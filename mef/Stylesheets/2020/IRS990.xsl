<?xml version="1.0" encoding="UTF-8"?>
   <!-- Updated 2/10/2015 per Kisam 02022312 by Robert L Jones Part C added InCareOfNm element though not in Schema -->
   <!-- Updated 2/10/2015 per SOI KISAM IM02150548 by Robert L Jones changed Part V 14b element to Form720FiledInd -->
   <!-- Updated 10/14/2015 per IBM Defect 44911 by Robert L Jones 20-22 overlapping -->
    <!-- Updated 10/14/2015 per IBM Defect 44913 by Robert L Jones 16a spacing/overlapping -->
     <!-- Updated 10/14/2015 per IBM Defect 44910 by Robert L Jones 8a - 11a  spacing -->
     <!-- Updated 11/18/2015 per IBM Defect 45255 by Robert L Jones Part VIII 2g overlapping  NPF - Robert L Jones-->
     <!-- Updated 11/20/2015 per IBM Defect 44911 by Robert L Jones Part VIII 2g overlapping  NPF - Robert L Jones-->
     <!-- Updated 11/20/2015 per IBM Defect 44910 by Robert L Jones Part VIII 2g overlapping  NPF - Robert L Jones-->
      <!-- Updated 1/8/2016 per IBM Defect 45628 by Robert L Jones Extra page numbers corrected-->
      <!-- Updated 1/8/2016 per IBM Defect 45255 by Robert L Jones see above reduced top padding by 1-->
      <!-- Updated 1/28/2016 per Kisam 02446984 by Robert L Jones Part VIII 6a-6c and 7a-7c data interchanged. Code correct but IE11 reading out of order so I had to switch the two elements as a quick fix. See note in area below -->
      <!-- Updated 3/10/2016 per Kisam 02422360 by Robert L Jones Part VIII 2a-2g and 11a-12 misalignment -->
      <!-- Updated 4/22/2016 per UWR 177702 Tax Year Update -->
       <!-- Updated 6/30/2016 per IBM Defect 46020 by Robert L Jones spacing-->
       <!-- Updated 9/29/2016 per PDF Review by Robert L Jones spacing-->
       <!-- Updated 1/12/2017 per IBM Defect 60570 by Robert L Jones spacing at Part VI Header. NPF-->
       <!-- Updated 2/27/2017 per IBM Defect 60570 by Robert L Jones spacing at Page 6 Header. Dot on line 5 Part XI -->
       <!-- Updated per UWR 195015 5/19/17 by Robert L Jones -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS990Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form990Data" select="$RtnDoc/IRS990"/>
  <xsl:param name="Form990RHData" select="$RtnHdrData"/>
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form990Data)"/>
          </xsl:call-template>
        </title>
        <!-- No Browser Caching -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <!-- Define Character Set -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Desc" content="IRS Form 990"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">

          <xsl:if test="not($Print) or $Print=''"> 

          <xsl:call-template name="IRS990Style"/>
          <xsl:call-template name="AddOnStyle"/>

           </xsl:if>

        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form990">
          <xsl:call-template name="DocumentHeader"/>
          <div class="styTBB" style="width:187mm;">
            <div class="styFNBox" style="width:26mm;height:25mm;">
              <div style="padding-top:1mm;">
            Form<span class="styFormNumber">990</span>
                <br/>
                <span style="width:2px;"/>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data"/>
                </xsl:call-template>
                
                <xsl:call-template name="LinkToLeftoverDataTableInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/SpecialConditionDesc"/>
                </xsl:call-template>
                </div>
                
              <div style="padding-top:3mm;">
                <span class="styAgency">Department of the Treasury</span>
              
                <span class="styAgency">Internal Revenue Service</span>
              </div>
            </div>
            <div class="styFTBox" style="width:133mm;">
              <div class="styMainTitle" style="padding-top:1mm">Return of Organization Exempt From Income Tax</div>
              <div class="styFBT" style="height:4mm;text-align:left;padding-left:0.25mm; font-size: 6.5pt;">
            Under section 501(c), 527, or 4947(a)(1) of the Internal Revenue Code (except private foundations)
          </div>
              <div>
           <div style="text-align:center;">
                <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
            Do not enter social security numbers on this form as it may be made public.</div>
             <div class="styFBT" style="text-align:center; font-size: 7pt; font-weight: bold;">
            <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
            Go to <a href="http://www.irs.gov/form990" title="Link to IRS.gov">
                <i>www.irs.gov/Form990</i></a> for instructions and the latest information.<!--www.irs.gov/form990-->
            </div>
          </div>
            </div>
            <div class="styTYBox" style="width:27.75mm;">
              <div class="styOMB" style="height:4.5mm;">OMB No. 1545-0047</div>
              <div class="styTY">20<span class="styTYColor">20</span>
              </div>
              <div class="styPartName" style="height:10mm; width:27.75mm;padding-top:0.3mm">Open to Public Inspection</div>
            </div>
          </div>
          <!--********************************************A****************************************************************************************-->
          <div style="width:187mm;font-weight:bold;">
            <span class="styBoldText" style="width:4mm;">A</span> For the 2020 calendar year, or tax year beginning
            <!--<xsl:call-template name="PopulateReturnHeaderTaxYear"/>-->
             <span style="width:18mm;">
              <xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
            </span>
        , and ending         
              <xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
              </div>
              <!--********************************************B****************************************************************************************-->
          <div style="width:187mm;">
            <div style="width:25mm;float:left;font-size:6pt;padding-top:2mm;">
              <span class="styBoldText" style="float:left;width:2.75mm;">B</span>Check if applicable:
          <span style="width:2mm;padding-top:0mm;">
                <input type="checkbox" class="styIRS990CkBox" alt="AddressChangeInd">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990Data/AddressChangeInd"/>
                    <xsl:with-param name="BackupName">IRS990AddressChangeInd</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <span style="width:23mm;padding-top:0mm">
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990Data/AddressChangeInd"/>
                    <xsl:with-param name="BackupName">IRS990AddressChangeInd</xsl:with-param>
                  </xsl:call-template>
                  <span style="padding-right:2mm;"/>Address change
            </label>
              </span>
              <!-- This code allows checkbox to be checked with a click of
          the mouse in the Transmission.html as if on Internet 
                 
          <span style="width:3.5mm;padding-top:2mm">
              <input type="checkbox" class="styCkbox" TabIndex="-1" id="NameChange" onclick="return false;"/>
          </span>
          <span style="width:21.4mm;padding-top:1mm">
              <label for="NameChange">Name change</label>
          </span>
      -->
              <!-- NAME CHANGE CHECKBOX -->
              <span style="width:2mm;padding-top:0mm">
                <input type="checkbox" class="styIRS990CkBox" alt="NameChangeInd">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990Data/NameChangeInd"/>
                    <xsl:with-param name="BackupName">IRS990NameChangeInd</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <span style="width:23mm;padding-top:0mm">
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990Data/NameChangeInd"/>
                    <xsl:with-param name="BackupName">IRS990NameChangeInd</xsl:with-param>
                  </xsl:call-template>
                  <span style="padding-right:2mm;"/>Name change
            </label>
              </span>
              <!-- INITIAL RETURN CHECKBOX -->
              <span style="width:2mm;padding-top:0mm">
                <input type="checkbox" class="styIRS990CkBox" alt="InitialReturnInd">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InitialReturnInd"/>
                    <xsl:with-param name="BackupName">IRS990InitialReturnInd</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <span style="width:23mm;padding-top:0mm">
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InitialReturnInd"/>
                    <xsl:with-param name="BackupName">IRS990InitialReturnInd</xsl:with-param>
                  </xsl:call-template>
                  <span style="padding-right:2mm;"/>Initial return
            </label>
              </span>
              <!-- TERMINATION CHECKBOX -->
              <span style="width:2mm;padding-top:0mm">
                <input type="checkbox" class="styIRS990CkBox" alt="FinalReturnInd">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990Data/FinalReturnInd"/>
                    <xsl:with-param name="BackupName">IRS990TerminatedReturnInd</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <span style="width:23mm;padding-top:0mm;font-size:5pt;">
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990Data/FinalReturnInd"/>
                    <xsl:with-param name="BackupName">IRS990TerminatedReturnInd</xsl:with-param>
                  </xsl:call-template>
                  <span style="padding-right:2mm;"/>Final return/terminated
            </label>
           
              </span>
              <!-- AMENDED RETURN CHECKBOX -->
              <span style="width:2mm;padding-top:0mm">
                <input type="checkbox" class="styIRS990CkBox" alt="AmendedReturnInd">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990Data/AmendedReturnInd"/>
                    <xsl:with-param name="BackupName">IRS990AmendedReturnInd</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <span style="width:23mm;padding-top:0mm">
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990Data/AmendedReturnInd"/>
                    <xsl:with-param name="BackupName">IRS990AmendedReturnInd</xsl:with-param>
                  </xsl:call-template><span style="padding-right:2mm;"/>Amended return
            </label>
              </span>
              <!-- APPLICATION PENDING CHECKBOX -->
              <span style="width:2mm;padding-top:0mm;padding-bottom:0mm;">
                <input type="checkbox" class="styIRS990CkBox" alt="ApplicationPendingInd">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990Data/ApplicationPendingInd"/>
                    <xsl:with-param name="BackupName">IRS990ApplicationPendingInd</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <span style="width:23mm;padding-top:0mm">
                <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$Form990Data/ApplicationPendingInd"/>
                    <xsl:with-param name="BackupName">IRS990ApplicationPendingInd</xsl:with-param>
                  </xsl:call-template><span style="padding-right:2mm;font-size:5pt;"/>Application pending
            </label>
            
              </span>
              <!--   THIS CODE ALLOWS THE CHECKBOXES TO BE
                CHECKED AS IF ON THE INTERNET BUT MUST NOT BE IN FINAL CODE -->
              <!--        
          <span style="width:3.5mm;padding-top:2mm">
            <input type="checkbox" class="styCkbox" TabIndex="-1" id="FinalReturn" onclick="return false;"/>
          </span>
          <span style="width:21.4mm;padding-top:1mm">
            <label for="FinalReturn">Final return</label>
          </span>
          
          <span style="width:3.5mm;padding-top:2mm">
            <input type="checkbox" class="styCkbox" TabIndex="-1" id="AmendedReturn" onclick="return true;"/>
          </span>
          <span style="width:21.4mm;padding-top:2mm">
            <label for="AmendedReturn">Amended return</label>
          </span>
          
          <span style="width:3.5mm;padding-top:2mm">
            <input type="checkbox" class="styCkbox" TabIndex="-1" id="ApplicationPending" onclick="return false;"/>
          </span>
          <span style="width:21.4mm;padding-top:2mm">
            <label for="ApplicationPending">Application pending</label>
          </span>
          -->
          <!--********************************************C****************************************************************************************-->
            </div>
            <div class="styGenericDiv" style="width:112mm;">
              <div class="styLblNameAddr" style="width:112mm;height:36mm;">
              <!--
                <div class="styUseLbl" style="width:14mm;height:27mm;border-right-width:0px;">Please use IRS label or print or type. See Specific Instruc- tions.</div>
              -->
                <div class="styNameAddr" style="width:110mm;height:auto;border-left-width:1px;">
                  <span class="styBoldText" style="float:left;">C</span><span style="padding-left:.5mm;"/>Name of organization<br/>
                  <span class="stySmallText" style="padding-left:2mm;">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                      <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">InCareOfNm</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                  </span>
                </div>
                <div class="styNameAddr" style="width:110mm;height:auto;border-left-width:1px;">
                  <span class="stySmallText" style="padding-left:2mm;"> 
                          Doing business as <br/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form990Data/DoingBusinessAsName/BusinessNameLine1Txt"/>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form990Data/DoingBusinessAsName/BusinessNameLine2Txt"/>
                    </xsl:call-template>
                  </span>
                </div>
                <div class="styNameAddr" style="width:82.25mm;height:auto;border-right-width:1px;border-left-width:1px;">
                  <span style="width:2mm;"/>Number and street (or P.O. box if mail is not delivered to street address)<br/>
                  <span class="stySmallText" style="padding-left:2mm;">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
                    </xsl:call-template>
                  </span>
                </div>
                <div class="styNameAddr" style="width:28mm;height:8.0mm;">
                      Room/suite<br/>
                </div>
                <div class="styNameAddr" style="width:110mm;height:8mm;border-left-width:1px;">
                  <span style="width:6pt;"/>City or town, state or province, country, and ZIP or foreign postal code<br/>
                  <span class="stySmallText" style="padding-left:2mm;">
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
                    </xsl:call-template>
                    <br/>
                    <xsl:call-template name="PopulateReturnHeaderFiler">
                      <xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
                      <xsl:with-param name="MainForm">true</xsl:with-param>
                    </xsl:call-template>
                  </span>
                </div>
              </div>
            </div>
            <!--********************************************D****************************************************************************************-->
            <div class="styEINDateAssets" style="width:50mm;height:17mm;border-top-width:1px; padding-top:1mm;">
              <span class="styBoldText">D Employer identification number</span>
              <br/>
              <br/>
              <span class="styEINFld" style="padding-left:2mm;font-size:7pt">
                <!-- Since this is a main form, we must check for and display an updated EIN.  To do this, we use the EINChanged parameter when calling PopulateReturnHeaderFiler.-->
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="EINChanged">true</xsl:with-param>
                  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                </xsl:call-template>
              </span>
            </div>
            <!--********************************************E****************************************************************************************-->
            <div class="styEINDateAssets" style="width:50mm;height:10mm; padding-top:1mm;">
              <span class="styNormalText">E Telephone number</span>
              <br/>
              <br/>
              <span style="padding-left:2mm;font-size:7pt">
                <xsl:if test="$Location = 'RET' ">
                  <xsl:call-template name="PopulateReturnHeaderFiler">
                    <xsl:with-param name="TargetNode">Phone</xsl:with-param>
                  </xsl:call-template>
                </xsl:if>
              </span>
            </div>
            <!--********************************************G****************************************************************************************-->
            <!--  Begin Sections G -->
            <div class="styEINDateAssets" style="width:50mm;height:9mm;float:right;">
              <span class="styBoldText" style="padding-top:5mm;">G</span> Gross receipts $
            <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form990Data/GrossReceiptsAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <div class="styBB" style="width:187mm;float:none;">
            <div class="styGenericDiv" style="width:25mm;height:10mm;"/>
            <!--********************************************F****************************************************************************************-->
            <!--  F   -->
            <div class="styGenericDiv" style="width:93.9mm;height:auto;padding-left:2mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 1px;">
              <span class="styBoldText">F</span>
              <span style="width:1mm;"/>
        Name and address of principal officer:
        <br/>
              <xsl:choose>
                <xsl:when test="$Form990Data/PrincipalOfficerNm">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PrincipalOfficerNm"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PrincipalOfcrBusinessName/BusinessNameLine1Txt"/>
                  </xsl:call-template>
                  <xsl:if test="$Form990Data/PrincipalOfcrBusinessName/BusinessNameLine2Txt">
                    <br/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form990Data/PrincipalOfcrBusinessName/BusinessNameLine2Txt"/>
                    </xsl:call-template>
                  </xsl:if>
                </xsl:otherwise>
              </xsl:choose>
              <br/>
              <xsl:choose>
                <xsl:when test="$Form990Data/USAddress">
                  <xsl:call-template name="PopulateUSAddressTemplate">
                    <xsl:with-param name="TargetNode" select="$Form990Data/USAddress"/>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulateForeignAddressTemplate">
                    <xsl:with-param name="TargetNode" select="$Form990Data/ForeignAddress"/>
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </div>
            <!--********************************************I****************************************************************************************-->
            <!-- I -->
            <div style="width:118.9mm;float:left; clear:left;">
              <div class="styBB" style="width:118.9mm;padding-top:1mm;padding-bottom:1mm;float:left;border-top-width:1px;border-right-width:1px;">
                <div class="styGenericDiv" style="width:4mm;font-weight:bold;">I</div>
                <div class="styGenericDiv" style="width:114mm;font-size:6pt;">
                  <span class="stySmallText">Tax-exempt status:</span>
                  <!-- 501(c) -->
                  <span style="width:5px;"/>
                  <!--<input type="checkbox" class="styCkbox" name="Checkbox">Removed for 508 Compliance-RLJ-->
                  <input type="checkbox" class="styCkbox" alt="Organization501c3Ind">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form990Data/Organization501c3Ind"/>
                      <xsl:with-param name="BackupName">IRS990Organization501c3Ind</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$Form990Data/Organization501c3Ind"/>
                      <xsl:with-param name="BackupName">IRS990Organization501c3Ind</xsl:with-param>
                    </xsl:call-template>
  501(c)(3) 
  </label>  
  <!-- 501(c)( )-->
                  <span style="width:6px;"/>
                  <input type="checkbox" class="styCkbox" alt="Organization501cInd">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form990Data/Organization501cInd"/>
                      <xsl:with-param name="BackupName">IRS990Organization501cInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <span style="width:3px;"/>
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form990Data/Organization501cInd"/>
                  </xsl:call-template>
                  <span style="width:2px;"/>
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$Form990Data/Organization501cInd"/>
                      <xsl:with-param name="BackupName">IRS990Organization501cInd</xsl:with-param>
                    </xsl:call-template>
  501(c) 
  </label>
  ( 
 <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form990Data/Organization501cInd/@organization501cTypeTxt"/>
                  </xsl:call-template>
  ) 
  <img src="{$ImagePath}/990_Bullet_Left.gif" alt="LeftBullet"/> 
  (insert no.) 
  

  
  
  <span style="width:9px;"/>
                  <input type="checkbox" class="styCkbox" alt="Organization4947a1NotPFIndB">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form990Data/Organization4947a1NotPFInd"/>
                      <xsl:with-param name="BackupName">IRS990Organization4947a1Ind</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$Form990Data/Organization4947a1NotPFInd"/>
                      <xsl:with-param name="BackupName">IRS990Organization4947a1Ind</xsl:with-param>
                    </xsl:call-template>
  4947(a)(1) 
  </label>
  or 
  <span style="width:6px;"/>
                  <span class="styBoldText">
                    <input type="checkbox" class="styCkbox" alt="Organization527Ind">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$Form990Data/Organization527Ind"/>
                        <xsl:with-param name="BackupName">IRS990Organization527Ind</xsl:with-param>
                      </xsl:call-template>
                    </input>
                  </span>
                  <label>
                    <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$Form990Data/Organization527Ind"/>
                      <xsl:with-param name="BackupName">IRS990Organization527Ind</xsl:with-param>
                    </xsl:call-template>
  527 
  </label>
                </div>
              </div>
              <!--********************************************J****************************************************************************************-->
              <!--  J   -->
              <div class="styBB" style="width:118.9mm;float:left;height:6.5mm;padding-top:0mm;border-bottom-width:0px;border-right-width:1px;">
                <div class="styGenericDiv" style="width:4mm;font-weight:bold;height:auto;">J</div>
                <div class="styGenericDiv" style="width:17mm;">
                  <span class="styBoldText">Website:</span>
                  <span style="width:2px"/>
                  <!--<img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>-->
                  <img alt="MediumBullet" src="{$ImagePath}/990_Bullet_Md.gif"/>
                </div>
                <div class="styGenericDiv" style="width:97mm;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form990Data/WebsiteAddressTxt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- End Left Side of Sections G through J   -->
            <!-- Begin Right Side of Sections H through J  -->
            <!--********************************************H(a)****************************************************************************************-->
            <div class="styIRS990RightSideSection" style="width:67mm;height:20mm;border-left-width:0px;">
              <!--  H(a)   -->
              <div class="styGenericDiv" style="width:67mm;padding-left:2mm;">
                <div class="styIRS990RightSideLeftNumBox">
                  <span style="font-size:7pt">H(a)</span>
                </div>
                <div class="styGenericDiv" style="width:57mm;padding-top:0.75mm">
                  <span class="styNormalText">
  Is this a group return for<br/> subordinates? 
  <span style="width:15.5mm;"/>
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$Form990Data/GroupReturnForAffiliatesInd"/>
                    </xsl:call-template>
                    <span style="height:3.0mm;width:3.0mm;padding-left:3mm">
                      <xsl:call-template name="PopulateSpan">
                        <xsl:with-param name="TargetNode" select="$Form990Data/GroupReturnForAffiliatesInd"/>
                      </xsl:call-template>
           <!-- <input type="checkbox" alt="alt" class="styCkbox" name="Checkbox">Changed 4 508 Comp-->
                     <input type="checkbox" class="styCkbox" alt="GroupReturnForAffiliatesIndYes">
                        <xsl:call-template name="PopulateYesCheckbox">
                          <xsl:with-param name="TargetNode" select="$Form990Data/GroupReturnForAffiliatesInd"/>
                          <xsl:with-param name="BackupName">IRS990GroupReturnForAffiliatesInd</xsl:with-param>
                        </xsl:call-template>
                      </input>
                    </span>
                    <label>
                      <xsl:call-template name="PopulateLabelYes">
                        <xsl:with-param name="TargetNode" select="$Form990Data/GroupReturnForAffiliatesInd"/>
                        <xsl:with-param name="BackupName">IRS990GroupReturnForAffiliatesInd</xsl:with-param>
                      </xsl:call-template><span style="padding-left:4.5mm;"/>Yes 
										</label>
                    <span style="height:3.0mm;width:3.0mm;">
                      <xsl:call-template name="PopulateSpan">
                        <xsl:with-param name="TargetNode" select="$Form990Data/GroupReturnForAffiliatesInd"/>
                      </xsl:call-template>
                      <!-- <input type="checkbox" alt="alt" class="styCkbox" name="Checkbox">Changed 4 508 Comp-->
                      <input type="checkbox" class="styCkbox" alt="GroupReturnForAffiliatesIndNo">
                        <xsl:call-template name="PopulateNoCheckbox">
                          <xsl:with-param name="TargetNode" select="$Form990Data/GroupReturnForAffiliatesInd"/>
                          <xsl:with-param name="BackupName">IRS990GroupReturnForAffiliatesInd</xsl:with-param>
                        </xsl:call-template>
                      </input>
                    </span>
                    <label>
                      <xsl:call-template name="PopulateLabelNo">
                        <xsl:with-param name="TargetNode" select="$Form990Data/GroupReturnForAffiliatesInd"/>
                        <xsl:with-param name="BackupName">IRS990GroupReturnForAffiliatesInd</xsl:with-param>
                      </xsl:call-template><span style="padding-left:1.5mm;"/>No 
											</label>
                  </span>
                </div>
              </div>
              <!--********************************************H(b)****************************************************************************************-->
              
              <!--  H(b)   -->
              <div class="styGenericDiv" style="width:67mm;padding-left:2mm;">
                <div class="styIRS990RightSideLeftNumBox">
                  <span class="font-size:7pt">H(b)</span>
                </div>
                <div class="styGenericDiv" style="width:35mm;padding-top:0mm;">
                  <span class="styNormalText">
                    Are all subordinates <br/>included?
                     </span>
                </div>
              
                <div class="styGenericDiv" style="width:22mm;padding-top:0.75mm;padding-left:2mm;">
                    <xsl:call-template name="PopulateSpan">
                      <xsl:with-param name="TargetNode" select="$Form990Data/AllAffiliatesIncludedInd"/>
                    </xsl:call-template>
                  <!--  <input type="checkbox" class="styCkbox" name="Checkbox">Changed for 508 Comp-->
                    <input type="checkbox" class="styCkbox" alt="AllAffiliatesIncludedIndYes">
                      <xsl:call-template name="PopulateYesCheckbox">
                        <xsl:with-param name="TargetNode" select="$Form990Data/AllAffiliatesIncludedInd"/>
                        <xsl:with-param name="BackupName">IRS990AllAffiliatesIncludedInd</xsl:with-param>
            <!--<xsl:with-param name="BackupName">IRS990AllAffiliatesIncludedYes</xsl:with-param>changed for 508-->
                      </xsl:call-template>
                    </input>
                  
                  <label>
                    <xsl:call-template name="PopulateLabelYes">
                      <xsl:with-param name="TargetNode" select="$Form990Data/AllAffiliatesIncludedInd"/>
                      <xsl:with-param name="BackupName">IRS990AllAffiliatesIncludedInd</xsl:with-param>
                      <!--<xsl:with-param name="BackupName">IRS990AllAffiliatesIncludedYes</xsl:with-param>-->
                    </xsl:call-template>Yes  
  </label>
                  
                  <span style="height:3.0mm;width:3.0mm;">
                    <xsl:call-template name="PopulateSpan">
                      <xsl:with-param name="TargetNode" select="$Form990Data/AllAffiliatesIncludedInd"/>
                    </xsl:call-template>
                    <input type="checkbox" class="styCkbox" alt="AllAffiliatesIncludedIndNo">
                      <xsl:call-template name="PopulateNoCheckbox">
                        <xsl:with-param name="TargetNode" select="$Form990Data/AllAffiliatesIncludedInd"/>
                        <xsl:with-param name="BackupName">IRS990AllAffiliatesIncludedInd</xsl:with-param>
                        <!--<xsl:with-param name="BackupName">IRS990AllAffiliatesIncludedNo</xsl:with-param>-->
                      </xsl:call-template>
                    </input>
                  </span>
                  <label>
                    <xsl:call-template name="PopulateLabelNo">
                      <xsl:with-param name="TargetNode" select="$Form990Data/AllAffiliatesIncludedInd"/>
                      <xsl:with-param name="BackupName">IRS990AllAffiliatesIncludedInd</xsl:with-param>
                      <!--<xsl:with-param name="BackupName">IRS990AllAffiliatesIncludedNo</xsl:with-param>-->
                    </xsl:call-template><span style="padding-left:1mm;"/>No 
  </label>
                </div>
              </div>
              <div class="styGenericDiv" style="width:67mm;padding-left:2mm;">
                <div class="styIRS990RightSideLeftNumBox"/>
                <div class="styGenericDiv" style="width:56mm;padding-top:0.5mm">
                  <span class="styNormalText">If "No," attach a list. (see instructions)
                  <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$Form990Data/AllAffiliatesIncludedInd"/>
                    </xsl:call-template>
                  </span>
                </div>
              </div>
              <!--********************************************H(c)****************************************************************************************-->
              <!--  H(c)  -->
              <div class="styBB" style="width:67mm;float:left;padding-left:2mm;border-bottom-width:0px;padding-top:0mm;">
                <div class="styIRS990RightSideLeftNumBox">H(c)</div>
                <span class="styNormalText" style="padding-top:1mm;padding-bottom:0mm;">
  Group exemption number 
  <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                  <span style="width:3mm;"/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form990Data/GroupExemptionNum"/>
                  </xsl:call-template>
                </span>
              </div>
            </div>
          </div>
          <!-- End Right Side of Sections G through J -->
          <!-- Begin Line of Sections K through M  -->
          <!--********************************************K****************************************************************************************-->
          <div style="width:187mm;font-size:6pt;">
            <div class="styLNAmountBox" style="text-align:left;border-bottom-width:0px;border-left-width:0px;width:118.5mm;height:auto;">
              <span style="font-weight:bold;font-size:7pt;">K</span> 
  Form of organization: 
 <input type="checkbox" class="styCkbox" alt="TypeOfOrganizationCorpInd">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form990Data/TypeOfOrganizationCorpInd"/>
                  <xsl:with-param name="BackupName">IRS990TypeOfOrganizationCorpInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form990Data/TypeOfOrganizationCorpInd"/>
                  <xsl:with-param name="BackupName">IRS990TypeOfOrganizationCorpInd</xsl:with-param>
                </xsl:call-template>
  Corporation 
  </label>
              <input type="checkbox" class="styCkbox" alt="TypeOfOrganizationTrustInd">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form990Data/TypeOfOrganizationTrustInd"/>
                  <xsl:with-param name="BackupName">IRS990TypeOfOrganizationTrustInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form990Data/TypeOfOrganizationTrustInd"/>
                  <xsl:with-param name="BackupName">IRS990TypeOfOrganizationTrustInd</xsl:with-param>
                </xsl:call-template>
  Trust 
  </label>
              <input type="checkbox" class="styCkbox" alt="TypeOfOrganizationAssocInd">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form990Data/TypeOfOrganizationAssocInd"/>
                  <xsl:with-param name="BackupName">IRS990TypeOfOrganizationAssocInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form990Data/TypeOfOrganizationAssocInd"/>
                  <xsl:with-param name="BackupName">IRS990TypeOfOrganizationAssocInd</xsl:with-param>
                </xsl:call-template>
  Association 
  </label>
              <input type="checkbox" class="styCkbox" alt="TypeOfOrganizationOtherInd">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form990Data/TypeOfOrganizationOtherInd"/>
                  <xsl:with-param name="BackupName">IRS990TypeOfOrganizationOtherInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form990Data/TypeOfOrganizationOtherInd"/>
                  <xsl:with-param name="BackupName">IRS990TypeOfOrganizationOtherInd</xsl:with-param>
                </xsl:call-template>
  Other <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
              </label>
           
            
              <span style="width:1mm"/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form990Data/OtherOrganizationDsc"/>
              </xsl:call-template>
           </div>
            <!--********************************************L****************************************************************************************-->
            <div class="styLNAmountBox" style="border-bottom-width:0px;text-align:left;width:32mm;padding-left:4px;height:8.5mm;">
              <span style="font-weight:bold;font-size:7pt;">L</span> 
  Year of formation: 
 <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form990Data/FormationYr"/>
              </xsl:call-template>
            </div>
            <!--********************************************M****************************************************************************************-->
            <div class="styLNAmountBox" style="text-align:left;width:33mm;padding-left:4px;height:8.5mm;border-bottom-width:0px;">
              <span style="font-weight:bold;font-size:7pt;">M</span> 
      State of legal domicile: 
      <xsl:if test="$Form990Data/LegalDomicileStateCd">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form990Data/LegalDomicileStateCd"/>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="$Form990Data/LegalDomicileCountryCd">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form990Data/LegalDomicileCountryCd"/>
                </xsl:call-template>
              </xsl:if>
            </div>
          </div>
          <!--  End Sections G through M  -->
          <!-- BEGIN Part I-->
          <!-- BEGIN Part I Summary Title -->
          <div class="styBB" style="width:187mm;clear:both;border-top-width:1px;">
            <div class="styPartName" style="width:15mm; height:auto;"><span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part I</span></div>
            <div class="styPartDesc" style="width:171mm;height:auto;">
      Summary
      </div>
          </div>
          <!-- END Part I Title -->
          <!--span style="background-color:red;width: 187mm; border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px"/-->
          <table class="styTable" style="font-size:7pt;width:187mm;" cellspacing="0">
          <!--  <thead>
              <tr scope="col">
                <th class="styBB" colspan="5" style="padding-top:0;padding-bottom:0;">

                  <span class="styPartName" style="width:14mm;">Part I</span>
                  <span class="styPartDesc" style="width:172mm;">
                Summary
                 </span>
                </th>
              </tr>
            </thead>-->
            <tfoot/>
            <tbody valign="top">
              <!-- Begin Part I Summary Section -->
              <!-- Activities Governance Section -->
              <!--
 Found out the hexadecimal value for & and put in below for"and" and "&" because the & caused error message.
-->
              <tr>
          <td class="styIRS990VTImageBox" style="width: 5mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width: 1px" rowspan="11" valign="middle">
                  <img src="{$ImagePath}/990R_ActGov.gif" alt="Activities  &amp; Governance"/>
                </td>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;">
                  <span style="width:1.5mm;"/>1</td>
                <td class="styLNDesc" style="width:156mm;height:auto;" colspan="3">
  Briefly describe the organization’s mission or most significant activities: 
  <span style="height:auto;width: 175mm; border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form990Data/ActivityOrMissionDesc"/>
                    </xsl:call-template>
                    </span>
                  <xsl:if test="((count($Form990Data/ActivityOrMissionDesc) &gt; 3) and ($Print = $Separated))"/>
          <span style="height:auto;width: 175mm; border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                  </span>
                  <xsl:if test="((count($Form990Data/ActivityOrMissionDesc) &gt; 3) and ($Print = $Separated))">
                    </xsl:if>
        <span style="height:auto;width: 175mm; border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">                      </span>
                  <xsl:if test="((count($Form990Data/ActivityOrMissionDesc) &gt; 3) and ($Print = $Separated))">
                  </xsl:if>
          <span style="height:auto;width: 175mm; border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    
                  </span>
                  <xsl:if test="((count($Form990Data/ActivityOrMissionDesc) &gt; 3) and ($Print = $Separated))">
                  </xsl:if>

                </td>

              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;">
                  <span style="width:1.5mm;padding-top:4mm;"/>2</td>
                <td class="styLNDesc" style="padding-left:1.5mm;width:174mm;height:4.5mm;" colspan="3">
  Check this box <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                  <input type="checkbox" class="styCkbox" alt="ContractTerminationInd">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form990Data/ContractTerminationInd"/>
                      <xsl:with-param name="BackupName">IRS990ContractTerminationInd</xsl:with-param>
                    </xsl:call-template> if the organization discontinued its operations or disposed of more than 25% of its net assets.
               </input>
               <label style="float: right; clear: none;">
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$Form990Data/ContractTerminationInd"/>
									<xsl:with-param name="BackupName">IRS990ContractTerminationInd</xsl:with-param>
								</xsl:call-template>
							</label>
                </td>
              </tr>
              
<!-- New Additions To Match PDF (Hopefully)  -->
<!-- 3 -->
<tr>
<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;">
<span style="width:1.5mm;"/>3</td>
<td class="styLNDesc" style="padding-left:1.5mm;width:143mm;height:4.5mm;">
Number of voting members of the governing body (<span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VI</span>, line 1a)
<!--<span class="styDotLn" style="float:right;padding-right:1mm;">.....-->
<span style="clear:none;letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">........
</span>
</td>
<td class="styLNRightNumBox" style="height:4.5mm;width:6mm;">3</td>
<td class="styLNAmountBox" style="height:4.5mm;width:25mm;">
<xsl:call-template name="PopulateAmount">
<xsl:with-param name="TargetNode" select="$Form990Data/VotingMembersGoverningBodyCnt"/>
</xsl:call-template>
</td>
</tr>
<!-- 4 -->
<tr>
<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;">
<span style="width:1.5mm;"/>4</td>
<td class="styLNDesc" style="padding-left:1.5mm;width:143mm;height:4.5mm;">
Number of independent voting members of the governing body (<span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VI</span>, line 1b) 
<span style="clear:none;letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.....</span>
</td>
<td class="styLNRightNumBox" style="height:4.5mm;width:6mm;">4</td>
<td class="styLNAmountBox" style="height:4.5mm;width:25mm;">
<xsl:call-template name="PopulateAmount">
  <xsl:with-param name="TargetNode" select="$Form990Data/VotingMembersIndependentCnt"/>
</xsl:call-template>
</td>
</tr>
<!-- 5 -->
<tr>
<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;">
<span style="width:1.5mm;"/>5</td>
<td class="styLNDesc" style="padding-left:1.5mm;width:143mm;height:4.5mm;">
Total number of individuals employed in calendar year 2020 (<span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part V</span>, line 2a) 
<span style="clear:none;letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">......</span>
</td>
<td class="styLNRightNumBox" style="height:4.5mm;width:6mm;">5</td>
<td class="styLNAmountBox" style="height:4.5mm;width:25mm;">
<xsl:call-template name="PopulateAmount">
  <xsl:with-param name="TargetNode" select="$Form990Data/TotalEmployeeCnt"/>
</xsl:call-template>
</td>
</tr>
<!-- 6 -->
<tr>
<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;">
<span style="width:1.5mm;"/>6</td>
<td class="styLNDesc" style="padding-left:1.5mm;width:143mm;height:4.5mm;">
Total number of volunteers (estimate if necessary) 
<span style="clear:none;letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.............</span>
</td>
<td class="styLNRightNumBox" style="height:4.5mm;width:6mm;">6</td>
<td class="styLNAmountBox" style="height:4.5mm;width:25mm;">
<xsl:call-template name="PopulateAmount">
  <xsl:with-param name="TargetNode" select="$Form990Data/TotalVolunteersCnt"/>
</xsl:call-template>
</td>
</tr>
<!-- 7a -->
<tr>
<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-left:1mm;">
7a</td>
<td class="styLNDesc" style="padding-left:1.5mm;width:143mm;height:auto;">
Total unrelated business revenue from <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VIII</span>, column (C), line 12 
<span style="clear:none;letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">........</span>
</td>
<td class="styLNRightNumBox" style="height:4.5mm;width:6mm;">7a</td>
<td class="styLNAmountBox" style="height:4.5mm;width:25mm;">
<xsl:call-template name="PopulateAmount">
  <xsl:with-param name="TargetNode" select="$Form990Data/TotalGrossUBIAmt"/>
</xsl:call-template>
</td>
</tr>
<!-- 7b -->
<tr>
<td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
<span style="width:2mm;padding-left:0mm;"/>b</td>
<td class="styLNDesc" style="padding-left:1.5mm;width:143mm;height:4.5mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px">
Net unrelated business taxable income from Form 990-T, line 39 
<span style="clear:none;letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.........</span>
</td>
<td class="styLNRightNumBox" style="height:4.5mm;width:6mm;">7b</td>
<td class="styLNAmountBox" style="height:4.5mm;width:25mm;">
<xsl:call-template name="PopulateAmount">
  <xsl:with-param name="TargetNode" select="$Form990Data/NetUnrelatedBusTxblIncmAmt"/>
</xsl:call-template>
</td>
</tr>
</tbody>
</table>
          <!-- REVENUES SECTION -->
          <table class="styTable" style="font-size:7pt;width:187mm;" cellspacing="0">
            <tbody>
              <tr>
               <td class="styIRS990VTImageBox" rowspan="6" valign="middle" style="width:5mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width: 1px">
                                    <img alt="Revenues" src="{$ImagePath}/990R_Revenue.gif"/>
                </td>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;"/>
                <td class="styLNDesc" style="width:110.5mm;height:4.5mm;" colspan="2"/>
                <td class="styLNAmountBox" style="height:4.5mm;font-weight:bold;text-align:center;">Prior Year</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-weight:bold;text-align:center;">Current Year</td>
              </tr>
              <!-- 8 -->
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;">
                  <span style="width:1.5mm;"/>8</td>
                <td class="styLNDesc" style="padding-left:1.5mm;width:110.5mm;height:4.5mm;" colspan="2">
  Contributions and grants (<span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VIII</span>, line 1h) 
  <span style="clear:none;letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.........</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PYContributionsGrantsAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/CYContributionsGrantsAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- 9 -->
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;">
                  <span style="width:1.5mm;"/>9</td>
                <td class="styLNDesc" style="padding-left:1.5mm;width:110.5mm;height:4.5mm;" colspan="2">
  Program service revenue (<span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VIII</span>, line 2g) 
  <span style="clear:none;letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.........</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PYProgramServiceRevenueAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/CYProgramServiceRevenueAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- 10 -->
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;">10</td>
                <td class="styLNDesc" style="padding-left:1.5mm;width:110.5mm;height:auto;" colspan="2">
  Investment income (<span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VIII</span>, column (A), lines 3, 4, and 7d )  <span style="clear:none;letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">....</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PYInvestmentIncomeAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/CYInvestmentIncomeAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;">11</td>
                <td class="styLNDesc" style="padding-left:1.5mm;width:110.5mm;height:4.5mm;" colspan="2">
  Other revenue (<span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VIII</span>, column (A), lines 5, 6d, 8c, 9c, 10c, and 11e) 
  </td>
                <td class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PYOtherRevenueAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/CYOtherRevenueAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Use styLNLeftNumBoxBB and styBB when defining image parameters as they will draw the line separating images -->
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-bottom:3mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px">12</td>
                <td class="styLNDesc" style="padding-left:1.5mm;width:110.5mm;height:4.5mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px" colspan="2">Total revenue—add lines 8 through 11 (must equal <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VIII</span>, column (A), line 12)<span style="clear:none;letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"></span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;padding-top:0mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PYTotalRevenueAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;padding-top:0mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/CYTotalRevenueAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
             <td class="styIRS990VTImageBox" rowspan="8" valign="middle" style="width:5mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width: 1px">
                  <img src="{$ImagePath}/990R_Expenses.gif" alt="Expenses;"/>
                </td>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;">13</td>
                <td class="styLNDesc" style="padding-left:1.5mm;width:110.5mm;height:4.5mm;" colspan="2">
                <span style="float:left;">Grants and similar amounts paid (<span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IX</span>, column (A), lines 1–3 )</span>
                <span style="clear:none;letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">...</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PYGrantsAndSimilarPaidAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/CYGrantsAndSimilarPaidAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;">14</td>
                <td class="styLNDesc" style="padding-left:1.5mm;width:110.5mm;height:4.5mm;" colspan="2">
                <span style="float:left;">Benefits paid to or for members (<span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IX</span>, column (A), line 4)</span>
  <span style="clear:none;letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.....</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PYBenefitsPaidToMembersAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/CYBenefitsPaidToMembersAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-bottom:3mm;">15</td>
                <td class="styLNDesc" style="padding-left:1.5mm;width:110.5mm;height:4.5mm;" colspan="2">
                <span style="float:left;">Salaries, other compensation, employee benefits (<span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IX</span>, column (A), lines 5–10)</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;text-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PYSalariesCompEmpBnftPaidAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;text-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/CYSalariesCompEmpBnftPaidAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;">16a </td>
                <td class="styLNDesc" style="padding-left:2mm;width:110.5mm;height:4.5mm;font-size:7pt;" colspan="2">
                Professional fundraising fees (<span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IX</span>, column (A), line 11e)
                <span style="clear:none;letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.....</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PYTotalProfFndrsngExpnsAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/CYTotalProfFndrsngExpnsAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-left:3mm;">b</td>
                <td class="styLNDesc" style="padding-left:1.5mm;width:110.5mm;font-size:6pt;height:4.5mm;" colspan="2">Total fundraising expenses (<span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IX</span>, column (D), line 25) 
                <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                  <span class="styFixedUnderline" style="float:none;width:35mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/CYTotalFundraisingExpenseAmt"/>
                    </xsl:call-template>
                  </span>
                </td>
                <!-- NODATA used to keep amount box integrity-no such element -->
                <td class="styLNAmountBox" style="height:4.5mm;background-color:lightgrey;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/NODATA"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;background-color:lightgrey;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/NODATA"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;">17</td>
                <td class="styLNDesc" style="padding-left:1.5mm;width:110.5mm;height:4.5mm;" colspan="2">Other expenses (<span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IX</span>, column (A), lines 11a–11d, 11f–24e)<span style="clear:none;letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">....</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PYOtherExpensesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/CYOtherExpensesAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;">18</td>
                <td class="styLNDesc" style="padding-left:1.5mm;width:110.5mm;height:4.5mm;" colspan="2">Total expenses. Add lines 13–17 (must equal <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IX</span>, column (A), line 25)</td>
                <td class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PYTotalExpensesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/CYTotalExpensesAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px">19</td>
                <td class="styLNDesc" style="padding-left:1.5mm;width:110.5mm;height:4.5mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px" colspan="2">
                <span style="float:left;">Revenue less expenses. Subtract line 18 from line 12</span>
                <span style="clear:none;letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.......</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PYRevenuesLessExpensesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/CYRevenuesLessExpensesAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
            <td class="styIRS990VTImageBox" rowspan="5" valign="middle" style="width:5mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width: 1px">
                  <img src="{$ImagePath}/990R_NAFB.gif" alt="Net Assets or Fund Balances;"/>
                </td>
                <td class="styLNLeftNumBox" style="width:5mm;height:7.5mm;"/>
                <td class="styLNDesc" style="width:110.5mm;height:7.5mm;" colspan="2"/>
                <td class="styLNAmountBox" style="height:7.5mm;font-weight:bold;text-align:center;font-size:6pt;">Beginning of Current Year</td>
                <td class="styLNAmountBox" style="height:7.5mm;font-weight:bold;text-align:center;font-size:6pt;">End of Year</td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;">20</td>
                <td class="styLNDesc" style="padding-left:1.5mm;width:110.5mm;height:auto;" colspan="2">
                <span style="float:left;">Total assets (<span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part X</span>, line 16)</span>
                <span style="clear:none;letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.............</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TotalAssetsBOYAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TotalAssetsEOYAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;">21</td>
                <td class="styLNDesc" style="padding-left:1.5mm;width:110.5mm;height:auto;" colspan="2">
                <span style="float:left;">Total liabilities (<span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part X</span>, line 26)</span>
                <span style="clear:none;letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.............</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TotalLiabilitiesBOYAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TotalLiabilitiesEOYAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;">22</td>
                <td class="styLNDesc" style="padding-left:1.5mm;width:110.5mm;height:auto;" colspan="2">
                <span style="float:left;">Net assets or fund balances. Subtract line 21 from line 20</span>
                <span style="clear:none;letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.....</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/NetAssetsOrFundBalancesBOYAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/NetAssetsOrFundBalancesEOYAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
            </tbody>
          </table>
          <!-- END Part I -->
          <!-- BEGIN Part II Signature Title -->
            <div class="styBB" style="width:187mm;clear:both;border-top-width:1px;display:table;display:inline;">
            <div class="styPartName" style="width:15mm; height:auto;"><span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part II</span></div>
            <div class="styPartDesc" style="width:171mm;height:auto;">
      Signature Block
      </div>
          </div>
          <!-- END Part II Title -->
          <!-- Implementing the signature section in table -->
          <table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;clear:both;display:table;display:inline;">
            <tr>
              <td rowspan="5" style="width:15mm;font-size: 8pt;font-weight:bold;border-bottom:1px solid black;border-right:1px solid black;">Sign Here</td>
              <div style="width:187mm;">
              <div class="styNormalText" style="height:auto;width:187mm;font-size:7pt;padding-left:0mm;">Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than officer) is based on all information of which preparer has any knowledge. </div>
<div class="styBB" style="width:187mm;"/>
</div>
            </tr>
            <tr>
              <td rowspan="2" style="padding-left:1mm;">
                <img style="width:2mm;height:8mm;" src="{$ImagePath}/990_Bullet_Jumbo.gif" alt="JumboBullet"/>
              </td>
              <td style="height:auto;width:113mm;border-right: 0px;vertical-align:bottom;">
                <xsl:call-template name="PopulateReturnHeaderOfficer">
                  <xsl:with-param name="TargetNode">TaxpayerPIN</xsl:with-param>
                </xsl:call-template>
                <span style="width:1px;"/>
              </td>
              <td style="width:53mm;border-bottom:0px solid black;vertical-align:bottom;padding-left:1mm;">
                <xsl:call-template name="PopulateReturnHeaderOfficer">
                  <xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
                </xsl:call-template>
              </td>
            </tr>
            <tr>
              <td style="vertical-align:top;border-top:1px solid black;">Signature of officer</td>
              <td style="vertical-align:top;padding-left:1mm;border-top:1px solid black;">Date</td>
            </tr>
            <tr>
              <td rowspan="2" style="border-bottom:1px solid black;padding-left:1mm;padding-top:1mm;">
                <img style="width:2mm;height:8mm;" src="{$ImagePath}/990_Bullet_Jumbo.gif" alt="JumboBullet"/>
              </td>
              <td style="border-bottom:1px solid black;vertical-align:bottom;" colspan="2">
                <xsl:call-template name="PopulateReturnHeaderOfficer">
                  <xsl:with-param name="TargetNode">Name</xsl:with-param>
                </xsl:call-template>
                <span style="width:4px"/>
                <xsl:call-template name="PopulateReturnHeaderOfficer">
                  <xsl:with-param name="TargetNode">Title</xsl:with-param>
                </xsl:call-template>
              </td>
            </tr>
            <tr>
              <td style="vertical-align:top;border-bottom:1px solid black;height:auto;" colspan="2">Type or print name and title</td>
            </tr>
          </table>
          <!-- End Signature Section -->
          <!--div style="page-break-before:always;"></div-->
          <!-- BEGIN PREPARER SIGNATURE SECTION -->
					<!-- Implementing the preparer section in table -->
					<div class="styBB" style="width:187mm;font-size:6pt;display:table;display:inline;">
            <div style="width:22.75mm;padding-top:4mm;float:left;clear:none;height:auto;">
              <span class="styMainTitle" style="font-size:11pt;height:auto;">
                  Paid
                  Preparer
                  Use Only
                  </span>
            </div>
            <div style="width:164mm;float:left;clear:none;">
              <div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
                <div class="styLNDesc" style="height:7.5mm;width:46.8mm;padding-top:0mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
                
                Print/Type preparer's name<br/>
                  <!--<xsl:call-template name="PopulateReturnHeaderPreparer">
														<xsl:with-param name="TargetNode">Name</xsl:with-param>
													</xsl:call-template>-->
                </div>
                <div class="styLNDesc" style="height:7.5mm;width:46.5mm;padding-top:0mm;border-right:1px solid black;padding-left:1mm;">
                Preparer's signature<br/>
                <!--<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">Name</xsl:with-param>
									</xsl:call-template>-->
              </div>
                <div class="styLNDesc" style="height:7.5mm;width:15mm;border-right:1px solid black;padding-top:0mm;padding-left:1mm;">Date <br/>
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
                    <xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
                   <!-- <xsl:with-param name="BackupName">PopulateReturnHeaderPreparer</xsl:with-param>-->
                  </xsl:call-template>
                </div>
                <div class="styLNDesc" style="height:7.5mm;width:18mm;border-right:1px solid black;border-left:1px ;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">
                  <label>
                    <xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">SelfEmployedLabel</xsl:with-param>
											<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
										</xsl:call-template>
                    Check 
                  <!--  <input class="styCkbox" type="checkbox" style="width:4mm;">Changed for 508 Comp-->
                  <input type="checkbox" class="styCkbox" alt="SelfEmployedCheckbox">
                      <xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">SelfEmployedCheckbox</xsl:with-param>
										<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
									</xsl:call-template>
                    </input>
                    <span style="width:4px;"/>if<br/>self-employed
                  </label>
                </div>
                <div class="styLNDesc" style="height:7.5mm;width:16mm;padding-top:0mm;padding-left:1mm;">PTIN
                             <br/>
                             <xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">SSN</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
								</xsl:call-template>
                         
                </div>
              </div>
              <div style="width:164mm;float:left;clear:none;border-bottom:1px ">
                <div class="styLNDesc" style="height:auto;width:108.5mm;border-right:1px solid black; border-left:1px solid black;padding-left:1mm;border-bottom:1px solid black;">
                  <span class="styGenericDiv" style="">Firm's name 
                  <span style="width:2.2mm;"/>
                    <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                    <span style="width:4px;"/>
                  </span>
                  <div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
										</xsl:call-template>

                    
                  </div>
                </div>
                <div class="styLNDesc" style="height:auto;width:42mm;padding-left:1mm;border-bottom:0px solid black;">Firm's EIN
                <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                  <span style="width:4px;"/>
               
                    
                  
                  <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
                </div>
              </div>
              <div style="width:164mm;float:left;clear:none;">
                <div class="styLNDesc" style="height:auto;width:108.5mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
                  <div class="styGenericDiv" style="padding-right:.5mm;">Firm's address 
                  <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                  </div>
                  <div class="styGenericDiv" style="padding-right:.5mm;">
                
                    <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
										</xsl:call-template>
          
                  </div>
                </div>
                <div class="styLNDesc" style="width:55mm;padding-left:1mm;height:auto;border-top:1px solid black;"> Phone no. 
               
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">Phone</xsl:with-param>
								</xsl:call-template>
                </div>
              </div>
            </div>
          </div>
          <!-- END paid preparer -->
          <div class="styIRS990EZLineItem">
						<span class="styLNDesc" style="width: 187mm; font-size: 7pt;height:auto;">
							<!-- <label><xsl:call-template name="PopulateLabel"><xsl:with-param name="TargetNode" select="$RtnHdrData/Officer/AuthorizeThirdParty" /><xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param></xsl:call-template> -->
    May the IRS discuss this return with the preparer shown above? (see instructions)
	<!-- </label> -->
							<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm; margin-right:1mm">..........</span>
							<!--<img src="{$ImagePath}/990EZ_Bullet_Lg.gif" alt="bullet"/>-->
							
							<input type="checkbox" class="styCkbox" alt="AuthorizeThirdPartyYesCheckbox">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">AuthorizeThirdPartyYesCheckbox</xsl:with-param>
					<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">AuthorizeThirdPartyYesLabel</xsl:with-param>
					<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
								</xsl:call-template>
								<b>Yes</b>
							</label>
							<span style="width:1mm"/>
							<input type="checkbox" class="styCkbox" alt="AuthorizeThirdPartyNoCheckbox">
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">AuthorizeThirdPartyNoCheckbox</xsl:with-param>
									<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateReturnHeaderOfficer">
									<xsl:with-param name="TargetNode">AuthorizeThirdPartyNoLabel</xsl:with-param>
									<xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
								</xsl:call-template>
								<b>No</b>
							</label>
						</span>
					</div>
					
					
					<div style="width:187mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 0px">
						<div style="float: left; clear: none;">
							<span class="styBoldText">For Paperwork Reduction Act Notice, see the separate instructions.</span>
						</div>
						<div style="float:right">
    Cat. No. 11282Y
    <span style="width:70px"/>
    Form <span class="styBoldText" style="font-size: 8pt;"> 990 </span> (2020)
  </div>
					</div>
					<div class="pageEnd"/>
				<!--	<div style="width:187mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 0px"/>
          <div style="width:187mm;float:none;" class="pageend">
            <div class="styGenericDiv" style="width:117mm;font-weight:bold;">For Paperwork Reduction Act Notice, see the separate instructions.</div>
            <div class="styGenericDiv" style="width:23mm;">Cat. No. 11282Y</div>
            <div class="styGenericDiv" style="float:right;">Form <span class="styBoldText">990</span> (2014)</div>
          </div>-->
          <!-- header -->
          <div style="width:187mm;clear:both;padding-bottom:.5mm;float:none;clear:both;" class="styBB">
            <div style="width:90mm;" class="styGenericDiv">Form 990 (2020)</div>
            <div style="width:55mm;text-align:center;" class="styGenericDiv"/>
            <div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">2</span>
            </div>
          </div>
          
          <!-- BEGIN Part III Title -->
          <div class="styBB" style="width:187mm;clear:both;">
            <div class="styPartName"><span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part III</span></div>
            <div class="styPartDesc" style="width:171mm;height:auto;">
        Statement of Program Service Accomplishments
        </div>
        <span class="styNormalText" style="padding-top:0.0mm;width:187mm;height:auto;padding-left:17mm;">
        Check if Schedule O contains a response or note to any line in this <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part III</span>
        <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..............</span>    
                   <input type="checkbox" class="styCkbox" alt="InfoInScheduleOPartIIIInd">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InfoInScheduleOPartIIIInd"/>
                    <xsl:with-param name="BackupName">IRS990InfoInScheduleOPartIIIInd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form990Data/InfoInScheduleOPartIIIInd"/>
										<xsl:with-param name="BackupName">IRS990InfoInScheduleOPartIIIInd</xsl:with-param>
									</xsl:call-template>
								</label>
								</span>
          </div>
          <!-- END Part III Title -->
          <!-- BEGIN Part III Table -->
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">1</div>
            <td class="styLNDesc" style="width:176mm;height:auto;">
  Briefly describe the organization’s mission: 
  <span style="height:auto;width: 187mm; border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form990Data/MissionDesc"/>
                </xsl:call-template>
              </span>
              <xsl:if test="((count($Form990Data/MissionDesc) &gt; 3) and ($Print = $Separated))">
                            <xsl:call-template name="PopulateAdditionalDataTableMessage">
                  <xsl:with-param name="TargetNode" select="$Form990Data/MissionDesc"/>
                </xsl:call-template>
              </xsl:if>

              <span style="height:auto;width: 187mm; border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px"/>
              <xsl:if test="((count($Form990Data/MissionDesc) &gt; 3) and ($Print = $Separated))">
              
              </xsl:if>
              <span style="height:auto;width: 187mm; border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px"/>
              <xsl:if test="((count($Form990Data/MissionDesc) &gt; 3) and ($Print = $Separated))">
             
              </xsl:if>
              <span style="height:auto;width: 187mm; border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px"/>
              <xsl:if test="((count($Form990Data/MissionDesc) &gt; 3) and ($Print = $Separated))">
             
              </xsl:if>
            </td>
          </div>
          <!-- Part III 2 -->
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">2</div>
            <div class="styLNDesc" style="width:178mm;height:auto;">
          Did the organization undertake any significant program services during the year which were not listed on<br/>
the prior Form 990 or 990-EZ? 
                           <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.....................</span>
              <span style="width:2mm;padding-left:8mm;"/>
              <input type="checkbox" class="styCkbox" alt="SignificantNewProgramSrvcIndYes" id="dummyidexempt">
                <xsl:call-template name="PopulateYesCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form990Data/SignificantNewProgramSrvcInd"/>
                  <xsl:with-param name="BackupName">IRS990SignificantNewProgramSrvcInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <label for="dummyidexempt">
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form990Data/SignificantNewProgramSrvcInd"/>
                  <xsl:with-param name="BackupName">IRS990SignificantNewProgramSrvcInd</xsl:with-param>
                </xsl:call-template>
                <span class="styBoldText">   Yes</span>
              </label>
              <span style="width:2mm;">
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form990Data/SignificantNewProgramSrvcInd"/>
                </xsl:call-template>
              </span>
              <input type="checkbox" class="styCkbox" alt="SignificantNewProgramSrvcIndNo" onclick="return false;" id="dummyidnonexempt">
                <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form990Data/SignificantNewProgramSrvcInd"/>
                  <xsl:with-param name="BackupName">IRS990SignificantNewProgramSrvcInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <label for="dummyidnonexempt">
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form990Data/SignificantNewProgramSrvcInd"/>
                  <xsl:with-param name="BackupName">IRS990SignificantNewProgramSrvcInd</xsl:with-param>
                </xsl:call-template>
                <span class="styBoldText">   No</span>
              </label>
              <span style="width:2mm;"/>
            </div>
            <div class="styLNDesc" style="width:158mm;height:auto;padding-left:8mm;">
               If "Yes," describe these new services on Schedule O.
       </div>
          </div>
          <!-- Part III 3 -->
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">3</div>
            <div class="styLNDesc" style="width:178mm;height:auto;">
          Did the organization cease conducting, or make significant changes in how it conducts, any program<br></br> services? 
                           <!-- Dotted Line -->
                           
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...........................</span>
              <span style="width:2mm;padding-left:8mm;">
              <xsl:call-template name="PopulateSpan">
                <xsl:with-param name="TargetNode" select="$Form990Data/SignificantChangeInd"/>
              </xsl:call-template>
              </span>
              <input type="checkbox" class="styCkbox" alt="SignificantChangeIndYes" onclick="return false;" id="dummyidexempt">
                <xsl:call-template name="PopulateYesCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form990Data/SignificantChangeInd"/>
                  <xsl:with-param name="BackupName">IRS990SignificantChangeInd</xsl:with-param>
                </xsl:call-template>
                
              </input>
              <label for="dummyidexempt">
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form990Data/SignificantChangeInd"/>
                  <xsl:with-param name="BackupName">IRS990SignificantChangeInd</xsl:with-param>
                </xsl:call-template>
                <span class="styBoldText">   Yes</span>
              </label>
              <span style="width:2mm;">
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form990Data/SignificantChangeInd"/>
                </xsl:call-template>
              </span>
              <input type="checkbox" class="styCkbox" alt="SignificantChangeIndNo" onclick="return false;" id="dummyidnonexempt">
                <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form990Data/SignificantChangeInd"/>
                  <xsl:with-param name="BackupName">IRS990SignificantChangeInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <label for="dummyidnonexempt">
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form990Data/SignificantChangeInd"/>
                  <xsl:with-param name="BackupName">IRS990SignificantChangeInd</xsl:with-param>
                </xsl:call-template>
                <span class="styBoldText">   No</span>
              </label>
              
            </div>
            <div class="styLNDesc" style="width:158mm;height:auto;padding-left:8mm;">
               If "Yes," describe these changes on Schedule O.
       </div>
          </div>
          <!-- Part III 4 -->
          <div style="width:187mm;clear:both;">
            <div class="styLNLeftNumBox" style="height:auto;">4</div>
            <div class="styLNDesc" style="width:170mm;height:auto;padding-top:1mm">
      Describe the organization’s program service accomplishments for each of its three largest program services, as measured by expenses.
      Section 501(c)(3) and 501(c)(4) organizations are required to report the amount of grants and allocations to others, the total expenses, and revenue, if any, for each program service reported.
    </div>
          </div>
          <table class="styTable" style="width: 187mm;" cellspacing="0">
            <tbody>
              <tr>
                <td colspan="2" style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <!-- 4a -->
              <tr>
                <td class="styLNLeftNumBox" style="font-size:7pt;font-style:bold;">4a</td>
                <td style="width:178mm">
          (Code:
          <span style="width:24mm;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/ActivityCd"/>
                    </xsl:call-template>
                  </span>
          ) 
          (Expenses $ 
          <span style="width:24mm;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/ExpenseAmt"/>
                    </xsl:call-template>
                  </span>
                  <span style="width:3mm;"/>
          including grants of $ 
          <span style="width:24mm;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/GrantAmt"/>
                    </xsl:call-template>
                  </span>
          ) (Revenue $
          <span style="width:24mm;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/RevenueAmt"/>
                    </xsl:call-template>
                  </span>
          )
      </td>
              </tr>
              
              
           
              
                        
              
            <xsl:if test="(count($Form990Data/Desc) &gt; 0) and ($Form990Data/Desc != '')">
                <tr>
                  <td/>
                  <td valign="top" style="padding-top:.5mm; padding-bottom:1.5mm; border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form990Data/Desc"/>
                    </xsl:call-template>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="(count($Form990Data/Desc) &lt; 1) or ($Form990Data/Desc = '')">
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
              </xsl:if>
              <tr>
                <td colspan="2" style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <!-- 4b -->
              <tr>
                <td class="styLNLeftNumBox" style="font-size:7pt;font-style:bold;">4b</td>
                <td style="width:178mm">
          (Code:
          <span style="width:24mm;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/ProgSrvcAccomActy2Grp/ActivityCd"/>
                    </xsl:call-template>
                  </span>
          ) 
          (Expenses $ 
          <span style="width:24mm;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/ProgSrvcAccomActy2Grp/ExpenseAmt"/>
                    </xsl:call-template>
                  </span>
                  <span style="width:3mm;"/>
          including grants of $ 
          <span style="width:24mm;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/ProgSrvcAccomActy2Grp/GrantAmt"/>
                    </xsl:call-template>
                  </span>
          ) (Revenue $
          <span style="width:24mm;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/ProgSrvcAccomActy2Grp/RevenueAmt"/>
                    </xsl:call-template>
                  </span>
          )
      </td>
              </tr>
              <xsl:if test="(count($Form990Data/ProgSrvcAccomActy2Grp/Desc) &gt; 0) and ($Form990Data/ProgSrvcAccomActy2Grp/Desc != '')">
                <tr>
                  <td/>
                  <td style="padding-top:.5mm; padding-bottom:1.5mm; border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form990Data/ProgSrvcAccomActy2Grp/Desc"/>
                    </xsl:call-template>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="(count($Form990Data/ProgSrvcAccomActy2Grp/Desc) &lt; 1) or ($Form990Data/ProgSrvcAccomActy2Grp/Desc = '')">
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
              </xsl:if>
              <tr>
                <td colspan="2" style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <!-- 4c -->
              <tr>
                <td class="styLNLeftNumBox" style="font-size:7pt;font-style:bold;">4c</td>
                <td style="width:178mm">
          (Code:
          <span style="width:24mm;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/ProgSrvcAccomActy3Grp/ActivityCd"/>
                    </xsl:call-template>
                  </span>
          ) 
          (Expenses $ 
          <span style="width:24mm;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/ProgSrvcAccomActy3Grp/ExpenseAmt"/>
                    </xsl:call-template>
                  </span>
                  <span style="width:3mm;"/>
          including grants of $ 
          <span style="width:24mm;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/ProgSrvcAccomActy3Grp/GrantAmt"/>
                    </xsl:call-template>
                  </span>
          ) (Revenue $
          <span style="width:24mm;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/ProgSrvcAccomActy3Grp/RevenueAmt"/>
                    </xsl:call-template>
                  </span>
          )
      </td>
              </tr>
              <xsl:if test="(count($Form990Data/ProgSrvcAccomActy3Grp/Desc) &gt; 0) and ($Form990Data/ProgSrvcAccomActy3Grp/Desc != '')">
                <tr>
                  <td/>
                  <td style="padding-top:.5mm; padding-bottom:1.5mm; border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form990Data/ProgSrvcAccomActy3Grp/Desc"/>
                    </xsl:call-template>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="(count($Form990Data/ProgSrvcAccomActy3Grp/Desc) &lt; 1) or ($Form990Data/ProgSrvcAccomActy3Grp/Desc = '')">
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
                <tr>
                  <td/>
                  <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
              </xsl:if>
              <tr>
                <td colspan="2" style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <!-- The line repititions after 4c are displayed here -->
           <xsl:if test="($Print = $Separated) and (count($Form990Data/ProgSrvcAccomActyOtherGrp) &gt; 10)">
                <tr>
                  <td class="styLNLeftNumBox" style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                  <td style="width:178mm; font-size: 7pt; border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <xsl:call-template name="PopulateAdditionalDataTableMessage">
                      <xsl:with-param name="TargetNode" select="$Form990Data/ProgSrvcAccomActyOtherGrp"/>
                    </xsl:call-template>
                  </td>
                </tr>
              </xsl:if> 
              <xsl:if test="($Print != $Separated) or (count($Form990Data/ProgSrvcAccomActyOtherGrp) &lt;=10)">
              <xsl:for-each select="$Form990Data/ProgSrvcAccomActyOtherGrp">
                <tr>
                  <td class="styLNLeftNumBox" style="font-size:7pt;font-style:bold;"/>
                  <td style="width:178mm">
              (Code:
              <span style="width:24mm;text-align:right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="ActivityCd"/>
                      </xsl:call-template>
                    </span>
              ) 
              (Expenses $ 
              <span style="width:24mm;text-align:right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="ExpenseAmt"/>
                      </xsl:call-template>
                    </span>
                    <span style="width:3mm;"/>
              including grants of $ 
              <span style="width:24mm;text-align:right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="GrantAmt"/>
                      </xsl:call-template>
                    </span>
              ) (Revenue $
              <span style="width:24mm;text-align:right;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="RevenueAmt"/>
                      </xsl:call-template>
                    </span>
              )
          </td>
                </tr>
                <xsl:if test="(count(Desc) &gt; 0) and (Desc != '')">
                  <tr>
                    <td/>
                    <td style="padding-top:.5mm; padding-bottom:1.5mm; border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="Desc"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                </xsl:if>
               <xsl:if test="(count(Desc) &lt; 1) or (Desc = '')">
                  <tr>
                    <td/>
                    <td style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
               </xsl:if>
                <tr>
                  <td colspan="2" style="border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
              </xsl:for-each>
              </xsl:if>
              <!-- 4d -->
              <tr style="font-size:7pt;">
                <td class="styLNLeftNumBox" style="font-size:7pt;font-style:bold;">
          4d
      </td>
                <td style="width:178mm;">
        Other program services (Describe in Schedule O.)
      </td>
              </tr>
              <tr style="font-size:7pt;">
                <td style="padding-bottom:1mm;border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
                  <span class="styTableCellPad"/>
                </td>
                <td style="width:178mm;padding-bottom:1mm;border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px">
          (Expenses $ 
          <span style="width:30mm;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/TotalOtherProgSrvcExpenseAmt"/>
                    </xsl:call-template>
                  </span>
                  <span style="width:3mm;"/>
          including grants of $ 
          <span style="width:30mm;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/TotalOtherProgSrvcGrantAmt"/>
                    </xsl:call-template>
                  </span>
          ) (Revenue $
          <span style="width:30mm;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/TotalOtherProgSrvcRevenueAmt"/>
                    </xsl:call-template>
                  </span>
          )
      </td>
              </tr>
              <!-- 4e -->
              <tr style="font-size:7pt;">
                <td class="styLNLeftNumBox" style="font-size:7pt;font-style:bold;border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 2px">4e</td>
                <td style="width:178mm;border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 2px">
                  <span style="font-style:bold">
                    <b>Total program service expenses</b><span style="width:.5mm;"/>
                    <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/><!--$ Taken out per PDF Final 2011-->
        </span>
                  <span style="width:30mm;text-align:right;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/TotalProgramServiceExpensesAmt"/>
                    </xsl:call-template>
                  </span>
                  <!--
                  <span style="padding-left:3mm;font-style:italic">
          (Must equal Part IX, Line 25, column (B).)
        </span>
-->
                </td>
              </tr>
            </tbody>
          </table>
          <!-- END Part III Table -->
          <!-- Footer -->
          <div style="width:187mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 0px" class="pageEnd">
            <div class="styGenericDiv" style="width:105mm;"/>
            <div class="styGenericDiv" style="width:25mm;"/>
            <div class="styGenericDiv" style="float:right;">Form <span class="styBoldText">990</span> (2020)</div>
          </div>
          <!-- header -->
          <div style="width:187mm;clear:both;padding-bottom:.5mm;float:none;clear:both;" class="styBB">
            <div style="width:90mm;" class="styGenericDiv">Form 990 (2020)</div>
            <div style="width:55mm;text-align:center;" class="styGenericDiv"/>
            <div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">3</span>
            </div>
          </div>
          <!-- END Part III Table -->
          <!-- BEGIN Part IV Checklist of Required Schedules Title -->
          <div class="styBB" style="width:187mm;float:none;">
            <div class="styPartName" style="float:left;height:auto;"><span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IV</span></div>
            <div class="styPartDesc" style="float:left;width:152mm;height:auto;">Checklist of Required Schedules </div>
          </div>
          <div style="width: 187mm">
            <div class="styLNLeftNumBox"/>
            <div class="styLNDesc" style="width: 150mm"/>
            <div class="styIRS990LNYesNoBox" style="width:8mm;height:4.5mm;border-left-width:0px;">
              <span style="width:1px;"/>
            </div>
            <div class="styIRS990LNYesNoBox" style="width:10mm;height:4.5mm;border-top-width:0px;">
              <span class="styBoldText">Yes</span>
            </div>
            <div class="styIRS990LNYesNoBox" style="width:10mm;height:4.5mm;border-top-width:0px;">
              <span class="styBoldText">No</span>
            </div>
          </div>
          <!-- END Part IV Checklist of Required Schedules Title-->
          <!--BEGIN Part IV Checklist of Required Sched Line Items -->
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;padding-left:3mm;">1</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
         Is the organization described in section 501(c)(3) or 4947(a)(1) (other than a private foundation)?
         <i> If "Yes," complete Schedule A</i>
              <span style="padding-left:1mm"/>  <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/DescribedInSection501c3Ind"/>
                </xsl:call-template>
             
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.....................</span>
               </span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">1</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/DescribedInSection501c3Ind"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/DescribedInSection501c3Ind"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">2</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
         Is the organization required to complete <i>Schedule B, Schedule of Contributors</i> (see instructions)?
         <span style="padding-left:1mm"/><xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/ScheduleBRequiredInd"/>
                </xsl:call-template>
             
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...</span> </span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">2</div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ScheduleBRequiredInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ScheduleBRequiredInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;padding-left:3mm;">3</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
        Did the organization engage in direct or indirect political campaign activities on behalf of or in opposition to candidates for public office?
<span class="styItalicText"> If "Yes," complete Schedule C, <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part I</span></span>
               <span style="padding-left:1mm"/> <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/PoliticalCampaignActyInd"/>
                </xsl:call-template>
            
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.............</span>  </span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">3</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/PoliticalCampaignActyInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/PoliticalCampaignActyInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="width: 8mm; height: auto; padding-top: 2mm; padding-left: 3mm;">4</div>
            <span class="styLNDesc" style="width: 150mm; height: auto; padding-top: 2mm; padding-right: 0.5mm;">
              <span class="styBoldText" style="padding-top:0.0mm;">
        Section 501(c)(3) organizations. </span> Did the organization engage in lobbying activities, or have a section 501(h) election in effect during the tax year?
              <span class="styItalicText"> If "Yes," complete Schedule C, <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part II</span></span>
             <span style="padding-left:1mm"/> <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form990Data/LobbyingActivitiesInd"/>
              </xsl:call-template>
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.........</span>
            </span>
            <div class="styLNRightNumBox" style="height:10.5mm;padding-top:6mm;">4</div>
            <div class="styIRS990LNYesNoBox" style="height:10.5mm;padding-top:6mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/LobbyingActivitiesInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:10.5mm;padding-top:6mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/LobbyingActivitiesInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;padding-left:3mm;">5</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
         Is the organization a section 501(c)(4), 501(c)(5), or 501(c)(6) organization that receives membership dues, assessments, or similar amounts as defined in Revenue Procedure 98-19?  
              <span class="styItalicText">  If "Yes," complete Schedule C, <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part III</span></span>
              <span style="padding-left:1mm"/><xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form990Data/SubjectToProxyTaxInd"/>
              </xsl:call-template>
              <!--Dotted Line-->
              <span style="letter-spacing:2mm; font-weight:bold; font-size:7pt; ">..</span></span>
            </div>
            <div class="styLNRightNumBox" style="height:10.5mm;padding-top:6mm;">5</div>
            <div class="styIRS990LNYesNoBox" style="height:10.5mm;padding-top:5.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/SubjectToProxyTaxInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:10.5mm;padding-top:5.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/SubjectToProxyTaxInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:10.5mm;padding-left:3mm;">6</div>
            <div class="styLNDesc" style="width:150mm;height:10.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
        Did the organization maintain any donor advised funds or any similar funds or accounts for which donors have the right to provide advice on the distribution or investment of amounts in such funds or accounts?
<span class="styItalicText">  If "Yes," complete </span> </span>
<span class="styItalicText">  Schedule D, </span>

<span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part I</span>
                <span style="padding-left:1mm"/>
					<xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/DonorAdvisedFundInd"/>
                </xsl:call-template>
             
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt;">.........................</span>
            </div>
            <div class="styLNRightNumBox" style="height:10.5mm;padding-top:7mm;">6</div>
            <div class="styIRS990LNYesNoBox" style="height:10.5mm;padding-top:5.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/DonorAdvisedFundInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:10.5mm;padding-top:5.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/DonorAdvisedFundInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;padding-left:3mm;">7</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
        Did the organization receive or hold a conservation easement, including easements to preserve open space, <br/>the environment, historic land areas, or historic structures?
<span class="styItalicText"> If "Yes," complete Schedule D, <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part II</span></span>
                <span style="padding-left:1mm"/><xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/ConservationEasementsInd"/>
                </xsl:call-template>
             
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">....</span> </span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">7</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ConservationEasementsInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ConservationEasementsInd"/>
              </xsl:call-template>
            </div>
          </div>
          
          
           <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:5.5mm;padding-top:2mm;padding-left:3mm;">8</div>
            <div class="styLNDesc" style="width:150mm;height:5.5mm;padding-top:2mm;">
              <span class="styNormalText" style="padding-top:0mm;">Did the organization maintain collections of works of art, historical treasures, or other similar assets?</span>
                 <i> If "Yes," <br/>complete Schedule D, </i><span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part III</span>
                <span style="padding-left:1mm"/>
				<xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/CollectionsOfArtInd"/>
                </xsl:call-template>
             
               <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..............</span> 
            </div>
            <div class="styLNRightNumBox" style="height:9.5mm;padding-top:2mm;">8</div>
            <div class="styIRS990LNYesNoBox" style="height:9.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/CollectionsOfArtInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:9.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/CollectionsOfArtInd"/>
              </xsl:call-template>
            </div>
          </div>
          
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:10.5mm;padding-left:3mm;">9</div>
            <div class="styLNDesc" style="width:150mm;height:10.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
        Did the organization report an amount in <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part X</span>, line 21 for escrow or custodial account liability; serve as a custodian for amounts not listed in <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part X</span>; or provide credit counseling, debt management, credit repair, or debt negotiation services?<span class="styItalicText"> <span style="width:1mm;"/> If "Yes," complete Schedule D, <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IV</span></span>
                <span style="padding-left:1mm"/>
				<xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/CreditCounselingInd"/>
                </xsl:call-template>
             
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..............</span> </span>
            </div>
            <div class="styLNRightNumBox" style="height:10.5mm;padding-top:6.5mm;">9</div>
            <div class="styIRS990LNYesNoBox" style="height:10.5mm;padding-top:5.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/CreditCounselingInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:10.5mm;padding-top:5.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/CreditCounselingInd"/>
              </xsl:call-template>
            </div>
          </div>
          
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:5.5mm;padding-top:2mm;">10</div>
            <div class="styLNDesc" style="width:150mm;height:5.5mm;padding-top:2mm;">
              <span class="styNormalText" style="padding-top:0mm;">
    Did the organization, directly or through a related organization, hold assets in temporarily restricted endowments, permanent endowments, or quasi endowments?
    <span class="styItalicText"> If "Yes," complete Schedule D, <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part V</span></span>
                <span style="padding-left:1mm"/>
				<xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/DonorRstrOrQuasiEndowmentsInd"/>
                </xsl:call-template>
             
               <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">......</span> </span>
            </div>
            <div class="styLNRightNumBox" style="height:9.5mm;padding-top:2mm;">10</div>
            <div class="styIRS990LNYesNoBox" style="height:9.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/DonorRstrOrQuasiEndowmentsInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:9.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/DonorRstrOrQuasiEndowmentsInd"/>
              </xsl:call-template>
            </div>
          </div>
          
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;">11</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
       If the organization’s answer to  any of the following questions is "Yes," then complete Schedule D, Parts VI, VII, VIII, IX, or X as applicable.
       <!--            
       <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/BalanceSheetAmountsReported"/>
                </xsl:call-template>
         -->
              </span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;background-color:lightgrey;"/>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;background-color:lightgrey;">
            <!--
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/BalanceSheetAmountsReported"/>
              </xsl:call-template>
-->
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;background-color:lightgrey;">
            <!--
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/BalanceSheetAmountsReported"/>
              </xsl:call-template>
<div class="styLNLeftNumBox" style="height:7.5mm;padding-left:4mm;">b</div>
-->
            </div>
          </div>
          
           <!-- Bullets for Part IV - 11-->
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;padding-left:4mm;">a</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
              
             <!-- <img src="{$ImagePath}/990_Bullet_Round.gif" alt="RoundBullet"/>-->
        Did the organization report an amount for land, buildings, and equipment in <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part X</span>, line 10?  
<i> If "Yes," complete <br/>Schedule D, </i><span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VI</span>.
                 <span style="padding-left:1mm"/><xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/ReportLandBuildingEquipmentInd"/>
                </xsl:call-template>
              
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...................</span></span>
              </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">11a</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
            <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ReportLandBuildingEquipmentInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
            <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ReportLandBuildingEquipmentInd"/>
              </xsl:call-template>
            </div>
          </div>
          
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
              <!--<img src="{$ImagePath}/990_Bullet_Round.gif" alt="RoundBullet"/>-->
        Did the organization report an amount for investments—other securities in <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part X</span>, line 12 that is 5% or more of its total assets reported in <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part X</span>, line 16?    
<span class="styItalicText"> If "Yes," complete Schedule D, <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VII</span></span>
                   <span style="padding-left:1mm"/><xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/ReportInvestmentsOtherSecInd"/>
                </xsl:call-template>
             
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.......</span> </span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">11b</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
            <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ReportInvestmentsOtherSecInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
            <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ReportInvestmentsOtherSecInd"/>
              </xsl:call-template>
              </div>
          </div>
          
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;padding-left:4mm;">c</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
              <!--<img src="{$ImagePath}/990_Bullet_Round.gif" alt="RoundBullet"/>-->
        Did the organization report an amount for investments—program related in <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part X</span>, line 13 that is 5% or more of its total assets reported in <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part X</span>, line 16?       
<span class="styItalicText"> If "Yes," complete Schedule D, <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VIII</span></span>
                   <span style="padding-left:1mm"/><xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/ReportProgramRelatedInvstInd"/>
                </xsl:call-template>
              
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.......</span></span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">11c</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
            <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ReportProgramRelatedInvstInd"/>
              </xsl:call-template>
              </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
            <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ReportProgramRelatedInvstInd"/>
              </xsl:call-template>
            </div>
          </div>
          
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;padding-left:4mm;">d</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
            <!--  <img src="{$ImagePath}/990_Bullet_Round.gif" alt="RoundBullet"/>-->
        Did the organization report an amount for other assets in <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part X</span>, line 15 that is 5% or more of its total assets reported in <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part X</span>, line 16?    
<span class="styItalicText"> If "Yes," complete Schedule D, <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IX</span></span>
                  <span style="padding-left:1mm"/><xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/ReportOtherAssetsInd"/>
                </xsl:call-template>
              
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">............</span></span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">11d</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ReportOtherAssetsInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ReportOtherAssetsInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:auto;padding-left:4mm;">e</div>
            <div class="styLNDesc" style="width:150mm;height:auto;">
              <span class="styNormalText" style="padding-top:0.0mm;">
              <!--<img src="{$ImagePath}/990_Bullet_Round.gif" alt="RoundBullet"/>-->
        Did the organization report an amount for other liabilities in <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part X</span>, line 25?   
<span class="styItalicText"> If "Yes," complete Schedule D, <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part X</span></span>
                 <span style="padding-left:1mm"/><xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/ReportOtherLiabilitiesInd"/>
                </xsl:call-template>
              </span>
              
            </div>
            <div class="styLNRightNumBox" style="height:auto;padding-top:2.5mm;">11e</div>
            <div class="styIRS990LNYesNoBox" style="height:auto;padding-top:2.5mm;">
            <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ReportOtherLiabilitiesInd"/>
              </xsl:call-template>
              </div>
            <div class="styIRS990LNYesNoBox" style="height:auto;padding-top:2.5mm;">
            <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ReportOtherLiabilitiesInd"/>
              </xsl:call-template>
            </div>
          </div>
          
          <div style="width:187mm;height:7.5mm;float:none;">
            <div class="styLNLeftNumBox" style="height:auto;padding-left:4mm;">f</div>
            <div class="styLNDesc" style="width:150mm;height:auto;">
              <span class="styNormalText">
              <!--<img src="{$ImagePath}/990_Bullet_Round.gif" alt="RoundBullet"/>-->
        Did the organization’s separate or consolidated financial statements for the tax year include a footnote that addresses the organization’s liability for uncertain tax positions under FIN 48 (ASC 740)?   
<span class="styItalicText"> If "Yes," complete Schedule D, <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part X</span></span>
                     <span style="padding-left:1mm"/><xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/IncludeFIN48FootnoteInd"/>
                </xsl:call-template>
             
             <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;"></span>  </span>
            </div>
            <div class="styLNRightNumBox" style="height:auto;padding-top:4mm;">11f</div>
            <div class="styIRS990LNYesNoBox" style="height:auto;padding-top:4mm;">
            <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/IncludeFIN48FootnoteInd"/>
              </xsl:call-template>
              </div>
            <div class="styIRS990LNYesNoBox" style="height:auto;padding-top:4mm;">
            <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/IncludeFIN48FootnoteInd"/>
              </xsl:call-template>
              </div>
          </div>
          
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:auto;">12a</div>
            <div class="styLNDesc" style="width:150mm;height:auto;">
              <span class="styNormalText" style="padding-top:0.0mm;">
        Did the organization obtain separate, independent audited financial statements for the tax year? 
<i>If "Yes," complete <br/>Schedule D, Parts XI and XII</i>
                    <span style="padding-left:1mm">
						<xsl:call-template name="SetFormLinkInline">
						  <xsl:with-param name="TargetNode" select="$Form990Data/IndependentAuditFinclStmtInd"/>
						</xsl:call-template>
                </span>
                <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">......................</span></span>
              
            </div>
            <div class="styLNRightNumBox" style="height:auto;padding-top:3.5mm;">12a</div>
            <div class="styIRS990LNYesNoBox" style="height:auto;padding-top:3.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/IndependentAuditFinclStmtInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:auto;padding-top:3.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/IndependentAuditFinclStmtInd"/>
              </xsl:call-template>
            </div>
          </div>
                    
      <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm; font-size:7pt;">
        Was the organization included in consolidated, independent audited financial statements for the tax year? 
        <span class="styItalicText"> If "Yes," and if the organization answered "No" to line 12a, then completing Schedule D, Parts XI and XII is optional
                        <span style="padding-left:1mm"/><xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/ConsolidatedAuditFinclStmtInd"/>
                </xsl:call-template>
                </span>        
            </span>
              </div>
              <div class="styLNRightNumBox" style="height:7.5mm;padding-top:2mm;">12b</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ConsolidatedAuditFinclStmtInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ConsolidatedAuditFinclStmtInd"/>
              </xsl:call-template>
            </div>
              <!--
            THIS IS EXAMPLE OF HOW TO SET UP INNER YES/NO BOX next to Normal yes/no boxes
            <div class="styIRS990LNYesNoBox" style="width:5mm;height:2.5mm;border-top-width:0px; padding-bottom:3.5mm;border-top-width:1px;">
        <span class="styBoldText">Yes</span>
        </div>
            <div class="styIRS990LNYesNoBox" style="width:5mm;height:2.5mm;border-top-width:0px; padding-bottom:3.5mm;border-top-width:1px;">
                          <span class="styBoldText">No</span>
                                      </div>
                 -->
                 <!--
           <div class="styShadingCell" style="width:8mm;height:7.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:7.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:7.5mm;"/>
                   -->
                   
            </div>              
                    
                
              
         <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:auto;">13</div>
            <div class="styLNDesc" style="width:150mm;height:auto;">
              <span class="styNormalText" style="padding-top:0.0mm;">
    Is the organization a school described in section 170(b)(1)(A)(ii)?
    <i> If "Yes," complete Schedule E</i>
             
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;"></span></span>
                <span style="padding-left:1mm"/><xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/SchoolOperatingInd"/>
                </xsl:call-template>
                 </div>
            <div class="styLNRightNumBox" style="height:auto;padding-top:2.5mm;">13</div>
            <div class="styIRS990LNYesNoBox" style="height:auto;padding-top:2.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/SchoolOperatingInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:auto;padding-top:2.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/SchoolOperatingInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">14a</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
    Did the organization maintain an office, employees, or agents outside of the United States?
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.....</span></span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">14a</div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ForeignOfficeInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ForeignOfficeInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
        Did the organization have aggregate revenues or expenses of more than $10,000 from grantmaking, fundraising, business, investment, and program service activities outside the United States, or aggregate foreign investments valued at $100,000 or more?
<i> If "Yes," complete Schedule F, Parts I and IV</i>
              
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.........</span>
                <span style="padding-left:1mm"/><xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/ForeignActivitiesInd"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="styLNRightNumBox" style="height:10.5mm;padding-top:5.5mm;">14b</div>
            <div class="styIRS990LNYesNoBox" style="height:10.5mm;padding-top:5.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ForeignActivitiesInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:10.5mm;padding-top:5.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ForeignActivitiesInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;">15</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
        Did the organization report on <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IX</span>, column (A), line 3, more than $5,000 of grants or other assistance to or for any foreign organization?
<i>  If “Yes,” complete Schedule F, Parts II and IV</i>
             
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.....</span> 
                  <span style="padding-left:1mm"/><xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/MoreThan5000KToOrgInd"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">15</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/MoreThan5000KToOrgInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/MoreThan5000KToOrgInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;">16</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
        Did the organization report on <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IX</span>, column (A), line 3, more than $5,000 of aggregate grants or other assistance to or for foreign individuals?
<i> If “Yes,” complete Schedule F, Parts III and IV</i>
              
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...</span> 
            <span style="padding-left:1mm"/><xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/MoreThan5000KToIndividualsInd"/>
                </xsl:call-template>
             </span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">16</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/MoreThan5000KToIndividualsInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/MoreThan5000KToIndividualsInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;">17</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
    Did the organization report a total of more than $15,000 of expenses for professional fundraising services on <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IX</span>, column (A), lines 6 and 11e?
    <i>  If "Yes," complete Schedule G, <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part I</span> </i>(see instructions)
              
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">....</span>
             
                <span style="padding-left:1mm"/><xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/ProfessionalFundraisingInd"/>
                </xsl:call-template>
                 </span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:1.5mm;">17</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
              <xsl:with-param name="TargetNode" select="$Form990Data/ProfessionalFundraisingInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
              <xsl:with-param name="TargetNode" select="$Form990Data/ProfessionalFundraisingInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;">18</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
    Did the organization report more than $15,000 total of fundraising event gross income and contributions on <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VIII</span>, lines 1c and 8a?
    <i> If "Yes," complete Schedule G, <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part II</span></i>
             
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">............ </span>
            <span style="padding-left:1mm"/><xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/FundraisingActivitiesInd"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">18</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/FundraisingActivitiesInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/FundraisingActivitiesInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:5.5mm;">19</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
    Did the organization report more than $15,000 of gross income from gaming activities on <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VIII</span>, line 9a?
    <i> If "Yes," complete Schedule G, <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part III</span></i>
    <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...................</span>
              
                      <span style="padding-left:1mm"/><xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/GamingActivitiesInd"/>
                </xsl:call-template>
                </span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:2.5mm;">19</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/GamingActivitiesInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/GamingActivitiesInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:5.5mm;">20a</div>
            <div class="styLNDesc" style="width:150mm;height:5.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
    Did the organization operate one or more hospital facilities?
    <i> If "Yes," complete Schedule H</i>
              
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">....</span> </span>
                 <span style="padding-left:1mm"/><xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/OperateHospitalInd"/>
                </xsl:call-template>
             
            </div>
            <div class="styLNRightNumBox" style="height:5.5mm;padding-top:1.5mm;">20a</div>
            <div class="styIRS990LNYesNoBox" style="height:5.5mm;padding-top:1.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/OperateHospitalInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:5.5mm;padding-top:1.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/OperateHospitalInd"/>
              </xsl:call-template>
            </div>
          </div>          
          
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:5.5mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:150mm;height:5.5mm;">
              <span style="float:left;">
    If "Yes" to line 20a, did the organization attach a copy of its audited financial statements to this return? 
    <!--<b>Note. </b>All Form 990 filers that operated one or more hospitals must attach audited financial statements.
    <span class="styItalicText"> If "Yes," complete Schedule H</span>-->
              </span>
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">
                  <span style="padding-left:1mm"/> <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/AuditedFinancialStmtAttInd"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="styLNRightNumBox" style="height:5.5mm;padding-top:2.5mm;">20b</div>
            <div class="styIRS990LNYesNoBox" style="height:5.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/AuditedFinancialStmtAttInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:5.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/AuditedFinancialStmtAttInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:5.5mm;">21</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
    Did the organization report more than $5,000 of grants or other assistance to any domestic organization or domestic government on <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IX</span>, column (A), line 1?
     <i>  If “Yes,” complete Schedule I, Parts I and II</i>
              
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.....</span>
               <span style="padding-left:1mm"/> <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/GrantsToOrganizationsInd"/>
                </xsl:call-template></span>
              
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:1.5mm;">21</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
              <xsl:with-param name="TargetNode" select="$Form990Data/GrantsToOrganizationsInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/GrantsToOrganizationsInd"/>
              </xsl:call-template>
            </div>
          </div>
            
          
          <!-- END Part III Table -->
          
          <!-- Footer -->
          <div style="width:187mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 0px" class="pageEnd">
            <div class="styGenericDiv" style="width:105mm;"/>
            <div class="styGenericDiv" style="width:25mm;"/>
            <div class="styGenericDiv" style="float:right;">Form <span class="styBoldText">990</span> (2020)</div>
          </div>
          <!-- header -->
          <div style="width:187mm;clear:both;padding-bottom:.5mm;float:none;clear:both;" class="styBB">
            <div style="width:90mm;" class="styGenericDiv">Form 990 (2020)</div>
            <div style="width:55mm;text-align:center;" class="styGenericDiv"/>
            <div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">4</span>
            </div>
          </div>
          <!-- Begin Part IV Checklist of Required Schedules-->
          <!--   BEGIN Part IV Checklist of Required Schedules Title -->
          <div class="styBB" style="width:187mm;float:none;">
            <div class="styPartName" style="float:left;height:auto;"><span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IV</span></div>
            <div class="styPartDesc" style="float:left;width:152mm;">Checklist of Required Schedules <span class="styNormalText" style="font-style:italic;">(continued)</span>
            </div>
          </div>
          <div style="width: 187mm">
            <div class="styLNLeftNumBox"/>
            <div class="styLNDesc" style="width: 150mm"/>
            <div class="styIRS990LNYesNoBox" style="width:8mm;height:4.5mm;border-left-width:0px;">
              <span style="width:1px;"/>
            </div>
            <div class="styIRS990LNYesNoBox" style="width:10mm;height:4.5mm;border-top-width:0px;">
              <span class="styBoldText">Yes</span>
            </div>
            <div class="styIRS990LNYesNoBox" style="width:10mm;height:4.5mm;border-top-width:0px;">
              <span class="styBoldText">No</span>
            </div>
            </div>
           <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:5.5mm;">22</div>
            <div class="styLNDesc" style="width:150mm;height:5.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
    Did the organization report more than $5,000 of grants or other assistance to or for domestic individuals on <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IX</span>, column (A), line 2?
    <i> If “Yes,” complete Schedule I, Parts I and III</i>
              
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">........</span>
                <span style="padding-left:1mm"/><xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/GrantsToIndividualsInd"/>
                </xsl:call-template></span>
            </div>
            
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:1.5mm;">22</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/GrantsToIndividualsInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/GrantsToIndividualsInd"/>
              </xsl:call-template>
            </div>
          </div> 
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:10.5mm;">23</div>
            <div class="styLNDesc" style="width:150mm;height:10.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
        Did the organization answer "Yes" to <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VII</span>, Section A, line 3, 4, or 5 about compensation of the organization’s current and former officers, directors, trustees, key employees, and highest compensated employees?
         <i> If "Yes," complete Schedule J</i>
             
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">....................... </span>
       <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/ScheduleJRequiredInd"/>
                </xsl:call-template></span>
              
            </div>
            <div class="styLNRightNumBox" style="height:10.5mm;padding-top:3.5mm;">23</div>
            <div class="styIRS990LNYesNoBox" style="height:10.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ScheduleJRequiredInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:10.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ScheduleJRequiredInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:10.5mm;">24a</div>
            <div class="styLNDesc" style="width:150mm;height:10.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
        Did the organization have a tax-exempt bond issue with an outstanding principal amount of more than $100,000 as of the last day of the year,  that was issued after December 31, 2002? 
<i> If “Yes,” answer lines 24b through 24d and complete Schedule K. If “No,” go to line 25a</i>
             
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...............</span> 
       <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/TaxExemptBondsInd"/>
                </xsl:call-template></span>
              
            </div>
            <div class="styLNRightNumBox" style="height:10.5mm;padding-top:7mm;">24a</div>
            <div class="styIRS990LNYesNoBox" style="height:10.5mm;padding-top:5.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/TaxExemptBondsInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:10.5mm;padding-top:5.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/TaxExemptBondsInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:5.5mm;padding-left:4mm;padding-top:2mm;">b</div>
            <div class="styLNDesc" style="width:150mm;height:5.5mm;padding-top:2mm;">
              <span class="styNormalText" style="padding-top:0mm;">
    Did the organization invest any proceeds of tax-exempt bonds beyond a temporary period exception?</span>
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...
        </span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">24b</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/InvestTaxExemptBondsInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/InvestTaxExemptBondsInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;padding-left:4mm;">c</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
    Did the organization maintain an escrow account other than a refunding escrow at any time during the year <br/> to defease any tax-exempt bonds?
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...............</span></span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">24c</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/EscrowAccountInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/EscrowAccountInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:5.5mm;padding-left:4mm;">d</div>
            <div class="styLNDesc" style="width:150mm;height:5.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
    Did the organization act as an "on behalf of" issuer for bonds outstanding at any time during the year?</span>
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...</span>
            </div>
            <div class="styLNRightNumBox" style="height:5.5mm;padding-top:1.5mm;">24d</div>
            <div class="styIRS990LNYesNoBox" style="height:5.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/OnBehalfOfIssuerInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:5.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/OnBehalfOfIssuerInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:auto;">25a</div>
            <div class="styLNDesc" style="width:150mm;height:auto;">
              <b> Section 501(c)(3), 501(c)(4), and 501(c)(29) organizations. </b> Did the organization engage in an excess benefit transaction with a disqualified person during the year?
              <i> If "Yes," complete Schedule L, </i>
			<span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part I
				<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.... </span>
				<xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/EngagedInExcessBenefitTransInd"/>
                </xsl:call-template>
			</span>
             </div>
            
            <div class="styLNRightNumBox" style="height:9.5mm;padding-top:4.5mm;">25a</div>
            <div class="styIRS990LNYesNoBox" style="height:9.5mm;padding-top:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/EngagedInExcessBenefitTransInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:9.5mm;padding-top:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/EngagedInExcessBenefitTransInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:10.5mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:150mm;height:10.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
        Is the organization aware that it engaged in an excess benefit transaction with a disqualified person in a prior year, and that the transaction has not been reported on any of the organization’s prior Forms 990 or 990-EZ?
<i> If "Yes," complete Schedule L, </i><span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part I</span>
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.......................</span>
       <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/PYExcessBenefitTransInd"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="styLNRightNumBox" style="height:10.5mm;padding-top:3.5mm;">25b</div>
            <div class="styIRS990LNYesNoBox" style="height:10.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/PYExcessBenefitTransInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:10.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/PYExcessBenefitTransInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;">26</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
       Did the organization report any amount on Part X, line 5 or 22 for receivables from or payables to any current or former officer, director, trustee, key employee, creator or founder, substantial contributor, or 35% controlled entity or family member of any of these persons? 
<span class="styItalicText"> If "Yes,"
complete Schedule L, <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part II</span>
<span style="width:1mm;"></span><xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/LoanOutstandingInd"/>
                </xsl:call-template>
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...........</span>
              </span>
 
              </span>
            </div>
            <div class="styLNRightNumBox" style="height:10.5mm;padding-top:3.5mm;">26</div>
            <div class="styIRS990LNYesNoBox" style="height:10.5mm;padding-top:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/LoanOutstandingInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:10.5mm;padding-top:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/LoanOutstandingInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;height:auto;float:none;">
            <div class="styLNLeftNumBox" style="height:auto;">27</div>
            <div class="styLNDesc" style="width:150mm;height:auto;">
<div>Did the organization provide a grant or other assistance to any current or former officer, director, trustee, key employee, creator or founder, substantial contributor, or employee thereof, a grant selection committee member, or to a 35% controlled entity (including an employee thereof) or family member of any of these persons? <div style="font-style:italic;">If "Yes," complete</div><span class="styItalicText"> Schedule L, </span><span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part III</span>
<!--Dotted Line--><xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form990Data/GrantToRelatedPersonInd"/>
                </xsl:call-template>
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.........................</span>
              
            </div>
            </div>
            <div class="styLNRightNumBox" style="height:14mm;padding-top:4.5mm;">27</div>
            <div class="styIRS990LNYesNoBox" style="height:14mm;padding-top:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/GrantToRelatedPersonInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:14mm;padding-top:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/GrantToRelatedPersonInd"/>
              </xsl:call-template>
            </div>
          </div>
          
          
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:auto;">28</div>
            <div class="styLNDesc" style="width:150mm;height:auto;">
          Was the organization a party to a business transaction with one of the following parties (see Schedule L, <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IV</span> instructions for applicable filing thresholds, conditions, and exceptions):
      </div>
            <div class="styShadingCell" style="width:8mm;height:7.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:7.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:7.5mm;"/>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:auto;padding-left:4mm;">a</div>
            <div class="styLNDesc" style="width:150mm;height:auto;">
             A current or former officer, director, trustee, key employee, creator or founder, or substantial contributor? <i> If "Yes," complete Schedule L, <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IV</span> </i>
              <!--Dotted Line-->
    <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">......................</span>
       <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/BusinessRlnWithOrgMemInd"/>
                </xsl:call-template>
             
            </div>
            <div class="styShadingCell" style="width:8mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
            <div class="styLNRightNumBox" style="height:auto;">28a</div>
            <div class="styIRS990LNYesNoBox" style="height:auto;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/BusinessRlnWithOrgMemInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:auto;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/BusinessRlnWithOrgMemInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:auto;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:150mm;height:auto;">
            
              <span class="styNormalText" style="padding-top:0.0mm;">
        A family member of any individual described in line 28a?  
        <i> If "Yes," complete Schedule L, <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IV</span></i>
              
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.....</span>
       <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/BusinessRlnWithFamMemInd"/>
                </xsl:call-template></span>
              
            </div>
            <div class="styLNRightNumBox" style="height:auto;padding-top:3.5mm;">28b</div>
            <div class="styIRS990LNYesNoBox" style="height:auto;padding-top:3.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/BusinessRlnWithFamMemInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:auto;padding-top:3.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/BusinessRlnWithFamMemInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;padding-left:4mm;">c</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
        A 35% controlled entity of one or more individuals and/or organizations described in lines 28a or 28b? 
<i> If "Yes," complete Schedule L, <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-style:italic; font-size:10.0px;">Part IV</span></i>
             
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..................... </span>
        <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/BusinessRlnWith35CtrlEntInd"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">28c</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/BusinessRlnWith35CtrlEntInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/BusinessRlnWith35CtrlEntInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:5.5mm;">29</div>
            <div class="styLNDesc" style="width:150mm;height:5.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
    Did the organization receive more than $25,000 in non-cash contributions?
    <span class="styItalicText">  If "Yes," complete Schedule M</span>
    <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..</span>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/DeductibleNonCashContriInd"/>
                </xsl:call-template>
              </span>
               </div>
            <div class="styLNRightNumBox" style="height:5.5mm;padding-top:1.5mm;">29</div>
            <div class="styIRS990LNYesNoBox" style="height:5.5mm;padding-top:1mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/DeductibleNonCashContriInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:5.5mm;padding-top:1mm">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/DeductibleNonCashContriInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;">30</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
    Did the organization receive contributions of art, historical treasures, or other similar assets, or qualified conservation contributions?
    <span class="styItalicText"> If "Yes," complete Schedule M
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.................</span>
              </span>
       <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/DeductibleArtContributionInd"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">30</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/DeductibleArtContributionInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/DeductibleArtContributionInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:auto;">31</div>
            <div class="styLNDesc" style="width:150mm;height:auto;">
              <span class="styNormalText" style="padding-top:0.0mm;">
    Did the organization liquidate, terminate, or dissolve and cease operations?<i> If "Yes," complete Schedule N, <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part I</span></i>
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;"></span>
              </span>
       <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/TerminateOperationsInd"/>
                </xsl:call-template>
              
            </div>
            <div class="styLNRightNumBox" style="height:auto;padding-top:2.5mm;">31</div>
            <div class="styIRS990LNYesNoBox" style="height:auto;padding-top:2.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/TerminateOperationsInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:auto;padding-top:2.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/TerminateOperationsInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;">32</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
              <div class="styNormalText" style="padding-top:0.0mm;">
    Did the organization sell, exchange, dispose of, or transfer more than 25% of its net assets?
    <i> If "Yes," complete Schedule N, <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part II</span></i>
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">........................</span>
				<xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/PartialLiquidationInd"/>
                </xsl:call-template>
              </div>
       
              </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">32</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/PartialLiquidationInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/PartialLiquidationInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;">33</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
    Did the organization own 100% of an entity disregarded as separate from the organization under Regulations
sections 301.7701-2 and 301.7701-3?    <span class="styItalicText">  If "Yes," complete Schedule R, <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part I</span>
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">............</span>
              </span>
              <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/DisregardedEntityInd"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">33</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/DisregardedEntityInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/DisregardedEntityInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;">34</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">Was the organization related to any tax-exempt or taxable entity? 
    <i>If "Yes," complete Schedule R, <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part II</span>, III, or IV, and <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part V</span>, line 1</i>   
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.........................</span>
         
       <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/RelatedEntityInd"/>
                </xsl:call-template>
           
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:2.5mm;">34</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/RelatedEntityInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/RelatedEntityInd"/>
              </xsl:call-template>
            </div>
          </div>
          
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;padding-top:2.5mm;">35a</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
              <span class="styNormalText" style="padding-top:2.5mm;">
                Did the organization have a controlled entity within the meaning of section 512(b)(13)?
                  <!--Dotted Line-->
            <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;"/>
               </span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:2.5mm;">35a</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/RelatedOrganizationCtrlEntInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/RelatedOrganizationCtrlEntInd"/>
              </xsl:call-template>
            </div>
          </div>
<!-- NEW 35a for 2011 per 40502 -->
        <!-- Changed line 35a to put yes/no boxes back as normal yes/no boxes -->  
                  
<div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
    If ‘Yes’ to line 35a, did the organization receive any payment from or engage in any transaction with a controlled entity within the meaning of section 512(b)(13)? <span class="styItalicText"> If "Yes," complete Schedule R, <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part V</span>, line 2
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...</span>
              </span>
       <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/TransactionWithControlEntInd"/>
                </xsl:call-template>
              </span>
              
          <!--  
            <span style="width:2mm;padding-left:8mm;"/>
              <input type="checkbox" class="styCkbox" name="Checkbox" id="dummyidexempt">
                <xsl:call-template name="PopulateYesCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form990Data/TransactionRelatedEntity"/>
                  <xsl:with-param name="BackupName">IRS990TransactionRelatedEntityYes</xsl:with-param>
                </xsl:call-template>
              </input>
              <label for="dummyidexempt">
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form990Data/TransactionRelatedEntity"/>
                  <xsl:with-param name="BackupName">IRS990TransactionRelatedEntityYes</xsl:with-param>
                </xsl:call-template>
                <span class="styBoldText">Yes</span>
              </label>
              <span style="width:2mm;">
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form990Data/TransactionRelatedEntity"/>
                </xsl:call-template>
              </span>
              <input type="checkbox" class="styCkbox" name="Checkbox" onclick="return false;" id="dummyidnonexempt">
                <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form990Data/TransactionRelatedEntity"/>
                  <xsl:with-param name="BackupName">IRS990TransactionRelatedEntityNo</xsl:with-param>
                </xsl:call-template>
              </input>
              <label for="dummyidnonexempt">
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form990Data/TransactionRelatedEntity"/>
                  <xsl:with-param name="BackupName">IRS990TransactionRelatedEntityNo</xsl:with-param>
                </xsl:call-template>
                <span class="styBoldText">No</span>
              </label>
              <span style="width:2mm;"/>
-->
            </div>
            
           <div class="styLNRightNumBox" style="height:7.5mm;padding-top:2.5mm;">35b</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/TransactionWithControlEntInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/TransactionWithControlEntInd"/>
              </xsl:call-template>
            </div>
          </div>
         <!--
<div class="styShadingCell" style="width:8mm;height:8mm;"/>
            <div class="styShadingCell" style="width:10mm;height:8mm;"/>
            <div class="styShadingCell" style="width:10mm;height:8mm;"/>
         -->
              
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;">36</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
                <span class="styBoldText">
    Section 501(c)(3) organizations.</span> Did the organization make any transfers to an exempt non-charitable related organization? 
    <span class="styItalicText"> If "Yes," complete Schedule R, <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part V</span>, line 2</span>
             
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">............. </span> 
       <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/TrnsfrExmptNonChrtblRltdOrgInd"/>
                </xsl:call-template></span>
             
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">36</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/TrnsfrExmptNonChrtblRltdOrgInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/TrnsfrExmptNonChrtblRltdOrgInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;">37</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
    Did the organization conduct more than 5% of its activities through an entity that is not a related organization and that is treated as a partnership for federal income tax purposes?
<span class="styItalicText">  If "Yes," complete Schedule R, <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VI</span></span>
              
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/ActivitiesConductedPrtshpInd"/>
                </xsl:call-template></span>
              </span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">37</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ActivitiesConductedPrtshpInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ActivitiesConductedPrtshpInd"/>
              </xsl:call-template>
            </div>
            
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;">38</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
    Did the organization complete Schedule O and provide explanations in Schedule O for <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VI</span>, lines 11b and 19? <b>Note.</b> All Form 990 filers are required to complete Schedule O.
              
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">............</span>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990Data/ScheduleORequiredInd"/>
                </xsl:call-template>
              </span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">38</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ScheduleORequiredInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ScheduleORequiredInd"/>
              </xsl:call-template>
            </div>
                      </div>
                      <div class="styBB" style="width:187mm; border-top-width: 1px; clear:both;">
            <div class="styPartName" style="float:left;height:4.5mm"><span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part V</span></div>
            <div class="styPartDesc" style="float:left;width:171mm;height:auto;">Statements Regarding Other IRS Filings and Tax Compliance <br></br>
           <span class="styNormalText" style="padding-top:0.0mm;">
        Check if Schedule O contains a response or note to any line in this <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part V</span></span>
        <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...........</span>
              <span style="width:.5mm"/>
							<input type="checkbox" class="styCkbox" alt="InfoInScheduleOPartVInd">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InfoInScheduleOPartVInd"/>
                    <xsl:with-param name="BackupName">IRS990InfoInScheduleOPartVInd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
									<xsl:call-template name="PopulateLabel">
										<xsl:with-param name="TargetNode" select="$Form990Data/InfoInScheduleOPartVInd"/>
										<xsl:with-param name="BackupName">IRS990InfoInScheduleOPartVInd</xsl:with-param>
									</xsl:call-template>
								</label>
        
        </div>
        </div>
          <div style="width: 187mm">
            <div class="styLNLeftNumBox"/>
            <div class="styLNDesc" style="width: 150mm"/>
            <div class="styIRS990LNYesNoBox" style="width:8mm;height:4.5mm;border-left-width:0px;">
              <span style="width:1px;"/>
            </div>
            <div class="styIRS990LNYesNoBox" style="width:10mm;height:4.5mm;border-top-width:0px;">
              <span class="styBoldText">Yes</span>
            </div>
            <div class="styIRS990LNYesNoBox" style="width:10mm;height:4.5mm;border-top-width:0px;">
              <span class="styBoldText">No</span>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;padding-top:0mm;">1a</div>
            <div class="styLNDesc" style="width:110mm;height:4.5mm;padding-top:0mm;">
        Enter the number reported in Box 3 of Form 1096. <!--<span class="styItalicText">Annual Summary and Transmittal of U.S. Information Returns.-->Enter -0- <!--</span>--> if not applicable   
                                             <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..</span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;padding-top:0mm;">1a</div>
            <div class="styLNAmountBox" style="height:4.5mm;padding-right:0.5mm;padding-top:0mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form990Data/IRPDocumentCnt"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="width:8mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;padding-top:0mm;">b</div>
            <div class="styLNDesc" style="width:110mm;height:4.5mm;padding-top:0mm;">
        Enter the number of Forms W-2G included in line 1a. Enter -0- 
if not applicable
                                            <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;"/>.
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;padding-top:0mm;">1b</div>
            <div class="styLNAmountBox" style="height:4.5mm;padding-right:0.5mm;padding-top:0mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form990Data/IRPDocumentW2GCnt"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="width:8mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:7.5mm;padding-left:4mm;">c</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
        Did the organization comply with backup withholding rules for reportable payments to vendors and reportable gaming (gambling) winnings to prize winners?  
                                             <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..................</span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">1c</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/BackupWthldComplianceInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/BackupWthldComplianceInd"/>
              </xsl:call-template>
            </div>
          </div> 
          <!-- END Part IV Table -->
          
          <!-- Footer -->
          <div style="width:187mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 0px" class="pageEnd">
            <div class="styGenericDiv" style="width:105mm;"/>
            <div class="styGenericDiv" style="width:25mm;"/>
            <div class="styGenericDiv" style="float:right;">Form <span class="styBoldText">990</span> (2020)</div>
          </div>
          <!-- header -->
          <div style="width:187mm;clear:both;padding-bottom:.5mm;float:none;clear:both;" class="styBB">
            <div style="width:90mm;" class="styGenericDiv">Form 990 (2020)</div>
            <div style="width:55mm;text-align:center;" class="styGenericDiv"/>
            <div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">5</span>
            </div>
          </div>
        
        
        <div class="styBB" style="width:187mm; border-top-width: 1px; clear:both;">
            <div class="styPartName" style="float:left;height:4.5mm"><span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part V</span></div>
            <div class="styPartDesc" style="float:left;width:171mm;height:auto;">Statements Regarding Other IRS Filings and Tax Compliance <span class="styNormalText" style="font-style: italic;">(continued)</span></div>
            </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:9.5mm;padding-left:3mm;">2a</div>
            <div class="styLNDesc" style="width:110mm;height:9.5mm;">
       Enter the number of employees reported on Form W-3, Transmittal of Wage and <br/>Tax
Statements, filed for the calendar year ending with or within the year covered by this return   
                                             <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..................</span>
            </div>
            <div class="styLNRightNumBox" style="height:10.5mm;padding-top:6.5mm;">2a</div>
            <div class="styLNAmountBox" style="height:10.5mm;padding-top:6.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form990Data/EmployeeCnt"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="width:8mm;height:10.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:10.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:10.5mm;"/>
          </div>
          
        
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:150mm;height:auto;">
              <span class="styNormalText" style="padding-top:0mm;">
    If at least one is reported on line 2a, did the organization file all required federal employment tax returns?</span>
              <br/>
              
              <span class="styNormalText" style="padding-top:0.0mm;display:inline;">
                <span class="styBoldText">Note. </span>
                <span style="width:1mm;"></span>
                <span class="styNormalText"> If the sum of lines 1a and 2a is greater than 250, you may be required to e-file (see instructions)</span>
              </span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;padding-top:0mm;">2b</div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;padding-top:0mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/EmploymentTaxReturnsFiledInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;padding-top:0mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/EmploymentTaxReturnsFiledInd"/>
              </xsl:call-template>
            </div>

            <div class="styShadingCell" style="width:8mm;height:2.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:2.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:2.5mm;"/>
         </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">3a</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
    Did the organization have unrelated business gross income of $1,000 or more during the year?</span>
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...</span>
              
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">3a</div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/UnrelatedBusIncmOverLimitInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/UnrelatedBusIncmOverLimitInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
    If “Yes,” has it filed a Form 990-T for this year?<span class="styItalicText"> If “No” to line 3b, provide an explanation in Schedule O</span>
              </span>
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...</span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">3b</div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/Form990TFiledInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/Form990TFiledInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:6.5mm;padding-left:3mm;">4a</div>
            <div class="styLNDesc" style="width:150mm;height:6.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
    At any time during the calendar year, did the organization have an interest in, or a signature or other authority over, a financial account in a foreign country (such as a bank account, securities account, or other financial account)?
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..</span></span>
            </div>
            <div class="styLNRightNumBox" style="height:6.5mm;padding-top:1mm;">4a</div>
            <div class="styIRS990LNYesNoBox" style="height:6.5mm;padding-top:1mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ForeignFinancialAccountInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:6.5mm;padding-top:1mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ForeignFinancialAccountInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
              <span class="styNormalText" style="padding-top:0mm;">
        If "Yes," enter the name of the foreign country: <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
              </span>
              <span class="styFixedUnderline" style="float:none;width:75mm;">
                <xsl:for-each select="$Form990Data/ForeignCountryCd">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="."/>
                  </xsl:call-template>
                  <xsl:if test="not(position() = last())">
                  ,
                </xsl:if>
                </xsl:for-each>
              </span>
              <br/>
              <span class="styNormalText" style="padding-top:0.25mm;">
See instructions for filing requirements for FinCEN Form 114, Report of Foreign Bank and Financial Accounts (FBAR).</span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;background-color:lightgrey;"/>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;background-color:lightgrey;"/>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;background-color:lightgrey;"/>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">5a</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
    Was the organization a party to a prohibited tax shelter transaction at any time during the tax year?
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..</span></span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">5a</div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ProhibitedTaxShelterTransInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ProhibitedTaxShelterTransInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:5.5mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
  Did any taxable party notify the organization that it was or is a party to a prohibited tax shelter transaction?</span>
            </div>
            <div class="styLNRightNumBox" style="height:5.5mm;padding-top:1.5mm;">5b</div>
            <div class="styIRS990LNYesNoBox" style="height:5.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/TaxablePartyNotificationInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:5.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/TaxablePartyNotificationInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">c</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
 If "Yes," to line 5a or 5b, did the organization file Form 8886-T? <!--<span class="styNormalText"> Disclosure by Tax-Exempt Entity Regarding Prohibited Tax Shelter Transaction?</span>-->
              
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">............</span>
              </span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">5c</div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/Form8886TFiledInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/Form8886TFiledInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;padding-left:3mm;">6a</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
Does the organization have annual gross receipts that are normally greater than $100,000, and did the organization solicit any contributions that were not tax deductible as charitable contributions?
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...</span></span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;">6a</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/NondeductibleContributionsInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/NondeductibleContributionsInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
 If "Yes," did the organization include with every solicitation an express statement that such contributions or gifts were not tax deductible?
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">......................</span></span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">6b</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/NondeductibleContriDisclInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/NondeductibleContriDisclInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">7</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
              <span class="styBoldText" style="padding-top:0.0mm;">
Organizations that may receive deductible contributions under section 170(c).</span>
            </div>
            <div class="styShadingCell" style="width:8mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">a</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
 Did the organization receive a payment in excess of $75 made partly as a contribution and partly for goods and services provided to the payor?
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">....................</span></span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;">7a</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/QuidProQuoContributionsInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/QuidProQuoContributionsInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
 If "Yes," did the organization notify the donor of the value of the goods or services provided?
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.....</span></span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">7b</div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/QuidProQuoContriDisclInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/QuidProQuoContriDisclInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;padding-left:4mm;">c</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
 Did the organization sell, exchange, or otherwise dispose of tangible personal property for which it was
required to file Form 8282?
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.........................</span></span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">7c</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/Form8282PropertyDisposedOfInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/Form8282PropertyDisposedOfInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">d</div>
            <div class="styLNDesc" style="width:110mm;height:4.5mm;">
        If "Yes," indicate the number of Forms 8282 filed during the year
                                             <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">....</span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">7d</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form990Data/Form8282FiledCnt"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="width:8mm;height:7.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:7.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:7.5mm;"/>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">e</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
  Did the organization receive any funds, directly or indirectly, to pay premiums on a personal benefit contract?
              <!--Dotted Line-->
            <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;"></span></span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">7e</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/RcvFndsToPayPrsnlBnftCntrctInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/RcvFndsToPayPrsnlBnftCntrctInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">f</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
 Did the organization, during the year, pay premiums, directly or indirectly, on a personal benefit contract?
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..</span></span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">7f</div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/PayPremiumsPrsnlBnftCntrctInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/PayPremiumsPrsnlBnftCntrctInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;padding-left:4mm;">g</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
 If the organization received a contribution of qualified intellectual property, did the organization file Form 8899 as required?
              <!--Dotted Line-->
            <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">......................</span></span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">7g</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/Form8899Filedind"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/Form8899Filedind"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;padding-left:4mm;">h</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
If the organization received a contribution of cars, boats, airplanes, or other vehicles, did the organization file a Form 1098-C?
              <!--Dotted Line-->
        <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..........................</span></span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">7h</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/Form1098CFiledInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/Form1098CFiledInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
          <div style="width: 158mm; height: 4.5mm; float: left;"></div>
          <div class="styShadingCell" style="width:8mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
            <div class="styLNLeftNumBox" style="height:auto;padding-left:3mm;">8</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
              <span class="styNormalText">
                <span class="styBoldText"> Sponsoring organizations maintaining donor advised funds.</span>
                 Did a donor advised fund maintained by the sponsoring organization have excess business holdings at any time during the year?
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">........</span></span>
            </div>
            
           
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top: 2.5mm;">8</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top: 2.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/DAFExcessBusinessHoldingsInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top: 2.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/DAFExcessBusinessHoldingsInd"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- Changed per UWR 107551 and PDF Review with TEGE on 11/25/2014 -->
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">9</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
              <span class="styBoldText" style="padding-top:0.0mm;">
Sponsoring organizations maintaining donor advised funds.</span>
            </div>
            <div class="styShadingCell" style="width:8mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">a</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
 Did the sponsoring organization make any taxable distributions under section 4966?</span>
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">........</span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">9a</div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/TaxableDistributionsInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/TaxableDistributionsInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
 Did the sponsoring organization make a distribution to a donor, donor advisor, or related person?</span>
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...</span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">9b</div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/DistributionToDonorInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/DistributionToDonorInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">10</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
                <span class="styBoldText"> Section 501(c)(7) organizations.</span> Enter:</span>
            </div>
            <div class="styShadingCell" style="width:8mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">a</div>
            <div class="styLNDesc" style="width:110mm;height:4.5mm;">
        Initiation fees and capital contributions included on <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VIII</span>, line 12   
                                             <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...</span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">10a</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form990Data/InitiationFeesAndCapContriAmt"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="width:8mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:110mm;height:4.5mm;">
        Gross receipts, included on Form 990, <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VIII</span>, line 12, for public use of club facilities
                                            <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;"/>
            </div>
            <!-- Per Kisams 01527956 changed element to GrossReceiptsForPublicUseAmt 2/26/2014-->
            <div class="styLNRightNumBox" style="height:4.5mm;">10b</div>
            <div class="styLNAmountBox" style="height:4.5mm;padding-right:0.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form990Data/GrossReceiptsForPublicUseAmt"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="width:8mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">11</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
              <span class="styBoldText" style="padding-top:0.0mm;">
Section 501(c)(12) organizations.</span> Enter:
            </div>
            <div class="styShadingCell" style="width:8mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">a</div>
            <div class="styLNDesc" style="width:110mm;height:4.5mm;">
        Gross income from members or shareholders
                                             <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.........</span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">11a</div>
            <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form990Data/MembersAndShrGrossIncomeAmt"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="width:8mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:7.5mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:110mm;height:7.5mm;">
Gross income from other sources (Do not net amounts due or paid to other sources against amounts due or received from them.)
                                            <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..........</span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">11b</div>
            <div class="styLNAmountBox" style="height:7.5mm;padding-right:0.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form990Data/OtherSourcesGrossIncomeAmt"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="width:8mm;height:9.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:9.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:9.5mm;"/>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">12a</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
                <span class="styBoldText">Section 4947(a)(1) non-exempt charitable trusts. </span> Is the organization filing Form 990 in lieu of Form 1041?</span>
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;"/>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">12a</div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/OrgFiledInLieuOfForm1041Ind"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/OrgFiledInLieuOfForm1041Ind"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:110mm;height:4.5mm;">
If "Yes," enter the amount of tax-exempt interest received or accrued during the year.
                                            <!--Dotted Line-->
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;"></span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">12b</div>
            <div class="styLNAmountBox" style="height:7.5mm;padding-right:0.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form990Data/TaxExemptInterestAmt"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="width:8mm;height:7.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:7.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:7.5mm;"/>
            
          </div>
          
          <!-- Added new line 13,13a,13b and 13c per BSP-102104OTH -->
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">13</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
              <span class="styBoldText" style="padding-top:0.0mm;">
Section 501(c)(29) qualified nonprofit health insurance issuers.</span>
            </div>
            <div class="styShadingCell" style="width:8mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:auto;padding-left:4mm;">a</div>
            <div class="styLNDesc" style="width:150mm;height:auto;">
              <span class="styNormalText">
                Is the organization licensed to issue qualified health plans in more than one state? </span>
<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.........</span><br/>
                <span class="styBoldText" style="padding-top:0.0mm;">Note.</span> See the instructions for additional information the organization must report on Schedule O.
              <!--  All 501(c)(29) organizations must list in Schedule O each state in which they are licensed to issue qualified health plans, the amount of reserves required by each state, and the amount of reserves the organization allocated to each state.-->
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;"/>
            </div>
            <div class="styLNRightNumBox" style="height:7mm;padding-top:1.5mm;">13a</div>
            <div class="styIRS990LNYesNoBox" style="height:7mm;padding-top:1.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/LicensedMoreThanOneStateInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7mm;padding-top:1.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/LicensedMoreThanOneStateInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:auto;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:110mm;height:auto;">
Enter the amount of reserves the organization is required to maintain by the states in which the organization is licensed to issue qualified health plans
                                            <!--Dotted Line-->
           <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">....</span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">13b</div>
            <div class="styLNAmountBox" style="height:7.5mm;padding-right:0.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form990Data/StateRequiredReservesAmt"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="width:8mm;height:7.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:7.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:7.5mm;"/>
            
          </div>
          
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">c</div>
            <div class="styLNDesc" style="width:110mm;height:4.5mm;">
Enter the amount of reserves on hand
                                            <!--Dotted Line-->
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">............</span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;padding-top:1mm;">13c</div>
            <div class="styLNAmountBox" style="height:4.5mm;padding-right:0.5mm;padding-top:1mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form990Data/ReservesMaintainedAmt"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="width:8mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
            
          </div>
         <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">14a</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
 Did the organization receive any payments for indoor tanning services during the tax year?</span>
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.....</span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">14a</div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/IndoorTanningServicesInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/IndoorTanningServicesInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
 If "Yes," has it filed a Form 720 to report these payments?</span>
 <span class="styItalicText"> If "No," provide an explanation in Schedule O</span>
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..</span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">14b</div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/Form720FiledInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/Form720FiledInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:9.5mm;">15</div>
            <div class="styLNDesc" style="width:150mm;height:9.5mm;">
              
Is the organization subject to the section 4960 tax on payment(s) of more than $1,000,000 in remuneration or excess parachute payment(s) during the year?  
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt;">....................</span>
				<br/>If "Yes," see instructions and file Form 4720, Schedule N.
            </div>
            <div class="styLNRightNumBox" style="height:9.5mm; padding-top: 3.0mm;">15</div>
            <div class="styIRS990LNYesNoBox" style="height:9.5mm; padding-top: 3.0mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/SubjToTaxRmnrtnExPrchtPymtInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:9.5mm; padding-top: 3.0mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/SubjToTaxRmnrtnExPrchtPymtInd"/>
              </xsl:call-template>
            </div>
          </div>
          
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:8.5mm;">16</div>
            <div class="styLNDesc" style="width:150mm;height:8.5mm;">
Is the organization an educational institution subject to the section 4968 excise tax on net investment income?  
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt;">..</span>
			<br/> If "Yes," complete Form 4720, Schedule O.
            </div>
            <div class="styLNRightNumBox" style="height:8.5mm; padding-top: 1.5mm;">16</div>
            <div class="styIRS990LNYesNoBox" style="height:8.5mm;padding-top: 1.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/SubjectToExcsTaxNetInvstIncInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:8.5mm;padding-top: 1.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/SubjectToExcsTaxNetInvstIncInd"/>
              </xsl:call-template>
            </div>
          </div>
          
          <!-- Footer -->
          <div style="width:187mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 0px" class="pageEnd">
            <div class="styGenericDiv" style="width:105mm;"/>
            <div class="styGenericDiv" style="width:25mm;"/>
            <div class="styGenericDiv" style="float:right;">Form <span class="styBoldText">990</span> (2020)</div>
          </div>
          <!-- header -->
          <div style="width:187mm;clear:both;padding-bottom:.5mm;float:none;clear:both;" class="styBB">
            <div style="width:90mm;" class="styGenericDiv">Form 990 (2020)</div>
            <div style="width:55mm;text-align:center;" class="styGenericDiv"/>
            <div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">6</span>
            </div>
          </div>
          <!-- Begin Part VI-->
          <!-- BEGIN Part VI Title -->
          <!-- BEGIN Part VI Governance, Management, and Disclos -->
          <div class="styBB" style="width:187mm;float:none;">
            <div class="styPartName" style="float:left;height:4.3mm;"><span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VI</span></div>
            <div class="styLNDesc" style="float:left;width:168mm;height:5mm;"> <span class="styBoldText" style="padding-left:2mm;">Governance, Management, and Disclosure </span><i> For each "Yes" response to lines 2 through 7b below, and for a "No" response to lines <span style="padding-left:2mm;"/>8a, 8b, or 10b below, describe the circumstances, processes, or changes in Schedule O. See instructions.</i>
             </div>
            <span class="styNormalText" style="padding-top:0.0mm;width:187mm;height:auto;padding-left:16mm;">
        Check if Schedule O contains a response or note to any line in this <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VI</span>
        <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..............</span>
<input type="checkbox" class="styCkbox" alt="InfoInScheduleOPartVIInd">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InfoInScheduleOPartVIInd"/>
                    <xsl:with-param name="BackupName">IRS990InfoInScheduleOPartVIInd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
    <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$Form990Data/InfoInScheduleOPartVIInd"/>
        <xsl:with-param name="BackupName">IRS990InfoInScheduleOPartVIInd</xsl:with-param>
    </xsl:call-template>
 </label>
         </span>
          </div>
          
         <div class="styBB" style="width:187mm;float:none;">
            <div class="styPartDesc" style="width:187mm;float:none;height:auto;">
Section A. Governing Body and Management 
 </div>
          </div>
          <div style="width: 187mm">
            <div class="styLNLeftNumBox"/>
            <div class="styLNDesc" style="width: 150mm"/>
            <div class="styIRS990LNYesNoBox" style="width:8mm;height:auto;border-left-width:0px;">
              <span style="width:1px;"/>
            </div>
            <div class="styIRS990LNYesNoBox" style="width:10mm;height:auto;border-top-width:0px;">
              <span class="styBoldText">Yes</span>
            </div>
            <div class="styIRS990LNYesNoBox" style="width:10mm;height:auto;border-top-width:0px;">
              <span class="styBoldText">No</span>
            </div>
          </div>
         
            
            <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">1a</div>
            <div class="styLNDesc" style="width:110mm;height:4.5mm;font-size:7pt;">
       Enter the number of voting members of the governing body at the end of the tax year
                                                     <!--Dotted Line-->
             <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;"></span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">1a</div>
            <div class="styLNAmountBox" style="height:4.5mm;padding-right:0.5mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form990Data/GoverningBodyVotingMembersCnt"/>
              </xsl:call-template>
            </div>
            
            <div class="styShadingCell" style="width:8mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:7.5mm;"/>
            <div class="styLNDesc" style="width:110mm;height:7.5mm;font-size:7pt;">
       
       If there are material differences in voting rights among members of the governing body, or
       if the governing body delegated broad authority to an executive committee or similar committee, explain in Schedule O.  
                                               <!--Dotted Line
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..............</span>-->
            </div>
            <div class="styLNRightNumBox" style="height:10.5mm;border-right-width: 0px;border-bottom-width: 0px;"/>
            <div class="styLNAmountBox" style="height:10.5mm;border-bottom-width: 0px;">
              
            </div>
            
            <div class="styShadingCell" style="width:8mm;height:10.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:10.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:10.5mm;"/>
          </div>
          
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:7.5mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:110mm;height:7.5mm;">
        Enter the number of voting members included in line 1a, above, who are independent
        

                                            <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;"></span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">1b</div>
            <div class="styLNAmountBox" style="height:7.5mm;padding-right:0.5mm;padding-top:3.5mm;border-top-width: 0px">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form990Data/IndependentVotingMemberCnt"/>
              </xsl:call-template>
            </div>
            <div class="styShadingCell" style="width:8mm;height:7.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:7.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:7.5mm;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">2</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
        Did any officer, director, trustee, or key employee have a family relationship or a business relationship with any other officer, director, trustee, or key employee?
                                             <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.................</span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">2</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/FamilyOrBusinessRlnInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/FamilyOrBusinessRlnInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">3</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
        Did the organization delegate control over management duties customarily performed by or under the direct supervision of officers, directors or trustees, or key employees to a management company or other person?
                                             <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.</span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:2mm;">3</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/DelegationOfMgmtDutiesInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:2mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/DelegationOfMgmtDutiesInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.25mm;padding-left:3mm;">4</div>
            <div class="styLNDesc" style="width:150mm;height:4.25mm;">
        Did the organization make any significant changes to its governing documents since the prior Form 990 was filed?
        <span style="letter-spacing:2mm; font-weight:bold; font-size:7pt; margin-left:1mm;">.</span>
                     </div>
            <div class="styLNRightNumBox" style="height:4.25mm;padding-top:0.25mm;">4</div>
            <div class="styIRS990LNYesNoBox" style="height:4.25mm;padding-top:0.25mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ChangeToOrgDocumentsInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:4.25mm;padding-top:0.25mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ChangeToOrgDocumentsInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.25mm;padding-left:3mm;">5</div>
            <div class="styLNDesc" style="width:150mm;height:4.25mm;">
        Did the organization become aware during the year of a significant diversion of the organization’s assets?
                                             <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.</span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">5</div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/MaterialDiversionOrMisuseInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/MaterialDiversionOrMisuseInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">6</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
        Did the organization have members or stockholders?
                                             <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">................</span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">6</div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/MembersOrStockholdersInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/MembersOrStockholdersInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:7.5mm;padding-left:3mm;">7a</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
        Did the organization have members, stockholders, or other persons who had the power to elect or appoint one or more members of the governing body?  
                                           <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">....................</span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">7a</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ElectionOfBoardMembersInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ElectionOfBoardMembersInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
        Are any governance decisions of the organization reserved to (or subject to approval by) members, stockholders, or persons other than the governing body?
                                             <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...................</span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;">7b</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/DecisionsSubjectToApprovaInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/DecisionsSubjectToApprovaInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">8</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
Did the organization contemporaneously document the meetings held or written actions undertaken during the year by the following:</span>
            </div>
            <div class="styShadingCell" style="width:8mm;height:7.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:7.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:7.5mm;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;padding-left:3mm;padding-left:4mm;">a</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
      The governing body?
                                             <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.......................</span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">8a</div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/MinutesOfGoverningBodyInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/MinutesOfGoverningBodyInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
       Each committee with authority to act on behalf of the governing body?
                                             <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">............</span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">8b</div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/MinutesOfCommitteesInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/MinutesOfCommitteesInd"/>
              </xsl:call-template>
            </div>
          </div>
          
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:7.5mm;padding-left:3mm;">9</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
        Is there any officer, director, trustee, or key employee listed in <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VII</span>, Section A, who cannot be reached at the organization’s mailing address? <i>If "Yes," provide the names and addresses in Schedule O</i>
                                      <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.......</span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">9</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/OfficerMailingAddressInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/OfficerMailingAddressInd"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- SECTION B POLICIES -->
          <div class="styBB" style="width:187mm;float:none;border-top-width: 1px">
            <div class="styPartDesc" style="width:187mm;float:none;height:auto;">
Section B. Policies 
<span class="styNormalText">(<i>This Section B requests information about policies not required by the Internal Revenue Code.</i>) </span>
</div>
          </div>
          <div style="width: 187mm">
            <div class="styLNLeftNumBox"/>
            <div class="styLNDesc" style="width: 150mm"/>
            <div class="styIRS990LNYesNoBox" style="width:8mm;height:4.5mm;border-left-width:0px;">
              <span style="width:1px;"/>
            </div>
            <div class="styIRS990LNYesNoBox" style="width:10mm;height:4.5mm;border-top-width:0px;">
              <span class="styBoldText">Yes</span>
            </div>
            <div class="styIRS990LNYesNoBox" style="width:10mm;height:4.5mm;border-top-width:0px;">
              <span class="styBoldText">No</span>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">10a</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
       Did the organization have local chapters, branches, or affiliates?   
                                          <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">............</span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">10a</div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/LocalChaptersInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/LocalChaptersInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:7.5mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
        If "Yes," did the organization have written policies and procedures governing the activities of such chapters, affiliates, and branches to ensure their operations are consistent with the organization's exempt purposes?
                                           <!--Dotted Line-->
             <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;"/>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">10b</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/PoliciesReferenceChaptersInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/PoliciesReferenceChaptersInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:7.5mm;">11a</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
       Has the organization provided a complete copy of this Form 990 to all members of its governing body before filing the form?   
       <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">............................</span> 
                </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">11a</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/Form990ProvidedToGvrnBodyInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/Form990ProvidedToGvrnBodyInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
      Describe in Schedule O the process, if any, used by the organization to review this Form 990.    
                                      <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.....</span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;padding-top:0mm;background-color:lightgrey;"/>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;padding-top:0mm;background-color:lightgrey;"/>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;padding-top:0mm;background-color:lightgrey;"/>
          </div>
          
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">12a</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
       Did the organization have a written conflict of interest policy? <span class="styItalicText">If "No," go to line 13</span>
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.......</span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">12a</div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ConflictOfInterestPolicyInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/ConflictOfInterestPolicyInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:7.5mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">Were officers, directors, or trustees, and key employees required to disclose annually interests that could give
rise to conflicts?
                                            <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..........................</span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">12b</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/AnnualDisclosureCoveredPrsnInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/AnnualDisclosureCoveredPrsnInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:7.5mm;padding-left:4mm;">c</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">Did the organization regularly and consistently monitor and enforce compliance with the policy? <i>If "Yes,"
describe in Schedule O how this was done</i>
                                            <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...................</span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">12c</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/RegularMonitoringEnfrcInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/RegularMonitoringEnfrcInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">13</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
       Did the organization have a written whistleblower policy?
                                          <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...............</span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">13</div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/WhistleblowerPolicyInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/WhistleblowerPolicyInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">14</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
       Did the organization have a written document retention and destruction policy?
                                          <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.........</span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">14</div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/DocumentRetentionPolicyInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/DocumentRetentionPolicyInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">15</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
Did the process for determining compensation of the following persons include a review and approval by independent persons, comparability data, and contemporaneous substantiation of the deliberation and decision? </span>
            </div>
            <div class="styShadingCell" style="width:8mm;height:7.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:7.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:7.5mm;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">a</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
       The organization’s CEO, Executive Director, or top management official
                                             <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...........</span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">15a</div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/CompensationProcessCEOInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/CompensationProcessCEOInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
       Other officers or key employees of the organization
                                             <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">................</span>
            </div>
            <div class="styLNRightNumBox" style="height:4.5mm;">15b</div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/CompensationProcessOtherInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/CompensationProcessOtherInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:4.5mm;"/>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
If "Yes" to line 15a or 15b, describe the process in Schedule O (see instructions).</span>
            </div>
            <div class="styShadingCell" style="width:8mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">16a</div>
            <div class="styLNDesc" style="width:150mm;height:4.5mm;">
       Did the organization invest in, contribute assets to, or participate in a joint venture or similar arrangement with a taxable entity during the year?
                                             <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">......................</span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">16a</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/InvestmentInJointVentureInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:3.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/InvestmentInJointVentureInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:auto;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:150mm;height:auto;">
       If "Yes," did the organization follow a written policy or procedure requiring the organization to evaluate its participation in joint venture arrangements under applicable federal tax law, and take steps to safeguard the organization’s exempt status with respect to such arrangements?
                                     <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">............</span>
            </div>
            <div class="styShadingCell" style="width:8mm;height:7.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:7.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:7.5mm;"/>
            <div class="styLNRightNumBox" style="height:4.5mm;">16b</div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/WrittenPolicyOrProcedureInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/WrittenPolicyOrProcedureInd"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- SECTION C Disclosure -->
          <div class="styBB" style="width:187mm;float:none;border-top-width: 1px">
            <div class="styPartDesc" style="width:150mm;float:none;height:auto;">
Section C. Disclosure 
 </div>
          </div>
          
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:auto;padding-top:.5mm;">17</div>
            <div class="styLNDesc" style="width:97mm;height:auto;">
         List the states with which a copy of this Form 990 is required to be filed<img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
          </div>
          <span class="styFixedUnderline" style="float:none;width:81mm;padding-top:3mm;">
          <!--  <div class="styFixedUnderline" style="float:left;clear:none;width:81mm;">-->
              <xsl:for-each select="$Form990Data/StatesWhereCopyOfReturnIsFldCd">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="."/>
                </xsl:call-template>  
                <xsl:if test="not(position() = last())">
              ,
            </xsl:if>
              </xsl:for-each>
              </span>
            </div>
          <!--</div>-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:auto;">18</div>
            <div class="styLNDesc" style="width:150mm;height:auto;">
      Section 6104 requires an organization to make its Form 1023 (or 1024-A if applicable), 990, and 990-T (501(c)(3)s only)
available for public inspection. Indicate how you made these available. Check all that apply.    </div>
          </div>
           <div style="width:187mm;">
          <span style="width:2mm;padding-left:8mm;"/>
          <input type="checkbox" class="styCkbox" alt="OwnWebsiteInd" onclick="return false;" id="dummyidexempt">
            <xsl:call-template name="PopulateYesCheckbox">
              <xsl:with-param name="TargetNode" select="$Form990Data/OwnWebsiteInd"/>
              <xsl:with-param name="BackupName">IRS990OwnWebsiteInd</xsl:with-param>
            </xsl:call-template>
          </input>
          <label for="dummyidexempt">
            <xsl:call-template name="PopulateLabelYes">
              <xsl:with-param name="TargetNode" select="$Form990Data/OwnWebsiteInd"/>
              <xsl:with-param name="BackupName">IRS990OwnWebsiteInd</xsl:with-param>
            </xsl:call-template>          
            Own website
          </label>
          <span style="width:2mm;">
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$Form990Data/OwnWebsiteInd"/>
            </xsl:call-template>
          </span>
          <input type="checkbox" class="styCkbox" alt="OtherWebsiteInd" onclick="return false;" id="dummyidnonexempt">
            <xsl:call-template name="PopulateYesCheckbox">
              <xsl:with-param name="TargetNode" select="$Form990Data/OtherWebsiteInd"/>
              <xsl:with-param name="BackupName">IRS990OtherWebsiteInd</xsl:with-param>
            </xsl:call-template>
          </input>
          <label for="dummyidnonexempt">
            <xsl:call-template name="PopulateLabelYes">
              <xsl:with-param name="TargetNode" select="$Form990Data/OtherWebsiteInd"/>
              <xsl:with-param name="BackupName">IRS990OtherWebsiteInd</xsl:with-param>
            </xsl:call-template>
            Another's website
          </label>
          <span style="width:2mm;">
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$Form990Data/OtherWebsiteInd"/>
            </xsl:call-template>
          </span>
          <input type="checkbox" class="styCkbox" alt="UponRequestInd" onclick="return false;" id="dummyidnonexempt">
            <xsl:call-template name="PopulateYesCheckbox">
              <xsl:with-param name="TargetNode" select="$Form990Data/UponRequestInd"/>
              <xsl:with-param name="BackupName">IRS990UponRequestInd</xsl:with-param>
            </xsl:call-template>
          </input>
          <label for="dummyidnonexempt">
            <xsl:call-template name="PopulateLabelYes">
              <xsl:with-param name="TargetNode" select="$Form990Data/UponRequestInd"/>
              <xsl:with-param name="BackupName">IRS990UponRequestInd</xsl:with-param>
            </xsl:call-template>
            Upon request
          </label>
          <span style="width:2mm;">
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$Form990Data/UponRequestInd"/>
            </xsl:call-template>
          </span>
          <input type="checkbox" class="styCkbox" alt="OtherInd" onclick="return false;" id="dummyidnonexempt">
            <xsl:call-template name="PopulateYesCheckbox">
              <xsl:with-param name="TargetNode" select="$Form990Data/OtherInd"/>
              <xsl:with-param name="BackupName">IRS990OtherInd</xsl:with-param>
            </xsl:call-template>
          </input>
          <label for="dummyidnonexempt">
            <xsl:call-template name="PopulateLabelYes">
              <xsl:with-param name="TargetNode" select="$Form990Data/OtherInd"/>
              <xsl:with-param name="BackupName">IRS990OtherInd</xsl:with-param>
            </xsl:call-template>
            Other (explain in Schedule O)
          </label>
          <span style="width:2mm;">
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$Form990Data/OtherInd"/>
            </xsl:call-template>
          </span>
          </div>
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:auto;">19</div>
            <div class="styLNDesc" style="width:150mm;height:auto;">
       Describe in Schedule O whether (and if so, how) the organization made its governing documents, conflict of interest policy, and financial statements available to the public during the tax year.  
<!--<xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="TargetNode" select="$Form990Data/TheBooksAreInCareOf"/>
              </xsl:call-template>-->
            </div>
          </div>
          <!--Part VI Ln20-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:auto;">20</div>
            <div class="styLNDesc" style="width:178mm;height:auto;">
         State the name, address, and telephone number of the person who 
         possesses the organization's books and records: <br/><img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
           <xsl:choose>
              <xsl:when test="$Form990Data/BooksInCareOfDetail/PersonNm">
                       <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form990Data/BooksInCareOfDetail/PersonNm"/>
                </xsl:call-template>
                </xsl:when>
              <xsl:otherwise>
                 <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form990Data/BooksInCareOfDetail/BusinessName/BusinessNameLine1Txt"/>
                </xsl:call-template>
                <span style="width:1px"/>
				<span style="width:2px"/>
                 <xsl:if test="$Form990Data/BooksInCareOfDetail/BusinessName/BusinessNameLine2Txt">
                <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form990Data/BooksInCareOfDetail/BusinessName/BusinessNameLine2Txt"/>
                  </xsl:call-template>
                 </xsl:if>
                </xsl:otherwise>
                 </xsl:choose> 
         <span style="padding-left:1mm"/>
        
               <xsl:choose>
              <xsl:when test="$Form990Data/BooksInCareOfDetail/ForeignAddress">
  <!--<xsl:call-template name="PopulateForeignAddressTemplate"> This template shows address info on separate lines. TEGE wants it on one line so I changed to Populate text 2013 changed it back in 2014 because it generated too many defects for spacing-->
  <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form990Data/BooksInCareOfDetail/ForeignAddress/AddressLine1Txt"/>
                </xsl:call-template>
                <span style="width:1px"></span>
									<span style="width:2px"/> 
					<xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form990Data/BooksInCareOfDetail/ForeignAddress/AddressLine2Txt"/>
                </xsl:call-template>
                <span style="width:1px"></span>
									<span style="width:2px"/>
									<xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form990Data/BooksInCareOfDetail/ForeignAddress/CityNm"/>
                </xsl:call-template>
                <span style="width:1px">,</span>
									<span style="width:4px"/>
									<xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form990Data/BooksInCareOfDetail/ForeignAddress/ProvinceOrStateNm"/>
                </xsl:call-template>
                <span style="width:1px"></span>
									<span style="width:2px"/>
					 <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form990Data/BooksInCareOfDetail/ForeignAddress/ForeignPostalCd"/>
            </xsl:call-template>  				
					<span style="width:1px"></span>
									<span style="width:2px"/>				
									<xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form990Data/BooksInCareOfDetail/ForeignAddress/CountryCd"/>
                </xsl:call-template>
              </xsl:when>
               <xsl:otherwise>
               
                <!--<xsl:call-template name="PopulateUSAddressTemplate">This template shows address info on separate lines. TEGE wants it on one line so I changed to Populate text 2013 changed it back in 2014 because it generated too many defects for spacing-->
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form990Data/BooksInCareOfDetail/USAddress/AddressLine1Txt"/>
                </xsl:call-template>
                <span style="width:1px"></span>
									<span style="width:2px"/> 
					<xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form990Data/BooksInCareOfDetail/USAddress/AddressLine2Txt"/>
                </xsl:call-template>
                <span style="width:1px"></span>
									<span style="width:2px"/> 
									<xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form990Data/BooksInCareOfDetail/USAddress/CityNm"/>
                </xsl:call-template>
                <span style="width:1px">,</span>
									<span style="width:4px"/>
									<xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form990Data/BooksInCareOfDetail/USAddress/StateAbbreviationCd"/>
                </xsl:call-template>
                <span style="width:1px"></span>
									<span style="width:2px"/>
									<xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form990Data/BooksInCareOfDetail/USAddress/ZIPCd"/>
                </xsl:call-template>
                <span style="width:1px"></span>
									<span style="width:2px"/>
				  <xsl:call-template name="PopulatePhoneNumber">
              <xsl:with-param name="TargetNode" select="$Form990Data/BooksInCareOfDetail/PhoneNum"/>
            </xsl:call-template> 
             </xsl:otherwise>
            </xsl:choose>
            </div>
            </div>
             
        
          <!-- Footer -->
          <div style="width:187mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 0px" class="pageEnd">
            <div class="styGenericDiv" style="width:105mm;"/>
            <div class="styGenericDiv" style="width:25mm;"/>
            <div class="styGenericDiv" style="float:right;">Form <span class="styBoldText">990</span> (2020)</div>
          </div>
          <!-- header -->
          <div style="width:187mm;clear:both;padding-bottom:.5mm;float:none;clear:both;" class="styBB">
            <div style="width:90mm;" class="styGenericDiv">Form 990 (2020)</div>
            <div style="width:55mm;text-align:center;" class="styGenericDiv"/>
            <div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">7</span>
            </div>
          </div>
          <!-- Begin Part VII-->
          <!-- BEGIN Part VII Title-->
          <div class="styBB" style="width:187mm;float:none;display:table;">
            <div class="styPartName" style="float:left;width:14mm;"><span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VII</span></div>
            <div class="styPartDesc" style="width:160mm;height:auto;">Compensation of Officers, Directors,Trustees, Key Employees, Highest Compensated Employees, and Independent Contractors
</div>
<span class="styNormalText" style="padding-top:0.0mm;width:187mm;height:auto;padding-left:17mm;">
        Check if Schedule O contains a response or note to any line in this <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VII</span>
        <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..............</span>
<input type="checkbox" class="styCkbox" alt="InfoInScheduleOPartVIIInd">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InfoInScheduleOPartVIIInd"/>
                    <xsl:with-param name="BackupName">IRS990InfoInScheduleOPartVIIInd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
    <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$Form990Data/InfoInScheduleOPartVIIInd"/>
        <xsl:with-param name="BackupName">IRS990InfoInScheduleOPartVIIInd</xsl:with-param>
    </xsl:call-template>
 </label>
        
        </span>
          </div>
          <div class="styBB" style="width:187mm;float:none;">
            <div class="styPartDesc" style="width:187mm;float:left;height:4mm;">
     Section A.   Officers, Directors, Trustees, Key Employees, and Highest Compensated Employees 
      </div>
      
          </div>
          <div class="styLNDesc" style="width:187mm;height:auto;">
            <span class="styBoldText">1a</span>  Complete this table for all persons required to be listed. Report compensation for the calendar year ending with or within the organization’s tax year. <br/>
            <!--Bullet ONE-->
            
            <span style="padding-left:4mm"/><img src="{$ImagePath}/990_Bullet_Round.gif" alt="RoundBullet"/>
 List all of the organization’s <span class="styBoldText">current</span> officers, directors, trustees (whether individuals or organizations), regardless of amount<br/>  of compensation. Enter -0- in columns (D), (E), and (F) if no compensation was paid.</div>
          <br/>
          <div class="styLNDesc" style="width:187mm;height:auto;">
            <span style="padding-left:3mm"/><img src="{$ImagePath}/990_Bullet_Round.gif" alt="RoundBullet"/>
 List all of the organization’s <span class="styBoldText">current</span> key employees, if any. See instructions for definition of "key employee."</div>
          <div class="styLNDesc" style="width:187mm;height:auto;">
            <span style="padding-left:3mm"/><img src="{$ImagePath}/990_Bullet_Round.gif" alt="RoundBullet"/>
 List the organization’s five <span class="styBoldText">current</span> highest compensated employees (other than an officer, director, trustee or key employee) <br/>who received reportable compensation (Box 5 of Form W-2 and/or Box 7 of Form 1099-MISC) of more than $100,000 from the <br/>organization and any related organizations.</div>
          <br/>
          
          <div class="styLNDesc" style="width:187mm;height:auto;">
            <span style="padding-left:3mm"/><img src="{$ImagePath}/990_Bullet_Round.gif" alt="RoundBullet"/>
 List all of the organization’s <span class="styBoldText">former</span> officers, key employees, or highest compensated employees who received more than $100,000 <br/>of reportable compensation from the organization and any related organizations.</div>
          <br/>
          <div class="styLNDesc" style="width:187mm;height:auto;">
            <span style="padding-left:3mm"/><img src="{$ImagePath}/990_Bullet_Round.gif" alt="RoundBullet"/>
 List all of the organization’s <span class="styBoldText">former directors or trustees</span> that received, in the capacity as a former director or trustee of the <br/>organization, more than $10,000 of reportable compensation from the organization and any related organizations.</div>
          <br/>
          <div class="styLNDesc" style="width:187mm;height:auto;">See instructions for the order in which to list the persons above.
      </div>
          <div class="styBB" style="width:187mm;">
            <div class="styGenericDiv" style="width:187mm;text-align:left;">
              <input type="checkbox" class="styCkbox" alt="NoListedPersonsCompensatedInd" onclick="return false;" id="dummyidexempt">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form990Data/NoListedPersonsCompensatedInd"/>
                  <xsl:with-param name="BackupName">IRS990NoListedPersonsCompensatedInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <label style="float: right; clear: none;">
    <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$Form990Data/NoListedPersonsCompensatedInd"/>
        <xsl:with-param name="BackupName">IRS990NoListedPersonsCompensatedInd</xsl:with-param>
    </xsl:call-template>
 </label>

        Check this box if neither the organization nor any related organization compensated any current officer, director, or trustee.
            </div>
          </div>
          <!-- END Part VII Title -->
          <!--  Begin Part VII Table -->
          <div class="styBB" style="width:187mm;float:none;display:table;">
            <!--  print logic -->
            <!--xsl:call-template name="SetInitialState"/-->
            <!--  end -->
            <table class="styTable" cellspacing="0" style="display:table;">
              <thead class="styTableThead" scope="col" style="font-size:7pt;border-left-width:0;border-top-width:0;">
                <tr>
                  <th class="styDepTblCell" scope="col" style="width:62mm;border-top-width:0;border-left-width:0;text-align:center;" rowspan="2">
      (A) 
      <br/>
                    <span class="styNormalText"> Name and title</span>
                  </th>
                  
                  <th class="styDepTblCell" scope="col" style="width:15mm;border-left-width:0;border-top-width:0;text-align:center;" rowspan="2">
      (B) 
      <br/>
                    <span class="styNormalText">Average hours per week (list any hours for related organizations below dotted line)</span>
                  </th>
                  
                  <th class="styDepTblCell" scope="col" style="width:35mm;border-left-width:0;border-top-width:0;text-align:center;" colspan="6">
      (C) 
      <br/>
                    <span class="styNormalText"> Position (do not check more than one box, unless person is both an officer and a director/trustee)</span>
                  </th>
                  <th class="styDepTblCell" scope="col" style="width:25mm;border-left-width:0;border-top-width:0;text-align:center;" rowspan="2">
      (D) 
      <br/>
                    <span class="styNormalText"> Reportable compensation from the organization (W-2/1099-MISC)</span>
                  </th>
                  <th class="styDepTblCell" scope="col" style="width:25mm;border-left-width:0;border-top-width:0;text-align:center;" rowspan="2">
      (E) 
      <br/>
                    <span class="styNormalText">Reportable compensation from related organizations (W-2/1099-MISC)</span>
                  </th>
                  <th class="styDepTblCell" scope="col" style="width:25mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px;text-align:center;" rowspan="2">
      (F) 
      <br/>
                    <span class="styNormalText"> Estimated amount of other compensation from the organization and related organizations</span>
                  </th>
                </tr>
                <tr>
                  <th scope="col" class="styIRS990VTImageBox" style="width:5mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width: 1px;" rowspan="1" valign="top">
                    <img src="{$ImagePath}/990_ITorD.gif" alt="Individual Trustee or Director;"/>
                  </th>
                
                  <th scope="col" class="styIRS990VTImageBox" style="width:5mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top- width: 0px; border-bottom-width: 1px" rowspan="1" valign="top">
                    <img src="{$ImagePath}/990_Institutional_Trustee.gif" alt="Institutional Trustee;"/>
                  </th>
               
                  <th scope="col" class="styIRS990VTImageBox" style="width:5mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top- width: 0px; border-bottom-width: 1px" rowspan="1" valign="top">
                    <img src="{$ImagePath}/990R_Officer.gif" alt="OfficerInd;"/>
                  </th>
                 
                  <th scope="colgroup" class="styIRS990VTImageBox" style="width:5mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top- width: 0px; border-bottom-width: 1px" rowspan="1"  valign="top">
                    <img src="{$ImagePath}/990_Key_Emp.gif" alt="Key Employee;"/>
                  </th>
                 
                  <th scope="col" class="styIRS990VTImageBox" style="width:5mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top- width: 0px; border-bottom-width: 1px" rowspan="1" valign="top">
                    <img src="{$ImagePath}/990_High_Comp_Emp.gif" alt="Highest compensated employee;"/>
                  </th>
                  
                  <th scope="col" class="styIRS990VTImageBox" style="width:5mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top- width: 0px; border-bottom-width: 1px" rowspan="1" valign="top">
                    <img src="{$ImagePath}/990_Former.gif" alt="FormerOfcrDirectorTrusteeInd;"/>
                  </th>
                </tr>
              </thead>
               <tbody>
                <xsl:for-each select="$Form990Data/Form990PartVIISectionAGrp">
                  <xsl:if test="position() &lt; 18">
                    <tr>
                    <!-- Added the ability to number each instance for 2010 - RLJ-->
                      <td class="styTableCellText" scope="col" style="width:62mm;border-style: solid; border-color: black;">(<xsl:number value="position()" format="1"/>)
                        <xsl:choose>
                          <xsl:when test="PersonNm">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="PersonNm"/>
                            </xsl:call-template>
                            <!--Dotted Line per customer request. If you add more dots then amount for D,E,F will wrap-->
                             <span style="width:59mm;text-align:left;letter-spacing:.1mm;  font-size:6pt;"><b>......................................................................</b></span>
                          </xsl:when>
                  
                          <xsl:otherwise>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
                            </xsl:call-template>
                            <br/>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
                            </xsl:call-template>
                          </xsl:otherwise>
                        </xsl:choose>
                        <br/>
                        <xsl:if test="TitleTxt">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="TitleTxt"/>
                          </xsl:call-template>
                        </xsl:if>
                        <br/>
                      </td>
                      <!-- Column B -->
                    <td class="styTableCell" scope="col" style="width:15mm;border-bottom-width:1px;border-style: solid; border-color: black;height:5.5mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="AverageHoursPerWeekRt"/>
                        </xsl:call-template>
                       <br></br>
                      
                        <!--Dotted Line per customer request. If you add more dots then amount for D,E,F will wrap-->
                      <span style="width:15mm;text-align:left;letter-spacing:.1mm;  font-size:6pt;height:4.5mm;"><b>.................</b></span>
                        <br></br>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="AverageHoursPerWeekRltdOrgRt"/>
                        </xsl:call-template>
                    </td>
                       <!-- Column C -->
                      <td class="styTableCell" scope="col" style="width:10mm;text-align:center;border-style: solid; border-color: black;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="IndividualTrusteeOrDirectorInd"/>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" scope="col" style="width:5mm;text-align:center;border-style: solid; border-color: black;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="InstitutionalTrusteeInd"/>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" scope="col" style="width:5mm;text-align:center;border-style: solid; border-color: black;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="OfficerInd"/>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" scope="col" style="width:5mm;text-align:center;border-style: solid; border-color: black;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="KeyEmployeeInd"/>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" scope="col" style="width:5mm;text-align:center;border-style: solid; border-color: black;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="HighestCompensatedEmployeeInd"/>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" scope="col" style="width:5mm;text-align:center;border-style: solid; border-color: black;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="FormerOfcrDirectorTrusteeInd"/>
                        </xsl:call-template>
                      </td>
                      <!-- Column D -->
                      <td class="styTableCell" scope="col" style="width:25mm;font-size:6pt;border-style: solid; border-color: black;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="ReportableCompFromOrgAmt"/>
                        </xsl:call-template>
                      </td>
                      <!-- Column E -->
                      <td class="styTableCell" scope="col" style="width:25mm;font-size:6pt;border-style: solid; border-color: black;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="ReportableCompFromRltdOrgAmt"/>
                        </xsl:call-template>
                      </td>
                      <!-- Column F -->
                      <td class="styTableCell" scope="col" style="width:25mm;font-size:6pt;border-right-width:0px;border-style: solid; border-color: black;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="OtherCompensationAmt"/>
                        </xsl:call-template>
                      </td>
                   </tr>
                  </xsl:if>
                </xsl:for-each>
                <xsl:if test="count($Form990Data/Form990PartVIISectionAGrp) &lt; 1">
                  <xsl:call-template name="IRS990PartVIITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($Form990Data/Form990PartVIISectionAGrp) &lt; 2">
                  <xsl:call-template name="IRS990PartVIITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($Form990Data/Form990PartVIISectionAGrp) &lt;  3">
                  <xsl:call-template name="IRS990PartVIITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($Form990Data/Form990PartVIISectionAGrp) &lt;  4">
                  <xsl:call-template name="IRS990PartVIITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($Form990Data/Form990PartVIISectionAGrp) &lt;  5">
                  <xsl:call-template name="IRS990PartVIITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($Form990Data/Form990PartVIISectionAGrp) &lt;  6">
                  <xsl:call-template name="IRS990PartVIITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($Form990Data/Form990PartVIISectionAGrp) &lt;  7">
                  <xsl:call-template name="IRS990PartVIITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($Form990Data/Form990PartVIISectionAGrp) &lt;  8">
                  <xsl:call-template name="IRS990PartVIITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($Form990Data/Form990PartVIISectionAGrp) &lt;  9">
                  <xsl:call-template name="IRS990PartVIITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($Form990Data/Form990PartVIISectionAGrp) &lt; 10">
                  <xsl:call-template name="IRS990PartVIITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($Form990Data/Form990PartVIISectionAGrp) &lt; 11">
                  <xsl:call-template name="IRS990PartVIITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($Form990Data/Form990PartVIISectionAGrp) &lt; 12">
                  <xsl:call-template name="IRS990PartVIITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($Form990Data/Form990PartVIISectionAGrp) &lt; 13">
                  <xsl:call-template name="IRS990PartVIITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($Form990Data/Form990PartVIISectionAGrp) &lt; 14">
                  <xsl:call-template name="IRS990PartVIITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($Form990Data/Form990PartVIISectionAGrp) &lt; 15">
                  <xsl:call-template name="IRS990PartVIITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($Form990Data/Form990PartVIISectionAGrp) &lt; 16">
                  <xsl:call-template name="IRS990PartVIITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($Form990Data/Form990PartVIISectionAGrp) &lt; 17">
                  <xsl:call-template name="IRS990PartVIITableFillerRow"/>
                </xsl:if>
              </tbody>
              <tfoot/>
            </table>
          </div>
          <!--  End Part VII Table -->
          <!--     <span style="width: 187mm; border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px"/>-->
          <!-- Footer -->
          <div style="width:187mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 0px" class="pageEnd">
            <div class="styGenericDiv" style="width:105mm;"/>
            <div class="styGenericDiv" style="width:25mm;"/>
            <div class="styGenericDiv" style="float:right;">Form <span class="styBoldText">990</span> (2020)</div>
          </div>
          <!-- header -->
          <div style="width:187mm;clear:both;padding-bottom:.5mm;float:none;clear:both;" class="styBB">
            <div style="width:90mm;" class="styGenericDiv">Form 990 (2020)</div>
            <div style="width:55mm;text-align:center;" class="styGenericDiv"/>
            <div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">8</span>
            </div>
          </div>
          <!--  button display logic 
          <xsl:call-template name="SetDynamicTableToggleButton">
            <xsl:with-param name="TargetNode" select="$Form990Data/Form990PartVIISectionA"/>
            <xsl:with-param name="headerHeight" select="2"/>
            <xsl:with-param name="containerHeight" select="17"/>
            <xsl:with-param name="containerID" select=" 'F990P7SAConctn' "/>
          </xsl:call-template>
            end button display logic -->
          <!--  Start Part VII continued -->
          <div class="styBB" style="width:187mm;float:none;">
            <div class="styPartName" style="float:left;height:auto;width:14mm;"><span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VII</span></div>
            <div class="styPartDesc" style="float:left;font-size:7.5pt;width:172mm;height:auto;">Section A. Officers, Directors, Trustees, Key Employees, and Highest Compensated Employees <span class="styNormalText"><i> (continued)</i></span>
            </div>
            <div class="styTableContainer" id="F990P7SAConctn">
              <!--  print logic -->
              <xsl:call-template name="SetInitialState"/>
              <!-- end -->
            </div>
            <table class="styTable" cellspacing="0">
              <thead class="styTableThead" style="font-size:7pt;border-left-width:0;border-top-width:0;">
                <tr>
                  <th class="styDepTblCell" scope="col" style="width:59mm;border-top-width:0;border-left-width:0;text-align:center;" rowspan="2">
      (A) 
      <br/>
                    <span class="styNormalText"> Name and title</span>
                  </th>
                  <th class="styDepTblCell" scope="col" style="width:15mm;border-left-width:0;border-top-width:0;text-align:center;" rowspan="2">
      (B) 
      <br/>
                    <span class="styNormalText">Average hours per week (list any hours for related organizations below dotted line)</span>
                  </th>
                  <th class="styDepTblCell" scope="col" style="width:35mm;border-left-width:0;border-top-width:0;text-align:center;" colspan="6">
      (C) 
      <br/>
                    <span class="styNormalText"> Position (do not check more than one box, unless person is both an officer and a director/trustee)</span>
                  </th>
                  <th class="styDepTblCell" scope="col" style="width:25mm;border-left-width:0;border-top-width:0;text-align:center;" rowspan="2">
      (D) 
      <br/>
                    <span class="styNormalText"> Reportable compensation from the organization (W-2/1099-MISC)</span>
                  </th>
                  <th class="styDepTblCell" scope="col" style="width:25mm;border-left-width:0;border-top-width:0;text-align:center;" rowspan="2">
      (E) 
      <br/>
                    <span class="styNormalText">Reportable compensation from related organizations (W-2/1099-MISC)</span>
                  </th>
                  <th class="styDepTblCell" scope="col" style="width:25mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 1px;text-align:center;" rowspan="2">
      (F) 
      <br/>
                    <span class="styNormalText"> Estimated amount of other compensation from the organization and related organizations</span>
                  </th>
                </tr>
                <tr>
                  <th scope="col" class="styIRS990VTImageBox" style="width:5mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top-width: 0px; border-bottom-width: 1px" rowspan="1" valign="top">
                    <img src="{$ImagePath}/990_ITorD.gif" alt="Individual Trustee or Director;"/>
                  </th>
                  <th scope="col" class="styIRS990VTImageBox" style="width:5mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top- width: 0px; border-bottom-width: 1px" rowspan="1" valign="top">
                    <img src="{$ImagePath}/990_Institutional_Trustee.gif" alt="Institutional Trustee;"/>
                  </th>
                  <th scope="col" class="styIRS990VTImageBox" style="width:5mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top- width: 0px; border-bottom-width: 1px" rowspan="1" valign="top">
                    <img src="{$ImagePath}/990R_Officer.gif" alt="OfficerInd;"/>
                  </th>
                  <th scope="col" class="styIRS990VTImageBox" style="width:5mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top- width: 0px; border-bottom-width: 1px" rowspan="1" valign="top">
                    <img src="{$ImagePath}/990_Key_Emp.gif" alt="Key Employee;"/>
                  </th>
                  <th scope="col" class="styIRS990VTImageBox" style="width:5mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top- width: 0px; border-bottom-width: 1px" rowspan="1" valign="top">
                    <img src="{$ImagePath}/990_High_Comp_Emp.gif" alt="Highest compensated employee;"/>
                  </th>
                  <th scope="col" class="styIRS990VTImageBox" style="width:5mm;border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 1px; border-top- width: 0px; border-bottom-width: 1px" rowspan="1" valign="top">
                    <img src="{$ImagePath}/990_Former.gif" alt="FormerOfcrDirectorTrusteeInd;"/>
                  </th>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="$Form990Data/Form990PartVIISectionAGrp">
                  <xsl:if test="position() &gt; 17">
                    <tr>
                    <!-- Added the ability to number each instance for 2010 -->
                      <td class="styTableCellText" scope="col" style="width:59mm;border-style: solid; border-color: black;">(<xsl:number value="position()" format="1"/>)
                        <xsl:choose>
                          <xsl:when test="PersonNm">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="PersonNm"/>
                            </xsl:call-template>
                          <!--Dotted Line per customer request. If you add more dots then amount for D,E,F will wrap 2012-->  
                            <span style="width:59mm;text-align:left;letter-spacing:.1mm;  font-size:6pt;"><b>........................................................................</b></span>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1Txt"/>
                            </xsl:call-template>
                            <br/>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2Txt"/>
                            </xsl:call-template>
                          </xsl:otherwise>
                        </xsl:choose>
                        <br/>
                        <xsl:if test="TitleTxt">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="TitleTxt"/>
                          </xsl:call-template>
                        </xsl:if>
                        <br/>
                      </td>
                      <!-- Column B -->
                      <td class="styTableCell" scope="col" style="width:15mm;border-top-width:0px;border-bottom-width:1px;border-style: solid; border-color: black;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="AverageHoursPerWeekRt"/>
                        </xsl:call-template>
                        <br/>
                        <!--Dotted Line per customer request. If you add more dots then amount for D,E,F will wrap 2012-->
                        <!--Doesn't put bottom line at last record even though a border statement is present - 2012-->
                      <span style="width:15mm;text-align:left;letter-spacing:.1mm;  font-size:6pt;"><b>.......................</b></span>
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="AverageHoursPerWeekRltdOrgRt"/>
                        </xsl:call-template>
                    </td> 
                      <!-- Column C -->
                      <td class="styTableCell" scope="col" style="width:10mm;text-align:center;border-style: solid; border-color: black;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="IndividualTrusteeOrDirectorInd"/>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" scope="col" style="width:5mm;text-align:center;border-style: solid; border-color: black;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="InstitutionalTrusteeInd"/>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" scope="col" style="width:5mm;text-align:center;border-style: solid; border-color: black;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="OfficerInd"/>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" scope="col" style="width:5mm;text-align:center;border-style: solid; border-color: black;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="KeyEmployeeInd"/>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" scope="col" style="width:5mm;text-align:center;border-style: solid; border-color: black;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="HighestCompensatedEmployeeInd"/>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" scope="col" style="width:5mm;text-align:center;border-style: solid; border-color: black;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="FormerOfcrDirectorTrusteeInd"/>
                        </xsl:call-template>
                      </td>
                      <!-- Column D -->
                      <td class="styTableCell" scope="col" style="width:25mm;font-size:6pt;border-style: solid; border-color: black;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="ReportableCompFromOrgAmt"/>
                        </xsl:call-template>
                      </td>
                      <!-- Column E -->
                      <td class="styTableCell" scope="col" style="width:25mm;font-size:6pt;border-style: solid; border-color: black;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="ReportableCompFromRltdOrgAmt"/>
                        </xsl:call-template>
                      </td>
                      <!-- Column F -->
                      <td class="styTableCell" scope="col" style="width:25mm;font-size:6pt;border-right-width:0px;border-style: solid; border-color: black;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="OtherCompensationAmt"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:if>
                </xsl:for-each>
                <xsl:if test="count($Form990Data/Form990PartVIISectionAGrp) &lt; 18">
                  <xsl:call-template name="IRS990PartVIITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($Form990Data/Form990PartVIISectionAGrp) &lt; 19">
                  <xsl:call-template name="IRS990PartVIITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($Form990Data/Form990PartVIISectionAGrp) &lt;  20">
                  <xsl:call-template name="IRS990PartVIITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($Form990Data/Form990PartVIISectionAGrp) &lt;  21">
                  <xsl:call-template name="IRS990PartVIITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($Form990Data/Form990PartVIISectionAGrp) &lt;  22">
                  <xsl:call-template name="IRS990PartVIITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($Form990Data/Form990PartVIISectionAGrp) &lt;  23">
                  <xsl:call-template name="IRS990PartVIITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($Form990Data/Form990PartVIISectionAGrp) &lt;  24">
                  <xsl:call-template name="IRS990PartVIITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($Form990Data/Form990PartVIISectionAGrp) &lt;  25">
                  <xsl:call-template name="IRS990PartVIITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($Form990Data/Form990PartVIISectionAGrp) &lt;  26">
                  <xsl:call-template name="IRS990PartVIITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($Form990Data/Form990PartVIISectionAGrp) &lt; 27">
                  <xsl:call-template name="IRS990PartVIITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($Form990Data/Form990PartVIISectionAGrp) &lt; 28">
                  <xsl:call-template name="IRS990PartVIITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($Form990Data/Form990PartVIISectionAGrp) &lt; 29">
                  <xsl:call-template name="IRS990PartVIITableFillerRow"/>
                </xsl:if>
                <xsl:if test="count($Form990Data/Form990PartVIISectionAGrp) &lt; 30">
                  <xsl:call-template name="IRS990PartVIITableFillerRow"/>
                </xsl:if>
              </tbody>
              <tfoot/>
            </table>
          </div>
          <table class="styTable" style="font-size:7pt;width:187mm;border-color:black" cellspacing="0">
            <tbody valign="top">
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:auto;padding-top:.3mm;border-style: solid;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">1b</td>
                <td class="styGenericDiv" colspan="4" style="width:101mm;height:auto;border-style: solid;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                  <span class="styBoldText" style="float:left;">Sub-Total</span>
                  <span style="float:left;letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">................</span>
                  <span style="float:right;padding-right:.5mm;">
                    <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                  </span>
                  <td class="styTableCell" style="width:27mm;height:auto;font-size:6pt;">
                    <span class="styTableCellPad"/>
                    
                  </td>
                  <td class="styTableCell" style="width:27mm;height:auto;font-size:6pt; ">
                    <span class="styTableCellPad"/>
                    
                  </td>
                  <td class="styTableCell" style="width:27mm;height:auto;font-size:6pt; border-style: solid;border-right-width: 0px;">
                    <span class="styTableCellPad"/>
                   
                  </td>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:auto;padding-top:.3mm;padding-left:3mm;border-style: solid;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">c</td>
                <td class="styGenericDiv" colspan="4" style="width:101mm;height:auto;border-style: solid;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                  <span class="styBoldText" style="float:left;">Total from continuation sheets to <span style="font-family: Arial, Helvetica, sans-serif; font-weight: bold; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VII</span>, Section A</span>
                  <span style="float:left;letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">....</span>
                  <span style="float:right;padding-right:.5mm;">
                    <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                  </span>
                  <td class="styTableCell" style="width:25mm;height:auto;font-size:6pt;">
                    <span class="styTableCellPad"/>
                    
                  </td>
                  <td class="styTableCell" style="width:25mm;height:auto;font-size:6pt; ">
                    <span class="styTableCellPad"/>
                   
                  </td>
                  <td class="styTableCell" style="width:25mm;height:auto;font-size:6pt;border-style: solid;border-right-width: 0px; ">
                    <span class="styTableCellPad"/>
                    
                  </td>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:auto;padding-top:0mm;padding-left:3mm;border-style: solid;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">d</td>
                <td class="styGenericDiv" colspan="4" style="width:101mm;height:auto;border-style: solid;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;">
                  <span class="styBoldText" style="float:left;">Total (add lines 1b and 1c)</span>
                  <span style="float:left;letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">...........</span>
                  <span style="float:right;padding-right:.5mm;">
                    <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                  </span>
                  <td class="styTableCell" style="width:25mm;height:auto;font-size:6pt;">
                    <span class="styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/TotalReportableCompFromOrgAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styTableCell" style="width:25mm;height:auto;font-size:6pt; ">
                    <span class="styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/TotReportableCompRltdOrgAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styTableCell" style="width:25mm;height:auto;font-size:6pt; border-style: solid;border-right-width: 0px;">
                    <span class="styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/TotalOtherCompensationAmt"/>
                    </xsl:call-template>
                  </td>
                </td>
              </tr>
            </tbody>
          </table>
          <div style="width:187mm;float:none;padding-top:1mm;">
            <div class="styLNLeftNumBox" style="height:4.5mm;">2</div>
            <div class="styLNDesc" style="width:140mm;height:4.5mm;">
          Total number of individuals (including but not limited to those listed above) who received more than $100,000 of reportable compensation from the organization
          <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
          <span style="padding-left:1mm;"/>
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form990Data/IndivRcvdGreaterThan100KCnt"/>
              </xsl:call-template>
            </div>
          </div>
          <div class="styBB" style="width:187mm;float:none;height:4.5mm;"/>
          <div style="width: 187mm">
            <div class="styLNLeftNumBox"/>
            <div class="styLNDesc" style="width: 150mm"/>
            <div class="styIRS990LNYesNoBox" style="width:8mm;height:4.5mm;border-left-width:0px;">
              <span style="width:1px;"/>
            </div>
            <div class="styIRS990LNYesNoBox" style="width:10mm;height:4.5mm;border-top-width:0px;">
              <span class="styBoldText">Yes</span>
            </div>
            <div class="styIRS990LNYesNoBox" style="width:10mm;height:4.5mm;border-top-width:0px;">
              <span class="styBoldText">No</span>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:auto;">3</div>
            <div class="styLNDesc" style="width:150mm;height:auto;">
          Did the organization list any <span class="styBoldText">former</span> officer, director or trustee, key employee, or highest compensated employee on line 1a? <span class="styItalicText">If "Yes," complete Schedule J for such individual </span>
              <span style="letter-spacing:4mm; font-weight:bold; font-size:8pt; margin-left:2mm;">..............</span>
            </div>
            <div class="styShadingCell" style="width:8mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
            <div class="styLNRightNumBox" style="height:4.5mm;">3</div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/FormerOfcrEmployeesListedInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/FormerOfcrEmployeesListedInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:auto;">4</div>
            <div class="styLNDesc" style="width:150mm;height:auto;">
          For any individual listed on line 1a, is the sum of reportable compensation and other compensation from
the organization and related organizations greater than $150,000? <i>If "Yes," complete Schedule J for such <br></br>individual</i> 
              <span style="letter-spacing:4mm; font-weight:bold; font-size:8pt; margin-left:2mm;">...........................</span>
            </div>
            <div class="styShadingCell" style="width:8mm;height:7.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:7.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:7.5mm;"/>
            <div class="styLNRightNumBox" style="height:4.5mm;">4</div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/TotalCompGreaterThan150KInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/TotalCompGreaterThan150KInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:auto;">5</div>
            <div class="styLNDesc" style="width:150mm;height:auto;">
          Did any person listed on line 1a receive or accrue compensation from any unrelated organization or individual for services rendered to the organization?<span class="styItalicText"> If "Yes," complete Schedule J for such person </span>
              <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:8pt; margin-left:2mm;">........</span>
            </div>
            <div class="styShadingCell" style="width:8mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
            <div class="styShadingCell" style="width:10mm;height:4.5mm;"/>
            <div class="styLNRightNumBox" style="height:4.5mm;">5</div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/CompensationFromOtherSrcsInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/CompensationFromOtherSrcsInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div class="styTBB" style="width:187mm;"/>
          <!-- BEGIN Section B  -->
          <div class="styBB" style="width:187mm;float:none;">
            <span class="styPartDesc" style="float:none;height:auto;">
        Section B. Independent Contractors 
     </span>
          </div>
          <div class="styBB" style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:auto;">1</div>
            <div class="styLNDesc" style="width:170mm;height:auto;">
          Complete this table for your five highest compensated independent contractors that received more than $100,000 of compensation from the organization.
          Report compensation for the calendar year ending with or within the organization’s tax year.
     </div>
          </div>
          <!-- BEGIN Section B Table -->
          <table class="styTable" cellspacing="0" style="width:187mm;border-color:black;display:table;">
            <thead class="styTableThead">
              <tr>
                <th class="styTableCellHeader" scope="col" style="width:124mm;">
              (A)<br/>
                  <span class="styNormalText"> Name and business address</span>
                </th>
                <th class="styTableCellHeader" scope="col" style="width:40mm;">
              (B)<br/>
                  <span class="styNormalText">Description of services</span>
                </th>
                <th class="styTableCellHeader" scope="col" style="width:23mm;border-right-width:0px;">
              (C)<br/>
                  <span class="styNormalText">Compensation</span>
                </th>
              </tr>
            </thead>
            <tfoot/>
            <tbody>
              <xsl:for-each select="$Form990Data/ContractorCompensationGrp">
                <tr>
                  <td class="styTableCellText" scope="col" style="width:124mm;">
                    <xsl:choose>
                      <xsl:when test="ContractorName/PersonNm">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="ContractorName/PersonNm"/>
                        </xsl:call-template>,
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="ContractorName/BusinessName/BusinessNameLine1Txt"/>
                        </xsl:call-template> <br></br>
                        <xsl:if test="ContractorName/BusinessName/BusinessNameLine2Txt">
                       <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="ContractorName/BusinessName/BusinessNameLine2Txt"/>
                          </xsl:call-template>
                        </xsl:if>
                      </xsl:otherwise>
                    </xsl:choose>
                     <br></br>
                   <!--<span style="width: 2px"/>-->
                    <xsl:choose>
                      <xsl:when test="ContractorAddress/USAddress">
                      <!-- <xsl:call-template name="PopulateForeignAddressTemplate">TEGE wants this to be one line so changed Template to PopulateText-->
                        <xsl:call-template name="PopulateUSAddressTemplate">
                          <xsl:with-param name="TargetNode" select="ContractorAddress/USAddress"/>
                        </xsl:call-template>
                      </xsl:when>
                      <xsl:otherwise>
                       <!-- <xsl:call-template name="PopulateForeignAddressTemplate">TEGE wants this to be one line so changed Template to PopulateText-->
                       <xsl:call-template name="PopulateForeignAddressTemplate">
                          <xsl:with-param name="TargetNode" select="ContractorAddress/ForeignAddress"/>
                        </xsl:call-template>
                      </xsl:otherwise>
                    </xsl:choose>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCellText" scope="col" style="width:40mm;vertical-align:top;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="ServicesDesc"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" scope="col" style="width:23mm;border-right-width:0px;vertical-align:top;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="CompensationAmt"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
              </xsl:for-each>
              <xsl:if test="count($Form990Data/ContractorCompensationGrp) &lt; 1">
                <tr>
                  <td class="styTableCellText" scope="col" style="width:124mm;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCellText" scope="col" style="width:40mm;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" scope="col" style="width:23mm;border-right-width:0px;">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="count($Form990Data/ContractorCompensationGrp) &lt; 2">
                <tr>
                  <td class="styTableCellText" scope="col" style="width:124mm;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCellText" scope="col" style="width:40mm;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" scope="col" style="width:23mm;border-right-width:0px;">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="count($Form990Data/ContractorCompensationGrp) &lt; 3">
                <tr>
                  <td class="styTableCellText" scope="col" style="width:124mm;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCellText" scope="col" style="width:40mm;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" scope="col" style="width:23mm;border-right-width:0px;">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="count($Form990Data/ContractorCompensationGrp) &lt; 4">
                <tr>
                  <td class="styTableCellText" scope="col" style="width:124mm;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCellText" scope="col" style="width:40mm;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" scope="col" style="width:23mm;border-right-width:0px;">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="count($Form990Data/ContractorCompensationGrp) &lt; 5">
                <tr>
                  <td class="styTableCellText" scope="col" style="width:124mm;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCellText" scope="col" style="width:40mm;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" scope="col" style="width:23mm;border-right-width:0px;">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
              </xsl:if>
              <tr style="font-size:7pt;">
                <td class="styTableCellText" scope="col" style="width:164mm;height:auto;" colspan="2">
                  <div class="styLNLeftNumBox" style="width:5mm;height:auto;padding-top:.3mm;">
                2 
              </div>
              Total number of independent contractors (including but not limited to those listed above) who received more than $100,000 of compensation from the organization 
               <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                  <span style="padding-left:1mm;"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/CntrctRcvdGreaterThan100KCnt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" scope="col" style="width:23mm;border-right-width:0px;font-size:6pt;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
              </tr>
            </tbody>
          </table>
          <!--  End Part VII continued -->
          <!-- End Part VII-->
          <!-- Footer -->
          <div style="width:187mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 0px" class="pageEnd">
            <div class="styGenericDiv" style="width:105mm;"/>
            <div class="styGenericDiv" style="width:25mm;"/>
            <div class="styGenericDiv" style="float:right;">Form <span class="styBoldText">990</span> (2020)</div>
          </div>
          <!-- header -->
          <div style="width:187mm;clear:both;padding-bottom:.5mm;float:none;clear:both;" class="styBB">
            <div style="width:90mm;" class="styGenericDiv">Form 990 (2020)</div>
            <div style="width:55mm;text-align:center;" class="styGenericDiv"/>
            <div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">9</span>
            </div>
          </div>
            <!--@@@@@@@@@@@@@@@@NEW PART VIII BELOW@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
          <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
          <!-- Begin Part VIII-->
          <!--   BEGIN Part VIII Title -->
          <div class="styBB" style="width:187mm;float:none;">
            <div class="styPartName" style="width:16mm;height:auto;"><span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VIII</span></div>
            <div class="styPartDesc" style="width:77mm;height:auto;">Statement of Revenue
              </div>
              <span style="height:auto;width:187mm;font-size: 7pt; float:left;padding-left:19mm;">Check if Schedule O
contains a response or note to any line in this <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VIII</span> 
               <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.............</span>
              <span style="width:1mm;"/>
<input type="checkbox" class="styCkbox" alt="InfoInScheduleOPartVIIIInd">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InfoInScheduleOPartVIIIInd"/>
                    <xsl:with-param name="BackupName">IRS990InfoInScheduleOPartVIII</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
    <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$Form990Data/InfoInScheduleOPartVIIIInd"/>
        <xsl:with-param name="BackupName">IRS990InfoInScheduleOPartVIIIInd</xsl:with-param>
    </xsl:call-template>
 </label>
              
      </span>
          </div>
          
          <!-- END Part VIII Title -->
<!--  Begin Part VIII Table -->
          <!--  STATEMENT OF REVENUE BEGINNING   -->
     <!--  <table class="styTable" style="font-size:7pt;width:187mm;border-color:black;" cellspacing="0">-->
       
					<table class="styTable" style="font-size: 7pt; border-color:black;width:187mm;height:auto;display:table;" cellspacing="0">
					<tr scope="col">
               <td class="styTableCell" style="width:87mm;height:10mm;font-weight:bold;text-align:center;border-left-width:0px;border-style: solid;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px; background-color:lightgrey;">
                   <span class="styTableCellPad"/>
                   </td>
                  <td class="styTableCell" style="width:25mm;height:10mm;text-align:center;vertical-align:top;">
                  <span style="font-weight:bold;">(A)</span>
                  <br/> 
  Total revenue 
  </td>
                <td class="styTableCell" style="width:25mm;height:10mm;text-align:center;vertical-align:top;">
                  <span style="font-weight:bold;">(B)</span>
                  <br/> 
  Related or 
  <br/> 
  exempt 
  <br/> 
  function 
  <br/> 
  revenue 
  </td>
                <td class="styTableCell" style="width:25mm;height:10mm;text-align:center;vertical-align:top;">
                  <span style="font-weight:bold;">(C)</span>
                  <br/> 
  Unrelated 
  <br/> 
  business 
  <br/> 
  revenue 
  </td>
                <td class="styTableCell" style="width:25mm;height:auto;text-align:center;vertical-align:top;border-style: solid;border-right-width: 0px;">
                  <span style="font-weight:bold;">(D)</span>
                  <br/> 
  Revenue 
  <br/> 
  excluded from 
  <br/> 
  tax under sections 
  <br/> 
 512 - 514  
  </td>
              </tr>
              </table>
              
               <table class="styTable" style="border-bottom-width: 1px;border-top-width: 0px;border-right-width: 0px;border-left-width: 0px; border-style: solid; font-size:7pt;width:187mm;display:table;" cellspacing="0">
          
                         <tr>
                <td class="styIRS990VTImageBox" rowspan="11" valign="top" style="width:0mm;font:6pt;padding-right:0mm;">
                  <img src="{$ImagePath}/990_CGGOSAmt.gif" alt="Contributions, Gifts, GrantAmt and OtherAmt Similar Amounts"/>
                </td>
            <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-top:.3mm;padding-left:0mm;">1a</td>
          
                <td class="styGenericDiv" colspan="3" style="width:41mm;height:4.5mm;">
                  <span style="float:left;">Federated campaigns</span>
                  <span style="float:left;letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">..</span>
                  
            <td class="styLNRightNumBox" style="height:4.5mm;">1a</td>
<td class="styLNAmountBox" style="height:4.5mm;width:22mm;font-size:6pt;">
                  
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/FederatedCampaignsAmt"/>
                    </xsl:call-template>
                    
                
                </td>
                  </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
                
              <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
                  <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
                  <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
                  <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
              </tr>
              <!-- 1b -->
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-top:.3mm;padding-left:3mm;padding-left:2mm;">b</td>
                <td class="styGenericDiv" colspan="3" style="width:41mm;height:4.5mm;">
                  <span style="float:left;">Membership dues</span>
                  <span style="float:left;letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">..</span>
                   <td class="styLNRightNumBox" style="height:4.5mm;">1b</td>
<td class="styLNAmountBox" style="height:4.5mm;width:22mm;font-size:6pt;">
                
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/MembershipDuesAmt"/>
                    </xsl:call-template>
                  </td>
          </td>
              
                 <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
               <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
               <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
               <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
              </tr>
              <!-- 1c -->
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-top:.3mm;padding-left:3mm;padding-left:2mm;">c</td>
                <td class="styGenericDiv" colspan="3" style="width:41mm;height:4.5mm;">
                  <span style="float:left;">Fundraising events</span>
                  <span style="float:left;letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">..</span>
                   <td class="styLNRightNumBox" style="height:4.5mm;">1c</td>
<td class="styLNAmountBox" style="height:4.5mm;width:22mm;font-size:6pt;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/FundraisingAmt"/>
                    </xsl:call-template>
                    </td>
          </td>
          <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
               <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
               <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
              </tr>
              <!-- 1d -->
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-top:.3mm;padding-left:2mm;">d</td>
                <td class="styGenericDiv" colspan="3" style="width:41mm;height:4.5mm;">
                  <span style="float:left;">Related organizations</span>
                  <span style="float:left;letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"></span>
                   <td class="styLNRightNumBox" style="height:4.5mm;">1d</td>
<td class="styLNAmountBox" style="height:4.5mm;width:22mm;font-size:6pt;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/RelatedOrganizationsAmt"/>
                    </xsl:call-template>
                     </td>
                </td>
              <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
               <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
              </tr>
              <!-- 1e -->
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-top:.3mm;padding-left:2mm;">e</td>
                <td class="styGenericDiv" colspan="3" style="width:41mm;height:4.5mm;">
                  <span style="float:left;font-size:6pt;">Government grants (contributions)</span>
                   <td class="styLNRightNumBox" style="height:4.5mm;">1e</td>
<td class="styLNAmountBox" style="height:4.5mm;width:22mm;font-size:6pt;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/GovernmentGrantsAmt"/>
                    </xsl:call-template>
                    </td>
                </td>
               <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
               <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
               <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
               <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
                
                <tr/>
                <td class="styLNLeftNumBox" style="width:5mm;height:5.5mm;padding-top:.3mm;padding-left:2mm;">f</td>
                <td class="styGenericDiv" colspan="3" style="width:41mm;height:5.5mm;">
                  <span style="float:left;font-size:6pt;">All other contributions, gifts, grants, and similar amounts not included above</span>
                  <td class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm;">1f</td>
<td class="styLNAmountBox" style="height:7.5mm;width:22mm;font-size:6pt;padding-top:4mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/AllOtherContributionsAmt"/>
                    </xsl:call-template>
                   </td>
                </td>
               <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
               <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
               <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
                 <!-- 1g -->
                 <tr/>
                <td class="styLNLeftNumBox" style="width:5mm;height:5.5mm;padding-top:.3mm;padding-left:2mm;">g</td>
                <td class="styGenericDiv" colspan="3" style="width:41mm;height:5.5mm;">
                  <span style="float:left;font-size:6pt;">Noncash contributions included in lines 1a - 1f:$</span></td>
                  <td class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">1g</td>
<td class="styLNAmountBox" style="height:7.5mm;width:22mm;font-size:6pt;padding-top:4mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/NoncashContributionsAmt"/>
                    </xsl:call-template>
                   
                </td>
               <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
               <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
               <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
              </tr>
              
              <tr/>
              
              <!-- 1h -->
             <tr>
                
                <td class="styGenericDiv" colspan="3" style="padding-top:0mm;width:78.5mm;height:4.5mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 <span style="width:2mm;"/><b>h Total. </b> 
                  <span class="styNormalText"> Add lines 1a-1f</span>
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.......</span>
                 
                  <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
               
                 </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:1mm;">
                   <span style="font-size:6pt;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/TotalContributionsAmt"/>
                    </xsl:call-template>
                  </span>
                </td>
               
                <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
               <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
               <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
               <td class="styTableCell" style="width:25mm;height:4.5mm;background-color:lightgrey;border-style: solid; border-color: lightgrey;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                 </td>
              </tr>
              
														
														</table>
													 <table class="styTable" style="border: 0px 1px 0px 0px solid black; font-size:7pt;width:187mm;border-color:black;display:table;" cellspacing="0">
            <tbody valign="top">
              <!--********************************************************************************************************************************************************************************-->
              <!-- Program Service Revenue - 2a - 2g -->
              <!-- Space between top of table and 2a -->
             
              <tr>
               <td class="styIRS990VTImageBox" style="width:5mm;padding-left:1mm;" valign="middle">
                  <xsl:attribute name="rowspan">
                  <xsl:choose>
                  <xsl:when test="count($Form990Data/ProgramServiceRevenueGrp) &lt; 5">8
          </xsl:when>
          <xsl:otherwise>
          <xsl:value-of select="count($Form990Data/ProgramServiceRevenueGrp) + 3"/>
          </xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
              <img src="{$ImagePath}/990R_ProgSerRev.gif" alt=" Program Service RevenueAmt"/>
                </td>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;"/>
                <td class="styLNDesc" colspan="2" style="width:47mm;height:4.5mm;"/>
               <td class="styTableCell" style="width:22mm;height:4.5mm;border-left-width:1px;text-align:center;border-top-width:1px;border-top-width:0px;">Business Code</td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;border-top-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;border-top-width:0px;background-color:lightgrey">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;border-top-width:0px;background-color:lightgrey">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;border-top-width:0px;background-color:lightgrey;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                </td>
              </tr>
           
              <!-- 2a -->
              <xsl:for-each select="$Form990Data/ProgramServiceRevenueGrp">
                <tr>
                  <xsl:if test="position()=1">
             <td class="styLNLeftNumBox" style="width:5mm;height:8mm;padding-top:1mm;padding-left:1mm;">2a</td>
                  </xsl:if>
                  <xsl:if test="position()!=1">
                    <td class="styLNLeftNumBox" style="width:5mm;height:8mm;vertical-align:top;padding-left:2.5mm;padding-top:1mm;">
                    
                      <xsl:number value="position()" format="a"/>
                    </td>
                  </xsl:if>
                   <td class="styLNDesc" colspan="2" style="width:51.25mm;">
                     <span style="width:51.25mm;height:8mm;font-size:6pt;padding-top:0mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;padding-left:0mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="Desc"/>
                      </xsl:call-template>
                    </span>
                  </td>
                  
                   <td class="styTableCell" style="width:20mm;height:8mm;font-size:6pt;border-left-width:1px;padding-top:2.25mm;">
                    <span class="styTableCellPad"/>
                      <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="BusinessCd"/>
                    </xsl:call-template>
                  </td>
                  <td class="styTableCell" style="width:25mm;height:8mm;font-size:6pt;padding-top:0mm;border-style: solid; border-color: black;border-top-width: 0px;">
                    <span class="styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="TotalRevenueColumnAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styTableCell" style="width:25mm;height:8mm;font-size:6pt;padding-top:0mm;">
                    <span class="styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="RelatedOrExemptFuncIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styTableCell" style="width:25mm;height:8mm;font-size:6pt;padding-top:0mm;">
                    <span class="styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="UnrelatedBusinessRevenueAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styTableCell" style="width:25mm;height:8mm;font-size:6pt;padding-top:0mm;border-style: solid;border-right-width: 0px;">
                    <span class="styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="ExclusionAmt"/>
                    </xsl:call-template>
                  </td>
                </tr>
              </xsl:for-each>
            <xsl:if test="count($Form990Data/ProgramServiceRevenueGrp) &lt; 1">
                <tr>
                   <td class="styLNLeftNumBox" style="width:5mm;height:8mm;padding-top:0mm;padding-left:0mm;">2a</td>
                   <td class="styLNDesc" colspan="2" style="width:51.25mm;height:8mm;">
                    <span style="width:51.25mm;height:8mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
                      <span class="styTableCellPad"/>
                    </span>
                  </td>
                  <td class="styTableCell" style="width:22mm;height:8mm;font-size:6pt;border-left-width:1px;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="width:25mm;height:8mm;font-size:6pt;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="width:25mm;height:8mm;font-size:6pt;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="width:25mm;height:8mm;font-size:6pt;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="width:25mm;height:8mm;font-size:6pt;border-style: solid;border-right-width: 0px;">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="count($Form990Data/ProgramServiceRevenueGrp) &lt; 2">
                <tr>
               <td class="styLNLeftNumBox" style="width:5mm;height:8mm;padding-top:0mm;padding-left:2.5mm;">
                    <span style="width:1.5mm;"/>b 
        </td>
                  <td class="styGenericDiv" colspan="2" style="width:51.25mm;height:8mm;">
                    <span style="width:51.25mm;height:8mm;padding-top:.5mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
                      <span class="styTableCellPad"/>
                    </span>
                  </td>
                  <td class="styTableCell" style="width:22mm;height:8mm;font-size:6pt;border-left-width:1px;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="width:25mm;height:8mm;font-size:6pt;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="width:25mm;height:8mm;font-size:6pt;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="width:25mm;height:8mm;font-size:6pt;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="width:25mm;height:8mm;font-size:6pt;border-style: solid;border-right-width: 0px;">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="count($Form990Data/ProgramServiceRevenueGrp) &lt; 3">
                <tr>
                   <td class="styLNLeftNumBox" style="width:5mm;height:8mm;padding-top:0mm;padding-left:2.5mm;">
                    <span style="width:1.5mm;"/>c 
        </td>
                  <td class="styGenericDiv" colspan="2" style="width:51.25mm;height:8mm;">
                    <span style="width:51.25mm;height:8mm;padding-top:.5mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
                      <span class="styTableCellPad"/>
                    </span>
                  </td>
                  <td class="styTableCell" style="width:22mm;height:8mm;font-size:6pt;border-left-width:1px;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="width:25mm;height:8mm;font-size:6pt;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="width:25mm;height:8mm;font-size:6pt;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="width:25mm;height:8mm;font-size:6pt;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="width:25mm;height:8mm;font-size:6pt;border-style: solid;border-right-width: 0px;">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="count($Form990Data/ProgramServiceRevenueGrp) &lt; 4">
                <tr>
                  <td class="styLNLeftNumBox" style="width:5mm;height:8mm;padding-top:0mm;padding-left:2.5mm;">
                    <span style="width:1.5mm;"/>d 
                  </td>
                  <td class="styGenericDiv" colspan="2" style="width:51.25mm;height:8mm;">
                    <span style="width:51.25mm;height:8mm;padding-top:.5mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
                      <span class="styTableCellPad"/>
                    </span>
                  </td>
                  <td class="styTableCell" style="width:22mm;height:8mm;font-size:6pt;border-left-width:1px;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="width:25mm;height:8mm;font-size:6pt;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="width:25mm;height:8mm;font-size:6pt;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="width:25mm;height:8mm;font-size:6pt;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="width:25mm;height:8mm;font-size:6pt;border-style: solid;border-right-width: 0px;">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
              </xsl:if>
              <xsl:if test="count($Form990Data/ProgramServiceRevenueGrp) &lt; 5">
                <tr>
                  <td class="styLNLeftNumBox" style="width:5mm;height:8mm;padding-top:0mm;padding-left:2.5mm;">
                    <span style="width:1.5mm;"/>e 
                  </td>
                  <td class="styGenericDiv" colspan="2" style="width:51.25mm;height:8mm;">
                    <span style="width:51.25mm;height:8mm;padding-top:0mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
                      <span class="styTableCellPad"/>
                    </span>
                  </td>
                  <td class="styTableCell" style="width:22mm;height:8mm;font-size:6pt;border-left-width:1px;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="width:25mm;height:8mm;font-size:6pt;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="width:25mm;height:8mm;font-size:6pt;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="width:25mm;height:8mm;font-size:6pt;">
                    <span class="styTableCellPad"/>
                  </td>
                  <td class="styTableCell" style="width:25mm;height:8mm;font-size:6pt;border-style: solid;border-right-width: 0px;">
                    <span class="styTableCellPad"/>
                  </td>
                </tr>
              </xsl:if>
              <!-- 2f -->
              <xsl:if test="count($Form990Data/ProgramServiceRevenueGrp) &lt; 6">
              <tr>
                 <td class="styLNLeftNumBox" style="width:5mm;height:8mm;padding-top:3mm;padding-left:1mm;">
                  <span style="width:1.5mm;"/>f 
    </td>
                <td class="styGenericDiv" colspan="2" style="width:48mm;height:8mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:3mm;">All other program service revenue.
   <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:22mm;height:8mm;font-size:6pt;border-left-width:1px;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:8mm;font-size:6pt;padding-top:1mm;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TotalOthProgramServiceRevGrp/TotalRevenueColumnAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:8mm;font-size:6pt;padding-top:1mm;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TotalOthProgramServiceRevGrp/RelatedOrExemptFuncIncomeAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:8mm;font-size:6pt;padding-top:1mm;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TotalOthProgramServiceRevGrp/UnrelatedBusinessRevenueAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:8mm;font-size:6pt;padding-top:1mm;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TotalOthProgramServiceRevGrp/ExclusionAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              </xsl:if>
              <!-- 2g -->
               <tr>
                 <td class="styLNLeftNumBox" style="width:0.25mm;height:4.5mm;padding-top:0mm;padding-left:2mm;padding-right:0mm;">
                  g
    </td>
             <td class="styGenericDiv" colspan="3" style="width:52mm;height:4.5mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:0.5mm;padding-right:0mm;">
                 <span style="width:2mm;padding-right:3mm;"/><b> Total. </b> 
                  <span class="styNormalText"> Add lines 2a–2f </span>
                  <span style="letter-spacing:2.5mm; font-weight:bold; font-size:7pt;">.....</span>
                  <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                  <span style="width:1mm;"/>
                </td>
                <td class="styTableCell" style="width:16mm;height:4.5mm;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                  <span style="width:1mm;"/>
                  <span style="font-size:5.7pt;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/TotalProgramServiceRevenueAmt"/>
                    </xsl:call-template>
                  </span>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm; border-style: solid;border-right-width: 0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm; background-color:lightgrey;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm; background-color:lightgrey;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                </td>
                  <td class="styTableCell" style="width:25mm;height:4.5mm; background-color:lightgrey;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                </td>
              </tr>
             	</tbody>
					</table>
           
														
              <!-- Line 3 -->
              <table class="styTable" style="font-size:7pt;width:187mm;border-color:black;display:table;" cellspacing="0">
            <tbody valign="top">							
															
              <tr>
            <td class="styIRS990VTImageBox" style="width:5mm;padding-left:2mm;" rowspan="33" valign="middle">
                  <img src="{$ImagePath}/990_Other_Revenue.gif" alt=" OtherAmtRevenueAmt"/>
                </td>
               <td class="styLNDesc" colspan="3" style="width:81mm;height:4.5mm;border-style: solid; border-color: black;border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;float:left;">
                <span style="padding-left:1mm;"><b>3</b> Investment income (including dividends, interest, and other</span>
               <span style="padding-left:3mm">similar amounts)  </span>
                <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">......</span>
                  <span style="float:right;padding-right:.5mm;">
                    <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                  </span>
                 
                 </td>
               
                 <td class="styTableCell" style="width:25mm;height:7.5mm;font-size:6pt;padding-top:3mm;border-style: solid; border-color: black;border-left-width: 1px;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InvestmentIncomeGrp/TotalRevenueColumnAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;padding-top:3mm;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InvestmentIncomeGrp/RelatedOrExemptFuncIncomeAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;padding-top:3mm;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InvestmentIncomeGrp/UnrelatedBusinessRevenueAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;padding-top:3mm;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InvestmentIncomeGrp/ExclusionAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- Line 4 -->
              <tr>
                
                <td class="styLNDesc" colspan="3" style="width:81mm;height:auto;font-size:7pt;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                  <span style="padding-left:1mm;"><b>4</b> Income from investment of tax-exempt bond proceeds</span>
                  <span style="float:right;padding-right:.5mm;">
                    <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                  </span>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/IncmFromInvestBondProceedsGrp/TotalRevenueColumnAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/IncmFromInvestBondProceedsGrp/RelatedOrExemptFuncIncomeAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/IncmFromInvestBondProceedsGrp/UnrelatedBusinessRevenueAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/IncmFromInvestBondProceedsGrp/ExclusionAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- 5 -->
              <tr>
                
                <td class="styLNDesc" colspan="3" style="width:81mm;height:auto;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                  <span style="padding-left:1mm;"><b>5 </b>Royalties</span>
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">...........</span>
                  <span style="float:right;padding-right:.5mm;">
                    <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                  </span>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/RoyaltiesRevenueGrp/TotalRevenueColumnAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/RoyaltiesRevenueGrp/RelatedOrExemptFuncIncomeAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/RoyaltiesRevenueGrp/UnrelatedBusinessRevenueAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/RoyaltiesRevenueGrp/ExclusionAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="border-width: 0px; border-style: solid; width: 28mm; height: 4.5mm; padding-left: 0mm;"></td>
				<td class="styLNLeftNumBox" style="border-width: 1px 0px 0px 1px; border-style: solid; width: 5mm; height: 4.5mm;"></td>
				<td class="styTableCell" style="width: 24mm; height: 4.5mm; text-align: center; font-size: 7pt; border-top-width: 1px; border-left-width: 0px; float: right;">(ii) Personal</td>
				<td class="styTableCell" style="width: 24mm; height: 4.5mm; text-align: center; font-size: 7pt; border-top-width: 1px; border-left-width: 1px; float: right;">(i) Real</td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-top-width:1px;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-top-width:1px;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-top-width:1px;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-top-width:1px;border-bottom-width:0px;background-color:lightgrey;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <!--***************************6a - 6c and 7a - 7c Elements are backwards because IE11 is reading them out of order - RLJ *********************************-->
              <!-- 6a -->
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-top:3mm;padding-left:1mm;">6a</td>
                <td class="styGenericDiv" style="width:17mm;height:4.5mm;padding-top:3mm;">
  Gross rents 
                 </td>
                <td class="styTableCell" style="width:24mm;height:7.5mm;font-size:6pt;border-left-width:0px;float:right;padding-top:3.5mm;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/GrossRentsGrp/PersonalAmt"/>
                    <!--<xsl:with-param name="TargetNode" select="$Form990Data/GrossRentsGrp/RealAmt"/>-->
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:24mm;height:7.5mm;font-size:6pt;float:right;border-left-width:1px;padding-top:3.5mm;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/GrossRentsGrp/RealAmt"/>
                   <!-- <xsl:with-param name="TargetNode" select="$Form990Data/GrossRentsGrp/PersonalAmt"/>-->
                  </xsl:call-template>
                </td>
                <td class="styLNLeftNumBox" style="padding-top:3mm; border-width: 0px 0px 1px 1px; border-style: solid; width: 5mm; height: 7.5mm; font-size: 7pt; float: right;">6a</td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              
              
               <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:5mm;padding-top:0.5;padding-left:1mm;">b</td>
                <td class="styGenericDiv" style="width:19mm;height:5mm;padding-top:0.5;font-size:7pt;">
 Less: rental expenses 
                 </td>
                <td class="styTableCell" style="width:24mm;height:7.5mm;font-size:6pt;border-left-width:0px;float:right;padding-top:3.5mm;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/LessRentalExpensesGrp/PersonalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:24mm;height:7.5mm;font-size:6pt;float:right;border-left-width:1px;padding-top:3.5mm;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/LessRentalExpensesGrp/RealAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNLeftNumBox" style="padding-top:3mm; border-width: 0px 0px 1px 1px; border-style: solid; width: 5mm; height: 7.5mm; font-size: 7pt; float: right;">6b</td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              
              
               <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-top:0.5; padding-left:1mm;">c</td>
                <td class="styGenericDiv" style="width:19mm;height:4.5mm;padding-top:0.5;font-size:7pt;">
 Rental income or (loss)
                 </td>
                <td class="styTableCell" style="width:24mm;height:7.5mm;font-size:6pt;border-left-width:0px;float:right;padding-top:3.5mm;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/RentalIncomeOrLossGrp/PersonalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:24mm;height:7.5mm;font-size:6pt;float:right;border-left-width:1px;padding-top:3.5mm;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/RentalIncomeOrLossGrp/RealAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNLeftNumBox" style="padding-top:3mm; border-width: 0px 0px 1px 1px; border-style: solid; width: 5mm; height: 7.5mm; font-size: 7pt; float: right;">6c</td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              
              
            
              <!-- 6d -->
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:4.5mm;padding-top:0mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-left:.5mm;">
                  <span style="width:2.5mm;"/>d</td>
                <td class="styGenericDiv" colspan="3" style="width:72mm;height:4.5mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                  <span class="styNormalText" style="">Net rental income or (loss)</span>
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:1mm">.......</span>
                  <span style="float:right;padding-right:.5mm;padding-top:1mm;">
                    <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                  </span>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;padding-top:0mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 1px; border-right-width: 1px;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/NetRentalIncomeOrLossGrp/TotalRevenueColumnAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/NetRentalIncomeOrLossGrp/RelatedOrExemptFuncIncomeAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/NetRentalIncomeOrLossGrp/UnrelatedBusinessRevenueAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/NetRentalIncomeOrLossGrp/ExclusionAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              
              
              <tr>
                <td class="styLNLeftNumBox" style="border-width: 0px; border-style: solid; width: 28mm; height: 4.5mm; padding-left: 0mm;"></td>
				<td class="styLNLeftNumBox" style="border-width: 1px 0px 0px 1px; border-style: solid; width: 5mm; height: 4.5mm;"></td>
				<td class="styTableCell" style="width: 24mm; height: 4.5mm; text-align: center; font-size: 7pt; border-top-width: 1px; border-left-width: 0px; float: right;">(ii) Other</td>
				<td class="styTableCell" style="width: 24mm; height: 4.5mm; text-align: center; font-size: 7pt; border-top-width: 1px; border-left-width: 1px; float: right;">(i) Securities</td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-top-width:1px;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-top-width:1px;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-top-width:1px;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-top-width:1px;border-bottom-width:0px;background-color:lightgrey;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              
              
              
              <!--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
              
                            <!-- 7a -->
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:12mm;padding-top:1mm;padding-left:1mm;">7a</td>
                <td class="styGenericDiv" style="width:18mm;height:12mm;padding-top:1mm;font-size:6pt;">
  Gross amount from sales of assets other than inventory  
                 </td>
                <td class="styTableCell" style="width:24mm;height:12mm;font-size:6pt;border-left-width:0px;float:right;padding-top:3.5mm;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/GrossAmountSalesAssetsGrp/OtherAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:24mm;height:12mm;font-size:6pt;float:right;border-left-width:1px;padding-top:3.5mm;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/GrossAmountSalesAssetsGrp/SecuritiesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNLeftNumBox" style="padding-top:3mm; border-width: 0px 0px 1px 1px; border-style: solid; width: 5mm; height: 12mm; font-size: 7pt; float: right;">7a</td>
                <td class="styTableCell" style="width:25mm;height:12mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:12mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:12mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:12mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              
              
               <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:10mm;padding-top:1.5mm;padding-left:1mm;">b</td>
                <td class="styGenericDiv" style="width:19mm;height:10mm;padding-top:1.5mm;font-size:6pt;">
Less: cost or other basis and sales expenses   
                 </td>
                <td class="styTableCell" style="width:24mm;height:10mm;font-size:6pt;border-left-width:0px;float:right;padding-top:3.5mm;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/LessCostOthBasisSalesExpnssGrp/OtherAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:24mm;height:10mm;font-size:6pt;float:right;border-left-width:1px;padding-top:3.5mm;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/LessCostOthBasisSalesExpnssGrp/SecuritiesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNLeftNumBox" style="padding-top:3mm; border-width: 0px 0px 1px 1px; border-style: solid; width: 5mm; height: 10mm; font-size: 7pt; float: right;">7b</td>
                <td class="styTableCell" style="width:25mm;height:8mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:10mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:10mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:10mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                </td>
              </tr>
               <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:7.5mm;padding-top:3.5mm; padding-left:1mm;">c</td>
                <td class="styGenericDiv" style="width:19mm;height:7.5mm;padding-top:3.5mm;font-size:6pt;">
 Gain or (loss)   
                 </td>
                <td class="styTableCell" style="width:24mm;height:7.5mm;font-size:6pt;border-left-width:0px;float:right;padding-top:3.5mm;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/GainOrLossGrp/OtherAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:24mm;height:7.5mm;font-size:6pt;float:right;border-left-width:1px;padding-top:3.5mm;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/GainOrLossGrp/SecuritiesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNLeftNumBox" style="padding-top:3mm; border-width: 0px 0px 1px 1px; border-style: solid; width: 5mm; height: 7.5mm; font-size: 7pt; float: right;">7c</td>
                <td class="styTableCell" style="width:25mm;height:7.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:7.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:7.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:7.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <!--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->

              <!-- 7d -->
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;padding-top:.3mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-left:.5mm;">
                  <span style="width:2.5mm;"/>d 
  </td>
                <td class="styGenericDiv" colspan="3" style="width:72mm;height:auto;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                  <span class="styNormalText" style="">Net gain or (loss)</span>
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.........</span>
                  <span style="float:right;padding-right:.5mm;padding-top:1mm;">
                    <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                  </span>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-left-width: 1px;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/NetGainOrLossInvestmentsGrp/TotalRevenueColumnAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/NetGainOrLossInvestmentsGrp/RelatedOrExemptFuncIncomeAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/NetGainOrLossInvestmentsGrp/UnrelatedBusinessRevenueAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/NetGainOrLossInvestmentsGrp/ExclusionAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- 8a -->
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-top:.3mm;padding-left:1mm;">8a</td>
                <td class="styLNDesc" colspan="2" style="width:45mm;height:4.5mm;font-size:6pt;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
  Gross income from fundraising events (not including $ 
 <span class="styFixedUnderline" style="float:none;width:20mm;text-align:right;font-size:6pt;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/ContriRptFundraisingEventAmt"/>
                     </xsl:call-template>
                  </span>
               
  <span style="padding-left:2mm"/>of contributions reported on line 1c). 
  <span class="NormalText"> See <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IV</span>, line 18 <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">....</span>
                  </span>
                  
              
               <td class="styTableCell" style="width:25mm;height:10.5mm;border-left-width:1px;border-top-width:1px;border-bottom-width:0px;text-align:center;font-size:7pt;float:right;"></td>
                 </td>
                 <td class="styLNLeftNumBox" style="border-width: 1px 0px 0px 1px; border-style: solid; width: 6mm; height: 10.5mm; padding-left: 0.5mm; font-size: 6.5pt;"></td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <!-- 8a -->
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-top:0mm;"/>
                <td class="styLNDesc" colspan="2" style="width:45mm;height:4.5mm;padding-top:0mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                </td>
                <td class="styLNLeftNumBox" style="border-width: 0px 0px 1px 1px; border-style: solid; width: 6mm; height: 4.5mm; padding-left: 1.5mm; font-size: 6.5pt;">8a</td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;vertical-align:bottom; border-left-width: 1px;float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/FundraisingGrossIncomeAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <!-- 8b -->
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-top:.5mm;padding-left:3mm;">b</td>
                <td class="styLNDesc" colspan="2" style="width:45mm;height:4.5mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-top:.5mm;">
                  <span style="">
  Less: direct expenses 
  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">...</span>
                  </span>
                </td>
                <td class="styLNLeftNumBox" style="border-width: 0px 0px 1px 1px; border-style: solid; width: 6mm; height: 4.5mm; padding-left: 1.5mm; font-size: 6.5pt;">8b</td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;vertical-align:bottom; border-left-width: 1px; float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/FundraisingDirectExpensesAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <!-- 8c -->
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:auto;padding-top:.3mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-left:.5mm;">
                  <span style="width:2.5mm;"/>c</td>
                <td class="styGenericDiv" colspan="3" style="width:72mm;height:auto;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                  <span class="styNormalText" style="">Net income or (loss) from fundraising events</span>
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">..</span>
                  <span style="float:right;padding-right:.5mm;padding-top:1mm;">
                    <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                  </span>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-right-width: 1px;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/NetIncmFromFundraisingEvtGrp/TotalRevenueColumnAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                  <!--
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/NetIncomeFromFundraisingEvents/RelatedOrExemptFunctionIncome"/>
                  </xsl:call-template>
                  -->
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/NetIncmFromFundraisingEvtGrp/UnrelatedBusinessRevenueAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/NetIncmFromFundraisingEvtGrp/ExclusionAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- 9a -->
             <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:7.5mm;padding-top:4mm;padding-left:0mm;">9a</td>
                <td class="styLNDesc" colspan="2" style="width:45mm;height:7.5mm;padding-top:4mm;font-size: 6.5pt;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
  Gross income from gaming activities.<br/><span class="NormalText">See <span style="font-family: Arial, Helvetica, sans-serif; font-size: 10px; font-weight: 500;">Part IV</span>, line 19  <span style="letter-spacing: 4mm; font-size: 6.5pt; font-weight: bold; margin-left: 2mm;">...</span></span>
                </td>
                <td class="styLNLeftNumBox" style="border-width: 1px 0px 0px 1px; border-style: solid; width: 6mm; height: 7.5mm; padding-left: 0.5mm; font-size: 6.5pt;"></td>
            <td class="styTableCell" style="width:25mm;height:7.5mm;border-left-width:1px;border-top-width:1px;border-bottom-width:0px;text-align:center;font-size:7pt;float:right;"></td>
                <td class="styTableCell" style="width:25mm;height:7.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:7.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:7.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:7.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-top:0mm;"/>
                <td class="styLNDesc" colspan="2" style="width:45mm;height:4.5mm;padding-top:0mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                </td>
                <td class="styLNLeftNumBox" style="border-width: 0px 0px 1px 1px; border-style: solid; width: 6mm; height: 4.5mm; padding-left: 1.5mm; font-size: 6.5pt;">9a</td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;vertical-align:border-bottom-width:0px;border-left-width: 1px;float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/GamingGrossIncomeAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <!-- 9b -->
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:auto;padding-top:.3mm;padding-left:3mm;">b</td>
                <td class="styLNDesc" colspan="2" style="width:45mm;height:4.5mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                  <span style="">
  Less: direct expenses 
  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">...</span>
                  </span>
                </td>
                <td class="styLNLeftNumBox" style="border-width: 0px 0px 1px 1px; border-style: solid; width: 6mm; height: 4.5mm; padding-left: 1.5mm; font-size: 6.5pt;">9b</td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;vertical-align:bottom;border-left-width: 1px;float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/GamingDirectExpensesAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <!-- 9c -->
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-top:.3mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-left:.5mm;">
                  <span style="width:2.5mm;"/>c</td>
                <td class="styGenericDiv" colspan="3" style="width:72mm;height:4.5mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                  <span class="styNormalText" style="">Net income or (loss) from gaming activities</span>
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">..</span>
                  <span style="float:right;padding-right:.5mm;padding-top:1mm;">
                    <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                  </span>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-right-width: 1px;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/NetIncomeFromGamingGrp/TotalRevenueColumnAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/NetIncomeFromGamingGrp/RelatedOrExemptFuncIncomeAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/NetIncomeFromGamingGrp/UnrelatedBusinessRevenueAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/NetIncomeFromGamingGrp/ExclusionAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- 10a -->
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:7.5mm;padding-top:4mm;padding-left:0mm;">10a</td>
                <td class="styLNDesc" colspan="2" style="width:45mm;height:7.5mm;padding-top:4mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
  Gross sales of inventory, less<br/>returns and allowances 
  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">..</span>
                </td>
                <td class="styLNLeftNumBox" style="border-width: 1px 0px 0px 1px; border-style: solid; width: 6mm; height: 7.5mm; padding-left: 0.5mm; font-size: 6.5pt;"></td>
            <td class="styTableCell" style="width:25mm;height:7.5mm;border-left-width:1px;border-top-width:1px;border-bottom-width:0px;text-align:center;font-size:7pt;float:right;"></td>
                <td class="styTableCell" style="width:25mm;height:7.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:7.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:7.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:7.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-top:0mm;"/>
                <td class="styLNDesc" colspan="2" style="width:45mm;height:4.5mm;padding-top:0mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                </td>
                <td class="styLNLeftNumBox" style="border-width: 0px 0px 1px 1px; border-style: solid; width: 6mm; height: 4.5mm; padding-left: 0.5mm; font-size: 6.5pt;">10a</td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;vertical-align:border-bottom-width:0px;border-left-width: 1px;float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/GrossSalesOfInventoryAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <!-- 10b -->
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:4.5mm;padding-top:.3mm;padding-left:3mm;">b</td>
                <td class="styLNDesc" colspan="2" style="width:45mm;height:4.5mm; border: 0px solid black;">
                  <span>
  Less: cost of goods sold 
  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">..</span>
                  </span>
                </td>
                <td class="styLNLeftNumBox" style="border-width: 0px 0px 1px 1px; border-style: solid; width: 6mm; height: 4.5mm; padding-left: 0.5mm; font-size: 6.5pt;">10b</td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;vertical-align:bottom;border-left-width: 1px;float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/CostOfGoodsSoldAmt"/>
                  </xsl:call-template>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;background-color:lightgrey;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <!-- 10c -->
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:auto;padding-top:1mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;padding-left:.5mm;">
                  <span style="width:2.5mm; "/>c</td>
                <td class="styGenericDiv" colspan="3" style="width:72mm;height:auto;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                  <span class="styNormalText" style="padding-top:1mm;">Net income or (loss) from sales of inventory</span>
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">..</span>
                  <span style="float:right;padding-right:.5mm;padding-top:1mm;">
                    <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                  </span>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/NetIncomeOrLossGrp/TotalRevenueColumnAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/NetIncomeOrLossGrp/RelatedOrExemptFuncIncomeAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-bottom-width:0px;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/NetIncomeOrLossGrp/UnrelatedBusinessRevenueAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-style: solid;border-right-width: 0px;border-bottom-width:0px;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/NetIncomeOrLossGrp/ExclusionAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styTableCell" colspan="3" style="width:25mm;height:4.5mm;text-align:center;float:right;border-style: solid; border-color: black;border-top-width: 1px;border-right-width: 1px;">Business Code</td>
                <td class="styTableCell" style="width:56mm;height:4.5mm;text-align:center;float:right;border-style: solid; border-color: black;border-top-width: 1px;">Miscellaneous Revenue</td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;border-bottom-width:0px;border-top-width:1px;background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;border-top-width:1px;border-bottom-width:0px;background-color:lightgrey">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;border-top-width:1px;border-bottom-width:0px;background-color:lightgrey">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;border-top-width:1px;border-bottom-width:0px;background-color:lightgrey;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                </td>
              </tr>
              <!-- 11a -->
             <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:auto;padding-top:.1mm;">11a</td>
                <td class="styGenericDiv" colspan="2" style="width:51mm;height:10.5mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                  <span style="width:51mm;height:10.5mm;padding-top:.5mm;padding-left:1mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form990Data/OtherRevenueMiscGrp[1]/Desc"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </span>
                </td>
                <td class="styTableCell" style="width:25mm;height:10.5mm;font-size:6pt;float:right;border-style: solid; border-color: black;border-right-width: 1px;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OtherRevenueMiscGrp[1]/BusinessCd"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                   <xsl:with-param name="TargetNode" select="$Form990Data/OtherRevenueMiscGrp[1]/TotalRevenueColumnAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990Data/OtherRevenueMiscGrp[1]/RelatedOrExemptFuncIncomeAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OtherRevenueMiscGrp[1]/UnrelatedBusinessRevenueAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OtherRevenueMiscGrp[1]/ExclusionAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- 11b -->
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:auto;padding-top:.3mm;padding-left:3mm;">b</td>
                <td class="styGenericDiv" colspan="2" style="width:51mm;height:10.5mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                  <span style="width:51mm;height:10.5mm;padding-top:.5mm;padding-left:.5mm;border-style: solid; border-color: black;border-top-width: 1px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form990Data/OtherRevenueMiscGrp[2]/Desc"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </span>
                </td>
                 <td class="styTableCell" style="width:25mm;height:10.5mm;font-size:6pt;float:right;border-style: solid; border-color: black;border-right-width: 1px;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OtherRevenueMiscGrp[2]/BusinessCd"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OtherRevenueMiscGrp[2]/TotalRevenueColumnAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OtherRevenueMiscGrp[2]/RelatedOrExemptFuncIncomeAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OtherRevenueMiscGrp[2]/UnrelatedBusinessRevenueAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OtherRevenueMiscGrp[2]/ExclusionAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- 11c -->
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:auto;padding-top:.3mm;padding-left:3mm;">c</td>
                <td class="styGenericDiv" colspan="2" style="width:51mm;height:10.5mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">
                  <span style="width:51mm;height:10.5mm;padding-top:.5mm;padding-left:.5mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form990Data/OtherRevenueMiscGrp[3]/Desc"/>
                    </xsl:call-template>
                    <span class="styTableCellPad"/>
                  </span>
                </td>
                <td class="styTableCell" style="width:25mm;height:10.5mm;font-size:6pt;float:right;border-style: solid; border-color: black;border-right-width: 1px;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OtherRevenueMiscGrp[3]/BusinessCd"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OtherRevenueMiscGrp[3]/TotalRevenueColumnAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OtherRevenueMiscGrp[3]/RelatedOrExemptFuncIncomeAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OtherRevenueMiscGrp[3]/UnrelatedBusinessRevenueAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OtherRevenueMiscGrp[3]/ExclusionAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- 11d -->
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:auto;padding-top:.3mm;padding-left:3mm;">d</td>
                <td class="styGenericDiv" colspan="2" style="width:51mm;height:4.5mm;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 1px;">All other revenue
<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">....</span>
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;float:right;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/MiscellaneousRevenueGrp/TotalRevenueColumnAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/MiscellaneousRevenueGrp/RelatedOrExemptFuncIncomeAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/MiscellaneousRevenueGrp/UnrelatedBusinessRevenueAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/MiscellaneousRevenueGrp/ExclusionAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <!-- 11e -->
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:auto;padding-top:.3mm;padding-left:.5mm;border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
                  <span style="width:2.5mm;"/>e</td>
                <td class="styLNDesc" colspan="3" style="width:75mm;height:auto;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                  <span class="styBoldText" style="">Total.</span> Add lines 11a–11d
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">......
                  <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/></span>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt; padding-top:3mm;border-style: solid; border-color: black;border-left-width: 1px;">
                  <span class="styTableCellPad"/>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OtherRevenueTotalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm; background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm; background-color:lightgrey;">
                  <span class="styTableCellPad"/>
                </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm; background-color:lightgrey;border-style: solid;border-right-width: 0px;">
                  <span class="styTableCellPad"/>
                </td>
              </tr>
           
              <tr>
                <td class="styLNLeftNumBox" style="width:5mm;height:auto;padding-top:.3mm;">12</td>
                <td class="styLNDesc" colspan="3" style="width:72mm;height:auto;border-style: solid; border-color: black;border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">
                  <span class="styNormalText" style=""><b>Total revenue.</b> See instructions</span>
                <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.....</span>
                 <span style="float:right;padding-top:1mm;">
                    <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                  </span>
              <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt; padding-top:3mm;border-left-width: 1px;">
                    <span class="styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/TotalRevenueGrp/TotalRevenueColumnAmt"/>
                    </xsl:call-template>
                  </td>
                <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt; padding-top:3mm;">
                    <span class="styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/TotalRevenueGrp/RelatedOrExemptFuncIncomeAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt; padding-top:3mm;">
                    <span class="styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/TotalRevenueGrp/UnrelatedBusinessRevenueAmt"/>
                    </xsl:call-template>
                  </td>
                  <td class="styTableCell" style="width:25mm;height:4.5mm;font-size:6pt; padding-top:3mm;border-style: solid;border-right-width: 0px;">
                    <span class="styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990Data/TotalRevenueGrp/ExclusionAmt"/>
                    </xsl:call-template>
                  </td>
                </td>
              </tr>
            
				</tbody>
																			
          </table>
					<!--  End Part VIII Table  -->
					<!-- End Part VIII-->
          <!-- Footer -->
       <!--@@@@@@@@@@@@@@@@NEW PART VIII ABOVE@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
       
       <!--@@@@@@@@@@@@@@@@OLD PART VIII@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
     
          <!-- Footer -->
          <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->   
            <div style="width:187mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 0px" class="pageEnd">
              <div class="styGenericDiv" style="width:105mm;"/>
              <div class="styGenericDiv" style="width:25mm;"/>
              <div class="styGenericDiv" style="float:right;">Form <span class="styBoldText">990</span> (2020)</div>
            </div>
          
          <!-- header -->
          <div style="width:187mm;clear:both;padding-bottom:.5mm;float:none;clear:both;" class="styBB">
            <div style="width:90mm;" class="styGenericDiv">Form 990 (2020)</div>
            <div style="width:55mm;text-align:center;" class="styGenericDiv"/>
            <div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">10</span>
            </div>
          </div>
          <!-- Begin Part IX-->
          <!--   BEGIN Part IX Title -->
          <div class="styBB" style="width:187mm;float:none;">
            <div class="styPartName" style="float:left;width:14mm;height:auto;border-color: black; border-bottom-style: solid; border-bottom-width: 1px;"><span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IX</span></div>
            <div class="styPartDesc" style="width:173mm;height:auto;border-color: black; border-bottom-style: solid;border-top-width: 1px;border-bottom-width: 1px;">Statement of Functional Expenses</div>
            <span style="width:187mm;font-size: 7pt; float:left;height:auto;border-color: black; border-bottom-width: 1px;padding-left:17mm;">Section 501(c)(3) and 501(c)(4) organizations must complete all columns. All other organizations must complete column (A).</span>
            
            <span style="width:187mm;font-size: 7pt; float:left; padding-left:17mm;padding-top:0mm;height:auto; border-color: black; border-bottom-width: 1px;border-top-width: 1px">Check if Schedule O contains a response or note to any line in this <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IX</span>
               <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..............</span>
<input type="checkbox" class="styCkbox" alt="InfoInScheduleOPartIXInd">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InfoInScheduleOPartIXInd"/>
                    <xsl:with-param name="BackupName">IRS990InfoInScheduleOPartIXInd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
    <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$Form990Data/InfoInScheduleOPartIXInd"/>
        <xsl:with-param name="BackupName">IRS990InfoInScheduleOPartIXInd</xsl:with-param>
    </xsl:call-template>
 </label>
        </span>
             </div>
          <!-- END Part IX Title -->
          <!-- Begin Part IX Table-->
          <table class="styTable" style="font-size:7pt;width:187mm;border-style: solid; border-color: black" cellspacing="0">
            <thead>
              <tr>
                <th scope="col" colspan="2" align="center" style="width:83mm;height:auto;padding-top:0mm; border-bottom-width: 1px; border-bottom-style: solid;border-top-width: 1px;">
                  <span class="styBoldText" style="float:left;font-size:7pt;font-weight:bold;padding-left:.5mm;height:auto;border-bottom-width: 1px; border-top-width: 1px;">Do not include amounts reported on lines 6b,</span>
                  <br/>
                  <span class="styBoldText" style="float:left;font-size:7pt;font-weight:bold;height:auto;border-top-width: 1px;border-bottom-width: 1px;">7b, 8b, 9b, and 10b of <span style="font-family: Arial, Helvetica, sans-serif; font-weight: bold; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VIII</span>.</span>
                </th>
                
                <th scope="col" align="center" style="height:auto;width:26mm;font-size:6pt;border-left:1px solid black; border-bottom:1px solid black;float:none;">
            (A) <br/>
                  <span class="styNormalText"> Total expenses</span>
                </th>
                <th scope="col" align="center" style="height:auto;width:26mm;font-size:6pt;border-left:1px solid black; border-bottom:1px solid black;float:none;">
            (B)<br/>
                  <span class="styNormalText"> Program service </span>
                  <span class="styNormalText"> expenses </span>
                </th>
                <th scope="col" align="center" style="height:auto;width:26mm;font-size:6pt;border-left:1px solid black; border-bottom:1px solid black;float:none;">
            (C)<br/>
                  <span class="styNormalText"> Management and </span>
                  <span class="styNormalText"> general expenses</span>
                </th>
                <th scope="col" align="center" style="height:auto;width:26mm;font-size:6pt;border-left:1px solid black; border-bottom:1px solid black;float:none;">
            (D)<br/>
                  <span class="styNormalText"> Fundraising </span><br/>
                  <span class="styNormalText"> expenses</span>
                </th>
              </tr>
            </thead>
          </table>
											
          
          
            <table class="styTable" style="font-size:7pt;width:187mm;" cellspacing="0">
             
             <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;padding-left:3mm;">1</td>
                <td class="styLNDesc" style="float:left;width:77mm;height:auto;">
         Grants and other assistance to domestic organizations and domestic governments. See <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IV</span>, line 21
         <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">....</span>
        <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form990Data/GrantsToDomesticOrgsGrp"/>
                  </xsl:call-template>
                </td>
               <td class="styLNAmountBoxSmall" style="width:26mm;height:7.5mm;vertical-align:bottom;padding-right:0.75mm;float:left">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/GrantsToDomesticOrgsGrp/TotalAmt"/>
                  </xsl:call-template>
                </td>
              <td class="styLNAmountBoxSmall" style="width:26mm;height:7.5mm;vertical-align:bottom;padding-right:0.75mm;float:left">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/GrantsToDomesticOrgsGrp/ProgramServicesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styShadingCell" style="width:26mm;height:7.5mm;border-bottom:1px solid black;float:left">
                  <span style="width:1px"/>
                </td>
                <td class="styShadingCell" style="width:26mm;height:7.5mm;border-bottom:1px solid black;float:left">
                  <span style="width:1px"/>
                </td>
              </tr>
                 <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;padding-left:3mm;">2</td>
                <td class="styLNDesc" style="float:left;width:77mm;height:auto;">
          Grants and other assistance to domestic individuals. See <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IV</span>, line 22 
          <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">...........</span>
        <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form990Data/GrantsToDomesticIndividualsGrp"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:9mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/GrantsToDomesticIndividualsGrp/TotalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:9mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/GrantsToDomesticIndividualsGrp/ProgramServicesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styShadingCell" style="width:26mm;height:9mm;border-bottom:1px solid black;">
                  <span style="width:1px"/>
                </td>
                <td class="styShadingCell" style="width:26mm;height:9mm;border-bottom:1px solid black;">
                  <span style="width:1px"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;padding-left:3mm;">3</td>
                <td class="styLNDesc" style="width:77mm;height:auto;">
                  
          Grants and other assistance to foreign organizations, foreign governments, and foreign individuals. See <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IV</span>, lines 15 and 16.  
<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.............</span>     
      
                  <span style="width:1px"/>
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form990Data/ForeignGrantsGrp"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:10.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/ForeignGrantsGrp/TotalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:10.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/ForeignGrantsGrp/ProgramServicesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styShadingCell" style="width:26mm;height:10.5mm;border-bottom:1px solid black;">
                  <span style="width:1px"/>
                </td>
                <td class="styShadingCell" style="width:26mm;height:10.5mm;border-bottom:1px solid black;">
                  <span style="width:1px"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;padding-left:3mm;">4</td>
                <td class="styLNDesc" style="width:77mm;height:auto;">
       Benefits paid to or for members
       <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:1mm">.......</span>
        <span style="width:1px"/>
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form990Data/BenefitsToMembersGrp"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/BenefitsToMembersGrp/TotalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/BenefitsToMembersGrp/ProgramServicesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styShadingCell" style="width:26mm;height:4.5mm; border-bottom:1px solid black">
                  <span style="width:1px"/>
                </td>
                <td class="styShadingCell" style="width:26mm;height:4.5mm; border-bottom:1px solid black">
                  <span style="width:1px"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;padding-left:3mm;">5</td>
                <td class="styLNDesc" style="width:77mm;height:auto;">
       Compensation of current officers, directors,
trustees, and key employees
        <span style="width:1px"/>
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form990Data/CompCurrentOfcrDirectorsGrp"/>
                  </xsl:call-template>
                  
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">...........</span>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:7.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/CompCurrentOfcrDirectorsGrp/TotalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:7.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/CompCurrentOfcrDirectorsGrp/ProgramServicesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:7.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/CompCurrentOfcrDirectorsGrp/ManagementAndGeneralAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:7.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/CompCurrentOfcrDirectorsGrp/FundraisingAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;padding-left:3mm;">6</td>
                <td class="styLNDesc" style="width:77mm;height:auto;">
      Compensation not included above, to disqualified persons (as defined under section 4958(f)(1)) and persons described in section 4958(c)(3)(B)
        <span style="width:1px"/>
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form990Data/CompDisqualPersonsGrp"/>
                  </xsl:call-template>
                 
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.........</span>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:10.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/CompDisqualPersonsGrp/TotalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:10.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/CompDisqualPersonsGrp/ProgramServicesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:10.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/CompDisqualPersonsGrp/ManagementAndGeneralAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:10.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/CompDisqualPersonsGrp/FundraisingAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;padding-left:3mm;">7</td>
                <td class="styLNDesc" style="width:77mm;height:auto;">
       Other salaries and wages<span style="width:1px"/>
       <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">........</span>
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OtherSalariesAndWagesGrp"/>
                  </xsl:call-template>
                 
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"/>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OtherSalariesAndWagesGrp/TotalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OtherSalariesAndWagesGrp/ProgramServicesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OtherSalariesAndWagesGrp/ManagementAndGeneralAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OtherSalariesAndWagesGrp/FundraisingAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;padding-left:3mm;">8</td>
                <td class="styLNDesc" style="width:77mm;height:auto;">
      Pension plan accruals and contributions (include section 401(k) and 403(b) employer contributions)
        
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">....</span>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:7.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PensionPlanContributionsGrp/TotalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:7.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PensionPlanContributionsGrp/ProgramServicesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:7.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PensionPlanContributionsGrp/ManagementAndGeneralAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:7.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PensionPlanContributionsGrp/FundraisingAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;padding-left:3mm;">9</td>
                <td class="styLNDesc" style="width:77mm;height:auto;">
   Other employee benefits  
                             
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.......</span>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OtherEmployeeBenefitsGrp/TotalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OtherEmployeeBenefitsGrp/ProgramServicesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OtherEmployeeBenefitsGrp/ManagementAndGeneralAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OtherEmployeeBenefitsGrp/FundraisingAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;">10</td>
                <td class="styLNDesc" style="width:77mm;height:auto;">
        Payroll taxes
               
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">...........</span>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PayrollTaxesGrp/TotalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PayrollTaxesGrp/ProgramServicesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PayrollTaxesGrp/ManagementAndGeneralAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PayrollTaxesGrp/FundraisingAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;">11</td>
                <td class="styLNDesc" style="width:77mm;height:auto;">
        Fees for services (non-employees):
       </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/NODATA"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data//NODATA"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data//NODATA"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data//NODATA"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;padding-left:4mm;">a</td>
                <td class="styLNDesc" style="width:77mm;height:auto;">
        Management
       
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">......</span>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/FeesForServicesManagementGrp/TotalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/FeesForServicesManagementGrp/ProgramServicesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/FeesForServicesManagementGrp/ManagementAndGeneralAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/FeesForServicesManagementGrp/FundraisingAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;padding-left:4mm;">b</td>
                <td class="styLNDesc" style="width:77mm;height:auto;">
        Legal
        
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.........</span>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/FeesForServicesLegalGrp/TotalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/FeesForServicesLegalGrp/ProgramServicesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/FeesForServicesLegalGrp/ManagementAndGeneralAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/FeesForServicesLegalGrp/FundraisingAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;padding-left:4mm;">c</td>
                <td class="styLNDesc" style="width:77mm;height:auto;">
        Accounting
        
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">...........</span>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/FeesForServicesAccountingGrp/TotalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/FeesForServicesAccountingGrp/ProgramServicesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/FeesForServicesAccountingGrp/ManagementAndGeneralAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/FeesForServicesAccountingGrp/FundraisingAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;padding-left:4mm;">d</td>
                <td class="styLNDesc" style="width:77mm;height:auto;">
        Lobbying
        
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">...........</span>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/FeesForServicesLobbyingGrp/TotalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/FeesForServicesLobbyingGrp/ProgramServicesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/FeesForServicesLobbyingGrp/ManagementAndGeneralAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/FeesForServicesLobbyingGrp/FundraisingAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;padding-left:4mm;">e</td>
                <td class="styLNDesc" style="width:77mm;height:auto;">
        Professional fundraising services. <span class="styNormalText">See <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IV</span>, line 17</span>
                  
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"/>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/FeesForServicesProfFundraising/TotalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styShadingCell" style="width:26mm;height:4.5mm; border-bottom:1 solid black">
                  <span style="width:1px"/>
                </td>
                <td class="styShadingCell" style="width:26mm;height:4.5mm; border-bottom:1 solid black">
                  <span style="width:1px"/>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/FeesForServicesProfFundraising/FundraisingAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;padding-left:4mm;">f</td>
                <td class="styLNDesc" style="width:77mm;height:auto;">
        Investment management fees
       
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">......</span>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/FeesForSrvcInvstMgmntFeesGrp/TotalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/FeesForSrvcInvstMgmntFeesGrp/ProgramServicesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/FeesForSrvcInvstMgmntFeesGrp/ManagementAndGeneralAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/FeesForSrvcInvstMgmntFeesGrp/FundraisingAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;padding-left:4mm;">g</td>
                <td class="styLNDesc" style="width:77mm;height:auto;">
        Other (If line 11g amount exceeds 10% of line 25, column (A) amount, list line 11g expenses on Schedule O)
        
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"></span>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:7.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/FeesForServicesOtherGrp/TotalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:7.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/FeesForServicesOtherGrp/ProgramServicesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:7.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/FeesForServicesOtherGrp/ManagementAndGeneralAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:7.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/FeesForServicesOtherGrp/FundraisingAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;">12</td>
                <td class="styLNDesc" style="width:77mm;height:auto;">
        Advertising and promotion
               
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">....</span>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/AdvertisingGrp/TotalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/AdvertisingGrp/ProgramServicesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/AdvertisingGrp/ManagementAndGeneralAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/AdvertisingGrp/FundraisingAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;">13</td>
                <td class="styLNDesc" style="width:77mm;height:auto;">
        Office expenses
               
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.......</span>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OfficeExpensesGrp/TotalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OfficeExpensesGrp/ProgramServicesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OfficeExpensesGrp/ManagementAndGeneralAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OfficeExpensesGrp/FundraisingAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;">14</td>
                <td class="styLNDesc" style="width:77mm;height:auto;">
        Information technology
               
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">......</span>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InformationTechnologyGrp/TotalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InformationTechnologyGrp/ProgramServicesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InformationTechnologyGrp/ManagementAndGeneralAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InformationTechnologyGrp/FundraisingAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;">15</td>
                <td class="styLNDesc" style="width:77mm;height:auto;">
        Royalties
               
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">..</span>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/RoyaltiesGrp/TotalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/RoyaltiesGrp/ProgramServicesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/RoyaltiesGrp/ManagementAndGeneralAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/RoyaltiesGrp/FundraisingAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;">16</td>
                <td class="styLNDesc" style="width:77mm;height:auto;">
        Occupancy    
            
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">...........</span>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OccupancyGrp/TotalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OccupancyGrp/ProgramServicesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OccupancyGrp/ManagementAndGeneralAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OccupancyGrp/FundraisingAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;">17</td>
                <td class="styLNDesc" style="width:77mm;height:auto;">
        Travel
        
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">............</span>
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TravelGrp"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TravelGrp/TotalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TravelGrp/ProgramServicesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TravelGrp/ManagementAndGeneralAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TravelGrp/FundraisingAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;">18</td>
                <td class="styLNDesc" style="width:77mm;height:auto;">
        Payments of travel or entertainment expenses for any federal, state, or local public officials
       
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.</span>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:7.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PymtTravelEntrtnmntPubOfclGrp/TotalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:7.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PymtTravelEntrtnmntPubOfclGrp/ProgramServicesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:7.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PymtTravelEntrtnmntPubOfclGrp/ManagementAndGeneralAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:7.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PymtTravelEntrtnmntPubOfclGrp/FundraisingAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;">19</td>
                <td class="styLNDesc" style="width:77mm;height:auto;">
        Conferences, conventions, and meetings
                
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">....</span>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/ConferencesMeetingsGrp/TotalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/ConferencesMeetingsGrp/ProgramServicesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/ConferencesMeetingsGrp/ManagementAndGeneralAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/ConferencesMeetingsGrp/FundraisingAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;">20</td>
                <td class="styLNDesc" style="width:77mm;height:auto;">
       Interest
            
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">...........</span>
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InterestGrp"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InterestGrp/TotalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InterestGrp/ProgramServicesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InterestGrp/ManagementAndGeneralAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InterestGrp/FundraisingAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;">21</td>
                <td class="styLNDesc" style="width:77mm;height:auto;">
       Payments to affiliates
                    
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.......</span>
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PaymentsToAffiliatesGrp"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PaymentsToAffiliatesGrp/TotalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PaymentsToAffiliatesGrp/ProgramServicesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PaymentsToAffiliatesGrp/ManagementAndGeneralAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PaymentsToAffiliatesGrp/FundraisingAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;">22</td>
                <td class="styLNDesc" style="width:77mm;height:auto;">
       Depreciation, depletion, and amortization
                     
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">..</span>
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form990Data/DepreciationDepletionGrp"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/DepreciationDepletionGrp/TotalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/DepreciationDepletionGrp/ProgramServicesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/DepreciationDepletionGrp/ManagementAndGeneralAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/DepreciationDepletionGrp/FundraisingAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;">23</td>
                <td class="styLNDesc" style="width:77mm;height:auto;">
        Insurance
                                  
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">...</span>
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InsuranceGrp"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InsuranceGrp/TotalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InsuranceGrp/ProgramServicesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InsuranceGrp/ManagementAndGeneralAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InsuranceGrp/FundraisingAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
             <tr>
								<td class="styLNLeftNumBox" style="width:6mm;height:auto;">24</td>
								<td class="styLNDesc" style="width:77mm;height:auto;">
        Other expenses. Itemize expenses not covered above (List miscellaneous expenses in line 24e. If line 24e amount exceeds 10% of line 25, column (A) amount, list line 24e expenses on Schedule O.)       
 <xsl:call-template name="SetFormLinkInline">
										<xsl:with-param name="TargetNode" select="$Form990Data/OtherExpensesGrp"/>
									</xsl:call-template>
								</td>
								<td class="styShadingCell" style="width:26mm;height:13mm; border-bottom:1px solid black">
									<span style="width:1px"/>
								</td>
								<td class="styShadingCell" style="width:26mm;height:13mm; border-bottom:1px solid black">
									<span style="width:1px"/>
								</td>
								<td class="styShadingCell" style="width:26mm;height:13mm; border-bottom:1px solid black">
									<span style="width:1px"/>
								</td>
								<td class="styShadingCell" style="width:26mm;height:13mm; border-bottom:1px solid black">
									<span style="width:1px"/>
								</td>
							</tr>
							<xsl:for-each select="$Form990Data/OtherExpensesGrp">
								<xsl:if test="($Print != $Separated) or (count($Form990Data/OtherExpensesGrp) &lt;= 6) ">
									<tr>
										<td class="styLNLeftLtrBoxDD" style="width:3mm;height:4.5mm;">
											<xsl:choose>
												<xsl:when test="position() = 1">
													<span class="styBoldText">a</span>
												</xsl:when>
												<xsl:when test="position() = 2">
													<span class="styBoldText">b</span>
												</xsl:when>
												<xsl:when test="position() = 3">
													<span class="styBoldText">c</span>
												</xsl:when>
												<xsl:when test="position() = 4">
													<span class="styBoldText">d</span>
												</xsl:when>
											</xsl:choose>
										</td>
										<td class="styIRS990LNAmountBoxNLB" style="width:77.7mm;height:7.5mm;text-align:left;padding-left:3mm;">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="Desc"/>
											</xsl:call-template>
										</td>
										<td class="styLNAmountBoxSmall" style="width:26mm;height:7.5mm;vertical-align:bottom;padding-right:0.75mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="TotalAmt"/>
											</xsl:call-template>
										</td>
										<td class="styLNAmountBoxSmall" style="width:26mm;height:7.5mm;vertical-align:bottom;padding-right:0.75mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ProgramServicesAmt"/>
											</xsl:call-template>
										</td>
										<td class="styLNAmountBoxSmall" style="width:26mm;height:7.5mm;vertical-align:bottom;padding-right:0.75mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="ManagementAndGeneralAmt"/>
											</xsl:call-template>
										</td>
										<td class="styLNAmountBoxSmall" style="width:26mm;height:7.5mm;vertical-align:bottom;padding-right:0.75mm;">
											<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="FundraisingAmt"/>
											</xsl:call-template>
										</td>
									</tr>
								</xsl:if>
							</xsl:for-each>
							<xsl:if test="(count($Form990Data/OtherExpensesGrp) &lt; 1) or (($Print = $Separated) and (count($Form990Data/OtherExpensesGrp) &gt; 6))">
								<tr>
									<td class="styLNLeftLtrBoxDD" style="width:3mm;height:4.5mm;">
										<span class="styBoldText">a</span>
									</td>
									<td class="styIRS990LNAmountBoxNLB" style="width:77.7mm;height:4.5mm;text-align:left;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="(count($Form990Data/OtherExpensesGrp) &lt; 2) or (($Print = $Separated) and (count($Form990Data/OtherExpensesGrp) &gt; 6))">
								<tr>
									<td class="styLNLeftLtrBoxDD" style="width:3mm;height:4.5mm;">
										<span class="styBoldText">b</span>
									</td>
									<td class="styIRS990LNAmountBoxNLB" style="width:77.7mm;height:4.5mm;text-align:left;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="(count($Form990Data/OtherExpensesGrp) &lt; 3) or (($Print = $Separated) and (count($Form990Data/OtherExpensesGrp) &gt; 6))">
								<tr>
									<td class="styLNLeftLtrBoxDD" style="width:3mm;height:4.5mm;">
										<span class="styBoldText">c</span>
									</td>
									<td class="styIRS990LNAmountBoxNLB" style="width:77.7mm;height:4.5mm;text-align:left;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:if test="(count($Form990Data/OtherExpensesGrp) &lt; 4) or (($Print = $Separated) and (count($Form990Data/OtherExpensesGrp) &gt; 6))">
								<tr>
									<td class="styLNLeftLtrBoxDD" style="width:3mm;height:4.5mm;">
										<span class="styBoldText">d</span>
									</td>
									<td class="styIRS990LNAmountBoxNLB" style="width:77.7mm;height:4.5mm;text-align:left;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
										<span class="styTableCellPad"/>
									</td>
									<td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
										<span class="styTableCellPad"/>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td class="styLNLeftLtrBoxDD" style="width:2mm;height:auto;">
									<span class="styBoldText">e</span>
								</td>
								<td class="styIRS990LNAmountBoxNLB" style="width:77.7mm;height:auto;text-align:left;padding-left:3mm;">All other expenses
</td>
								<td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form990Data/AllOtherExpensesGrp/TotalAmt"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form990Data/AllOtherExpensesGrp/ProgramServicesAmt"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form990Data/AllOtherExpensesGrp/ManagementAndGeneralAmt"/>
									</xsl:call-template>
								</td>
								<td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$Form990Data/AllOtherExpensesGrp/FundraisingAmt"/>
									</xsl:call-template>
								</td>
							</tr>
            
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;">25</td>
                <td class="styIRS990LNDescBB" style="width:77mm;height:auto;font-size:7pt;padding-bottom:3;">
                  <b>Total functional expenses.</b> Add lines 1 through 24e
     </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TotalFunctionalExpensesGrp/TotalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TotalFunctionalExpensesGrp/ProgramServicesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TotalFunctionalExpensesGrp/ManagementAndGeneralAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:4.5mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TotalFunctionalExpensesGrp/FundraisingAmt"/>
                  </xsl:call-template>
                </td>
                
              </tr>
              
              <tr>
                <td class="styLNLeftNumBox" style="width:6mm;height:auto;">26</td>
                <td class="styIRS990LNDescBB" style="width:77mm;height:15mm;font-size:7pt;padding-bottom:0;">
                  <span class="styBoldText">Joint costs. </span>
                  Complete this line only if the organization reported in column (B) joint costs from a combined educational campaign and fundraising solicitation.<span class="styNormalText"> 
                  
                  
                  Check here <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                  </span>
                  <span style="width:6px;"/>
                  <input type="checkbox" class="styCkbox" alt="JointCostsInd">
                    <xsl:call-template name="PopulateCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form990Data/JointCostsInd"/>
                      <xsl:with-param name="BackupName">IRS990JointCostsInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                  <label style="float: right; clear: none;">
    <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$Form990Data/JointCostsInd"/>
        <xsl:with-param name="BackupName">IRS990JointCostsInd</xsl:with-param>
    </xsl:call-template>
 </label>

  if  following SOP 98-2 (ASC 958-720). 
     </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:15mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TotalJointCostsGrp/TotalAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:15mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TotalJointCostsGrp/ProgramServicesAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:15mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TotalJointCostsGrp/ManagementAndGeneralAmt"/>
                  </xsl:call-template>
                </td>
                <td class="styLNAmountBoxSmall" style="width:26mm;height:15mm;vertical-align:bottom;padding-right:0.75mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TotalJointCostsGrp/FundraisingAmt"/>
                  </xsl:call-template>
                </td>
               
              </tr>
            
          </table>
          <!-- End Part IX Table-->
          <!-- End Part IX-->
          <!-- Footer -->
          <div style="width:187mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 0px" class="pageEnd">
            <div class="styGenericDiv" style="width:105mm;"/>
            <div class="styGenericDiv" style="width:25mm;"/>
            <div class="styGenericDiv" style="float:right;">Form <span class="styBoldText">990</span> (2020)</div>
          </div>
          <!-- header -->
          <div style="width:187mm;clear:both;padding-bottom:.5mm;float:none;clear:both;" class="styBB">
            <div style="width:90mm;" class="styGenericDiv">Form 990 (2020)</div>
            <div style="width:55mm;text-align:center;" class="styGenericDiv"/>
            <div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">11</span>
            </div>
          </div>
          <!-- Begin Part X Table-->
          <div class="styBB" style="width:187mm;float:none;">
            <div class="styPartName" style="float:left;width:14mm;height:auto;"><span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part X</span></div>
            <div class="styPartDesc" style="width:70mm;height:auto;">Balance Sheet</div>
            <span style="width:187mm;font-size: 7pt; float:left; padding-left:15mm;padding-top:1mm;height:auto; border-color: black; border-bottom-width: 1px;border-top-width: 1px">Check if Schedule O contains a response or note to any line in this <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IX</span>
               <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..............</span>
<input type="checkbox" class="styCkbox" alt="InfoInScheduleOPartXInd">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InfoInScheduleOPartXInd"/>
                    <xsl:with-param name="BackupName">IRS990InfoInScheduleOPartXInd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
    <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$Form990Data/InfoInScheduleOPartXInd"/>
        <xsl:with-param name="BackupName">IRS990InfoInScheduleOPartXInd</xsl:with-param>
    </xsl:call-template>
 </label>
              </span>
      </div>
                
            <table class="styTable" style="font-size:7pt;width:187mm;" cellspacing="0">
            <thead>
               <tr>
                <td class="styLNLeftNumBox" style="height:7.5mm;padding-left:4mm;border-bottom:1px"></td>
                <td class="styLNDesc" style="width:106mm;height:7.5mm;" colspan="3"></td>
                <td class="styLNAmountBox" style="text-align:center;height:7.5mm;font-family:'Arial';">
                 <span style="width:1px;"/> <b>(A)</b>
                  <br/>Beginning of year
                </td>
                <td class="styLNRightNumBox" style="height:7.5mm;"></td>
                <td class="styLNAmountBox" style="text-align:center;height:7.5mm;font-family:'Arial';">
                  <span style="width:1px;"/> <b>(B)</b>
                  <br/>End of year
                </td>
                </tr>
             </thead>
          </table>
													
            <table class="styTable" style="font-size:7pt;width:187mm;" cellspacing="0">
           
            <tbody valign="top">
              <!-- Begin Part X Assets Section -->
             <tr>
                 <td class="styIRS990VTImageBox" rowspan="19" valign="middle" style="padding-left:.9mm;border-style: solid; border-color: black;border-top-width: 1px;">
                  <img src="{$ImagePath}/990R_Assets.gif" alt="Assets"/>
              </td>
             <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;border-style: solid; border-color: black;border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;">1</td>
                <td class="styLNDesc" style="width:100.2mm;height:4.5mm;border-style: solid; border-color: black;border-top-width: 1px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;" colspan="3">Cash&#8211;non-interest-bearing
            
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">........</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/CashNonInterestBearingGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">1</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/CashNonInterestBearingGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
               <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">2</td>
                <td class="styLNDesc" style="width:100mm;height:4.5mm;" colspan="3">Savings and temporary cash investments
           
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.........</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/SavingsAndTempCashInvstGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">2</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/SavingsAndTempCashInvstGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">3</td>
                <td class="styLNDesc" style="width:100mm;height:4.5mm;" colspan="3">Pledges and grants receivable, net
                                       
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">......</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PledgesAndGrantsReceivableGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">3</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PledgesAndGrantsReceivableGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">4</td>
                <td class="styLNDesc" style="width:100mm;height:4.5mm;" colspan="3">Accounts receivable, net
           
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.............</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/AccountsReceivableGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">4</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/AccountsReceivableGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              
             <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">5</td>
                <td class="styLNDesc" style="width:100mm;height:4.5mm;" colspan="3">
   Loans and other payables to any current or former officer, director, trustee, key employee, creator or founder, substantial contributor, or 35% controlled entity or family member of any of these persons
   <span style="width:2px;"/>
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.......</span>
                </td>
                  <td class="styShadingCell" style="height:4.5mm;">
                  <span style="width:1px;"/>
                </td>
                <td class="styShadingCell" style="width:8mm;height:4.5mm;">
                  <span style="width:1px;"/>
                </td>
                <td class="styShadingCell" style="height:4.5mm;">
                  <span style="width:1px;"/>
                </td>
                
              </tr>     
            <tr>
                  <td class="styLNLeftNumBox" style="height:1.5mm;"/>
                <td class="styLNDesc" style="width:100mm;height:1.5mm;" colspan="3">
          
                  <span style="width:2px;"/>
                  
                  </td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/ReceivablesFromOfficersEtcGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;vertical-align:bottom;">5</td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <span style="float: left; clear:none">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$Form990Data/ReceivablesFromOfficersEtcGrp"/>
                    </xsl:call-template>
                  </span>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/ReceivablesFromOfficersEtcGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;padding-top:1mm;">6</td>
                <td class="styLNDesc" style="width:100mm;height:4.5mm;padding-top:1mm;" colspan="3">
  Loans and other receivables from other disqualified persons (as defined under section 4958(f)(1)), and persons described in section 4958(c)(3)(B)
  
            <span style="letter-spacing:3.5mm; font-weight:bold; font-size:7pt; ">...</span>
  </td>
                  <td class="styLNAmountBoxNBB" style="height:4.5mm;background-color:lightgrey;">
                  <span style="width:1px;"/>
                </td>
                  <td class="styShadingCell" style="width:8mm;height:4.5mm;">
                  <span style="width:1px;"/>
                </td>
                <td class="styLNAmountBoxNBB" style="height:4.5mm;background-color:lightgrey;">
                  <span style="width:1px;"/>
                </td>
              </tr>   
                 <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;"/>
                <td class="styLNDesc" style="width:100mm;height:4.5mm;" colspan="3">
                 </td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/RcvblFromDisqualifiedPrsnGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;vertical-align:bottom;">6</td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <span style="float: left; clear:none">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$Form990Data/RcvblFromDisqualifiedPrsnGrp"/>
                    </xsl:call-template>
                  </span>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/RcvblFromDisqualifiedPrsnGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">7</td>
                <td class="styLNDesc" style="width:100mm;height:4.5mm;" colspan="3">Notes and loans receivable, net
            
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">...........</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OthNotesLoansReceivableNetGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">7</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OthNotesLoansReceivableNetGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">8</td>
                <td class="styLNDesc" style="width:100mm;height:4.5mm;" colspan="3">Inventories for sale or use
           
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">............</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InventoriesForSaleOrUseGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">8</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InventoriesForSaleOrUseGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:3mm;">9</td>
                <td class="styLNDesc" style="width:100mm;height:4.5mm;" colspan="3">Prepaid expenses and deferred charges
           
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">......</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PrepaidExpensesDefrdChargesGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">9</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PrepaidExpensesDefrdChargesGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:auto;">10a</td>
                <td class="styLNDesc" style="width:60mm;height:auto;">
            Land, buildings, and equipment: cost or other basis. Complete <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VI</span> of Schedule D
          </td>
                <td class="styLNRightNumBox" style="height:7.5mm;padding-top:3mm;">10a</td>
                <td class="styLNAmountBox" style="height:7.5mm;font-family:'Arial';padding-top:3mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/LandBldgEquipCostOrOtherBssAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNAmountBoxNBB" style="height:7.5mm;background-color:lightgrey;">
                  <span style="width:1px;"/>
                </td>
                <td class="styShadingCell" style="width:8mm;height:7.5mm;">
                  <span style="width:1px;"/>
                </td>
                <td class="styLNAmountBoxNBB" style="height:7.5mm;background-color:lightgrey;">
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;padding-left:4mm;">b</td>
                <td class="styLNDesc" style="width:60mm;height:4.5mm;">
            Less: accumulated depreciation 
                  
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"></span>
                  <span style="width:2px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">10b</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';vertical-align:bottom;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/LandBldgEquipAccumDeprecAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/LandBldgEquipBasisNetGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">10c</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';vertical-align:bottom;font-family:'Arial';">
                  <span style="float:left; clear:none">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$Form990Data/LandBldgEquipBasisNetGrp"/>
                    </xsl:call-template>
                  </span>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/LandBldgEquipBasisNetGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">11</td>
                <td class="styLNDesc" style="width:100mm;height:4.5mm;" colspan="3">Investments—publicly traded securities
            
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InvestmentsPubTradedSecGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">11</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InvestmentsPubTradedSecGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">12</td>
                <td class="styLNDesc" style="width:100mm;height:4.5mm;" colspan="3">Investments—other securities. See <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IV</span>, line 11
            
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.....</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InvestmentsOtherSecuritiesGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">12</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InvestmentsOtherSecuritiesGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">13</td>
                <td class="styLNDesc" style="width:100mm;height:4.5mm;" colspan="3">Investments—program-related. See <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IV</span>, line 11
           
 
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">..</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InvestmentsProgramRelatedGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">13</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InvestmentsProgramRelatedGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">14</td>
                <td class="styLNDesc" style="width:100mm;height:4.5mm;" colspan="3">Intangible assets
            
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">...............</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/IntangibleAssetsGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">14</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/IntangibleAssetsGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">15</td>
                <td class="styLNDesc" style="width:100mm;height:4.5mm;" colspan="3">Other assets. See <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IV</span>, line 11
            
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">...........</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OtherAssetsTotalGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">15</td>
                <td class="styLNAmountBox" style="height:4.5mm;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OtherAssetsTotalGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;border-bottom: solid black 1px;">16</td>
                <td class="styLNDesc" style="width:100mm;height:4.5mm;border-bottom: solid black 1px;" colspan="3">
                  <span class="styBoldText">Total assets.</span>
                  <span style="width:1mm;"></span>
                  <span class="styNormalText"> Add lines 1 through 15 (must equal line 33)</span>
                  <span style="width:2px;"/>
                
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">...</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TotalAssetsGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">16</td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <span style="float:left; clear:none">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$Form990Data/TotalAssetsGrp"/>
                    </xsl:call-template>
                  </span>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TotalAssetsGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              </tbody>
              </table>
               <table class="styTable" style="font-size:7pt;width:187mm;" cellspacing="0">
           
            <tbody valign="top">
																
              <tr>
                 <td class="styIRS990VTImageBox" rowspan="11" valign="middle" style="padding-right:0mm;">
                  <img src="{$ImagePath}/990R_Liabilities.gif" alt="Liabilities"/>
                </td>
              <td class="styLNLeftNumBox" style="height:4.5mm;">17</td>
                <td class="styLNDesc" style="width:100.2mm;height:4.5mm;" colspan="3">
            Accounts payable and accrued expenses
            <span style="width:2px;"/>
                 
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.....</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/AccountsPayableAccrExpnssGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">17</td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <span style="float:left; clear:none">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$Form990Data/AccountsPayableAccrExpnssGrp"/>
                    </xsl:call-template>
                  </span>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/AccountsPayableAccrExpnssGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">18</td>
                <td class="styLNDesc" style="width:100.2mm;height:4.5mm;" colspan="3">
            Grants payable
            <span style="width:2px;"/>
                 
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">...</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/GrantsPayableGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">18</td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <span style="float:left; clear:none">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$Form990Data/GrantsPayableGrp"/>
                    </xsl:call-template>
                  </span>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/GrantsPayableGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">19</td>
                <td class="styLNDesc" style="width:100.2mm;height:4.5mm;" colspan="3">
            Deferred revenue
            <span style="width:2px;"/>
                  
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.........</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/DeferredRevenueGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">19</td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <span style="float:left; clear:none">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$Form990Data/DeferredRevenueGrp"/>
                    </xsl:call-template>
                  </span>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/DeferredRevenueGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">20</td>
                <td class="styLNDesc" style="width:100.2mm;height:4.5mm;" colspan="3">
            Tax-exempt bond liabilities
                        <span style="width:2px;"/>
                 
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.........</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TaxExemptBondLiabilitiesGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">20</td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <span style="float:left; clear:none">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$Form990Data/TaxExemptBondLiabilitiesGrp"/>
                    </xsl:call-template>
                  </span>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TaxExemptBondLiabilitiesGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">21</td>
                <td class="styLNDesc" style="width:100.2mm;height:4.5mm;" colspan="3">
            Escrow or custodial account liability. <span class="styNormalText">Complete <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IV</span> of Schedule D</span>
                  <span style="width:2px;"/>
                 
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"></span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/EscrowAccountLiabilityGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">21</td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <span style="float:left; clear:none">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$Form990Data/EscrowAccountLiabilityGrp"/>
                    </xsl:call-template>
                  </span>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/EscrowAccountLiabilityGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:7.5mm;padding-top:1mm;">22</td>
                <td class="styLNDesc" style="width:100.2mm;height:7.5mm;padding-top:1mm;" colspan="3">
            Loans and other payables to any current or former officer, director, trustee, key employee, creator or founder, substantial contributor, or 35% controlled entity or family member of any of these persons <span style="width:2px;"/>
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.........</span>
                </td>
                <td class="styLNAmountBoxNBB" style="height:7.5mm;background-color:lightgrey;">
                  <span style="width:1px;"/>
                </td>
                <td class="styShadingCell" style="width:8mm;height:7.5mm;">
                  <span style="width:1px;"/>
                </td>
                <td class="styLNAmountBoxNBB" style="height:7.5mm;background-color:lightgrey;">
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;"/>
                <td class="styLNDesc" style="width:100.2mm;height:4.5mm;" colspan="3">
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/LoansFromOfficersDirectorsGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">22</td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <span style="float:left; clear:none">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$Form990Data/LoansFromOfficersDirectorsGrp"/>
                    </xsl:call-template>
                  </span>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/LoansFromOfficersDirectorsGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">23</td>
                <td class="styLNDesc" style="width:100.2mm;height:4.5mm;" colspan="3">
            Secured mortgages and notes payable to unrelated third parties
            <span style="width:2px;"/>
                  
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">..</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/MortgNotesPyblScrdInvstPropGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">23</td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <span style="float:left; clear:none">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$Form990Data/MortgNotesPyblScrdInvstPropGrp"/>
                    </xsl:call-template>
                  </span>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/MortgNotesPyblScrdInvstPropGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">24</td>
                <td class="styLNDesc" style="width:100.2mm;height:4.5mm;" colspan="3">Unsecured notes and loans payable to unrelated third parties
            <span style="width:2px;"/>
                 
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">..</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/UnsecuredNotesLoansPayableGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">24</td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <span style="float:left; clear:none">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$Form990Data/UnsecuredNotesLoansPayableGrp"/>
                    </xsl:call-template>
                  </span>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/UnsecuredNotesLoansPayableGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:10mm;padding-top:1mm;">25</td>
                <td class="styLNDesc" style="width:100.2mm;height:10mm;" colspan="3">
            Other liabilities (including federal income tax, payables to related third parties, and other liabilities not included on lines 17 - 24). <span class="NormalText">Complete <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part X</span> of Schedule D</span>
                  <span style="width:2px;"/>
                
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"></span>
                </td>
                <td class="styLNAmountBox" style="height:10mm;vertical-align:bottom;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OtherLiabilitiesGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:10mm;">25</td>
                <td class="styLNAmountBox" style="height:10mm;vertical-align:bottom;font-family:'Arial';">
                  <span style="float:left; clear:none">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$Form990Data/OtherLiabilitiesGrp"/>
                    </xsl:call-template>
                  </span>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OtherLiabilitiesGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:auto;border-bottom: solid black 1px;">26</td>
                <td class="styLNDesc" style="width:100.2mm;height:auto;border-bottom: solid black 1px;" colspan="3">
                  <span class="styBoldText">Total liabilities. </span>
                  <span style="width:1mm;"></span>
                  <span class="NormalText"> Add lines 17 through 25</span>
                  <span style="width:2px;"/>
                
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">..</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TotalLiabilitiesGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">26</td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <span style="float:left; clear:none">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$Form990Data/TotalLiabilitiesGrp"/>
                    </xsl:call-template>
                  </span>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TotalLiabilitiesGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              
              </tbody>
              </table>
              <table class="styTable" style="font-size:7pt;width:187mm;" cellspacing="0">
           
            <tbody valign="top">
			<tr>													
             <td class="styIRS990VTImageBox" rowspan="14" valign="middle" style="border-bottom-width:0;padding-left:1.2mm;">
                  <img src="{$ImagePath}/990PF_NAFB.gif" alt="Net Assets or Fund Balance"/>
                </td>
              <td class="styLNLeftNumBox" style="height:7.5;"/>
                <td class="styLNDesc" style="width:100.2mm;height:7.5;" colspan="3">
                  <span class="styBoldText">Organizations that follow FASB ASC 958, <span>check here <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                      <span style="width:2mm;"/>
                      <input type="checkbox" class="styCkbox" alt="OrganizationFollowsFASB117Ind">
                        <xsl:call-template name="PopulateCheckbox">
                          <xsl:with-param name="TargetNode" select="$Form990Data/OrganizationFollowsFASB117Ind"/>
                          <xsl:with-param name="BackupName">IRS990OrganizationFollowsFASB117Ind</xsl:with-param>
                        </xsl:call-template>
                      </input>
                      <label>
                        <xsl:call-template name="PopulateLabel">
                          <xsl:with-param name="TargetNode" select="$Form990Data/OrganizationFollowsFASB117Ind"/>
                          <xsl:with-param name="BackupName">IRS990OrganizationFollowsFASB117Ind</xsl:with-param>
                        </xsl:call-template>
                      </label>
                    </span>
 and complete lines 27, 28, 32, and 33.</span>
 
                  <span style="width:2px;"/>
                </td>
                <td class="styLNAmountBoxNBB" style="height:7.5mm;background-color:lightgrey;">
                  <span style="width:1px;"/>
                </td>
                <td class="styShadingCell" style="width:8mm;height:7.5mm;">
                  <span style="width:1px;"/>
                </td>
                <td class="styLNAmountBoxNBB" style="height:7.5mm;background-color:lightgrey;">
                  <span style="width:1px;"/>
                  </td>
                  
              </tr>
              
              <tr>
                <td class="styLNLeftNumBox" style="height:auto;">27</td>
                <td class="styLNDesc" style="width:100.2mm;height:auto;" colspan="3">
            Net assets without donor restrictions
            <span style="width:2px;"/>
                 
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">..........</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/NoDonorRestrictionNetAssetsGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">27</td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <span style="float:left; clear:none">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$Form990Data/NoDonorRestrictionNetAssetsGrp"/>
                    </xsl:call-template>
                  </span>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/NoDonorRestrictionNetAssetsGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">28</td>
                <td class="styLNDesc" style="width:100.2mm;height:4.5mm;" colspan="3">
            Net assets with donor restrictions 
            <span style="width:2px;"/>
                 
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">...........</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/DonorRestrictionNetAssetsGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">28</td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <span style="float:left; clear:none">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$Form990Data/DonorRestrictionNetAssetsGrp"/>
                    </xsl:call-template>
                  </span>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/DonorRestrictionNetAssetsGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:7.5mm;"/>
                <td class="styLNDesc" style="width:100.2mm;height:7.5mm;" colspan="3">
                  <span class="styBoldText">Organizations that do not follow FASB ASC 958, <span>check here <img src="{$ImagePath}/990_Bullet_Md.gif" alt="MediumBullet"/>
                      <span style="width:2mm;"/>
                      <input type="checkbox" class="styCkbox" alt="OrgDoesNotFollowFASB117Ind">
                        <xsl:call-template name="PopulateCheckbox">
                          <xsl:with-param name="TargetNode" select="$Form990Data/OrgDoesNotFollowFASB117Ind"/>
                          <xsl:with-param name="BackupName">IRS990OrgDoesNotFollowFASB117Ind</xsl:with-param>
                        </xsl:call-template>
                      </input>
                      <label>
                        <xsl:call-template name="PopulateLabel">
                          <xsl:with-param name="TargetNode" select="$Form990Data/OrgDoesNotFollowFASB117Ind"/>
                          <xsl:with-param name="BackupName">IRS990OrgDoesNotFollowFASB117Ind</xsl:with-param>
                        </xsl:call-template>
                      </label>
                    </span>
 and complete lines 29 through 33.
  </span>
                  <span style="width:2px;"/>
                </td>
                <td class="styLNAmountBoxNBB" style="height:7.5mm;background-color:lightgrey;">
                  <span style="width:1px;"/>
                </td>
                <td class="styShadingCell" style="width:8mm;height:7.5mm;">
                  <span style="width:1px;"/>
                </td>
                <td class="styLNAmountBoxNBB" style="height:7.5mm;background-color:lightgrey;">
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">29</td>
                <td class="styLNDesc" style="width:100.2mm;height:4.5mm;" colspan="3">
            Capital stock or trust principal, or current funds
            <span style="width:2px;"/>
             
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">.....</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/CapStkTrPrinCurrentFundsGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">29</td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <span style="float:left; clear:none">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$Form990Data/CapStkTrPrinCurrentFundsGrp"/>
                    </xsl:call-template>
                  </span>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/CapStkTrPrinCurrentFundsGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">30</td>
                <td class="styLNDesc" style="width:100.2mm;height:4.5mm;" colspan="3">
            Paid-in or capital surplus, or land, building or equipment fund
            <span style="width:2px;"/>
              
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">...</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PdInCapSrplsLandBldgEqpFundGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">30</td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <span style="float:left; clear:none">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$Form990Data/PdInCapSrplsLandBldgEqpFundGrp"/>
                    </xsl:call-template>
                  </span>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PdInCapSrplsLandBldgEqpFundGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">31</td>
                <td class="styLNDesc" style="width:100.2mm;height:4.5mm;" colspan="3">
            Retained earnings, endowment, accumulated income, or other funds
            <span style="width:2px;"/>
                 
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm"/>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/RtnEarnEndowmentIncmOthFndsGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">31</td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <span style="float:left; clear:none">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$Form990Data/RtnEarnEndowmentIncmOthFndsGrp"/>
                    </xsl:call-template>
                  </span>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/RtnEarnEndowmentIncmOthFndsGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">32</td>
                <td class="styLNDesc" style="width:100.2mm;height:4.5mm;" colspan="3">
            Total net assets or fund balances
            <span style="width:2px;"/>
                 
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">...........</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TotalNetAssetsFundBalanceGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;">32</td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';">
                  <span style="float:left; clear:none">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$Form990Data/TotalNetAssetsFundBalanceGrp"/>
                    </xsl:call-template>
                  </span>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TotalNetAssetsFundBalanceGrp/EOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
              </tr>
              <tr>
                <td class="styLNLeftNumBox" style="height:4.5mm;">33</td>
                <td class="styLNDesc" style="width:100.2mm;height:4.5mm;" colspan="3">
            Total liabilities and net assets/fund balances
            <span style="width:2px;"/>
                 
                  <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm">........</span>
                </td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';border-bottom-width:0">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TotLiabNetAssetsFundBalanceGrp/BOYAmt"/>
                  </xsl:call-template>
                  <span style="width:1px;"/>
                </td>
                <td class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0">33</td>
                <td class="styLNAmountBox" style="height:4.5mm;vertical-align:bottom;font-family:'Arial';border-bottom-width:0">
                  <span style="float:left; clear:none">
                    <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$Form990Data/TotLiabNetAssetsFundBalanceGrp"/>
                    </xsl:call-template>
                  </span>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TotLiabNetAssetsFundBalanceGrp/EOYAmt"/>
                  </xsl:call-template>
                </td>
                
              </tr>
            </tbody>
              </table>
          
          <!-- End Part X Table-->
          <!-- Footer -->
          <div style="width:187mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 0px" class="pageEnd">
            <div class="styGenericDiv" style="width:105mm;"/>
            <div class="styGenericDiv" style="width:25mm;"/>
            <div class="styGenericDiv" style="float:right;">Form <span class="styBoldText">990</span> (2020)</div>
          </div>
          <!-- header -->
          <div style="width:187mm;clear:both;padding-bottom:.5mm;float:none;clear:both;" class="styBB">
            <div style="width:90mm;" class="styGenericDiv">Form 990 (2020)</div>
            <div style="width:55mm;text-align:center;" class="styGenericDiv"/>
            <div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">12</span>
            </div>
          </div>
            <div class="styBB" style="width:187mm;">
            <div class="styPartName"><span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part XI</span></div>
            <div class="styPartDesc" style="width:170mm;">Reconcilliation of Net Assets<span class="styNormalText"> </span>
            </div>
            <span class="styNormalText" style="padding-top:0.0mm;width:187mm;height:4.5mm;padding-left:17mm;">
        Check if Schedule O contains a response or note to any line in this <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part XI</span>
        <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..............</span>
              <span style="width:1mm;"/>
<input type="checkbox" class="styCkbox" alt="InfoInScheduleOPartXIInd">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InfoInScheduleOPartXIInd"/>
                    <xsl:with-param name="BackupName">IRS990InfoInScheduleOPartXIInd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
    <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$Form990Data/InfoInScheduleOPartXIInd"/>
        <xsl:with-param name="BackupName">IRS990InfoInScheduleOPartXIInd</xsl:with-param>
    </xsl:call-template>
 </label>
        
        </span>
          </div>
          <!-- End Part XI Title -->
          <!-- Begin Part XI Body -->
        
         <!-- <div class="styBB" style="width:187mm;">-->
            <div style="width:187mm;">
              <div class="styLNDesc" style="width:146.75mm;height:4mm;">
               </div>
            <!--  Empty number box lines on the right -->
              <div style="float:right">
                <div class="styLNRightNumBoxNBB" style="height:4mm;"/>
                <div class="styLNAmountBoxNBB" style="height:4mm;"/>
              </div>
            </div>
         <!--   L1 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4.5mm;">1</div>
              <div class="styLNDesc" style="width:139mm;height:4.5mm;"> Total revenue (must equal <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VIII</span>, column (A), line 12)
            <!--Dotted Line-->
                <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">............</span>
              </div>
           <!-- Float the number box to the right so all number boxes will align for both the screen and the print versions -->
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:4.5mm; padding-top=3.5mm;">1</div>
                <div class="styLNAmountBox" style="height:4.5mm; padding-top=3.5mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TotalRevenueGrp/TotalRevenueColumnAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--</div>-->
             
         <!-- L2-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4.5mm;">2</div>
              <div class="styLNDesc" style="width:139mm;height:4.5mm;"> Total expenses (must equal <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part IX</span>, column (A), line 25)
                           <!--Dotted Line-->
                <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">............</span>
              </div>
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:4.5mm; padding-top=3.5mm">2</div>
                <div class="styLNAmountBox" style="height:4.5mm; padding-top=3.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TotalFunctionalExpensesGrp/TotalAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
           
           <!-- L3 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4.5mm;">3</div>
              <div class="styLNDesc" style="width:139mm;height:4.5mm;"> Revenue less expenses. Subtract line 2 from line 1  
         <!--  Dotted Line-->
                <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..............</span>
              </div>
             <!-- Float the number box to the right so all number boxes wil align for both the screen and the print versions -->
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:4.5mm; padding-top=3.5mm">3</div>
                <div class="styLNAmountBox" style="height:4.5mm; padding-top=3.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/ReconcilationRevenueExpnssAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            
            <!-- L4 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4.5mm;">4</div>
              <div class="styLNDesc" style="width:139mm; height:4.5mm; ">Net assets or fund balances at beginning of year (must equal <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part X</span>, line 32, column (A))
          <!--Dotted Line-->
               <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">..</span>
              </div>
         <!--  Float the empty number box lines to the right so all number boxes wil align for both the screen and the print versions -->
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:4.5mm; padding-top=3.5mm">4</div>
                <div class="styLNAmountBox" style="height:4.5mm; padding-top=3.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TotalNetAssetsFundBalanceGrp/BOYAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
         <!--   L5 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4.5mm;">5</div>
              <div class="styLNDesc" style="width:139mm;height:4.5mm;"> Net unrealized gains (losses) on investments
         <!-- Dotted Line-->
                <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...............</span>
              </div>
             <!-- Float the number box to the right so all number boxes wil align for both the screen and the print versions-->
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:4.5mm; padding-top=3.5mm">5</div>
                <div class="styLNAmountBox" style="height:4.5mm; padding-top=3.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/NetUnrlzdGainsLossesInvstAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--   L6 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4.5mm;">6</div>
              <div class="styLNDesc" style="width:139mm;height:4.5mm;"> Donated services and use of facilities
         <!-- Dotted Line-->
                <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.................</span>
              </div>
             <!-- Float the number box to the right so all number boxes wil align for both the screen and the print versions-->
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:4.5mm; padding-top=3.5mm">6</div>
                <div class="styLNAmountBox" style="height:4.5mm; padding-top=3.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/DonatedServicesAndUseFcltsAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--   L7 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4.5mm;">7</div>
              <div class="styLNDesc" style="width:139mm;height:4.5mm;"> Investment expenses
         <!-- Dotted Line-->
                <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.....................</span>
              </div>
             <!-- Float the number box to the right so all number boxes wil align for both the screen and the print versions-->
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:4.5mm; padding-top=3.5mm">7</div>
                <div class="styLNAmountBox" style="height:4.5mm; padding-top=3.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InvestmentExpenseAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--   L8 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4.5mm;">8</div>
              <div class="styLNDesc" style="width:139mm;height:4.5mm;">Prior period adjustments
         <!-- Dotted Line-->
                <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.....................</span>
              </div>
             <!-- Float the number box to the right so all number boxes wil align for both the screen and the print versions-->
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:4.5mm; padding-top=3.5mm">8</div>
                <div class="styLNAmountBox" style="height:4.5mm; padding-top=3.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/PriorPeriodAdjustmentsAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!--   L9 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4.5mm;">9</div>
              <div class="styLNDesc" style="width:139mm;height:4.5mm;"> Other changes in net assets or fund balances (explain in Schedule O)
         <!-- Dotted Line-->
                <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">........</span>
              </div>
             <!-- Float the number box to the right so all number boxes wil align for both the screen and the print versions-->
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:4.5mm; padding-top=3.5mm">9</div>
                <div class="styLNAmountBox" style="height:4.5mm; padding-top=3.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/OtherChangesInNetAssetsAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
           <!--  L10 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4.5mm;">10</div>
              <div class="styLNDesc" style="width:139mm;height:4.5mm;"> Net assets or fund balances at end of year. Combine lines 3 through 9 (must equal <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part X</span>, line 32, column (B))  
                <!-- Dotted Line Took out dotted line per TEGE because print version only showed dots with no verbiage-->
               <!-- <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.......................</span>-->
              </div>
            <!-- Float the number box to the right so all number boxes wil align for both the screen and the print versions -->
              <div style="float:right">
                <div class="styLNRightNumBox" style="height:4.5mm; padding-top=3.5mm">10</div>
                <div class="styLNAmountBox" style="height:4.5mm; padding-top=3.5mm">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990Data/TotalNetAssetsFundBalanceGrp/EOYAmt"/>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            
                    <!-- BEGIN PART XII FINANCIAL STATEMENTS AND REPORTING-->
          <div class="styBB" style="width:187mm;clear:both;border-top-width:1px;">
            <div class="styPartName" style="width:15mm; height:auto;"><span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part XII</span></div>
            <div class="styPartDesc" style="width:171mm;">
      Financial Statements and Reporting
      </div>
      <span class="styNormalText" style="padding-top:0.0mm;width:187mm;height:auto;padding-left:18mm;">
        Check if Schedule O contains a response or note to any line in this <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part XII</span>
        <!-- Dotted Line -->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.............</span>
              <span style="width:2mm;"/>
<input type="checkbox" class="styCkbox" alt="InfoInScheduleOPartXIIInd">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form990Data/InfoInScheduleOPartXIIInd"/>
                    <xsl:with-param name="BackupName">IRS990InfoInScheduleOPartXIIInd</xsl:with-param>
                  </xsl:call-template>
                </input>
                <label>
    <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$Form990Data/InfoInScheduleOPartXIIInd"/>
        <xsl:with-param name="BackupName">IRS990InfoInScheduleOPartXIIInd</xsl:with-param>
    </xsl:call-template>
 </label>

        </span>
          </div>
          <div style="width: 187mm">
            <div class="styLNLeftNumBox"/>
            <div class="styLNDesc" style="width: 150mm; height:auto;"/>
            <div class="styIRS990LNYesNoBox" style="width:8mm;height:auto;border-left-width:0px;">
              <span style="width:1px;"/>
            </div>
            <div class="styIRS990LNYesNoBox" style="width:10mm;height:auto;border-top-width:0px;">
              <span class="styBoldText">Yes</span>
            </div>
            <div class="styIRS990LNYesNoBox" style="width:10mm;height:auto;border-top-width:0px;">
              <span class="styBoldText">No</span>
            </div>
          </div>
          
          <div style="width:187mm;float:none;">
      <div class="styLNLeftNumBox" style="height:auto;padding-top:2mm;padding-left:3mm;">1</div>
            <div class="styLNDesc" style="width:150mm;height:auto;">
          Accounting method used to prepare the Form 990: 
          <span style="width:2mm;padding-left:8mm;"/>
              <input type="checkbox" class="styCkbox" alt="MethodOfAccountingCashInd">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form990Data/MethodOfAccountingCashInd"/>
                  <xsl:with-param name="BackupName">IRS990MethodOfAccountingCashInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form990Data/MethodOfAccountingCashInd"/>
                  <xsl:with-param name="BackupName">IRS990MethodOfAccountingCashInd</xsl:with-param>
                </xsl:call-template>          
            Cash
          </label>
              <span style="width:2mm;"/>
              <input type="checkbox" class="styCkbox" alt="MethodOfAccountingAccrualInd">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form990Data/MethodOfAccountingAccrualInd"/>
                  <xsl:with-param name="BackupName">IRS990MethodOfAccountingAccrualInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form990Data/MethodOfAccountingAccrualInd"/>
                  <xsl:with-param name="BackupName">IRS990MethodOfAccountingAccrualInd</xsl:with-param>
                </xsl:call-template>          
            Accrual
          </label>
              <span style="width:2mm;"/>
              <input type="checkbox" class="styCkbox" alt="MethodOfAccountingOtherInd">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form990Data/MethodOfAccountingOtherInd"/>
                  <xsl:with-param name="BackupName">IRS990MethodOfAccountingOtherInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form990Data/MethodOfAccountingOtherInd"/>
                  <xsl:with-param name="BackupName">IRS990MethodOfAccountingOtherInd</xsl:with-param>
                </xsl:call-template>Other </label>
            <span class="styFixedUnderline" style="float:none;width:20mm;">
                     <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form990Data/MethodOfAccountingOtherInd/@methodOfAccountingOtherDesc"/>
                    </xsl:call-template>
            </span>
            <br/>
         If the organization changed its method of accounting from a prior year or checked "Other," explain in <br/>Schedule O.
            </div>
            <div class="styShadingCell" style="width:8mm;height:12mm;"/>
            <div class="styShadingCell" style="width:10mm;height:12mm;"/>
            <div class="styShadingCell" style="width:10mm;height:12mm;"/>
          </div>
         

          
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:auto;padding-left:3mm;">2a</div>
            <div class="styLNDesc" style="width:150mm;height:auto;">
              <span class="styNormalText" style="padding-top:0.0mm;">
        Were the organization’s financial statements compiled or reviewed by an independent accountant?</span>
                </div>
            <span class="styDotLn" style="float:right;padding-right:1mm;"/>
            <div class="styLNRightNumBox" style="height:4.5mm;">2a</div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/AccountantCompileOrReviewInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/AccountantCompileOrReviewInd"/>
              </xsl:call-template>
            </div>
            <div style="width:187mm;float:none;">
      <div class="styLNLeftNumBox" style="height:auto;padding-left:3mm;padding-left:4mm;"/>
            <div class="styLNDesc" style="width:150mm;height:auto;">
           <span style="float:left;">If ‘Yes,’ check a box below to indicate whether the financial statements for the year were compiled or reviewed on a separate basis, consolidated basis, or both:
              </span>
          </div>
          <!--background-color:lightgrey;-->
    <div class="styShadingCell" style="width:8mm;height:7.5mm;"/>
    <div class="styShadingCell" style="width:10mm;height:7.5mm;"/>
    <div class="styShadingCell" style="width:10mm;height:7.5mm;"/>
    </div>
      
    
             <div style="width:187mm;float:none;">
      <div class="styLNLeftNumBox" style="height:auto;padding-left:3mm;"/>
            <div class="styLNDesc" style="width:150mm;height:auto;">
        <span style="width:2mm;padding-left:0mm;"/>
              <input type="checkbox" class="styCkbox" alt="SeparateBasisFinclStmtInd">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form990Data/AcctCompileOrReviewBasisGrp/SeparateBasisFinclStmtInd"/>
                  <xsl:with-param name="BackupName">IRS990SeparateBasisFinclStmtInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form990Data/AcctCompileOrReviewBasisGrp/SeparateBasisFinclStmtInd"/>
                  <xsl:with-param name="BackupName">IRS990SeparateBasisFinclStmtInd</xsl:with-param>
                </xsl:call-template>          
            Separate basis
          </label>
          <span style="width:2mm;padding-left:8mm;"/>
              <input type="checkbox" class="styCkbox" alt="ConsolidatedBasisFinclStmtInd">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form990Data/AcctCompileOrReviewBasisGrp/ConsolidatedBasisFinclStmtInd"/>
                  <xsl:with-param name="BackupName">IRS990ConsolidatedBasisFinclStmtInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form990Data/AcctCompileOrReviewBasisGrp/ConsolidatedBasisFinclStmtInd"/>
                  <xsl:with-param name="BackupName">IRS990ConsolidatedBasisFinclStmtInd</xsl:with-param>
                </xsl:call-template>          
           Consolidated basis
          </label>
          <span style="width:2mm;padding-left:8mm;"/>
              <input type="checkbox" class="styCkbox" alt="ConsolAndSepBasisFinclStmtInd">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form990Data/AcctCompileOrReviewBasisGrp/ConsolAndSepBasisFinclStmtInd"/>
                  <xsl:with-param name="BackupName">IRS990ConsolAndSepBasisFinclStmtInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form990Data/AcctCompileOrReviewBasisGrp/ConsolAndSepBasisFinclStmtInd"/>
                  <xsl:with-param name="BackupName">IRS990ConsolAndSepBasisFinclStmtInd</xsl:with-param>
                </xsl:call-template>          
            Both consolidated and separate basis
          </label>
          </div>
    <div class="styShadingCell" style="width:8mm;height:7.5mm;"/>
    <div class="styShadingCell" style="width:10mm;height:7.5mm;"/>
    <div class="styShadingCell" style="width:10mm;height:7.5mm;"/>
    </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:auto;padding-left:3mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:150mm;height:auto;">
              <span class="styNormalText" style="padding-top:0.0mm;">
        Were the organization’s financial statements audited by an independent accountant?</span>
               </div>
               <!--Dotted Line-->
            <span class="styDotLn" style="float:right;padding-right:1mm;"/>
            <div class="styLNRightNumBox" style="height:auto;">2b</div>
            <div class="styIRS990LNYesNoBox" style="height:auto;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/FSAuditedInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:auto;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/FSAuditedInd"/>
              </xsl:call-template>
            </div>
            <div style="width:187mm;float:none;">
      <div class="styLNLeftNumBox" style="height:auto;padding-left:3mm;padding-left:4mm;"/>
            <div class="styLNDesc" style="width:150mm;height:auto;">
           <span style="float:left;">If ‘Yes,’ check a box below to indicate whether the financial statements for the year were audited on a separate basis, consolidated basis, or both:
              </span>
          </div>
    <div class="styShadingCell" style="width:8mm;height:7.5mm;"/>
    <div class="styShadingCell" style="width:10mm;height:7.5mm;"/>
    <div class="styShadingCell" style="width:10mm;height:7.5mm;"/>
    </div>
      
<!-- Attempting to fix 508 error I removed "IRS990" from the BackupNames in this section to avoid duplicate with PRIOR Section since they both use same element-->
             <div style="width:187mm;float:none;">
      <div class="styLNLeftNumBox" style="height:auto;padding-left:3mm;"/>
            <div class="styLNDesc" style="width:150mm;height:auto;">
        <span style="width:2mm;padding-left:0mm;"/>
              <input type="checkbox" class="styCkbox" alt="SeparateBasisFinclStmtInd">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form990Data/FSAuditedBasisGrp/SeparateBasisFinclStmtInd"/>
                  <xsl:with-param name="BackupName">SeparateBasisFinclStmtInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form990Data/FSAuditedBasisGrp/SeparateBasisFinclStmtInd"/>
                  <xsl:with-param name="BackupName">SeparateBasisFinclStmtInd</xsl:with-param>
                </xsl:call-template>          
            Separate basis
          </label>
          <span style="width:2mm;padding-left:8mm;"/>
              <input type="checkbox" class="styCkbox" alt="ConsolidatedBasisFinclStmtInd">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form990Data/FSAuditedBasisGrp/ConsolidatedBasisFinclStmtInd"/>
                  <xsl:with-param name="BackupName">ConsolidatedBasisFinclStmtInd
                  </xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form990Data/FSAuditedBasisGrp/ConsolidatedBasisFinclStmtInd"/>
                  <xsl:with-param name="BackupName">ConsolidatedBasisFinclStmtInd
                  </xsl:with-param>
                </xsl:call-template>          
           Consolidated basis
          </label>
          <span style="width:2mm;padding-left:8mm;"/>
              <input type="checkbox" class="styCkbox" alt="ConsolAndSepBasisFinclStmtInd">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form990Data/FSAuditedBasisGrp/ConsolAndSepBasisFinclStmtInd"/>
                  <xsl:with-param name="BackupName">ConsolAndSepBasisFinclStmtInd</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$Form990Data/FSAuditedBasisGrp/ConsolAndSepBasisFinclStmtInd"/>
                  <xsl:with-param name="BackupName">ConsolAndSepBasisFinclStmtInd</xsl:with-param>
                </xsl:call-template>          
            Both consolidated and separate basis
          </label>
          </div>
    <div class="styShadingCell" style="width:8mm;height:7.5mm;"/>
    <div class="styShadingCell" style="width:10mm;height:7.5mm;"/>
    <div class="styShadingCell" style="width:10mm;height:7.5mm;"/>
    </div>
          </div>
          <!--C-->
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:auto;padding-left:3mm;padding-left:4mm;">c</div>
            <div class="styLNDesc" style="width:150mm;height:auto;">
             
        <span style="float:none;">If "Yes," to line 2a or 2b, does the organization have a committee that assumes responsibility for oversight </span>
        <span style="float:none;">of the audit, review, or compilation of its financial statements and selection of an independent accountant? 
              </span>
            </div>
            <!--Dotted Line-->
            <span class="styDotLn" style="float:right;padding-right:1mm;"/>
            <div class="styLNRightNumBox" style="height:auto;padding-top:3.5mm;">2c</div>
            <div class="styIRS990LNYesNoBox" style="height:auto;padding-top:3.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/AuditCommitteeInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:auto;padding-top:3.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/AuditCommitteeInd"/>
              </xsl:call-template>
            </div>
            
            
       <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:auto;padding-left:3mm;padding-left:4mm;"/>
            <div class="styLNDesc" style="width:150mm;height:auto;">
             
        <span style="float:left;"> If the organization changed either its oversight process or selection process during the tax year, explain in Schedule O.</span>
              
            </div>
           
            <div class="styShadingCell" style="width:8mm;height:7.5mm;"/>
    <div class="styShadingCell" style="width:10mm;height:7.5mm;"/>
    <div class="styShadingCell" style="width:10mm;height:7.5mm;"/>
              </div>
            </div>
            <!-- 3a -->
              <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:auto;padding-left:3mm;">3a</div>
            <div class="styLNDesc" style="width:150mm;height:auto;">
              <span class="styNormalText" style="padding-top:0.0mm;">
        As a result of a federal award, was the organization required to undergo an audit or audits as set forth in
the Single Audit Act and OMB Circular A-133?
              <!--Dotted Line-->
              </span>
            </div>
            <span class="styDotLn" style="float:right;padding-right:1mm;"/>
            <div class="styLNRightNumBox" style="height:auto;padding-top:3.5mm;">3a</div>
            <div class="styIRS990LNYesNoBox" style="height:auto;padding-top:3.5mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/FederalGrantAuditRequiredInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:auto;padding-top:3.5mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/FederalGrantAuditRequiredInd"/>
              </xsl:call-template>
            </div>
          </div>
          <div style="width:187mm;float:none;">
            <div class="styLNLeftNumBox" style="height:7.5mm;padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:150mm;height:7.5mm;">
              <span class="styNormalText" style="padding-top:0.0mm;">
        If "Yes," did the organization undergo the required audit or audits?</span>
        If the organization did not undergo the required audit or audits, explain why in Schedule O and describe any steps taken to undergo such audits.
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;"/>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:4mm;">3b</div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:4mm;">
              <xsl:call-template name="PopulateYesBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/FederalGrantAuditPerformedInd"/>
              </xsl:call-template>
            </div>
            <div class="styIRS990LNYesNoBox" style="height:7.5mm;padding-top:4mm;">
              <xsl:call-template name="PopulateNoBoxText">
                <xsl:with-param name="TargetNode" select="$Form990Data/FederalGrantAuditPerformedInd"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- End Part XI Financial Statements and Reporting -->
         
            <!-- Footer -->
          <div style="width:187mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 0px" class="pageEnd">
            <div class="styGenericDiv" style="width:105mm;"/>
            <div class="styGenericDiv" style="width:25mm;"/>
            <div class="styGenericDiv" style="float:right;">Form <span class="styBoldText">990</span> (2020)</div>
          </div>
          <!-- header -->
          <div style="width:187mm;clear:both;padding-bottom:.5mm;float:none;clear:both;" class="styBB">
            <div style="width:90mm;" class="styGenericDiv">Form 990 (2020)</div>
            <div style="width:55mm;text-align:center;" class="styGenericDiv"/>
            <div style="float:right;" class="styGenericDiv"><span class="styBoldText" style="font-size:8pt;"></span>
            </div>
          </div>
          
          
         
  <!-- Footer 
          <div style="width:187mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 1px; border-bottom-width: 0px" class="pageEnd">
            <div class="styGenericDiv" style="width:105mm;"/>
            <div class="styGenericDiv" style="width:25mm;"/>
            <div class="styGenericDiv" style="float:right;">Form <span class="styBoldText">990</span> (2015)</div>
          </div>
         
          <div style="width:187mm;clear:both;padding-bottom:.5mm;float:none;clear:both;" class="styBB">
            <div style="width:90mm;" class="styGenericDiv">Form 990 (2015)</div>
            <div style="width:55mm;text-align:center;" class="styGenericDiv"/>
            <div style="float:right;" class="styGenericDiv"> <span class="styBoldText" style="font-size:8pt;"></span>
            </div>
          </div>
           -->
  <!-- BEGIN Left Over Table -->
          <!-- Additonal Data Title Bar and Button -->
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle">
        Additional Data        
      </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
          <!-- Additional Data Table -->
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$Form990Data"/>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
           <!--Special Condition Description -->
<span class="styRepeatingDataTitle">Form 990, Special Condition Description:
 </span>
<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">
<thead class="styTableThead">
<tr class="styDepTblHdr">
<th class="styDepTblCell" scope="col" rowspan="2" style="width:179mm;font-size:8pt;">
Special Condition Description</th>
</tr>
</thead>
<tfoot/>
<tbody>
<xsl:for-each select="$Form990Data/SpecialConditionDesc">
<tr style="border-color:black;height:6mm;">
<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
<td class="styTableCellText" style="width:179mm;">
<xsl:call-template name="PopulateText">
<xsl:with-param name="TargetNode" select="."/>
</xsl:call-template>
<span class="styTableCellPad"/>
</td>
</tr>
</xsl:for-each>
</tbody>
</table>
          <!-- Separated Data Tables -->
          <!-- Begin Part I Summary -->
        <xsl:if test="($Print = $Separated) and (count($Form990Data/ActivityOrMissionDesc) &gt; 3)">
            <span class="styRepeatingDataTitle">Form 990, <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part I</span>, Line 1 - Briefly describe the organization's mission or most significant activities:</span>
            <table class="styDepTbl" style="font-size:7pt;width:187mm;" cellspacing="0">
              <thead>
                <tr scope="col" class="styDepTblHdr">
                  <th scope="col" colspan="2" class="styDepTblCell"/>
                </tr>
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell" scope="col"><span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part I</span> Summary</th>
                </tr>
              </thead>
              <tfoot/>
              <tbody valign="top">
                <xsl:for-each select="$Form990Data/ProgramServiceRevenueGrp">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <td class="styDepTblCell" style="text-align:left;padding-left:80mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="ActivityOrMissionDesc"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
        </xsl:if>
          <!-- Begin Part III - Line1 - Program Service Accomplishments -->
          <xsl:if test="($Print = $Separated) and (count($Form990Data/MissionDesc) &gt; 3)">
            <span class="styRepeatingDataTitle">Form 990, PartI III, Line 1 - Briefly describe the organization's mission:</span>
            <table class="styDepTbl" style="font-size:7pt;width:187mm;" cellspacing="0">
              <thead>
                <tr scope="col" class="styDepTblHdr">
                  <th scope="col" colspan="2" class="styDepTblCell"/>
                </tr>
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell" scope="col"><span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part III</span> Statement of Program Service Accomplishments (See the instructions)</th>
                </tr>
              </thead>
              <tfoot/>
              <tbody valign="top">
                <xsl:for-each select="$Form990Data/ProgramServiceRevenueGrp">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <td class="styDepTblCell" style="text-align:left;padding-left:80mm;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="MissionDesc"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:if>
          <!-- Begin Part III  Statement of Program Service Accomplishments 4 -->
          <xsl:if test="($Print = $Separated) and (count($Form990Data/ProgSrvcAccomActyOtherGrp) &gt; 10)">
            <span class="styRepeatingDataTitle">Form 990, <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part III</span> - 4 Program Service Accomplishments (See the Instructions)</span>
            <table class="styDepTbl" style="font-size:7pt;width:187mm;" cellspacing="0">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell" scope="col" colspan="2" style="width:187mm;height:20mm;text-align:left;vertical-align:middle;">
      Describe the exempt purpose achievements for each of the organization’s three largest program services by expenses.<br/>
      Section 501(c)(3) and (4) organizations and 4947(a)(1) trusts are required to report the amount of grants and allocations to<br/>
      others, the total expenses, and revenue, if any, for each program service reported.</th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$Form990Data/ProgSrvcAccomActyOtherGrp">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <td style="width:187mm;">
              (Code:
              <span style="width:24mm;text-align:right;font-size:6pt;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="ActivityCd"/>
                        </xsl:call-template>
                      </span>
              ) 
              (Expenses $ 
              <span style="width:24mm;text-align:right;font-size:6pt;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="ExpenseAmt"/>
                        </xsl:call-template>
                      </span>
                      <span style="width:3mm;"/>
              including grants of $ 
              <span style="width:24mm;text-align:right;font-size:6pt;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="GrantAmt"/>
                        </xsl:call-template>
                      </span>
              ) (Revenue $
              <span style="width:24mm;text-align:right;font-size:6pt;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="RevenueAmt"/>
                        </xsl:call-template>
                      </span>
              )
               </td>
                  </tr>
                  <td style="padding-top:.5mm; padding-bottom:1.5mm; border-style:solid; border-color:black; border-left-width:0px; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px; text-align:left;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="Desc"/>
                    </xsl:call-template>
                  </td>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:if>
          <!-- Begin Part VII - Section B - Independent Contractors -->
          <xsl:if test="($Print = $Separated) and (count($Form990Data/NoListedPersonsCompensatedInd) &gt; 4)">
            <span class="styRepeatingDataTitle">Form 990, <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VII</span> - Section B - Complete this table for your five highest compensated independent contractors that received more than $100,000 of compensation from the organization. </span>
            <table class="styDepTbl" style="font-size:7pt;width:187mm;" cellspacing="0">
              <thead>
                <tr scope="col" class="styDepTblHdr">
                  <th scope="col" class="styDepTblCell">
                        (A) <br/>
             Name and business address
          </th>
                  <th scope="col" class="styDepTblCell">
                         (B)  <br/>
           Description of services
          </th>
                  <th scope="col" class="styDepTblCell">
                         (C)  <br/>
            Compensation
          </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody valign="top">
                <xsl:for-each select="$Form990Data/ContractorCompensationGrp">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <td class="styDepTblCell" style="width:100mm;height:4.5mm;text-align:left;valign:top;border-left-width:0px;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="ContractorName/PersonNm"/>
                      </xsl:call-template>
                    </td>
                    <td class="styDepTblCell" style="height:4.5mm;padding-right:0.75mm;valign:top;width:28mm;text-align:right;font-size:6pt;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="ServicesDesc"/>
                      </xsl:call-template>
                    </td>
                    <td class="styDepTblCell" style="height:4.5mm;padding-right:0.75mm;valign:top;text-align:right;font-size:6pt;width:29mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="CompensationAmt"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:if>
          <!-- Begin Part VIII - Col a - d -->
          
          <!-- Begin Part VIII - Statement of Revenue - 2a - 2e Program Service Revenue  Took this out per Defect 25112 and input from Charles Moore who says because of Max occurs is 5 no need to set up for separated print.
          <xsl:if test="($Print = $Separated) and (count($Form990Data/ProgramServiceRevenue) &gt; 4)">
            <span class="styRepeatingDataTitle">Form 990, Part VIII - Statement of Revenue - 2a - 2g  Program Service Revenue - </span>
            <table class="styDepTbl" style="font-size:7pt;width:187mm;" cellspacing="0">
              <thead>
                <tr scope="col" class="styDepTblHdr">
                  <th scope="col" colspan="2" class="styDepTblCell"/>
                  <th scope="col" class="styDepTblCell">
                    <br/>
                    <br/>
              Business Code
             </th>
                  <th scope="col" class="styDepTblCell">
                        (A) <br/>
             Total Revenue
          </th>
                  <th scope="col" class="styDepTblCell">
                         (B)  <br/>
            Related or<br/> Exempt <br/>
           Function <br/>
           Revenue
          </th>
                  <th scope="col" class="styDepTblCell">
                         (C)  <br/>
             Unrelated <br/> Business <br/>
             Revenue
          </th>
                  <th scope="col" class="styDepTblCell">
                          (D)  <br/>
            Revenue <br/>
            Excluded from <br/>
            Tax under IRC <br/>
            512, 513, or 514
          </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody valign="top">
                <xsl:for-each select="$Form990Data/ProgramServiceRevenue">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <td class="styDepTblCell" style="width:3mm;height:4.5mm;valign:top;border-right-width:0px;">
                      <span class="styBoldText"/>
                    </td>
                    <td class="styDepTblCell" style="width:70mm;height:4.5mm;text-align:left;valign:top;border-left-width:0px;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="Description"/>
                      </xsl:call-template>
                    </td>
                    <td class="styDepTblCell" style="height:4.5mm;padding-right:0.75mm;valign:top;width:28mm;text-align:right;font-size:6pt;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="BusinessCode"/>
                      </xsl:call-template>
                    </td>
                    <td class="styDepTblCell" style="height:4.5mm;padding-right:0.75mm;valign:top;text-align:right;font-size:6pt;width:29mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="TotalRevenueColumn"/>
                      </xsl:call-template>
                    </td>
                    <td class="styDepTblCell" style="height:4.5mm;padding-right:0.75mm;valign:top;width:28mm;text-align:right;font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="RelatedOrExemptFunctionIncome"/>
                      </xsl:call-template>
                    </td>
                    <td class="styDepTblCell" style="height:4.5mm;padding-right:0.75mm;valign:top;text-align:right;font-size:6pt;width:29mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="UnrelatedBusinessRevenue"/>
                      </xsl:call-template>
                    </td>
                    <td class="styDepTblCell" style="height:4.5mm;padding-right:0.75mm;valign:top;text-align:right;font-size:6pt;width:29mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="ExclusionAmount"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:if>
-->
          <!-- Begin Part VIII - Miscellaneous Revenue - 11a - 11c -->
          <xsl:if test="($Print = $Separated) and (count($Form990Data/OtherRevenueMiscGrp) &gt; 4)">
            <span class="styRepeatingDataTitle ">Form 990, <span style="font-family: Arial, Helvetica, sans-serif; font-weight: 500; font-width: font-stretch: ultra-expanded; font-size:10.0px;">Part VIII</span> - Statement of Revenue - 11a - 11c </span>
            <table class="styDepTbl" style="font-size:7pt;width:187mm;" cellspacing="0">
              <thead>
                <tr scope="col" class="styDepTblHdr">
                  <th scope="col" colspan="2" class="styDepTblCell"/>
                  <th scope="col" class="styDepTblCell">
                    <br/>
                    <br/>
              Business Code
             </th>
                  <th scope="col" class="styDepTblCell">
                        (A) <br/>
             Total Revenue
          </th>
                  <th scope="col" class="styDepTblCell">
                         (B)  <br/>
            Related or<br/> Exempt <br/>
           Function <br/>
           Revenue
          </th>
                  <th scope="col" class="styDepTblCell">
                         (C)  <br/>
             Unrelated <br/> Business <br/>
             Revenue
          </th>
                  <th scope="col" class="styDepTblCell">
                          (D)  <br/>
            Revenue <br/>
            Excluded from <br/>
            Tax under IRC <br/>
            512, 513, or 514
          </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody valign="top">
                <xsl:for-each select="$Form990Data/OtherRevenueMiscGrp">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <td class="styDepTblCell" style="width:3mm;height:4.5mm;valign:top;border-right-width:0px;">
                      <span class="styBoldText"/>
                    </td>
                    <td class="styDepTblCell" style="width:70mm;height:4.5mm;text-align:left;valign:top;border-left-width:0px;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="Desc"/>
                      </xsl:call-template>
                    </td>
                    <td class="styDepTblCell" style="height:4.5mm;padding-right:0.75mm;valign:top;width:28mm;text-align:right;font-size:6pt;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="BusinessCd"/>
                      </xsl:call-template>
                    </td>
                    <td class="styDepTblCell" style="height:4.5mm;padding-right:0.75mm;valign:top;text-align:right;font-size:6pt;width:29mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="TotalRevenueColumnAmt"/>
                      </xsl:call-template>
                    </td>
                    <td class="styDepTblCell" style="height:4.5mm;padding-right:0.75mm;valign:top;width:28mm;text-align:right;font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="RelatedOrExemptFuncIncomeAmt"/>
                      </xsl:call-template>
                    </td>
                    <td class="styDepTblCell" style="height:4.5mm;padding-right:0.75mm;valign:top;text-align:right;font-size:6pt;width:29mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="UnrelatedBusinessRevenueAmt"/>
                      </xsl:call-template>
                    </td>
                    <td class="styDepTblCell" style="height:4.5mm;padding-right:0.75mm;valign:top;text-align:right;font-size:6pt;width:29mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="ExclusionAmt"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:if>
          <!-- Begin Part IX - Statement of Functional Expenses - 24a - 24e Other Expenses Took this out per Defect 25112 and input from Charles Moore who says because of Max occurs is 5 no need to set up for separated print.
          <xsl:if test="($Print = $Separated) and (count($Form990Data/OtherExpenses) &gt; 4)">
            <span class="styRepeatingDataTitle">Form 990, Part IX - Statement of Functional Expenses - 24a -  24e  Other Expenses </span>
            <table class="styDepTbl" style="font-size:7pt;width:187mm;" cellspacing="0">
              <thead>
                <tr scope="col" class="styDepTblHdr">
                  <th scope="col" colspan="2" class="styDepTblCell">
                    <span class="styItalicText">
              Do not include amounts reported on line <br/>
              6b, 8b, 9b, and 10b of Part VIII.
              </span>
                  </th>
                  <th scope="col" class="styDepTblCell">
                        (A) <br/>
             Total expenses
          </th>
                  <th scope="col" class="styDepTblCell">
                         (B)  <br/>
             Program service <br/>expenses
          </th>
                  <th scope="col" class="styDepTblCell">
                         (C)  <br/>
             Management and <br/> general expenses
          </th>
                  <th scope="col" class="styDepTblCell">
                          (D)  <br/>
             Fundraising <br/> expenses
          </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody valign="top">
                <xsl:for-each select="$Form990Data/OtherExpenses">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <td class="styDepTblCell" style="width:3mm;height:4.5mm;valign:top;border-right-width:0px;">
                      <span class="styBoldText"/>
                    </td>
                    <td class="styDepTblCell" style="width:70mm;height:4.5mm;text-align:left;valign:top;border-left-width:0px;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="Description"/>
                      </xsl:call-template>
                    </td>
                    <td class="styDepTblCell" style="height:4.5mm;padding-right:0.75mm;valign:top;width:28mm;text-align:right;font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="Total"/>
                      </xsl:call-template>
                    </td>
                    <td class="styDepTblCell" style="height:4.5mm;padding-right:0.75mm;valign:top;text-align:right;font-size:6pt;width:29mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="ProgramServices"/>
                      </xsl:call-template>
                    </td>
                    <td class="styDepTblCell" style="height:4.5mm;padding-right:0.75mm;valign:top;width:28mm;text-align:right;font-size:6pt;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="ManagementAndGeneral"/>
                      </xsl:call-template>
                    </td>
                    <td class="styDepTblCell" style="height:4.5mm;padding-right:0.75mm;valign:top;text-align:right;font-size:6pt;width:29mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="Fundraising"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            <br/>
          </xsl:if>
          -->
          <!-- Begin Part X -Balance Sheet
          <xsl:if test="($Print = $Separated) and (count($Form990Data/OtherExpenses) &gt; 4)">
            <span class="styRepeatingDataTitle">Form 990, Part X -  </span>
          -->
                    
        </form>
      </body>
    </html>
  </xsl:template>
  <!-- Below are a few templates designed to be filler rows for the tables in this form -->
  <xsl:template name="IRS990PartVTableFillerRow">
    <tr>
      <td class="styTableCellText" style="width:71mm;">
        <br/>
        <span style="width:4px"/>
      </td>
      <td class="styTableCell" style="width:36mm;text-align:left;">
        <span style="width:4px"/>
      </td>
      <td class="styTableCell">
        <span style="width:4px;"/>
      </td>
      <td class="styTableCell">
        <span style="width:4px;"/>
      </td>
      <td class="styTableCell" style="border-right-width:0px">
        <span style="width:4px;"/>
      </td>
    </tr>
  </xsl:template>
  <xsl:template name="IRS990PartVIITableFillerRow">
    <tr>
      <td class="styTableCellText" scope="col" style="width:59mm;">
        <span class="styTableCellPad"/>
        <br/>
        <br/>
      </td>
      <td class="styTableCell" scope="col" style="width:15mm;">
        <span class="styTableCellPad"/>
      </td>
      <td class="styTableCell" scope="col" style="width:10mm;text-align:center">
        <span class="styTableCellPad"/>
      </td>
      <td class="styTableCell" scope="col" style="width:5mm;text-align:center">
        <span class="styTableCellPad"/>
      </td>
      <td class="styTableCell" scope="col" style="width:5mm;text-align:center">
        <span class="styTableCellPad"/>
      </td>
      <td class="styTableCell" scope="col" style="width:5mm;text-align:center">
        <span class="styTableCellPad"/>
      </td>
      <td class="styTableCell" scope="col" style="width:8mm;text-align:center">
        <span class="styTableCellPad"/>
      </td>
      <td class="styTableCell" scope="col" style="width:5mm;text-align:center">
        <span class="styTableCellPad"/>
      </td>
      <td class="styTableCell" scope="col" style="width:25mm;">
        <span class="styTableCellPad"/>
      </td>
      <td class="styTableCell" scope="col" style="width:25mm;">
        <span class="styTableCellPad"/>
      </td>
      <td class="styTableCell" scope="col" style="width:25mm;border-right-width:0px;">
        <span class="styTableCellPad"/>
      </td>
    </tr>
  </xsl:template>
  <xsl:template name="IRS990PartVIIITableFillerRow">
    <tr>
      <td class="styTableCellText" style="width:8mm;">
        <span class="styTableCellPad"/>
      </td>
      <td class="styTableCellText" style="width:8mm;border-right-width:0px">
        <span class="styTableCellPad"/>
      </td>
    </tr>
  </xsl:template>
  <xsl:template name="IRS990PartIXTableFillerRow">
    <tr>
      <td class="styTableCellText" style="width:56mm;">
        <span style="width:4px"/>
      </td>
      <td class="styTableCell" style="width:25mm;">
        <span style="width:4px"/>
      </td>
      <td class="styTableCell" style="width:25mm;border-right-width:0px">
        <span style="width:4px"/>
      </td>
    </tr>
  </xsl:template>
</xsl:stylesheet>