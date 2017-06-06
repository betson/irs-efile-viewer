<?xml version="1.0" encoding="UTF-8" ?>
<!-- 07/30/2010 - Modified per BSP101319OTH - Jeremy Nichols -->
<!-- 12/14/2010 - Modified per Defect #53516 - Jeremy Nichols -->

<!DOCTYPE xsl:stylesheet [
    <!ENTITY nbsp "&#160;">
  ]>
  
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS990ScheduleGStyle.xsl"/>

  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:param name="Form990ScheduleGData" select="$RtnDoc/IRS990ScheduleG" />

  <xsl:variable name="StatesSize" select="count($Form990ScheduleGData/LicensedStates)" />
  <xsl:variable name="RowsToShow" select="10" />

  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form990ScheduleGData)"></xsl:with-param>
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
        <meta name="Description" content="IRS Form 990 Schedule G" />
    
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
        <xsl:call-template name="InitJS"></xsl:call-template>
        
        <style type="text/css"> 
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS990ScheduleGStyle" />  
            <xsl:call-template name="AddOnStyle" />
          </xsl:if>
        </style>
        
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      
      <body class="styBodyClass">
        <form name="Form990ScheduleG">
          <xsl:call-template name="DocumentHeader" />
          
          <!-- BEGIN FORM HEADER -->
          <div class="styTBB" style="width:187mm;">
            <div class="styFNBox" style="width:33mm;padding-top:1mm;">
              <div style="height:14mm;">
                <span class="styFormNumber" style="font-size:9pt;" >SCHEDULE G<br/>
                  <span style="text-align:left;padding-left:0mm;padding-top:1mm;"></span> (Form 990 or 990-EZ)
                </span>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData"></xsl:with-param>
                </xsl:call-template>
              </div>
              <div style="padding-top:0mm;padding-bottom:.5mm;">
                <span class="styAgency">Department of the Treasury</span><br/>
                <span class="styAgency">Internal Revenue Service</span>
              </div>
            </div>
            <div class="styFTBox" style="width:122mm;height:19mm;">
              <div class="styMainTitle" style="height:11mm;padding-top:1mm;padding-bottom:0mm;">
                Supplemental Information Regarding<br />
                Fundraising or Gaming Activities
              </div>
              <div class="styFBT" style="margin-top:0mm;font-weight:bold;padding-bottom:.5mm;padding-top:1mm;" >
                <span style="font-size:5.5pt;font-weight:bold;padding-bottom:1mm;padding-top:0mm;">
                  Complete if the organization answered "Yes" to Form 990, Part IV, lines 17, 18, or 19, <br/>or if the organization entered more than $15,000 on Form 990-EZ, line 6a.<br/>
                  <img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/>
                  Attach to Form 990 or Form 990-EZ.  <img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/>
                  See separate instructions. 
                </span>
              </div>
            </div>
            <div class="styTYBox" style="width:31.5mm;height:22mm;">
              <div class="styOMB" >OMB No. 1545-0047</div>
              <div class="styTaxYear" style="height:11mm;padding-top:1mm;">
                20<span class="styTYColor">10</span>
              </div>
              <div class="styPartName" style="width:31.5mm;padding-top:0mm;text-align:left;padding-left:3mm;">
                Open to Public <span style="text-align:left;padding-left:0mm;"></span> Inspection
              </div>
            </div>
          </div>  
       
          <!-- Begin Name and Identifying Number Section-->    
          <div class="styBB" style="width:187mm;clear:both;font-family:verdana;font-size:7pt;">
            <div class="styNameBox" style="width:135mm;height:10mm;font-size:7pt;">
              Name of the organization<br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
              </xsl:call-template><br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
              </xsl:call-template><br/>
            </div>
            <div class="styEINBox" style="width:50mm;height:8mm;padding-left:2mm;font-size:7pt;">
              Employer identification number<br/><br/>
              <span style="font-weight:normal;">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                </xsl:call-template>
              </span>          
            </div>
          </div>
          <!-- End Name and Identifying Number Section-->     
      
          <!-- BEGIN PART I  -  FUNDRAISING ACTIVITIES  -->
          <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
      
          <!-- BEGIN PART I TITLE -->
          <div class="styBB" style="width:187mm;padding-top:1mm;padding-bottom:1mm;">
            <div class="styPartName" style="width:13mm;">Part I</div>
            <div class="styPartDesc" > <b>Fundraising Activities.</b>  
              <span class="styNormalText"> Complete if the organization answered "Yes" to Form 990, Part IV, line 17.</span>
            </div>
          </div>
  
          <!-- LINE 1  -->
          <div class="styNBB" style="width:187mm">
            <div class="styLNLeftNumBox" style="font-weight:bold;padding-top:.75mm;width:7.5mm;">1</div>
            <div style="float:left; width:178mm; padding-bottom:0.5mm;padding-top:1mm;">
              Indicate whether the organization raised funds through any of the following activities. Check all that apply.
            </div>
          </div> 
            
          <div class="styNBB" style="width:187mm;">
            <table style="width:187mm;font-size:7pt;">
              <tbody>
                <tr>
                  <td style="width:5mm;text-align:center;">
                    <span class="styBoldText">a</span>
                  </td>  
                  <td style="width:5mm;text-align:center;">
                    <input type="checkbox" class="styCkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/MailSolicitations"/>
                      </xsl:call-template>
                    </input>
                  </td>  
                  <td style="width:77mm;">
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/MailSolicitations"/>
                      </xsl:call-template>
                      Mail solicitations
                    </label>
                  </td> 
                  <td style="width:5mm;text-align:center;"> 
                    <span class="styBoldText">e</span>
                  </td> 
                  <td style="width:5mm;text-align:center;"> 
                    <input type="checkbox" class="styCkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/SolicitationOfNonGovtGrants"/>
                      </xsl:call-template>
                    </input>
                  </td>  
                  <td style="width:87mm;">
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/SolicitationOfNonGovtGrants"/>
                      </xsl:call-template>
                      Solicitation of non-government grants
                    </label>
                  </td>  
                </tr>
                <tr>
                  <td style="width:5mm;text-align:center;">
                    <span class="styBoldText">b</span>
                  </td> 
                  <td style="width:5mm;text-align:center;"> 
                    <input type="checkbox" class="styCkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EmailSolicitations"/>
                      </xsl:call-template>
                    </input>
                  </td>  
                  <td style="width:77mm;">
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EmailSolicitations"/>
                      </xsl:call-template>
                      Internet and e-mail solicitations
                    </label>
                  </td> 
                  <td style="width:5mm;text-align:center;"> 
                    <span class="styBoldText">f</span>
                  </td> 
                  <td style="width:5mm;text-align:center;"> 
                    <input type="checkbox" class="styCkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/SolicitationOfGovtGrants"/>
                      </xsl:call-template>
                    </input>
                  </td>  
                  <td style="width:87mm;">
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/SolicitationOfGovtGrants"/>
                      </xsl:call-template>
                      Solicitation of government grants
                    </label>
                  </td>  
                </tr>
                <tr>
                  <td style="width:5mm;text-align:center;">
                    <span class="styBoldText">c</span>
                  </td> 
                  <td style="width:5mm;text-align:center;"> 
                    <input type="checkbox" class="styCkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/PhoneSolicitations"/>
                      </xsl:call-template>
                    </input>
                  </td>  
                  <td style="width:77mm;">              
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/PhoneSolicitations"/>
                      </xsl:call-template>
                      Phone solicitations
                    </label>
                  </td>  
                  <td style="width:5mm;text-align:center;">
                    <span class="styBoldText">g</span>
                  </td> 
                  <td style="width:5mm;text-align:center;"> 
                    <input type="checkbox" class="styCkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/SpecialFundraisingEvents"/>
                      </xsl:call-template>
                    </input>
                  </td>  
                  <td style="width:87mm;">   
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/SpecialFundraisingEvents"/>
                      </xsl:call-template>
                      Special fundraising events
                    </label>
                  </td>  
                </tr>
                <tr>
                  <td style="width:5mm;text-align:center;">
                    <span class="styBoldText">d</span>
                  </td>  
                  <td style="width:5mm;text-align:center;">
                    <input type="checkbox" class="styCkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/InPersonSolicitations"/>
                      </xsl:call-template>
                    </input> 
                  </td>  
                  <td style="width:77mm;">   
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/InPersonSolicitations"/>
                      </xsl:call-template>
                      In-person solicitations
                    </label>
                  </td>  
                </tr>
              </tbody>
            </table>
          </div>
          
          <!--  LINE 2a  -->
          <div class="IRS990ScheduleG_LineContainer" style="padding-top:1mm;">
            <div class="IRS990ScheduleG_LineIndex" style="width:7.5mm;padding-right:10px;text-align:left;padding-left:1mm;padding-top:1mm;">2a</div>
            <div class="IRS990ScheduleG_LineDesc" style="width:180mm;border-right-width:0px;padding-top:1mm;">
              Did the organization have a written or oral agreement with any individual (including officers, directors, trustees
            </div>
          </div>
          
          <div class="IRS990ScheduleG_LineContainer">
            <div class="IRS990ScheduleG_LineIndex" style="width:7.5mm;"></div>
            <div class="IRS990ScheduleG_LineDesc" style="width:150mm;border-right-width:0px;">
              or key employees listed in Form 990, Part VII) or entity in connection with professional fundraising services?
            </div>
            <div class="IRS990ScheduleG_LineDesc" style="width:15mm;border-right-width:0px;text-align:right;">
            <span>
              <xsl:call-template name="PopulateSpan">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/AgreementRefFundraising" />
              </xsl:call-template>
              <input type="checkbox" class="IRS990ScheduleG_Checkbox">
                <xsl:call-template name="PopulateYesCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/AgreementRefFundraising" />
                </xsl:call-template>
              </input>
            </span>
            <span style="width:3mm;"></span>
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/AgreementRefFundraising" />
              </xsl:call-template>
              <span style="font-weight:bold;">Yes</span>
            </label>  
          </div>
          <div class="IRS990ScheduleG_LineDesc" style="width:15mm;border-right-width:0px;text-align:right;">
            <span>
              <xsl:call-template name="PopulateSpan">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/AgreementRefFundraising" />
              </xsl:call-template>
              <input type="checkbox" class="IRS990ScheduleG_Checkbox">
                <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/AgreementRefFundraising" />
                </xsl:call-template>
              </input>
            </span>
            <span style="width:3mm;"></span>
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/AgreementRefFundraising" />
              </xsl:call-template>
              <span style="font-weight:bold;">No</span>
            </label>  
          </div>
        </div>

        <!--  LINE  2b  --> 
        <div class="styNBB" style="width:187mm">
          <div class="styLNLeftNumBox" style="font-weight:bold;padding-left:2.5mm;width:7.5mm;padding-top:1mm;padding-bottom:0mm;">b</div>
          <div style="float:left; width:178mm; font-size:7pt;padding-top:1mm;">
            If “Yes,” list the ten highest paid individuals or entities (fundraisers) pursuant to agreements under which the fundraiser is <br/>
            to be compensated at least $5,000 by the organization. Form 990-EZ filers are not required to complete this table.  
          </div>
       
          <!--########################################################################################################-->         
          <!--  PART I  -  Fundraising Activities Table  -  Line 2b  -->
          <div class="styBB" style="width:187mm;float:none;clear:both;">   
          
            <!-- Table expand/collapse toggle button-->
            <div style="float:right;clear:all;width:7mm;text-align:right;">
              <xsl:call-template name="SetDynamicTableToggleButton">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraiserActivityInformation"/>
                <xsl:with-param name="containerHeight" select="10"/>
                <xsl:with-param name="headerHeight" select="2"/>        
                <xsl:with-param name="containerID" select=" 'P1ctn' "/>
              </xsl:call-template>
            </div>
          </div> 
          <!--Table expand/collapse toggle button end--> 
  
          <div class="IRS990ScheduleG_TableContainer" style="border-top-width: 0px" id="P1ctn"> 
            <xsl:call-template name="SetInitialState"/> 
              <table class="styTable" cellspacing="0" cellpadding="0" style="font-size:7pt;overflow-y:auto;">
                <thead class="styTableThead">
                  <tr>
                    <th class="IRS990ScheduleG_TableCell" style="vertical-align:top;padding-top:1mm; width:42mm;font-weight:normal;font-size:7pt;text-align:center;" scope="col" rowspan="2"> 
                      <b>(i)</b> Name and address of individual <br /> or entity (fundraiser)
                    </th>
                    <th class="IRS990ScheduleG_TableCell" style="vertical-align:top;padding-top:1mm;width:27mm;text-align:center;font-size:7pt;font-weight:normal;" scope="col" rowspan="2">
                      <span style="font-weight:bold;">(ii)</span> Activity
                    </th>
                    <th class="IRS990ScheduleG_TableCell" style="padding-right:0mm;padding-left:1mm; vertical-align:top;padding-top:1mm; width:22mm;text-align:center;font-size:6.5pt;font-weight:normal;" scope="col" colspan="2">
                      <span style="font-weight:bold;text-align:left;"  >(iii)</span> Did fundraiser have custody or control of contributions?
                    </th>
                    <th class="IRS990ScheduleG_TableCell" style="vertical-align:top;padding-top:1mm;width:32mm;text-align:center;font-size:7pt;font-weight:normal;" scope="col" rowspan="2">
                      <span style="font-weight:bold;">(iv)</span> Gross receipts <br />  from activity
                    </th>
                    <th class="IRS990ScheduleG_TableCell" style="vertical-align:top;padding-top:1mm;width:32mm;text-align:center;font-size:7pt;font-weight:normal;" scope="col" rowspan="2">
                      <span style="font-weight:bold;">(v)</span> Amount paid to <br/>(or retained by)<br/> fundraiser listed in <br/>col. <b>(i)</b>
                    </th>
                    <th class="IRS990ScheduleG_TableCell" style="vertical-align:top;padding-top:1mm;width:32mm;border-right-width:0px;text-align:center;font-size:7pt; font-weight:normal;" scope="col" rowspan="2">
                      <span style="font-weight:bold;">(vi)</span> Amount paid to <br />  (or retained by) <br /> organization
                    </th>
                  </tr>
                  <tr>
                    <th class="IRS990ScheduleG_TableCell" style="width:11mm;font-size:7pt;border-right-width:1px;text-align:center" scope="col">
                      Yes
                    </th>
                    <th class="IRS990ScheduleG_TableCell" style="width:11mm;font-size:7pt;border-right-width:1px;text-align:center" scope="col"  >
                      No
                    </th>
                  </tr>
                </thead>    
                <tfoot></tfoot>
                <tbody>
                
                  <!-- Display all rows: If the print parameter is not set to be Separated, OR -->
                  <!-- If the print parameter is separated, but there are fewer elements than the container height (10) -->
                  <!-- Name of Supported Organization -->
                  <xsl:if test="($Print != $Separated) or count($Form990ScheduleGData/FundraiserActivityInformation) &lt;= 11">
                    <xsl:for-each select="$Form990ScheduleGData/FundraiserActivityInformation">
                      <tr>
                        <td class="IRS990ScheduleG_TableCell" style="width:42mm;font-family:verdana;font-size:7pt;text-align:left;"> 
                      
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="NameOfIndividual"/>
                          </xsl:call-template>
                          <xsl:if test="NameOfOrganization">
                            <br/>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="NameOfOrganization"/>
                            </xsl:call-template>
                          </xsl:if>
                          
                          <xsl:if test="AddressForeign">
                            <br />
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="AddressForeign/AddressLine1"/>
                            </xsl:call-template><br />
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="AddressForeign/AddressLine2"/>
                            </xsl:call-template><br />
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="AddressForeign/City"/>
                            </xsl:call-template>, 
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="AddressForeign/ProvinceOrState"/>
                            </xsl:call-template><br />
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="AddressForeign/Country"/>
                            </xsl:call-template><span style="width:1mm;"/>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="AddressForeign/PostalCode"/>
                            </xsl:call-template>
                          </xsl:if>
                          <xsl:if test="AddressUS">
                            <br />
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="AddressUS/AddressLine1"/>
                            </xsl:call-template><br />
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="AddressUS/AddressLine2"/>
                            </xsl:call-template><br />
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="AddressUS/City"/>
                            </xsl:call-template>, 
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="AddressUS/State"/>
                            </xsl:call-template><span style="width:1mm;"/>
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="AddressUS/ZIPCode"/>
                            </xsl:call-template>
                          </xsl:if>
                        </td>
                
                        <!-- Activity -->
                        <td class="IRS990ScheduleG_TableCell" style="width:27mm;text-align:left;font-family:verdana;font-size:7pt;vertical-align:top;">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="Activity"/>
                          </xsl:call-template> 
                        </td>  
                
                        <!-- Fundraiser have Custody -->
                        <td class="IRS990ScheduleG_TableCell" style="width:11mm;text-align:center;font-family:verdana;font-size:7pt;">
                          <xsl:call-template name="PopulateYesBoxText">
                            <xsl:with-param name="TargetNode" select="FundraiserControlOfFunds"/>
                          </xsl:call-template> 
                        </td>  
                        <td class="IRS990ScheduleG_TableCell" style="width:11mm;text-align:center;font-family:verdana;font-size:7pt; ">
                          <xsl:call-template name="PopulateNoBoxText">
                            <xsl:with-param name="TargetNode" select="FundraiserControlOfFunds"/>
                          </xsl:call-template> 
                        </td>      
                
                        <!-- Gross Receipts -->           
                        <td class="IRS990ScheduleG_TableCell" style="width:32mm;text-align:right;font-family:verdana;font-size:7pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="GrossReceipts"/>
                          </xsl:call-template> 
                        </td>      
    
                        <!-- Amount paid to fundraiser -->           
                        <td class="IRS990ScheduleG_TableCell" style="width:32mm;text-align:right;font-family:verdana;font-size:7pt;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="AmountRetainedByContractor"/>
                          </xsl:call-template> 
                        </td>   
                           
                        <!-- Amount paid to organization -->
                        <td class="IRS990ScheduleG_TableCell" style="width:32mm;text-align:right;font-family:verdana;font-size:7pt;border-right-width:0px">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="NetToOrganization"/>
                          </xsl:call-template> 
                        </td>      
                      </tr>
                    </xsl:for-each>
                  </xsl:if>
                  <tr>
                    <td style="width:91mm;border:black 0 solid;border-bottom-width:0;font-family:verdana;font-size:7pt;border-right-width:1;height:7mm;" colspan="4">
                      <span class="styBoldText" >Total </span>          
                      <span class="IRS990ScheduleG_Dotspacing">.................</span>
                      <img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/>
                    </td>
                    <td style="width:32mm;border:black 0 solid;border-bottom-width:0;font-family:verdana;font-size:7pt;width:34mm;text-align:right;padding-right:.5mm;border-right-width:1px;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/TotalGrossReceipts" />
                      </xsl:call-template>
                    </td>
                    <td style="width:32mm;border:black 0 solid;border-bottom-width:0;font-family:verdana;font-size:7pt;width:34mm;text-align:right;padding-right:.5mm;border-right-width:1px;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/TotalRetainedByContractors" />
                      </xsl:call-template>
                    </td>
                    <td style="width:32mm;border:black 0 solid;border-bottom-width:0;font-family:verdana;font-size:7pt;text-align:right;width:34mm;padding-right:.5mm;border-right-width:0px;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/TotalNetToOrganization" />
                      </xsl:call-template>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
  
            <xsl:call-template name="SetInitialDynamicTableHeight">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraiserActivityInformation"/>
              <xsl:with-param name="containerHeight" select="10"/>
              <xsl:with-param name="headerHeight" select="2"/>        
              <xsl:with-param name="containerID" select=" 'P1ctn' "/>
            </xsl:call-template>
  
            <!--  LINE 3  -->
            <!-- BEGIN Part I -  All States Registered or Licensed-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-weight:bold;width:5mm;padding-top:1mm;">3</div>
              <div class="styLNDesc" style="width:180mm;padding-left:0mm;padding-top:1mm;clear:both;float:right;padding-bottom:3mm;"> 
                List all states in which the organization is registered or licensed to solicit funds or has been notified it is exempt from registration or licensing.
              </div>
              <div class="styFixedUnderline" style="float:left;clear:none;width:187mm;border-bottom-style:dashed;">
                <xsl:for-each select="$Form990ScheduleGData/LicensedStates">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="."/>
                  </xsl:call-template>
                  <xsl:if test="not(position() = last())">,  </xsl:if>
                </xsl:for-each>
              </div>
              <div class="styFixedUnderline" style="float:left;clear:none;width:187mm;border-bottom-style:dashed;">
                <xsl:for-each select="$Form990ScheduleGData/AllStates">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="."/>
                  </xsl:call-template>
                </xsl:for-each>
              </div>
            </div>
            <!-- END TABLE FOR Licensed States -->
  
            <!-- footer line -->
            <div class="pageEnd" style="width:187mm;float:none;clear:both;">
              <div style="font-weight:bold;width:114mm;font-size:6pt;padding-top:1mm;float:left;border-top-width:0px;">
                For Privacy Act and Paperwork Reduction Act Notice, see the Instructions for Form 990.
              </div>
              <div style="width:20mm;padding-left:0mm;padding-top:1mm;font-size:6pt;float:left;">
                Cat. No. 50083H
              </div>
              <div style="width:51mm;font-size:6pt;text-align:right;padding-top:1mm;float:right;font-weight:bold;">
                Schedule G (Form 990 or 990-EZ) 2010
              </div>
            </div>
  
            <!-- PAGE 2 HEADER  -->
            <div class="styBB" style="width:187mm; padding-bottom:.5mm;">  
              <div style="float:left;">Schedule G (Form 990 or 990-EZ) 2010</div>
              <div style="float:right;">Page <span style="font-weight:bold;font-size:7pt;">2</span></div>                    
            </div> 
            <!-- END Page Header  -->  
  
            <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@##############################################################################################################-->
            <!--  BEGIN  PART II   EVENTS  -->
            <!-- BEGIN Part II Title -->
      
            <table class="styTable" style="font-size: 7pt;width:187mm;" cellspacing="0">
              <thead >
                <div class="styBB" style="width:187mm;">
                  <div class="styPartName" >Part II</div>
                  <div class="styPartDesc" style="width:170mm;padding-bottom:.5mm;"><b>Fundraising Events. </b> <span class="styNormalText">  Complete if the organization answered "Yes" to Form 990, Part IV, line 18, or reported more than $15,000 on Form 990-EZ, line 6a. List events with gross receipts greater than $5,000.  </span></div>
                </div>
                <!-- END Part II Title -->
      
                <!-- Begin Part II Table-->
                <tr>
                  <th style="width: 6mm; border-color: black; border-style: solid; border-right-width: 1px; border-left-width: 0px; border-bottom-width: 0px; border-top-width: 0px" scope="col">
                    <span style="width:1px;"/>
                  </th>
                  <th colspan="2">
                    <span style="width: 1px;"/>
                  </th>
                  <th class="styLNAmountBox" scope="col" style="width:32mm;height:10mm;padding-top:.5mm;text-align:center;">
                    <b>(a)</b>
                    <span class="styNormalText"> Event #1</span>
                    <br/>
                    <br/>
                    <span class="styIRS990ScheduleGUnderlinedBox" style="text-align:left;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/NameOfEvent1"/>
                      </xsl:call-template>
                    </span>
                    <br/>
                    <span class="styNormalText"> (event type)</span>
                  </th>
                  <th class="styLNAmountBox" scope="col" style=" width:32mm;vertical-align:top;padding-top:.5mm;text-align:center;">
                    <b>(b)</b>
                    <span class="styNormalText"> Event #2</span>
                    <br/>
                    <br/>
                    <span class="styIRS990ScheduleGUnderlinedBox" style="text-align:left;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/NameOfEvent2"/>
                      </xsl:call-template>
                    </span>
                    <br/>
                    <span class="styNormalText"> (event type)</span>
                  </th>
                  <th class="styLNAmountBox" scope="col" style="width:32mm;vertical-align:top;padding-top:1mm;text-align:center">
                    <b>(c)</b>
                    <span class="styNormalText"> Other Events<br/>
                      <br/>
                    </span>
                    <span class="styIRS990ScheduleGUnderlinedBox">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/TotalNumberOfOtherEvents"/>
                      </xsl:call-template>
                    </span>
                    <br/>
                    <span class="styNormalText"> (total number)</span>
                  </th>
                  <th class="styLNAmountBox" scope="col" style="width:32mm; border-right-width: 0px;vertical-align:top;text-align:center;padding-top:1mm;">
                    <b>(d)</b>
                    <span class="styNormalText"> Total Events<br/>(Add col. <b>(a) </b>through col. <b>(c)</b>)</span>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody valign="top">
              
                <!--   BEGIN PART II  LINE 1   -->
                <tr>
                  <td class="styIRS990ScheduleGVTImageBox" style="width:6mm;padding-top:0mm;border-bottom-width:1px;" rowspan="3">
                    <img src="{$ImagePath}/990SchG_Revenue.gif" alt="VerticalRevenue"/>
                  </td>
                  <td>
                    <span class="styLNLeftLtrBox" style="width: 5mm;text-align:left;padding-left:1.25mm;padding-top:2mm;">1</span>
                  </td>
                  <td class="styLNDesc" style="width: 50mm;padding-top:3mm;border-bottom-width:1px;">
                    Gross receipts 
                    <b>
                      <span class="styNBSP"/>.
                      <span class="styNBSP"/>.
                      <span class="styNBSP"/>.
                    </b>
                  </td>
                  <td class="styLNAmountBox" style="width: 32mm;padding-top:2mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/GrossReceiptsEvent1"/>
                    </xsl:call-template>
                  </td>
                  <td class="styLNAmountBox" style="width: 32mm;padding-top:2mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/GrossReceiptsEvent2"/>
                    </xsl:call-template>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm;text-align:right;padding-top:2mm;">
                    <span class="styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/GrossReceiptsOtherEvents"/>
                    </xsl:call-template>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm; border-right-width:0px; text-align:right;padding-top:2mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/GrossReceiptsTotal"/>
                    </xsl:call-template>
                  </td>
                </tr>
                
                <!-- PART  II    Line 2  -->
                <tr>
                  <td>
                    <span class="styLNLeftLtrBox" style="width: 5mm;text-align:left;padding-left:1mm;">2</span>
                  </td>
                  <td class="styLNDesc" style="width: 50mm">
                    Less: Charitable<br/>
                    contributions
                    <b>
                      <span class="styNBSP"/>.
                      <span class="styNBSP"/>.
                      <span class="styNBSP"/>.
                    </b>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm;text-align:right;padding-top:2mm;">
                    <span class="styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/CharitableContributionsEvent1"/>
                    </xsl:call-template>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm;text-align:right;padding-top:2mm;">
                    <span class="styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/CharitableContributionsEvent2"/>
                    </xsl:call-template>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm;text-align:right;padding-top:2mm;">
                    <span class="styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/CharitableContribOtherEvents"/>
                    </xsl:call-template>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm; border-right-width:0px; text-align:right;padding-top:2mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/CharitableContributionsTotal"/>
                    </xsl:call-template>
                  </td>
                </tr>
                <!--   END LINE 2   -->
                
                <!--  START LINE 3  -->
                <tr>
                  <td style="border-color:black; border-style:solid; border-bottom-width: 1px; border-top-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <span class="styLNLeftNumBoxSD" style="padding-left:1mm;">3</span>
                  </td>
                  <td class="styLNDesc" style="border-color: black; border-style:solid; border-left-width: 0px; border-right-width: 0px; height:5mm;border-top-width: 0px; width: 50mm; border-bottom-width: 1px">
                    Gross income (line 1 <br/>minus line 2)
                    <b>
                      <span class="styNBSP"/>.
                      <span class="styNBSP"/>.
                      <span class="styNBSP"/>.
                    </b>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm;text-align:right;height:5mm;padding-top:2mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/GrossRevenueEvent1"/>
                    </xsl:call-template>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm;text-align:right;padding-top:2mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/GrossRevenueEvent2"/>
                    </xsl:call-template>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm;text-align:right;padding-top:2mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/GrossRevenueOtherEvents"/>
                    </xsl:call-template>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm; border-right-width:0px;text-align:right;padding-top:2mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/GrossRevenueTotalEvents"/>
                    </xsl:call-template>
                  </td>
                </tr>
                
                <!--   PART II  Lines 4 - 9 -->
                <tr>
                  <td class="styIRS990ScheduleGVTImageBox" rowspan="8" style="width: 6mm; padding-top:10mm;border-bottom-width:0px;">
                    <img src="{$ImagePath}/990SchG_DirectExpenses.gif" alt="VerticalDirectExpenses"/>
                  </td>
                  <td>
                    <span class="styLNLeftLtrBox" style="width: 5mm;padding-top:2mm;text-align:left;padding-left:1.25mm;">4</span>
                  </td>
                  <td class="styLNDesc" style="width: 50mm;padding-top:2mm;">
                    Cash prizes
                    <b>
                      <span class="styNBSP"/>.
                      <span class="styNBSP"/>.
                      <span class="styNBSP"/>.
                    </b>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm;text-align:right;padding-top:2mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/CashPrizesEvent1"/>
                    </xsl:call-template>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm;text-align:right;padding-top:2mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/CashPrizesEvent2"/>
                    </xsl:call-template>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm;text-align:right;padding-top:2mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/CashPrizesOtherEvents"/>
                    </xsl:call-template>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm; border-right-width:0px;text-align:right;padding-top:2mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/CashPrizesTotalEvents"/>
                    </xsl:call-template>
                  </td>
                </tr>
                
                <!-- PART II   Line 5 -->
                <tr>
                  <td>
                    <span class="styLNLeftLtrBox" style="width: 5mm;padding-top:2mm;text-align:left;padding-left:1.25mm;">5</span>
                  </td>
                  <td class="styLNDesc" style="width: 50mm;padding-top:2mm;">
                    Non-cash prizes
                    <b>
                      <span class="styNBSP"/>.
                      <span class="styNBSP"/>.
                    </b>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm;text-align:right;padding-top:2mm;">
                    <span class="styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/NonCashPrizesEvent1"/>
                    </xsl:call-template>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm;text-align:right;padding-top:2mm;">
                    <span class="styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/NonCashPrizesEvent2"/>
                    </xsl:call-template>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm;text-align:right;padding-top:2mm;">
                    <span class="styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/NonCashPrizesOtherEvents"/>
                    </xsl:call-template>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm; border-right-width:0px; text-align:right;padding-top:2mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/NonCashPrizesTotalEvents"/>
                    </xsl:call-template>
                  </td>
                </tr>
                
                <!-- PART II   Line 6 -->
                <tr>
                  <td>
                    <span class="styLNLeftLtrBox" style="width: 5mm;padding-top:2mm;text-align:left;padding-left:1.25mm;">6</span>
                  </td>
                  <td class="styLNDesc" style="width: 50mm;padding-top:2mm;">
                    Rent/facility costs
                    <b>
                      <span class="styNBSP"/>.
                      <span class="styNBSP"/>.
                    </b>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm;text-align:right;padding-top:2mm;">
                    <span class="styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/RentFacilityCostsEvent1"/>
                    </xsl:call-template>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm;text-align:right;padding-top:2mm;">
                    <span class="styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/RentFacilityCostsEvent2"/>
                    </xsl:call-template>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm;text-align:right;padding-top:2mm;">
                    <span class="styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/RentFacilityCostsOtherEvents"/>
                    </xsl:call-template>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm; border-right-width:0px;text-align:right;padding-top:2mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/RentFacilityCostsTotalEvents"/>
                    </xsl:call-template>
                  </td>
                </tr>
                
                <!-- PART II  Line 7  -->
                <tr>
                  <td>
                    <span class="styLNLeftLtrBox" style="width: 5mm;text-align:left;padding-top:2mm;padding-left:1.25mm;">7</span>
                  </td>
                  <td class="styLNDesc" style="width: 50mm;padding-top:2mm;">
                    Food and beverages
                    <b>
                      <span class="styNBSP"/>.
                      <span class="styNBSP"/>.
                    </b>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm;text-align:right;padding-top:2mm;">
                    <span class="styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/FoodAndBeverageEvent1"/>
                    </xsl:call-template>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm;text-align:right;padding-top:2mm;">
                    <span class="styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/FoodAndBeverageEvent2"/>
                    </xsl:call-template>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm;text-align:right;padding-top:2mm;">
                    <span class="styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/FoodAndBeverageOtherEvents"/>
                    </xsl:call-template>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm; border-right-width:0px;text-align:right;padding-top:2mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/FoodAndBeverageTotalEvents"/>
                    </xsl:call-template>
                  </td>
                </tr>
                
                  <!-- PART II  Line 8  -->
                <tr>
                  <td>
                    <span class="styLNLeftLtrBox" style="width: 5mm;text-align:left;padding-top:2mm;padding-left:1.25mm;">8</span>
                  </td>
                  <td class="styLNDesc" style="width: 50mm;padding-top:2mm;">Entertainment
                    <b>
                      <span class="styNBSP"/>.
                      <span class="styNBSP"/>.
                      <span class="styNBSP"/>.
                    </b>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm;text-align:right;padding-top:2mm;">
                    <span class="styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/EntertainmentEvent1"/>
                    </xsl:call-template>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm;text-align:right;padding-top:2mm;">
                    <span class="styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/EntertainmentEvent2"/>
                    </xsl:call-template>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm;text-align:right;padding-top:2mm;">
                    <span class="styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/EntertainmentOtherEvents"/>
                    </xsl:call-template>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm; border-right-width:0px;text-align:right;padding-top:2mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/EntertainmentTotalEvents"/>
                    </xsl:call-template>
                  </td>
                </tr>
  
                <!-- PART II  Line 9  -->
                <tr>
                  <td>
                    <span class="styLNLeftLtrBox" style="width: 5mm;text-align:left;padding-top:2mm;padding-left:1.25mm;">9</span>
                  </td>
                  <td class="styLNDesc" style="width: 50mm;padding-top:2mm;">
                    Other direct expenses
                    <b>
                      <span class="styNBSP"/>.
                    </b>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm;text-align:right;padding-top:2mm;">
                    <span class="styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/OtherDirectExpensesEvent1"/>
                    </xsl:call-template>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm;text-align:right;padding-top:2mm;">
                    <span class="styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/OtherDirectExpensesEvent2"/>
                    </xsl:call-template>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm;text-align:right;padding-top:2mm;">
                    <span class="styTableCellPad"/>
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/OtherDirectExpensesOtherEvents"/>
                    </xsl:call-template>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm; border-right-width:0px;text-align:right;padding-top:2mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/OtherDirectExpensesTotalEvents"/>
                    </xsl:call-template>
                  </td>
                </tr>
  
                <!--  PART II  Line 10 -->
                <tr>
                  <td>
                    <span class="styLNLeftLtrBox" style="width: 5mm;padding-top:3mm;text-align:left;padding-left:.25mm;">10</span>
                  </td>
                  <td style="height:7mm;padding-top:3mm;" colspan="4">
                    <span class="styNormalText" style="font-size:7pt;">Direct expense summary. Add lines 4 through 9 in column (d) </span>
                    <span class="IRS990ScheduleG_Dotspacing">........... </span>
                    <img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm; border-right-width:0px;text-align:right;padding-top:2mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/DirectExpenseSummaryEvents"/>
                    </xsl:call-template>
                  </td>
                </tr>
                
                <!--  PART II  Line 11  -->
                <tr>
                  <td>
                    <span class="styLNLeftLtrBox" style="width: 5mm;padding-top:.5mm;text-align:left;padding-left:.25mm;">11</span>
                  </td>
                  <td style="height:4mm;padding-top:.5mm;" colspan="4">
                    <span class="styNormalText" style="font-size:7pt;">Net income summary. Combine lines 3 and 10 in column (d)</span>
                    <span class="IRS990ScheduleG_Dotspacing">............ </span>
                    <img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/>
                  </td>
                  <td class="styLNAmountBox" style="width:32mm; border-right-width:0px;text-align:right;border-bottom-width:0px;padding-top:2mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EventsInformation/NetIncomeSummary"/>
                    </xsl:call-template>
                  </td>
                </tr>
              </tbody>
            </table>
  
            <!--  PART III   GAMING   -->
            <!-- BEGIN Part III Title -->
            <table class="styTable" style="font-size: 7pt;width:187mm;" cellspacing="0">
              <thead >
                <div class="styBB" style="width:187mm;border-top-width:2px;">
                  <div class="styPartName" style="padding-bottom:.5mm;">Part III</div>
                  <div class="styPartDesc" style="width:170mm;padding-bottom:.5mm;"><b>Gaming. </b> 
                    <span class="styNormalText">
                      Complete if the organization answered "Yes" to Form 990, Part IV, line 19, or reported more than $15,000 on Form 990-EZ, line 6a. 
                    </span>
                  </div>
                </div>
                <tr>
                  <th class="styIRS990ScheduleGVTImageBox" style="width:6mm;padding-top:1mm;border-bottom-width:0px;" rowspan="1" scope="col">
                    <img src="{$ImagePath}/990SchG_Revenue.gif" alt="VerticalRevenue"/>
                  </th>
                  <th colspan="2" >
                    <span style="width: 1px;"/>
                  </th>               
                  <th class="styLNAmountBox" scope="col" style="width:32mm; border-right-width: 0px;vertical-align:top;text-align:center;padding-top:1mm;" >
                    <b>(a)</b><span class="styNormalText"> Bingo</span>
                  </th>
                  <th class="styLNAmountBox" scope="col" style="width:32mm; border-right-width: 0px;vertical-align:top;text-align:center;padding-top:1mm;font-size:6.5pt;" >
                    <b>(b)</b><span class="styNormalText"> Pull tabs/Instant<br />bingo/progressive bingo</span>
                  </th>
                  <th class="styLNAmountBox" scope="col" style="width:32mm; border-right-width: 0px;vertical-align:top;text-align:center;padding-top:1mm;" >
                    <b>(c)</b><span class="styNormalText"> Other gaming</span>
                  </th>
                  <th class="styLNAmountBox" scope="col" style="font-size:6.5pt;width:32mm; border-right-width: 0px;vertical-align:top;text-align:center;padding-top:1mm;">
                    <b>(d)</b><span class="styNormalText"> Total gaming (Add col. <b>(a)</b> through col. <b>(c)</b>)</span>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody valign="top">
              
                <!--   BEGIN PART III  LINE 1   -->
                <tr>
                  <td style="height:0mm;width: 6mm; border-color: black; border-style: solid; border-right-width: 1px; border-left-width: 0px; border-bottom-width: 1px; border-top-width: 0px">
                    <span style="width:1px;"/>
                  </td>
                  <td style="border-color:black; border-style:solid; border-bottom-width: 1px; border-top-width: 0px; border-left-width: 0px; border-right-width: 0px">
                    <span class="styLNLeftLtrBox" style="width: 5mm;text-align:left;padding-left:1.25mm;padding-top:0mm;">1</span>
                  </td>
                  <td class="styLNDesc" style="border-color: black; border-style:solid; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; width: 50mm; border-bottom-width: 1px">
                    Gross revenue 
                    <b>
                      <span class="styNBSP"/>.
                      <span class="styNBSP"/>.
                      <span class="styNBSP"/>.
                      <span class="styNBSP"/>.
                    </b>
                  </td>
                  <td class="styLNAmountBox" style="width: 32mm;">
                    <xsl:call-template name="PopulateAmount">                  
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/GrossRevenueBingo"/>
                    </xsl:call-template>
                  </td>
                  <td class="styLNAmountBox" style="width: 32mm;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/GrossRevenuePullTabs"/>
                    </xsl:call-template>
                  </td>
                 <td class="styLNAmountBox" style="width:32mm;text-align:right;" > 
                  <span class ="styTableCellPad"></span>
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/GrossRevenueOtherGaming" />
                  </xsl:call-template>
                </td>      
                <td class="styLNAmountBox" style="width:32mm; border-right-width:0px; text-align:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/GrossRevenueTotalGaming" />
                  </xsl:call-template>
                </td>
              </tr>
  
              <!--  PART III   Line 2  -->
              <tr>
                <td class="styIRS990ScheduleGVTImageBox" style="width:6mm;padding-top:2mm;border-bottom-width:1px;" rowspan="4" >
                  <img src="{$ImagePath}/990SchG_DirectExpenses.gif" alt="VerticalDirectExpenses"/>
                </td>
                <td>
                  <span class="styLNLeftLtrBox" style="width: 5mm;padding-top:2mm;text-align:left;padding-left:1.25mm;">2</span>  
                </td>
                <td class="styLNDesc" style="width: 50mm;padding-top:2mm;border-bottom-width:1px;">
                  Cash prizes
                  <b>
                    <span class="styNBSP"/>.
                    <span class="styNBSP"/>.
                    <span class="styNBSP"/>.
                    <span class="styNBSP"/>.
                  </b>
                </td>
                <td class="styLNAmountBox" style="width: 32mm;">
                  <xsl:call-template name="PopulateAmount">                  
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/CashPrizesBingo"/>
                    </xsl:call-template>
                </td>
                <td class="styLNAmountBox" style="width: 32mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/CashPrizesPullTabs"/>
                  </xsl:call-template>
                </td>
               <td class="styLNAmountBox" style="width:32mm;text-align:right;" > 
                <span class ="styTableCellPad"></span>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/CashPrizesOtherGaming" />
                </xsl:call-template>
              </td>      
              <td class="styLNAmountBox" style="width:32mm; border-right-width:0px; text-align:right;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/CashPrizesTotalGaming" />
                </xsl:call-template>
              </td>
            </tr>
  
            <!--  PART III   Line 3  -->
            <tr>
            <td>
              <span class="styLNLeftLtrBox" style="width: 5mm;padding-top:2mm;text-align:left;padding-left:1.25mm;">3</span>        
            </td>
            <td class="styLNDesc" style="width: 50mm;padding-top:2mm;border-bottom-width:1px;">
              Non-cash prizes
              <b>
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                </b>
            </td>
            <td class="styLNAmountBox" style="width: 32mm;">
              <xsl:call-template name="PopulateAmount">                  
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/NonCashPrizesBingo"/>
              </xsl:call-template>
            </td>
            <td class="styLNAmountBox" style="width: 32mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/NonCashPrizesPullTabs"/>
              </xsl:call-template>
            </td>
            <td class="styLNAmountBox" style="width:32mm;text-align:right;" > 
              <span class ="styTableCellPad"></span>
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/NonCashPrizesOtherGaming" />
              </xsl:call-template>
            </td>      
            <td class="styLNAmountBox" style="width:32mm; border-right-width:0px; text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/NonCashPrizesTotalGaming" />
              </xsl:call-template>
            </td>
          </tr>
  
          <!--  PART III   Line 4  -->
          <tr>
            <td>
              <span class="styLNLeftLtrBox" style="width: 5mm;padding-top:2mm;text-align:left;padding-left:1.25mm;">4</span>        
            </td>
            <td class="styLNDesc" style="width: 50mm;padding-top:2mm;border-bottom-width:1px;">
              Rent/facility costs
              <b>
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
                <span class="styNBSP"/>.
              </b>
            </td>
            <td class="styLNAmountBox" style="width: 32mm;">
              <xsl:call-template name="PopulateAmount">                  
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/RentFacilityCostsBingo"/>
              </xsl:call-template>
            </td>
            <td class="styLNAmountBox" style="width: 32mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/RentFacilityCostsPullTabs"/>
                </xsl:call-template>
              </td>
              <td class="styLNAmountBox" style="width:32mm;text-align:right;" > 
                <span class ="styTableCellPad"></span>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/RentFacilityCostsOtherGaming" />
                </xsl:call-template>
              </td>      
              <td class="styLNAmountBox" style="width:32mm; border-right-width:0px; text-align:right;">
                <xsl:call-template name="PopulateAmount">
                 <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/RentFacilityCostsTotalGaming" />
                </xsl:call-template>
              </td>
            </tr>
  
            <!--  PART III   Line 5  -->
            <tr>
              <td style="border-color:black; border-style:solid; border-bottom-width: 1px; border-top-width: 0px; border-left-width: 0px; border-right-width: 0px">
                <span class="styLNLeftLtrBox" style="width: 5mm;padding-top:2mm;text-align:left;padding-left:1.25mm;">5</span>  
              </td>
              <td class="styLNDesc" style="border-color: black; border-style:solid; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; width: 50mm; border-bottom-width: 1px;padding-top:2mm;">
                Other direct expenses
                <b>
                  <span class="styNBSP"/>.
                  <span class="styNBSP"/>.
                </b>
              </td>
              <td class="styLNAmountBox" style="width: 32mm;">
                <xsl:call-template name="PopulateAmount">                  
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/OtherDirectExpensesBingo"/>
                </xsl:call-template>
              </td>
              <td class="styLNAmountBox" style="width: 32mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/OtherDirectExpensesPullTabs"/>
                </xsl:call-template>
              </td>
              <td class="styLNAmountBox" style="width:32mm;text-align:right;" > 
                <span class ="styTableCellPad"></span>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/OtherDirectExpensesOtherGaming" />
                </xsl:call-template>
              </td>      
              <td class="styLNAmountBox" style="width:32mm; border-right-width:0px; text-align:right;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/OtherDirectExpensesTotalGaming" />
                </xsl:call-template>
              </td>
            </tr>
        
            <!--  PART III   Line 6   Yes/No boxes for Line 6 -->
            <tr>
              <td style="width: 6mm; border-color: black; border-style: solid; border-right-width: 1px; border-left-width: 0px; border-bottom-width: 0px; border-top-width: 0px">
                <span style="width:1px;"/>
              </td>
              <td>
                <span class="styLNLeftLtrBox" style="width: 5mm;padding-top:2mm;text-align:left;padding-left:1.25mm;">6</span>  
              </td>
              <td class="styLNDesc" style="width: 50mm;padding-top:2mm;border-bottom-width:1px;">
                Volunteer labor
                <b>
                  <span class="styNBSP"/>.
                  <span class="styNBSP"/>.
                  <span class="styNBSP"/>.
                </b>
              </td>
  
              <!-- Line 6  col a  -->
              <td class="styLNAmountBox" style="width: 32mm;height:8mm;">
                <table style="width:32mm;font-size:7pt;">
                  <tbody>
                    <tr>
                      <td style="width:5mm;text-align:center;">
                        <xsl:call-template name="PopulateSpan">
                          <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/VolunteerLaborBingo"/>
                        </xsl:call-template>
                        <span style="">
                          <input type="checkbox" class="styCkbox" name="Checkbox">
                            <xsl:call-template name="PopulateYesCheckbox">
                              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/VolunteerLaborBingo"/>
                              <xsl:with-param name="BackupName">VolunteerLaborBingo</xsl:with-param>
                            </xsl:call-template>
                          </input>
                        </span>
                      </td> 
                      <td style="width:27mm"> 
                        <label>
                          <xsl:call-template name="PopulateLabelYes">
                            <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/VolunteerLaborBingo"/>
                            <xsl:with-param name="BackupName">VolunteerLaborBingo</xsl:with-param>
                          </xsl:call-template>
                          Yes
                        </label>
                        <span  class="styIRS990ScheduleGUnderlinedText" style="padding-right:1mm;text-align: right;width:17mm;border-style: dashed;">  
                          <xsl:call-template name="PopulatePercent">
                            <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/VolunteerLaborPercentageBingo" />
                          </xsl:call-template>
                        </span>
                      </td> 
                    </tr>
                    <tr>
                      <td style="width:5mm;text-align:center;">
                        <xsl:call-template name="PopulateSpan">
                          <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/VolunteerLaborBingo"/>
                        </xsl:call-template>    
                        <span style="">
                          <input type="checkbox" class="styCkbox" name="Checkbox">
                            <xsl:call-template name="PopulateNoCheckbox">
                              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/VolunteerLaborBingo"/>
                              <xsl:with-param name="BackupName">VolunteerLaborBingo</xsl:with-param>
                            </xsl:call-template>
                          </input>
                        </span>
                      </td> 
                      <td style="width:27mm"> 
                        <label>
                          <xsl:call-template name="PopulateLabelNo">
                            <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/VolunteerLaborBingo"/>
                            <xsl:with-param name="BackupName">VolunteerLaborBingo</xsl:with-param>
                          </xsl:call-template>
                          No
                        </label>
                      </td> 
                    </tr>
                  </tbody>
                </table>
              </td>
        
              <!-- Line 6  col b  -->      
              <td class="styLNAmountBox" style="width: 32mm;height:8mm;">
                <table style="width:32mm;font-size:7pt;">
                  <tbody>
                    <tr>
                      <td style="width:5mm;text-align:center;">
                        <xsl:call-template name="PopulateSpan">
                          <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/VolunteerLaborPullTabs"/>
                        </xsl:call-template>
                        <span style="">
                          <input type="checkbox" class="styCkbox" name="Checkbox">
                            <xsl:call-template name="PopulateYesCheckbox">
                              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/VolunteerLaborPullTabs"/>
                              <xsl:with-param name="BackupName">VolunteerLaborPullTabs</xsl:with-param>
                            </xsl:call-template>
                          </input>
                        </span> 
                      </td> 
                      <td style="width:27mm">          
                        <label>
                          <xsl:call-template name="PopulateLabelYes">
                            <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/VolunteerLaborPullTabs"/>
                            <xsl:with-param name="BackupName">VolunteerLaborPullTabs</xsl:with-param>
                          </xsl:call-template>
                          Yes
                        </label>
                        <span  class="styIRS990ScheduleGUnderlinedText" style="padding-right:1mm;text-align: right;width:17mm;border-style: dashed;">  
                          <xsl:call-template name="PopulatePercent">
                            <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/VolunteerLaborPrcntagePullTabs" />
                          </xsl:call-template>
                        </span>
                      </td> 
                    </tr>
                    <tr>
                      <td style="width:5mm;text-align:center;">
                        <xsl:call-template name="PopulateSpan">
                          <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/VolunteerLaborPullTabs"/>
                        </xsl:call-template>
                        <span style="">
                          <input type="checkbox" class="styCkbox" name="Checkbox">
                            <xsl:call-template name="PopulateNoCheckbox">
                              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/VolunteerLaborPullTabs"/>
                              <xsl:with-param name="BackupName">VolunteerLaborPullTabs</xsl:with-param>
                            </xsl:call-template>
                          </input>
                        </span>
                      </td> 
                      <td style="width:27mm">     
                        <label>
                          <xsl:call-template name="PopulateLabelNo">
                            <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/VolunteerLaborPullTabs"/>
                            <xsl:with-param name="BackupName">VolunteerLaborPullTabs</xsl:with-param>
                          </xsl:call-template>
                          No
                        </label>
                      </td> 
                    </tr>
                  </tbody>
                </table>
              </td>
        
              <!--   Line 6 col c  -->     
              <td class="styLNAmountBox" style="width: 32.5mm;height:8mm;">
                <table style="width:32mm;font-size:7pt;">
                  <tbody>
                    <tr>
                      <td style="width:5mm;text-align:center;">
                        <xsl:call-template name="PopulateSpan">
                          <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/VolunteerLaborOtherGaming"/>
                        </xsl:call-template>
                        <span style="">
                          <input type="checkbox" class="styCkbox" name="Checkbox">
                            <xsl:call-template name="PopulateYesCheckbox">
                              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/VolunteerLaborOtherGaming"/>
                              <xsl:with-param name="BackupName">VolunteerLaborPullTabs</xsl:with-param>
                            </xsl:call-template>
                          </input>
                        </span>  
                      </td> 
                      <td style="width:27mm">         
                        <label>
                          <xsl:call-template name="PopulateLabelYes">
                            <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/VolunteerLaborOtherGaming"/>
                            <xsl:with-param name="BackupName">VolunteerLaborPullTabs</xsl:with-param>
                          </xsl:call-template>
                          Yes
                        </label>
                        <span  class="styIRS990ScheduleGUnderlinedText" style="padding-right:1mm;text-align: right;width:17mm;border-style: dashed;">  
                          <xsl:call-template name="PopulatePercent">
                            <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/VolunteerLaborPrcntOtherGaming" />
                          </xsl:call-template>
                        </span>
                      </td> 
                    </tr>
                    <tr>
                      <td style="width:5mm;text-align:center;">
                        <xsl:call-template name="PopulateSpan">
                          <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/VolunteerLaborOtherGaming"/>
                        </xsl:call-template>
                        <span style="">
                          <input type="checkbox" class="styCkbox" name="Checkbox">
                            <xsl:call-template name="PopulateNoCheckbox">
                              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/VolunteerLaborOtherGaming"/>
                              <xsl:with-param name="BackupName">VolunteerLaborOtherGaming</xsl:with-param>
                            </xsl:call-template>
                          </input>
                        </span>
                      </td> 
                      <td style="width:27mm">  
                        <label>
                          <xsl:call-template name="PopulateLabelNo">
                            <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/VolunteerLaborOtherGaming"/>
                            <xsl:with-param name="BackupName">VolunteerLaborOtherGaming</xsl:with-param>
                          </xsl:call-template>
                          No
                        </label>
                      </td> 
                    </tr>
                  </tbody>
                </table>
              </td>
              <td class="styShadingCell" style="width:32mm;height:6mm; border-left-width:1px;border-right-width:1px;border-bottom-width:1px;border-color:black; ">
                <!-- <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/OtherDirectExpensesTotalGaming" />
                </xsl:call-template>-->
              </td>
            </tr>
  
            <!--  PART III   Line 7  -->
            <tr>
              <td style="width: 6mm; border-color: black; border-style: solid; border-right-width: 1px; border-left-width: 0px; border-bottom-width: 0px; border-top-width: 0px">
                <span style="width:1px;"/>
              </td>         
              <td>
                <span class="styLNLeftLtrBox" style="width: 5mm;padding-top:3mm;text-align:left;padding-left:1.25mm;">7</span>
              </td>
              <td style="height:7mm;padding-top:3mm;" colspan="4">
                <span class="styNormalText" style="font-size:7pt;">Direct expense summary. Add lines 2 through 5 in column (d) </span>          
                <span class="IRS990ScheduleG_Dotspacing">........... </span>
                <img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/>
              </td>
              <td class="styLNAmountBox" style="width:32mm; border-top-width:1px;border-right-width:0px;text-align:right;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/DirectExpenseSummaryGaming" />
                </xsl:call-template>
              </td>
            </tr>
      
            <!--  PART III   Line 8  -->
            <tr>
              <td style="width: 6mm; border-color: black; border-style: solid; border-right-width: 1px; border-left-width: 0px; border-bottom-width: 1px; border-top-width: 0px">
                <span style="width:1px;"/>
              </td>    
              <td class="styLNLeftLtrBoxBB" style="width: 5mm;padding-top:3mm;text-align:left;padding-left:1.25mm;font-weight:bold;">8
              </td>
              <td class="styBB" style="padding-top:3mm;" colspan="4">
                <span class="styNormalText" style="font-size:7pt;">Net gaming income summary. Combine lines 1 and 7 in column (d) </span>          
                <span class="IRS990ScheduleG_Dotspacing"> .......... </span>
                <img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/>
              </td>
              <td class="styLNAmountBox" style="width:32mm; border-right-width:0px;text-align:right;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformation/NetGamingIncomeSummary" />
                </xsl:call-template>
              </td>
            </tr>
          </tbody>
        </table>

     <!-- LINE 9  -->
    <div style="width:187mm;">
      <span style="height:2mm; width:84mm;"/>
      <div class="styLNLeftNumBox" style="width:8mm;padding-bottom:.5mm;padding-left:1mm;font-size:7pt;">9</div>
      <div class="styLNDesc" style="width:179mm;padding-top:.5mm;padding-bottom:0mm;font-size:7pt;">
        <span class="styNormalText">
          Enter the state(s) in which the organization operates gaming activities: </span>
          <span class="styIRS990ScheduleGUnderlinedText" style="font-size: 7pt; width:84mm;text-align: left">
            <xsl:if test="($Print = $Separated) and (count($Form990ScheduleGData/StatesWhereGamingConducted) &gt;8)">
              <xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/StatesWhereGamingConducted" />
              </xsl:call-template>
            </xsl:if>
            <xsl:if test="($Print != $Separated) or (($Print = $Separated) and (count($Form990ScheduleGData/StatesWhereGamingConducted) &lt;9))">
              <xsl:for-each select="$Form990ScheduleGData/StatesWhereGamingConducted">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="." />
                </xsl:call-template>
                <xsl:if test="position()!=last()">
                  , <span style="width: 1mm"></span>    
                </xsl:if>
              </xsl:for-each>
            </xsl:if>
          </span>
     </div>
    </div>

    
    <!-- Line 9a  -->
      <div style="width:187mm;" >
        <div class="styLNLeftNumBox" style="height:5mm;padding-top:1mm;padding-left:3mm;">a</div>
        <div class="styLNDesc" style="width:155mm;height:5mm;vertical-align:bottom;padding-top:1mm;padding-bottom:0mm;font-size:7pt;">
          <span class="styNormalText">
            Is the organization licensed to operate gaming activities in each of these states?
            <span style="letter-spacing:3mm; font-weight:bold; font-size:7pt; margin-left:2mm;">............</span>
          </span>
        </div>
             
        <div style="height:5mm;padding-top:1mm;font-size:7pt;vertical-align:center;">
          <span>
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/Licensed"/>
            </xsl:call-template>
            <input type="checkbox" class="IRS990ScheduleG_Checkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/Licensed"/>
              </xsl:call-template>
            </input>
          </span>
          <span style="width:0.5mm;"/>
          <label>
            <xsl:call-template name="PopulateLabelYes">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/Licensed"/>
            </xsl:call-template>
            <span>Yes</span>
          </label>
          <span style="width:2mm;"/>
          <span>
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/Licensed"/>
            </xsl:call-template>
            <input type="checkbox" class="IRS990ScheduleG_Checkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/Licensed"/>
              </xsl:call-template>
            </input>
          </span>
          <span style="width:0.5mm;"/>
          <label>
            <xsl:call-template name="PopulateLabelNo">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/Licensed"/>
            </xsl:call-template>
            <span>No</span>
          </label>
        </div>
      </div>


<!--  Line 9b  --> 
  <div style="width:187mm">
     <div class="styLNLeftNumBox" style="height:3mm;padding-left:3mm;">b</div>
       <div class="styLNDesc" style="width:178mm;height:3mm;padding-top:.25mm;padding-bottom:0mm;">
        If "No," Explain:
        <span class="styIRS990ScheduleGUnderlinedText" style="width:155mm;"/>
      </div>

      <div class="IRS990ScheduleG_LineContainer" style="height:4mm">
      <div class="IRS990ScheduleG_LineIndex"></div>
      <div class="IRS990ScheduleG_LineDesc" style="width:178mm;border-bottom-style:dashed;border-bottom-width:1px;border-right-width:0px;">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/ExplanationIfNo"/>
        </xsl:call-template>
      </div>
    </div>
 <xsl:if test="string-length($Form990ScheduleGData/ExplanationIfNo) &lt;1">
   <div class="IRS990ScheduleG_LineContainer">
    <div class="IRS990ScheduleG_LineIndex"></div>
    <div class="IRS990ScheduleG_LineDesc" style="width:178mm;border-bottom-style:dashed;border-bottom-width:1px;"></div>
</div>
</xsl:if>
</div>


<!-- LINE  10a  -->

 <div style="width:187mm">
      <div class="styLNLeftNumBox" style="height:3mm;padding-top:1mm;padding-left:0mm;">10a</div>
      <div class="styLNDesc" style="width:155mm;height:3mm;padding-top:1mm;padding-bottom:0mm;font-size:7pt;">
        <span class="styNormalText">
          Were any of the organization's gaming licenses revoked, suspended or terminated during the tax year?
            <span style="letter-spacing:3mm; font-weight:bold; font-size:7pt; margin-left:2mm;">.....</span>
        </span>
      </div>
      <div style="height:5mm;padding-top:1mm;font-size:7pt;vertical-align:center;">
          <span>
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/LicenseSuspendedEtc"/>
            </xsl:call-template>
            <input type="checkbox" class="IRS990ScheduleG_Checkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/LicenseSuspendedEtc"/>
              </xsl:call-template>
            </input>
          </span>
          <span style="width:0.5mm;"/>
          <label>
            <xsl:call-template name="PopulateLabelYes">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/LicenseSuspendedEtc"/>
            </xsl:call-template>
            <span>Yes</span>
          </label>
          <span style="width:2mm;"/>
          <span>
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/LicenseSuspendedEtc"/>
            </xsl:call-template>
            <input type="checkbox" class="IRS990ScheduleG_Checkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/LicenseSuspendedEtc"/>
              </xsl:call-template>
            </input>
          </span>
          <span style="width:0.5mm;"/>
          <label>
            <xsl:call-template name="PopulateLabelNo">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/LicenseSuspendedEtc"/>
            </xsl:call-template>
            <span>No</span>
          </label>
        </div>  
</div>

<!--  Line 10b  --> 
  <div style="width:187mm">
     <div class="styLNLeftNumBox" style="height:3mm;padding-left:3mm;">b</div>
       <div class="styLNDesc" style="width:178mm;height:3mm;padding-top:.25mm;padding-bottom:0mm;">
         If "Yes," Explain:
        <span class="styIRS990ScheduleGUnderlinedText" style="width:154mm;"/>
     </div>

      <div class="IRS990ScheduleG_LineContainer" style="height:4mm">
      <div class="IRS990ScheduleG_LineIndex"></div>
      <div class="IRS990ScheduleG_LineDesc" style="width:178mm;border-bottom-style:dashed;border-bottom-width:1px;border-right-width:0px;">
       <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/ExplanationIfYes"/>
      </xsl:call-template>
  </div>
 </div>
 <xsl:if test="string-length($Form990ScheduleGData/ExplanationIfYes) &lt;1">
   <div class="IRS990ScheduleG_LineContainer">
    <div class="IRS990ScheduleG_LineIndex"></div>
    <div class="IRS990ScheduleG_LineDesc" style="width:178mm;border-bottom-style:dashed;border-bottom-width:1px;"></div>
</div>
</xsl:if>
</div>

  <!-- Line 11  -->
      <div style="width:187mm">
      <div class="styLNLeftNumBox" style="height:3mm;padding-left:0mm;padding-top:1mm;">11</div>
      <div class="styLNDesc" style="width:155mm;height:3mm;padding-top:1mm;padding-bottom:0mm;">
        <span class="styNormalText">
          Does the organization operate gaming activities with nonmembers? <span style="letter-spacing:3mm; font-weight:bold; margin-left:2mm;">.................</span>
        </span></div>
        <div style="height:5mm;padding-top:1mm;font-size:7pt;vertical-align:center;">
          <span>
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingWithNonmembers"/>
            </xsl:call-template>
            <input type="checkbox" class="IRS990ScheduleG_Checkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingWithNonmembers"/>
              </xsl:call-template>
            </input>
          </span>
          <span style="width:0.5mm;"/>
          <label>
            <xsl:call-template name="PopulateLabelYes">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingWithNonmembers"/>
            </xsl:call-template>
            <span>Yes</span>
          </label>
          <span style="width:2mm;"/>
          <span>
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingWithNonmembers"/>
            </xsl:call-template>
            <input type="checkbox" class="IRS990ScheduleG_Checkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingWithNonmembers"/>
              </xsl:call-template>
            </input>
          </span>
          <span style="width:0.5mm;"/>
          <label>
            <xsl:call-template name="PopulateLabelNo">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingWithNonmembers"/>
            </xsl:call-template>
            <span>No</span>
          </label>
        </div> 
</div>

<!--  LINE  12  -->

    <div class="styBB" style="border-bottom-width:1.75px;">
     <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:3mm;padding-top:1mm;padding-left:0mm;">12</div>
      <div class="styLNDesc" style="width:155mm;height:3mm;padding-top:1mm;padding-bottom:0mm;font-size:7pt;">
        <span class="styNormalText">
         Is the organization a grantor, beneficiary or trustee of a trust or a member of a partnership or other entity
        </span></div>
    </div>

  <div style="width:187mm">
      <div class="styLNLeftNumBox" style="height:3mm;padding-left:1mm;padding-top:1mm;"></div>
      <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:1mm;font-size:7pt;">
        <span class="styNormalText">
          formed to administer charitable gaming? <span style="letter-spacing:3mm; font-weight:bold; font-size:7pt; margin-left:2mm;">...........................</span>
        </span></div>
        <div style="height:5mm;padding-top:1mm;font-size:7pt;vertical-align:center;">
          <span>
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/MemberOfOtherEntity"/>
            </xsl:call-template>
            <input type="checkbox" class="IRS990ScheduleG_Checkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/MemberOfOtherEntity"/>
              </xsl:call-template>
            </input>
          </span>
          <span style="width:0.5mm;"/>
          <label>
            <xsl:call-template name="PopulateLabelYes">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/MemberOfOtherEntity"/>
            </xsl:call-template>
            <span>Yes</span>
          </label>
          <span style="width:2mm;"/>
          <span>
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/MemberOfOtherEntity"/>
            </xsl:call-template>
            <input type="checkbox" class="IRS990ScheduleG_Checkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/MemberOfOtherEntity"/>
              </xsl:call-template>
            </input>
          </span>
          <span style="width:0.5mm;"/>
          <label>
            <xsl:call-template name="PopulateLabelNo">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/MemberOfOtherEntity"/>
            </xsl:call-template>
            <span>No</span>
          </label>
        </div>
 </div>
</div>

    <!-- Page 2 Footer -->
    <div class="pageEnd" style="width:187mm;">
      <span style="width:139mm;"></span>
      <span style="font-weight:bold;font-size:6pt;">Schedule G (Form 990 or 990-EZ) 2010</span>
    </div>
 
      
  
     <!-- PAGE 3 HEADER  -->
 <div class="styBB" style="width:187mm; padding-bottom:.5mm;border-bottom-width:1.75px;">  
    <div style="float:left;font-size;6pt;">Schedule G (Form 990 or 990-EZ) 2010</div>
    <div style="float:right;font-size:6pt;">Page <span style="font-weight:bold;font-size:7pt;">3</span></div>                    
  </div> 
<!-- END Page Header  -->  


     <!-- line  13  Yes - No boxes  -->
   
<div class="styNBB" style="width:187mm;">  

  <div class="IRS990ScheduleG_LineContainer" style="width:187mm;height:4mm;padding-top:0mm;">
  <div class="IRS990ScheduleG_LineIndex" style="border-top-width:0px;height:4mm;"></div>
  <div class="IRS990ScheduleG_LineDesc" style="width:155.25mm;height:4mm;border-right-width:0px;border-top-width:0px;">
    </div>
  <div class="IRS990ScheduleG_LineIndexMid" style="border-top-width:0px;width:8mm;padding-top:.25mm;border-bottom-width:0px;border-right-width:0px;height:4mm;"></div>
  <div class="IRS990ScheduleG_LineIndexMid" style="border-top-width:0px;width:8mm;height:4mm;padding-top:.25mm;border-right-width:0px;border-bottom-width:0px;font-size:7pt;"></div>
  <div class="IRS990ScheduleG_LineIndexMid" style="border-right-width:0px;width:8mm;height:4mm;padding-top:.25mm;border-bottom-width:0px;font-size:7pt;border-top-width:0px;"></div>
</div>
     
      
     <!-- LINE 13  -->
     <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:3mm;padding-left:0mm;">13</div>
      <div class="styLNDesc" style="width:139mm;height:4.5mm;">
        Indicate the percentage of gaming activity operated in:
        <!--Dotted Line-->
        <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;"></span>
      </div>
      <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;"></div>
      <div class="styLNAmountBox" style="height:4.5mm;padding-right:0.5mm;border-bottom-width:0px;"></div>
    </div>
    <!-- Line 13a-->
    <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:3mm;padding-left:3mm;">a</div>
      <div class="styLNDesc" style="width:139mm;height:4.5mm;">
       The organization's facility
        <!--Dotted Line-->
        <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">......................</span>
      </div>
      <div class="styLNRightNumBox" style="height:4.5mm;">13a</div>
      <div class="styLNAmountBox" style="height:4.5mm;padding-right:0.5mm;">
        <xsl:call-template name="PopulatePercent">
         <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/PercentageOfGamingOwnFacility" />
        </xsl:call-template></div>
    </div>
  <!-- Line 13b  --> 
 <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:3mm;padding-left:3mm;">b</div>
      <div class="styLNDesc" style="width:139mm;height:4.5mm;">
          An outside facility
        <!--Dotted Line-->
        <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;">........................</span>
      </div>
      <div class="styLNRightNumBox" style="height:4.5mm;">13b</div>
      <div class="styLNAmountBox" style="height:4.5mm;padding-right:0.5mm;">
      <xsl:call-template name="PopulatePercent"><xsl:with-param name="TargetNode" select="$Form990ScheduleGData/PercentageOfGamingOthrFacility" />
      </xsl:call-template></div>
    </div>
    
    
<!-- Line 14 -->
<div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:8mm;padding-left:0px;">14</div>
      <div class="styLNDesc" style="width:155mm;height:8mm;">
       Provide the name and address of the person who prepares the organization's gaming/special events books and records:
      </div>
       
      <div class="styLNLeftNumBox" style="height:4mm;"></div>
      <div class="styLNDesc" style="width:155mm;height:4mm;">
        </div>
   </div>

   <div style="width:187mm">
     <div class="IRS990ScheduleG_LineContainer" style="height:8mm;"> 
       <div class="styLNDesc" style="width:24mm;height:8mm;padding-left:8mm;padding-right:2.5mm;">
        Name  <img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/>
       </div>
          <div class="styFixedUnderline" style="width:163mm;padding-left:2mm;border-bottom-style:dashed;border-bottom-width:1px;border-right-width:0px;">
         <xsl:choose>
                  <xsl:when test="$Form990ScheduleGData/NameOfGamingRecKeeperPerson != ''">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/NameOfGamingRecKeeperPerson"/>
                    </xsl:call-template>
                  </xsl:when>
                </xsl:choose>
                <xsl:choose>
                  <xsl:when test="$Form990ScheduleGData/NameOfGamingRecKeeperBus/BusinessNameLine1 != ''">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/NameOfGamingRecKeeperBus/BusinessNameLine1"/>
                    </xsl:call-template>
                  </xsl:when>
                </xsl:choose>
                <xsl:choose>
                  <xsl:when test="$Form990ScheduleGData/NameOfGamingRecKeeperBus/BusinessNameLine2 != ''">
                    <br/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/NameOfGamingRecKeeperBus/BusinessNameLine2"/>
                    </xsl:call-template>
                  </xsl:when>
                </xsl:choose>
           
     </div> 
        </div>

   <!--  <xsl:if test="string-length($Form990ScheduleGData/NameOfGamingRecKeeperPerson) &lt;1">
      <div class="IRS990ScheduleG_LineContainer">
       <div class="styFixedUnderline" style="width:144.5mm;border-bottom-style:solid;border-bottom-width:1px;"></div>
       <div class="styShadingCell" style="width:8mm;height:8mm;height:100%;padding-bottom:1mm;border-top-width:0px;"></div>
       <div class="styShadingCell" style="width:8mm;height:8mm;height:100%;padding-bottom:1mm;border-top-width:0px;"></div>
      <div class="styShadingCell" style="width:8mm;height:8mm;height:100%;padding-bottom:1mm;border-top-width:0px;"></div>
</div>
</xsl:if> -->
</div>
    <div style="width:187mm">
      <div class="styLNLeftNumBox" style="height:4mm;"></div>
       <div class="styLNDesc" style="width:155mm;height:4mm;">
        </div>
   </div>

    <div style="width:187mm">
     <div class="IRS990ScheduleG_LineContainer" style="height:8mm;"> 
       <div class="styLNDesc" style="width:25mm;height:8mm;padding-left:8mm;padding-right:2.5mm;">
        Address  <img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/>  </div>
          <div class="styFixedUnderline" style="width:162mm;padding-left:2mm;border-bottom-style:dashed;border-bottom-width:1px;border-right-width:0px;">
    
    <xsl:if test="$Form990ScheduleGData/AddressOfGamingRecKeeperUS != ''">
                  <xsl:call-template name="PopulateUSAddressTemplate">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/AddressOfGamingRecKeeperUS"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$Form990ScheduleGData/AddressOfGamingRecKeeperFrgn != ''">
                  <xsl:call-template name="PopulateForeignAddressTemplate">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/AddressOfGamingRecKeeperFrgn"/>
                  </xsl:call-template>
                </xsl:if>
  
   </div> 
 </div>

 <!-- <xsl:if test="string-length($Form990ScheduleGData/AddressOfGamingRecKeeperUS) &lt;1">
   <div class="IRS990ScheduleG_LineContainer">
    <div class="styFixedUnderline" style="width:141.75mm;border-bottom-style:solid;border-bottom-width:1px;"></div>
    <div class="styShadingCell" style="width:8mm;height:8mm;height:100%;padding-bottom:1mm;border-top-width:0px;"></div>
    <div class="styShadingCell" style="width:8mm;height:8mm;height:100%;padding-bottom:1mm;border-top-width:0px;"></div>
    <div class="styShadingCell" style="width:8mm;height:8mm;height:100%;padding-bottom:1mm;border-top-width:0px;"></div>
</div>
</xsl:if>-->
</div>

  <div style="width:187mm">
      <div class="styLNLeftNumBox" style="height:4mm;"></div>
       <div class="styLNDesc" style="width:155mm;height:4mm;">
        </div>
   </div>



<!--  LINE  15a  -->

     <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:3mm;padding-left:0mm;">15a</div>
      <div class="styLNDesc" style="width:155mm;height:3mm;padding-top:.5mm;padding-bottom:0mm;font-size:7pt;">
        <span class="styNormalText">
         Does the organization have a contract with a third party from whom the organization receives gaming
        </span></div>
    </div>

  <div style="width:187mm">
      <div class="styLNLeftNumBox" style="height:3mm;padding-left:1mm;padding-top:1mm;"></div>
      <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:1mm;font-size:7pt;">
        <span class="styNormalText">
         revenue? <span style="letter-spacing:3mm; font-weight:bold; font-size:7pt; margin-left:2mm;">......................................</span>
        </span></div>
        <div style="height:5mm;padding-top:1mm;font-size:7pt;vertical-align:center;">
          <span>
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/ContractWith3rdPartyForGamRev"/>
            </xsl:call-template>
            <input type="checkbox" class="IRS990ScheduleG_Checkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/ContractWith3rdPartyForGamRev"/>
              </xsl:call-template>
            </input>
          </span>
          <span style="width:0.5mm;"/>
          <label>
            <xsl:call-template name="PopulateLabelYes">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/ContractWith3rdPartyForGamRev"/>
            </xsl:call-template>
            <span>Yes</span>
          </label>
          <span style="width:2mm;"/>
          <span>
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/ContractWith3rdPartyForGamRev"/>
            </xsl:call-template>
            <input type="checkbox" class="IRS990ScheduleG_Checkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/ContractWith3rdPartyForGamRev"/>
              </xsl:call-template>
            </input>
          </span>
          <span style="width:0.5mm;"/>
          <label>
            <xsl:call-template name="PopulateLabelNo">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/ContractWith3rdPartyForGamRev"/>
            </xsl:call-template>
            <span>No</span>
          </label>
        </div>
 </div>

<!--  Line 15b  -->  
 <div style="width: 187mm">
    <div class="styLNLeftLtrBox" style="padding-left:3mm;">b</div>
    <div class="styLNDesc" style="width: 155mm">
      If "Yes," enter the amount of gaming revenue received by the organization <img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/>  $  <span  class="styIRS990ScheduleGUnderlinedText" style="text-align: right">  
          <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/AmtOfGamingRevenueRecvdByOrg" />
                </xsl:call-template></span>
             <span style="width: 1mm"></span>and the </div>
  </div>

  <div style="width: 187mm">
    <div class="styLNLeftLtrBox"></div>
    <div class="styLNDesc" style="width: 155mm;height:3mm;">
        amount of gaming revenue retained by the third party <img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/> $ <span  class="styIRS990ScheduleGUnderlinedText" style="text-align: right">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/AmtOfGamingRevenueRetndBy3Prty" />
           </xsl:call-template>  
        </span>  <span style="width: 1mm">.</span>
        </div>
  </div> 

<!-- LINE  15c  -->
      <div style="width:187mm">
        <div class="styLNLeftNumBox" style="height:3mm;padding-left:3mm;padding-top:1mm;">c</div>
         <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:1.5mm;padding-bottom:0mm;">
         If "Yes," enter name and address:
     </div>
   </div>
   <div class="styLNLeftNumBox" style="height:4mm;"></div>
      <div class="styLNDesc" style="width:155mm;height:4.5mm;">
        </div>
      
    <div style="width:187mm">
     <div class="IRS990ScheduleG_LineContainer" style="height:8mm;"> 
       <div class="styLNDesc" style="width:24mm;height:8mm;padding-left:8mm;padding-right:2.5mm;">
        Name  <img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/>  </div>
          <div class="styFixedUnderline" style="width:163mm;padding-left:2mm;border-bottom-style:dashed;border-bottom-width:1px;border-right-width:0px;">
      <xsl:choose>
                  <xsl:when test="$Form990ScheduleGData/NameOfThirdPartyPerson!= ''">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/NameOfThirdPartyPerson"/>
                    </xsl:call-template>
                  </xsl:when>
                </xsl:choose>
                <xsl:choose>
                <xsl:when test="$Form990ScheduleGData/NameOfThirdPartyBusiness/BusinessNameLine1 != ''">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/NameOfThirdPartyBusiness/BusinessNameLine1"/>
                    </xsl:call-template>
                  </xsl:when>
                </xsl:choose>
                <xsl:choose>
                <xsl:when test="$Form990ScheduleGData/NameOfThirdPartyBusiness/BusinessNameLine2 != ''">
                    <br/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/NameOfThirdPartyBusiness/BusinessNameLine2"/>
                    </xsl:call-template>
                  </xsl:when>
                </xsl:choose>

  </div> 
 </div>

 <!--<xsl:if test="string-length($Form990ScheduleGData/NameOfThirdPartyPerson) &lt;1">
   <div class="IRS990ScheduleG_LineContainer">
    <div class="styFixedUnderline" style="width:143mm;border-bottom-style:solid;border-bottom-width:1px;"></div>
    <div class="styShadingCell" style="width:8mm;height:8mm;height:100%;padding-bottom:1mm;border-top-width:0px;"></div>
    <div class="styShadingCell" style="width:8mm;height:8mm;height:100%;padding-bottom:1mm;border-top-width:0px;"></div>
    <div class="styShadingCell" style="width:8mm;height:8mm;height:100%;padding-bottom:1mm;border-top-width:0px;"></div>
</div>
</xsl:if>-->
</div>
    <div style="width:187mm">
      <div class="styLNLeftNumBox" style="height:4mm;"></div>
       <div class="styLNDesc" style="width:155mm;height:4mm;">
        </div>
   </div>
   
  <!-- Line 15c  Address  -->
    <div style="width:187mm">
     <div class="IRS990ScheduleG_LineContainer" style="height:8mm;"> 
       <div class="styLNDesc" style="width:25mm;height:8mm;padding-left:8mm;padding-right:2.5mm;">
        Address  <img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/>  </div>
          <div class="styFixedUnderline" style="width:162mm;padding-left:2mm;border-bottom-style:dashed;border-bottom-width:1px;border-right-width:0px;">

      <xsl:choose>
                  <xsl:when test="$Form990ScheduleGData/AddressOfThirdPartyUS">                    
                      <xsl:call-template name="PopulateUSAddressTemplate">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/AddressOfThirdPartyUS" />
                      </xsl:call-template>                    
                  </xsl:when>
                  <xsl:otherwise>
                      <xsl:call-template name="PopulateForeignAddressTemplate">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/AddressOfThirdPartyForeign" />
                      </xsl:call-template>
                  </xsl:otherwise>  
                </xsl:choose>
    </div> 
 </div>

  <!--<xsl:if test="string-length($Form990ScheduleGData/AddressOfThirdPartyUS) &lt;1">
   <div class="IRS990ScheduleG_LineContainer">
      <div class="styFixedUnderline" style="width:141.75mm;border-bottom-style:solid;border-bottom-width:1px;"></div>
    <div class="styShadingCell" style="width:8mm;height:8mm;height:100%;padding-bottom:1mm;border-top-width:0px;"></div>
    <div class="styShadingCell" style="width:8mm;height:8mm;height:100%;padding-bottom:1mm;border-top-width:0px;"></div>
    <div class="styShadingCell" style="width:8mm;height:8mm;height:100%;padding-bottom:1mm;border-top-width:0px;"></div>
</div>
</xsl:if>-->
</div>


<!-- LINE  16  -->
      <div style="width:187mm">
        <div class="styLNLeftNumBox" style="height:3mm;padding-left:0mm;padding-top:2mm;">16</div>
         <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:2mm;padding-bottom:0mm;">
        Gaming manager information:
     </div>
   </div>
   <div class="styLNLeftNumBox" style="height:4mm;"></div>
      <div class="styLNDesc" style="width:155mm;height:4mm;">
        </div>
        
     <div class="styLNLeftNumBox" style="height:4mm;"></div>
      <div class="styLNDesc" style="width:155mm;height:4mm;">
        </div>
    <div style="width:187mm">
     <div class="IRS990ScheduleG_LineContainer" style="height:8mm;"> 
       <div class="styLNDesc" style="width:24mm;height:7mm;padding-left:8mm;padding-right:2mm;padding-top:1mm;">
        Name  <img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/>
</div>
          <div class="styFixedUnderline" style="width:163mm;padding-left:1mm;border-bottom-style:dashed;border-bottom-width:1px;border-right-width:0px;">
        <xsl:choose>
                  <xsl:when test="$Form990ScheduleGData/GamingManagerNamePerson!= ''">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingManagerNamePerson"/>
                    </xsl:call-template>
                  </xsl:when>
                </xsl:choose>
                <xsl:choose>
                  <xsl:when test="$Form990ScheduleGData/GamingManagerNameBusiness/BusinessNameLine1 != ''">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingManagerNameBusiness/BusinessNameLine1"/>
                    </xsl:call-template>
                  </xsl:when>
                </xsl:choose>
                <xsl:choose>
                  <xsl:when test="$Form990ScheduleGData/GamingManagerNameBusiness/BusinessNameLine2 != ''">
                    <br/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingManagerNameBusiness/BusinessNameLine2"/>
                    </xsl:call-template>
                  </xsl:when>
                </xsl:choose>
         
  </div> 
 </div>

<!-- <xsl:if test="string-length($Form990ScheduleGData/GamingManagerNamePerson) &lt;1">
   <div class="IRS990ScheduleG_LineContainer">
     <div class="styFixedUnderline" style="width:144.5mm;border-bottom-style:solid;border-bottom-width:1px;"></div>
    <div class="styShadingCell" style="width:8mm;height:8mm;height:100%;padding-bottom:1mm;border-top-width:0px;"></div>
    <div class="styShadingCell" style="width:8mm;height:8mm;height:100%;padding-bottom:1mm;border-top-width:0px;"></div>
    <div class="styShadingCell" style="width:8mm;height:8mm;height:100%;padding-bottom:1mm;border-top-width:0px;"></div>
</div>
</xsl:if>-->
</div>

    <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:3mm;padding-left:2mm;font-size:7pt;"></div>
      <div class="styLNDesc" style="width:155mm;height:3mm;padding-top:0mm;padding-bottom:0mm;font-size:7pt;">
        <span class="styNormalText">
          Gaming manager compensation  <img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/> $ </span>
           <span class="styIRS990ScheduleGUnderlinedBox" style="font-size: 7pt; width:40mm;text-align: right;padding-right:1mm;border-bottom-style:dashed;">
          <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingManagerCompensation" />
                </xsl:call-template>
              </span>
     </div>
    </div>
    
    <div class="styLNLeftNumBox" style="height:4mm;"></div>
      <div class="styLNDesc" style="width:155mm;height:4mm;">
        </div>

  <div style="width:187mm">
     <div class="IRS990ScheduleG_LineContainer" style="height:8mm;"> 
       <div class="styLNDesc" style="width:56mm;height:8mm;padding-left:8mm;padding-right:2mm;">
          Description of services provided  
          <img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/>
       </div>
       <div class="styFixedUnderline" style="width:131mm;padding-left:0mm;border-bottom-style:dashed;border-bottom-width:1px;border-right-width:0px;">
           <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingManagerServicesProvided"/>
           </xsl:call-template>
       </div> 
    </div>
  </div>

 <!-- line 16 check boxes --> 
 
    <div style="width:187mm">
     <div class="styLNLeftNumBox" style="height:4mm;"></div>
      <div class="styLNDesc" style="width:155mm;height:5mm;"> 
       <span style="width:50mm;">
        <input type="checkbox" class="IRS990ScheduleG_Checkbox">
         <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingManagerIsDirectorOfficer" />
          <xsl:with-param name="BackupName">GamingManagerIsDirectorOfficer</xsl:with-param>
         </xsl:call-template>
        </input>
        <label>
          <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingManagerIsDirectorOfficer" />
            <xsl:with-param name="BackupName">GamingManagerIsDirectorOfficer
            </xsl:with-param>
          </xsl:call-template>
          Director/officer
        </label>
      </span>     
      
      <span style="width:45mm;">
      <input type="checkbox" class="IRS990ScheduleG_Checkbox">
         <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingManagerIsEmployee" />
          <xsl:with-param name="BackupName">GamingManagerIsEmployee</xsl:with-param>
         </xsl:call-template>
        </input>
        <label>
          <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingManagerIsEmployee" />
            <xsl:with-param name="BackupName">GamingManagerIsEmployee
            </xsl:with-param>
          </xsl:call-template>
         Employee
        </label>
      </span>

      <span style="width:45mm;">
      <input type="checkbox" class="IRS990ScheduleG_Checkbox">
         <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingManagerIsIndContractor" />
          <xsl:with-param name="BackupName">GamingManagerIsIndContractor</xsl:with-param>
         </xsl:call-template>
        </input>
        <label>
          <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingManagerIsIndContractor" />
            <xsl:with-param name="BackupName">GamingManagerIsIndContractor
            </xsl:with-param>
          </xsl:call-template>
          Independent contractor
        </label>
      </span></div>
</div>

 
     <!-- LINE  17  -->
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4mm;padding-left:0mm;font-weight:bold;">17</div>
         <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:.5mm;padding-bottom:0mm;">
        Mandatory distributions:
     </div>
   
   <!--  Line 17a  -->
     <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:3mm;padding-left:3mm;">a</div>
      <div class="styLNDesc" style="width:155mm;height:3mm;padding-top:.5mm;padding-bottom:0mm;font-size:7pt;">
        <span class="styNormalText">
         Is the organization required under state law to make charitable distributions from the gaming proceeds to
        </span></div>
    </div>

  <div style="width:187mm">
      <div class="styLNLeftNumBox" style="height:3mm;padding-left:1mm;padding-top:1mm;"></div>
      <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:1mm;font-size:7pt;">
        <span class="styNormalText">
         retain the state gaming license? <span style="letter-spacing:3mm; font-weight:bold; font-size:7pt; margin-left:2mm;">............................</span>
        </span></div>
        <div style="height:5mm;padding-top:1mm;font-size:7pt;vertical-align:center;">
          <span>
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/CharitableDistribRequired"/>
            </xsl:call-template>
            <input type="checkbox" class="IRS990ScheduleG_Checkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/CharitableDistribRequired"/>
              </xsl:call-template>
            </input>
          </span>
          <span style="width:0.5mm;"/>
          <label>
            <xsl:call-template name="PopulateLabelYes">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/CharitableDistribRequired"/>
            </xsl:call-template>
            <span>Yes</span>
          </label>
          <span style="width:2mm;"/>
          <span>
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/CharitableDistribRequired"/>
            </xsl:call-template>
            <input type="checkbox" class="IRS990ScheduleG_Checkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/CharitableDistribRequired"/>
              </xsl:call-template>
            </input>
          </span>
          <span style="width:0.5mm;"/>
          <label>
            <xsl:call-template name="PopulateLabelNo">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/CharitableDistribRequired"/>
            </xsl:call-template>
            <span>No</span>
          </label>
        </div>
 </div>
</div>

<!--  LINE 17b  -->

<div style="width: 187mm;">
    <div class="styLNLeftLtrBox" style="padding-left:3mm;">b</div>
    <div class="styLNDesc" style="width: 155mm;height:3mm;">
      Enter the amount of distributions required under state law distributed to other exempt organizations or spent  
          </div>
  </div>

 <div class="styBB" style="width:187mm;">  
   <div class="styLNLeftLtrBox"></div>
    <div class="styLNDesc" style="width: 155mm;height:3mm;">
      in the organization's own exempt activities during the tax year  <img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/>  
      <span style="width: 2mm;">  </span>$
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/AmountDistributed" />
           </xsl:call-template>  
          </div>
  </div>
</div> 

  <!-- BEGIN Part IV Title -->
  <div class="styBB" style="width:187mm;">
    <div class="styPartName" >Part IV</div>
    <div class="styPartDesc" style="width:170mm;padding-bottom:.5mm;">
      <span class="styNormalText">  
        Complete this part to provide additional information for responses to quuestion on Schedule G (see instructions.)
      </span>
    </div>
  </div>
  <!-- END Part IV Title -->
 
            <table cellspacing="0" class="styDepTbl" cellpadding="0" style="font-size:7pt;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell" scope="col" style="width:50mm;height:5mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">Identifier</th>
                  <th class="styDepTblCell" scope="col" style="width:50mm;height:5mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">ReturnReference </th>
                  <th class="styDepTblCell" scope="col" style="width:87mm;height:5mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-right:none;">Explanation  </th>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="$Form990ScheduleGData/Form990ScheduleGPartIV">
                  <tr>
                    <xsl:attribute name="class">
                      <xsl:choose>
                        <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                        <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>
                    <td class="styTableCell" style="font-size:7pt;font-weight:normal;border-color:black;text-align:left;height:7mm;width:50mm;vertical-align:top;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="Identifier"/>
                      </xsl:call-template>
                      <span class="styTableCellPad "/>
                    </td>
                    <td class="styTableCell" style="font-size:7pt;border-color:black;width:50mm;text-align:left;padding-top:1mm;vertical-align:top;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="ReturnReference"/>
                      </xsl:call-template>
                      <span class="styTableCellPad "/>
                    </td>
                    <td class="styTableCell" style="font-size:7pt;border-color:black;border-right:none;width:87mm;text-align:left;vertical-align:top;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="Explanation"/>
                      </xsl:call-template>
                      <span class="styTableCellPad "/>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            
 <!-- Page Footer -->
    <div class="pageEnd" style="width:187mm;">
      <span style="width:139mm;"></span>
      <span style="font-weight:bold;font-size:6pt;">Schedule G (Form 990 or 990-EZ) 2010</span>
    </div>


<!-- Recycle Image -->
      
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
          <xsl:with-param name="TargetNode" select="$Form990ScheduleGData" />
          <xsl:with-param name="DescWidth" select="100"/>
        </xsl:call-template>
      </table>
      
   
   <!-- PART I  Line 2b  -  Fundraising Activities Table -->
   <!-- Additonal Data Table for separated data from Part I, Line 2b -->

      <xsl:if test="($Print = $Separated) and (count($Form990ScheduleGData/FundraiserActivityInformation) &gt; 10) ">
      <span class="styRepeatingDataTitle">
        <br/>Form 990, Schedule G, Part I, Line 2b - Fundraising Activities Table
      </span>
      <table class="styDepTbl" cellspacing="0" style="font-size:7pt">
        <thead class="styTableHead">
          <tr class="styDepTblHdr">
            <th class="styDepTblCell" scope="col">(i) Name of individual or entity (fundraiser)</th>
            <th class="styDepTblCell" style="width:25mm;" scope="col">(b) Line number from above</th>
          </tr>
        </thead>
        <tbody>
          <xsl:for-each select="$Form990ScheduleGData/FundraiserActivityInformation">
            <tr>
              <!--Define background colors to the rows -->
              <xsl:attribute name="class">
                <xsl:choose>
                  <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                  <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
              <td class="styDepTblCell" style="text-align:left;font-family:verdana;font-size:6pt">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="NameOfIndividual"/>
                </xsl:call-template><br />
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="NameOfOrganization/BusinessNameLine1"/>
                </xsl:call-template>
                   <br />
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="NameOfOrganization/BusinessNameLine2"/>
                </xsl:call-template>
              </td>
              
              <td class="styDepTblCell" style="text-align:center">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="LineNumber"/>
                </xsl:call-template>
              </td>
            </tr>
          </xsl:for-each>
        </tbody>
      </table>
    </xsl:if>
    <!-- End Part I, Line 2b separated data -->
 
  

   
   
      <!-- PART I  - LINE 3   Begin Separated Repeating Data table -->
  <!--  <xsl:if test="($Print = $Separated) and (count($Form990ScheduleGData/LicensedStates) &gt;12)">
      <span class="styRepeatingDataTitle">Form 990 Schedule G - Licensed States</span>
        <table cellspacing="0" class="styDepTbl" cellpadding="0" style="font-size:7pt;">
        <thead class="styTableThead">  
          <tr class="styDepTblHdr">
            <th class="styDepTblCell" scope="col" style="width:187mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-right-width:0px;">Licensed States</th>
          </tr>
        </thead>      
        <tbody>
            <xsl:for-each select="$Form990ScheduleGData/LicensedStates">
              <tr>
                <xsl:attribute name="class">
                  <xsl:choose>
                     <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                     <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                  </xsl:choose>
                </xsl:attribute>
                <td class="styTableCell" style="font-size:7pt;font-weight:normal;padding-left:2mm;border-color:black;border-right-width:0px;
                text-align:left;height:7mm;width:187mm;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="LicensedStates" />
                  </xsl:call-template>
                  <span class="styTableCellPad "></span>  
                </td>
              </tr>
            </xsl:for-each>
        </tbody>
      </table>
      <br />
    </xsl:if>--> 
      <!-- End SRD for first part -->
      
      
      
      <xsl:if test="($Print = $Separated) and (count($Form990ScheduleGData/StatesWhereGamingConducted) &gt;8)">
<br/>
<span class="styRepeatingDataTitle">Form 990 Schedule G Part III Line 9</span>
<table class="styDepTbl"  cellspacing="0" style="font-size: 7pt">
  <thead class="styTableThead" />
  <tbody>
    <tr class="styDepTblRow1">
          <td class="styDepTblCell" style="text-align: left; width:80mm"> Enter the state(s) in which the organization operates gaming activities:</td>
          <td class="styDepTblCell" style="text-align: left; width: 104mm">
     <xsl:if test="($Print = $Separated) and (count($Form990ScheduleGData/StatesWhereGamingConducted) &gt;8)">
          <xsl:for-each select="$Form990ScheduleGData/StatesWhereGamingConducted">     
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="." />
      </xsl:call-template><xsl:if test="position()!=last()">,<span style="width: 2px" /></xsl:if>
      </xsl:for-each>      
      </xsl:if>
      </td>
</tr>
</tbody>
</table>
</xsl:if>

   </div> 
</form>
</body>
</html>
</xsl:template>
   


<xsl:template name="StatesTemp">
  <xsl:param name="IsSeparated">no</xsl:param>
   
    <tr>
      <td class="styTableCell" style="font-size:7pt;font-weight:normal;border-color:black;text-align:left;height:7mm;width:187mm;border-right-width:0px;padding-left:2mm;">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/LicensedStates" />
        </xsl:call-template>
      <!--  <xsl:if test="$IsSeparated = 'yes' ">
          <xsl:call-template name="PopulateAdditionalDataTableMessage">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/LicensedStates"/>   
            <xsl:with-param name="ShortMessage" select="'true'" />                   
          </xsl:call-template>
        </xsl:if>-->
      </td>
     </tr>
</xsl:template>


<!-- The param CalledTemplate is used to differentiate different elements for the additional data table as the different elements call the same template -->
<xsl:template name="EmptyIteratorTemp">
  <xsl:param name="NumEmptyRows" />
  <xsl:param name="TempToCall" />
  <xsl:param name="CalledTemplate" select="$Form990ScheduleGData"></xsl:param>
  <xsl:param name="IsSeparated">no</xsl:param>
  <xsl:if test="$IsSeparated = 'no' ">
    <xsl:if test="$NumEmptyRows &gt; 0">
      <xsl:choose>
        <xsl:when test="$TempToCall = 'StatesTemp'">
          <xsl:call-template name="StatesTemp" />
        </xsl:when>
      
        <xsl:otherwise></xsl:otherwise>
      </xsl:choose>
      <xsl:call-template name="EmptyIteratorTemp">
        <xsl:with-param name="NumEmptyRows" select="$NumEmptyRows - 1" />
        <xsl:with-param name="TempToCall" select="$TempToCall" />
      </xsl:call-template>
    </xsl:if>
  </xsl:if>
  <xsl:if test="$IsSeparated = 'yes' ">
    <xsl:choose>
      <xsl:when test="$TempToCall = 'StatesTemp'">
        <xsl:call-template name="StatesTemp">
          <xsl:with-param name="IsSeparated">yes</xsl:with-param>
        </xsl:call-template>
      </xsl:when>
   
      <xsl:otherwise></xsl:otherwise>
    </xsl:choose>
    <xsl:call-template name="EmptyIteratorTemp">
      <xsl:with-param name="NumEmptyRows" select="$NumEmptyRows - 1" />
      <xsl:with-param name="TempToCall" select="$TempToCall" />
    </xsl:call-template>
  </xsl:if>



</xsl:template>
</xsl:stylesheet>
 
    
