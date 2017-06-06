<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<!-- 03/26/2015 - Changes made for IE11 compatibility - Jeremy Nichols -->
<!-- 07/31/2015 - Modified per UWR 161465 - Jeremy Nichols-->
<!-- 09/24/2015 - Modified per defect 44808 - Jeremy Nichols-->
<!-- 09/24/2015 - Modified per defect 44811 - Jeremy Nichols-->
<!-- 02/11/2016 - Modified per KISAM IM02466390 - Jeremy Nichols-->
<!-- 04/08/2016 - Modified per UWR 177702 - Jeremy Nichols-->
<!-- 01/18/2017 - Modified per 2016 pdf review under defect 60697 - Jeremy Nichols-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS990ScheduleGStyle.xsl"/>

  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form990ScheduleGData" select="$RtnDoc/IRS990ScheduleG"/>

  <xsl:variable name="StatesSize" select="count($Form990ScheduleGData/LicensedStatesCd)"/>
  <xsl:variable name="FundraiserActivityInformationSize" select="count($Form990ScheduleGData/FundraiserActivityInfoGrp)"/>
  <xsl:variable name="RowsToShow" select="10"/>

  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form990ScheduleGData)"/>
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
        <meta name="Description" content="IRS Form 990 Schedule G"/>
    
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <script language="JavaScript" type="text/javascript">
			  var lineCount;
						
			  function resetLineCount()
			  {
				lineCount = 0;      
			  }
			  
			  function getLineCount()
			  {
				var returnValue;
				
				lineCount = lineCount + 1;
				returnValue = lineCount;
				document.write(returnValue);
			  }
		</script>
        <xsl:call-template name="InitJS"/>
        
        <style type="text/css"> 
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS990ScheduleGStyle"/>  
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      
      <body class="styBodyClass">
        <form name="Form990ScheduleG">
          <xsl:call-template name="DocumentHeader"/>
          
          <!-- BEGIN FORM HEADER -->
          <div style="display:block;">
          <div class="styTBB" style="width:187mm;display:block;">
            <div class="styFNBox" style="height:23mm;width:33mm;padding-top:1mm;">
              <div style="height:13.5mm;">
                <span class="styFormNumber" style="font-size:9pt;">SCHEDULE G<span style="width:5mm;"/>
                  <span style="text-align:left;padding-left:0mm;padding-top:1mm;"/> (Form 990 or 990-EZ)
                </span>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData"/>
                </xsl:call-template>
              </div>
              <div style="padding-top:2mm;padding-bottom:1mm;">
                <span class="styAgency">Department of the Treasury</span><br/>
                <span class="styAgency">Internal Revenue Service</span>
              </div>
            </div>
            <div class="styFTBox" style="height:23mm;width:122mm;">
              <div class="styMainTitle" style="height:11mm;padding-top:1mm;padding-bottom:0mm;">
                Supplemental Information Regarding<br/>
                Fundraising or Gaming Activities
              </div>
              <div class="styFBT" style="margin-top:0mm;font-weight:bold;">
                <span style="width:122mm;font-size:5.5pt;font-weight:bold;">
					Complete if the organization answered "Yes" on Form 990, Part IV, lines 17, 18, or 19, or if the
				</span>
				<span style="width:122mm;font-size:5.5pt;font-weight:bold;">
					organization entered more than $15,000 on Form 990-EZ, line 6a.
				</span>
                <span style="width:122mm;font-size:5.5pt;font-weight:bold;">
					<img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/>Attach to Form 990 or Form 990-EZ.
				</span>
				<br/>
                <span style="width:122mm;font-size:5.5pt;font-weight:bold;">
					<img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/>Information about Schedule G (Form 990 or 990-EZ) and its instructions is at <i>www.irs.gov/form990</i>. 
				</span>
              </div>
            </div>
            <div class="styTYBox" style="width:31.5mm;height:23mm;">
              <div class="styOMB" style="width:31.5mm;">OMB No. 1545-0047</div>
              <div class="styTaxYear" style="height:11mm;padding-top:1mm;padding-bottom:0.8mm;">
                20<span class="styTYColor">16</span>
              </div>
              <div class="styPartName" style="height:8mm;width:31.5mm;padding-top:0mm;padding-bottom:0.5mm;text-align:left;padding-left:3mm;">
                Open to Public <span style="text-align:left;padding-left:0mm;"/> Inspection
              </div>
            </div>
          </div>  
       
          <!-- Begin Name and Identifying Number Section-->    
          <div class="styBB" style="width:187mm;clear:both;font-family:verdana;font-size:7pt;">
            <div class="styNameBox" style="width:135mm;height:10mm;font-size:7pt;">
              Name of the organization<br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
              </xsl:call-template><br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
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
            <div class="styPartDesc"> <b>Fundraising Activities.</b>  
              <span class="styNormalText"> Complete if the organization answered "Yes" on Form 990, Part IV, line 17.</span>
            </div>
              <span class="styNormalText" style="font-size:8pt;padding-left:16mm;"> Form 990-EZ filers are not required to complete this part.</span>
          </div>
  
          <!-- LINE 1  -->
          <div class="styNBB" style="width:187mm">
            <div class="styLNLeftNumBox" style="font-weight:bold;padding-top:.75mm;width:7.5mm;">1</div>
            <div style="float:left; width:178mm; padding-bottom:0.5mm;padding-top:1mm;">
              Indicate whether the organization raised funds through any of the following activities. Check all that apply.
            </div>
          </div> 
            
            <table style="width:187mm;font-size:7pt;">
              <tbody>
                <tr>
                  <td style="width:5mm;text-align:center;">
                    <span class="styBoldText">a</span>
                  </td>  
                  <td style="width:5mm;text-align:center;">
                    <input type="checkbox" class="styCkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/MailSolicitationsInd"/>
                      </xsl:call-template>
                    </input>
                  </td>  
                  <td style="width:77mm;">
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/MailSolicitationsInd"/>
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
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/SolicitationOfNonGovtGrantsInd"/>
                      </xsl:call-template>
                    </input>
                  </td>  
                  <td style="width:87mm;">
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/SolicitationOfNonGovtGrantsInd"/>
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
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EmailSolicitationsInd"/>
                      </xsl:call-template>
                    </input>
                  </td>  
                  <td style="width:77mm;">
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/EmailSolicitationsInd"/>
                      </xsl:call-template>
                      Internet and email solicitations
                    </label>
                  </td> 
                  <td style="width:5mm;text-align:center;"> 
                    <span class="styBoldText">f</span>
                  </td> 
                  <td style="width:5mm;text-align:center;"> 
                    <input type="checkbox" class="styCkbox">
                      <xsl:call-template name="PopulateCheckbox">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/SolicitationOfGovtGrantsInd"/>
                      </xsl:call-template>
                    </input>
                  </td>  
                  <td style="width:87mm;">
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/SolicitationOfGovtGrantsInd"/>
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
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/PhoneSolicitationsInd"/>
                      </xsl:call-template>
                    </input>
                  </td>  
                  <td style="width:77mm;">              
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/PhoneSolicitationsInd"/>
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
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/SpecialFundraisingEventsInd"/>
                      </xsl:call-template>
                    </input>
                  </td>  
                  <td style="width:87mm;">   
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/SpecialFundraisingEventsInd"/>
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
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/InPersonSolicitationsInd"/>
                      </xsl:call-template>
                    </input> 
                  </td>  
                  <td style="width:77mm;">   
                    <label>
                      <xsl:call-template name="PopulateLabel">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/InPersonSolicitationsInd"/>
                      </xsl:call-template>
                      In-person solicitations
                    </label>
                  </td>  
                </tr>
              </tbody>
            </table>
          
          <!--  LINE 2a  -->
          <div class="IRS990ScheduleG_LineContainer" style="padding-top:1mm;">
            <div class="IRS990ScheduleG_LineIndex" style="width:7.5mm;padding-right:10px;text-align:left;padding-left:1mm;padding-top:1mm;display:inline;">2a</div>
            <div class="IRS990ScheduleG_LineDesc" style="width:180mm;border-right-width:0px;padding-top:1mm;display:inline;">
              Did the organization have a written or oral agreement with any individual (including officers, directors, trustees
            </div>
            <div class="IRS990ScheduleG_LineIndex" style="width:7.5mm;display:inline;"/>
            <div class="IRS990ScheduleG_LineDesc" style="width:140mm;border-right-width:0px;display:inline;">
              or key employees listed in Form 990, Part VII) or entity in connection with professional fundraising services?
            </div>
            <span style="display:inline;">
              <xsl:call-template name="PopulateSpan">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/AgrmtProfFundraisingActyInd"/>
              </xsl:call-template>
              <input type="checkbox" class="IRS990ScheduleG_Checkbox" style="height:3mm;width:3mm;">
                <xsl:call-template name="PopulateYesCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/AgrmtProfFundraisingActyInd"/>
                </xsl:call-template>
              </input>
            </span>
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/AgrmtProfFundraisingActyInd"/>
              </xsl:call-template>
              <span style="font-weight:bold;">Yes</span>
            </label>  
            <span style="display:inline;">
              <xsl:call-template name="PopulateSpan">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/AgrmtProfFundraisingActyInd"/>
              </xsl:call-template>
              <input type="checkbox" class="IRS990ScheduleG_Checkbox" style="height:3mm;width:3mm;">
                <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/AgrmtProfFundraisingActyInd"/>
                </xsl:call-template>
              </input>
            </span>
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/AgrmtProfFundraisingActyInd"/>
              </xsl:call-template>
              <span style="font-weight:bold;">No</span>
            </label>  
        </div>

        <!--  LINE  2b  --> 
        <div class="styNBB" style="width:187mm;float:left;clear:none;">
          <div class="styLNLeftNumBox" style="font-weight:bold;padding-left:2.5mm;width:7.5mm;padding-top:1mm;padding-bottom:0mm;">b</div>
          <div style="width:178mm; font-size:7pt;padding-top:1mm;display:inline;">
            If "Yes," list the ten highest paid individuals or entities (fundraisers) pursuant to agreements under which the fundraiser is <br/>
            to be compensated at least $5,000 by the organization. 
          </div><br/><br/>
       
          <!--########################################################################################################-->         
          <!--  PART I  -  Fundraising Activities Table  -  Line 2b  -->
  
          <div class="IRS990ScheduleG_TableContainer" style="border-top-width: 0px;display:block;" id="P1ctn"> 
            <xsl:call-template name="SetInitialState"/> 
              <table class="styTable" cellspacing="0" cellpadding="0" style="font-size:7pt;overflow-y:auto;">
                <thead class="styTableThead">
                  <tr>
                    <th class="IRS990ScheduleG_TableCell" style="vertical-align:top;padding-top:1mm; width:48mm;font-weight:normal;font-size:7pt;text-align:center;border-top-width:1px;" scope="col" colspan="2"> 
                      <b>(i)</b> Name and address of individual <br/> or entity (fundraiser)
                    </th>
                    <th class="IRS990ScheduleG_TableCell" style="vertical-align:top;padding-top:1mm;width:27mm;text-align:center;font-size:7pt;font-weight:normal;border-top-width:1px;" scope="col">
                      <span style="font-weight:bold;">(ii)</span> Activity
                    </th>
                    <th class="IRS990ScheduleG_TableCell" style="padding-right:0mm;padding-left:1mm; vertical-align:top;padding-top:1mm; width:22mm;text-align:center;font-size:6.5pt;font-weight:normal;border-top-width:1px;" scope="col" colspan="2">
                      <span style="font-weight:bold;text-align:left;">(iii)</span> Did fundraiser have custody or control of contributions?
                    </th>
                    <th class="IRS990ScheduleG_TableCell" style="vertical-align:top;padding-top:1mm;width:30mm;text-align:center;font-size:7pt;font-weight:normal;border-top-width:1px;" scope="col">
                      <span style="font-weight:bold;">(iv)</span> Gross receipts <br/>  from activity
                    </th>
                    <th class="IRS990ScheduleG_TableCell" style="vertical-align:top;padding-top:1mm;width:30mm;text-align:center;font-size:7pt;font-weight:normal;border-top-width:1px;" scope="col">
                      <span style="font-weight:bold;">(v)</span> Amount paid to <br/>(or retained by)<br/> fundraiser listed in <br/>col. <b>(i)</b>
                    </th>
                    <th class="IRS990ScheduleG_TableCell" style="vertical-align:top;padding-top:1mm;width:30mm;border-right-width:0px;text-align:center;font-size:7pt; font-weight:normal;border-top-width:1px;" scope="col">
                      <span style="font-weight:bold;">(vi)</span> Amount paid to <br/>  (or retained by) <br/> organization
                    </th>
                  </tr>
                  <tr>
                    <th scope="col" style="border-right:1px solid black;" colspan="2">
						<span style="width:1mm;"/>
					</th>
                    <th scope="col" style="border-right:1px solid black;">
						<span style="width:1mm;"/>
					</th>
                    <th class="IRS990ScheduleG_TableCell" style="width:11mm;font-size:7pt;border-right-width:1px;text-align:center" scope="col">
                      Yes
                    </th>
                    <th class="IRS990ScheduleG_TableCell" style="width:11mm;font-size:7pt;border-right-width:1px;text-align:center" scope="col">
                      No
                    </th>
                    <th scope="col" style="border-right:1px solid black;">
						<span style="width:1mm;"/>
					</th>
                    <th scope="col" style="border-right:1px solid black;">
						<span style="width:1mm;"/>
					</th>
                    <th scope="col"/>
                  </tr>
                </thead>    
                <tfoot/>
                <tbody>
                
                  <!-- Display all rows: If the print parameter is not set to be Separated, OR -->
                  <!-- If the print parameter is separated, but there are fewer elements than the container height (10) -->
                  <!-- Name of Supported Organization -->
				  <script language="JavaScript" type="text/javascript">
					  resetLineCount();
				  </script>
                  <xsl:if test="($Print != $Separated) or count($Form990ScheduleGData/FundraiserActivityInfoGrp) &lt;= 10">
                    <xsl:for-each select="$Form990ScheduleGData/FundraiserActivityInfoGrp">
						<xsl:call-template name="FundraiserActivityInformationTemp"/>
                    </xsl:for-each>
                  <!-- Render out the rest of the empty rows if less than $RowsToShow1 data items present for consistency with PDF display. -->
                  <xsl:call-template name="EmptyIteratorTemp">
                    <xsl:with-param name="NumEmptyRows" select="$RowsToShow - $FundraiserActivityInformationSize"/>
                    <xsl:with-param name="TempToCall" select="'FundraiserActivityInformationTemp'"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="($Print = $Separated) and (count($Form990ScheduleGData/FundraiserActivityInfoGrp) &gt; 10) ">
                  <xsl:call-template name="EmptyIteratorTemp">
                    <xsl:with-param name="NumEmptyRows" select="10"/>
                    <xsl:with-param name="TempToCall" select="'FundraiserActivityInformationTemp'"/>
                    <xsl:with-param name="IsSeparated" select="'yes' "/>
                  </xsl:call-template>
                </xsl:if>
                  <tr>
                    <td style="width:91mm;border:black 0 solid;border-bottom-width:0;font-family:verdana;font-size:7pt;border-right-width:1px;height:7mm;" colspan="5">
                      <span class="styBoldText">Total </span>          
                      <span style="width:2mm;"/>.   
                      <span style="width:2mm;"/>.   
                      <span style="width:2mm;"/>.   
                      <span style="width:2mm;"/>.   
                      <span style="width:2mm;"/>.   
                      <span style="width:2mm;"/>.   
                      <span style="width:2mm;"/>.   
                      <span style="width:2mm;"/>.   
                      <span style="width:2mm;"/>.   
                      <span style="width:2mm;"/>.   
                      <span style="width:2mm;"/>.   
                      <span style="width:2mm;"/>.   
                      <span style="width:2mm;"/>.   
                      <span style="width:2mm;"/>.   
                      <span style="width:2mm;"/>.   
                      <span style="width:2mm;"/>.   
                      <span style="width:2mm;"/>.   
                      <span style="width:2mm;"/>.   
                      <span style="width:2mm;"/>.   
                      <span style="width:2mm;"/>.
                      <img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/>
                    </td>
                    <td style="width:32mm;border:black 0 solid;border-bottom-width:0;font-family:verdana;font-size:7pt;width:34mm;text-align:right;padding-right:.5mm;border-right-width:1px;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/TotalGrossReceiptsAmt"/>
                      </xsl:call-template>
                    </td>
                    <td style="width:32mm;border:black 0 solid;border-bottom-width:0;font-family:verdana;font-size:7pt;width:34mm;text-align:right;padding-right:.5mm;border-right-width:1px;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/TotalRetainedByContractorsAmt"/>
                      </xsl:call-template>
                    </td>
                    <td style="width:32mm;border:black 0 solid;border-bottom-width:0;font-family:verdana;font-size:7pt;text-align:right;width:34mm;padding-right:.5mm;border-right-width:0px;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/TotalNetToOrganizationAmt"/>
                      </xsl:call-template>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
  
            <xsl:call-template name="SetInitialDynamicTableHeight">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraiserActivityInfoGrp"/>
              <xsl:with-param name="containerHeight" select="10"/>
              <xsl:with-param name="headerHeight" select="2"/>        
              <xsl:with-param name="containerID" select=" 'P1ctn' "/>
            </xsl:call-template>
  
            <!--  LINE 3  -->
            <!-- BEGIN Part I -  All States Registered or Licensed-->
            <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="font-weight:bold;width:5mm;padding-top:1mm;display:inline">3</div>
              <div class="styLNDesc" style="height:10mm;width:180mm;padding-left:0mm;padding-top:1mm;padding-bottom:3mm;display:inline;"> 
                List all states in which the organization is registered or licensed to solicit contributions or has been notified it is exempt from registration or licensing.
              </div>
              <div class="styFixedUnderline" style="float:left;clear:none;width:187mm;border-bottom-style:dashed;display:inline;">
                <xsl:for-each select="$Form990ScheduleGData/LicensedStatesCd">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="."/>
                  </xsl:call-template>
                  <xsl:if test="not(position() = last())">,  </xsl:if>
                </xsl:for-each>
              </div>
              <div class="styFixedUnderline" style="float:left;clear:none;width:187mm;border-bottom-style:dashed;display:inline;">
                <xsl:for-each select="$Form990ScheduleGData/AllStatesCd">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="."/>
                  </xsl:call-template>
                </xsl:for-each>
              </div>
            </div>
            <!-- END TABLE FOR Licensed States -->
		    <div style="height:4mm;width:187mm;border-top-width:0px;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-style:solid;border-color:black"><span style="width:1mm;"/></div>
			</div>
            <!-- footer line -->
            <div class="pageEnd" style="width:187mm;float:none;clear:both;">
              <div style="font-weight:bold;width:114mm;font-size:6pt;padding-top:1mm;float:left;border-top-width:0px;">
                For Paperwork Reduction Act Notice, see the Instructions for Form 990 or 990-EZ.
              </div>
              <div style="width:20mm;padding-left:0mm;padding-top:1mm;font-size:6pt;float:left;">
                Cat. No. 50083H
              </div>
              <div style="width:51mm;font-size:6pt;text-align:right;padding-top:1mm;float:right;font-weight:bold;">
                Schedule G (Form 990 or 990-EZ) 2016
              </div>
            </div>
  
            <!-- PAGE 2 HEADER  -->
          <div style="display:block;">
            <div class="styBB" style="width:187mm; padding-bottom:.5mm;">  
              <div style="float:left;">Schedule G (Form 990 or 990-EZ) 2016</div>
              <div style="float:right;">Page <span style="font-weight:bold;font-size:7pt;">2</span></div>                    
            </div> 
            <!-- END Page Header  -->  
  
            <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@##############################################################################################################-->
            <!--  BEGIN  PART II   EVENTS  -->
            <!-- BEGIN Part II Title -->
				<div class="styBB" style="height:11mm;width:187mm;">
                  <div class="styPartName" style="height:4mm;display:inline;">Part II</div>
                  <div class="styPartDesc" style="width:170mm;padding-bottom:.5mm;display:inline;"><b>Fundraising Events. </b> <span class="styNormalText" style="display:inline;">  Complete if the organization answered "Yes" on Form 990, Part IV, line 18, or reported more than $15,000 of fundraising event contributions and gross income on Form 990-EZ, lines 1 and 6b. List events with gross receipts greater than $5,000.  </span></div>
                </div>
                <!-- END Part II Title -->    
            <table class="styTable" style="font-size: 7pt;height:auto;width:187mm;display:inline;" cellspacing="0" cellpadding="0">
				<tr>
					<td class="styIRS990ScheduleGVTImageBox" style="height:39.4mm;width:6mm;padding-top:0mm;border-bottom-width:1px;">
						<br/>
						<br/>
						<br/>
						<br/>
						<img src="{$ImagePath}/990SchG_Revenue.gif" alt="VerticalRevenue" style=""/>
					</td>
					<td>
						<table class="styTable" style="font-size: 7pt;height:auto;width:181mm;display:inline;" cellspacing="0" cellpadding="0">
							<tr>
							  <th colspan="2" style="height:20mm;width:53mm;float:left;clear:none;display:inline;">
								<span style="width: 53mm;display:inline;"/>
							  </th>
							  <th class="styLNAmountBox" scope="col" style="width:32mm;height:20mm;vertical-align:top;padding-top:.5mm;text-align:center;display:inline;">
								<b>(a)</b>
								<span class="styNormalText"> Event #1</span>
								<br/>
								<br/>
								<span class="styIRS990ScheduleGUnderlinedBox" style="height:auto;">
								  <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/Event1Nm"/>
								  </xsl:call-template>
								</span>
								<br/>
								<span class="styNormalText" style="display:inline;"> (event type)</span>
							  </th>
							  <th class="styLNAmountBox" scope="col" style="height:20mm;width:32mm;vertical-align:top;padding-top:.5mm;text-align:center;display:inline;">
								<b>(b)</b>
								<span class="styNormalText" style="display:inline;"> Event #2</span>
								<br/>
								<br/>
								<span class="styIRS990ScheduleGUnderlinedBox" style="height:auto;">
								  <xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/Event2Nm"/>
								  </xsl:call-template>
								</span>
								<br/>
								<span class="styNormalText" style="display:inline;"> (event type)</span>
							  </th>
							  <th class="styLNAmountBox" scope="col" style="height:20mm;width:32mm;vertical-align:top;padding-top:0.5mm;text-align:center;display:inline;">
								<b>(c)</b>
								<span class="styNormalText"> Other events</span>
								<br/>
								<br/>
								<span class="styIRS990ScheduleGUnderlinedBox" style="height:auto;">
								  <xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/OtherEventsTotalCnt"/>
								  </xsl:call-template>
								</span>
								<br/>
								<span class="styNormalText"> (total number)</span>
							  </th>
							  <th class="styLNAmountBox" scope="col" style="height:20mm;width:31mm; border-right-width: 0px;vertical-align:top;text-align:center;padding-top:0.75mm;display:inline;">
								<b>(d)</b>
								<span class="styNormalText"> Total events<br/>(add col. <b>(a) </b>through col. <b>(c)</b>)</span>
							  </th>
							</tr>
							<!--   BEGIN PART II  LINE 1   -->
							<tr>
							  <td style="height:6.5mm;float:left;clear:none;display:inline;">
								<br/>
								<span class="styLNLeftLtrBox" style="width: 5mm;text-align:left;padding-left:1.25mm;padding-top:0mm;">1</span>
							  </td>
							  <td class="styLNDesc" style="height:6.5mm;width: 48mm;padding-top:0mm;border-bottom-width:1px;display:inline;">
								<br/>
								Gross receipts 
								<span style="width:2mm;display:inline;"/>
								<b>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								</b>
							  </td>
							  <td class="styLNAmountBox" style="height:6.5mm;width: 32mm;padding-top:0mm;display:inline;">
								<br/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/GrossReceiptsEvent1Amt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:6.5mm;width: 32mm;padding-top:0mm;display:inline;">
								<br/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/GrossReceiptsEvent2Amt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:6.5mm;width:32mm;text-align:right;padding-top:0mm;display:inline;">
								<br/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/GrossReceiptsOtherEventsAmt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:6.5mm;width:31mm; border-right-width:0px; text-align:right;padding-top:0mm;display:inline;">
								<br/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/GrossReceiptsTotalAmt"/>
								</xsl:call-template>
							  </td>
							</tr>
							<!-- PART  II    Line 2  -->
							<tr>
							  <td style="height:6.5mm;width:5mm;float:left;clear:none;display:inline;">
								<br/>
								<span class="styLNLeftLtrBox" style="width: 5mm;text-align:left;padding-left:1mm;padding-top:0mm;">2</span>
							  </td>
							  <td class="styLNDesc" style="height:6.5mm;width: 48mm;padding-top:0mm;display:inline;">
								<br/>
								Less: Contributions 
								<b>.
								  <span style="width:4mm;"/>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								</b>
							  </td>
							  <td class="styLNAmountBox" style="height:6.5mm;width:32mm;text-align:right;padding-top:0mm;display:inline;">
								<br/>
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/CharitableContriEvent1Amt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:6.5mm;width:32mm;text-align:right;padding-top:0mm;display:inline;">
								<br/>
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/CharitableContriEvent2Amt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:6.5mm;width:32mm;text-align:right;padding-top:0mm;display:inline;">
								<br/>
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/CharitableContriOtherEventsAmt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:6.5mm;width:31mm; border-right-width:0px; text-align:right;padding-top:0mm;display:inline;">
								<br/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/CharitableContributionsTotAmt"/>
								</xsl:call-template>
							  </td>
							</tr>
							<!--  START LINE 3  -->
							<tr>
							  <td style="height:8mm;width:5mm;display:inline;">
								<span class="styLNLeftLtrBox" style="height:6.5mm;width: 5mm;text-align:left;padding-left:1mm;padding-top:0mm;border-bottom:1px solid black;">3</span>
							  </td>
							  <td class="styLNDesc" style="height:6.5mm;width: 48mm;padding-top:0mm;border-bottom:1px solid black;display:inline;">
								Gross income (line 1 minus <br/>
								line 2)
								<b>
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								</b>
							  </td>
							  <td class="styLNAmountBox" style="height:6.5mm;width:32mm;text-align:right;padding-top:0mm;vertical-align:bottom;display:inline;">
								<br/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/GrossRevenueEvent1Amt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:6.5mm;width:32mm;text-align:right;padding-top:0mm;vertical-align:bottom;display:inline;">
								<br/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/GrossRevenueEvent2Amt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:6.5mm;width:32mm;text-align:right;padding-top:0mm;vertical-align:bottom;display:inline;">
								<br/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/GrossRevenueOtherEventsAmt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:6.5mm;width:31mm; border-right-width:0px;text-align:right;padding-top:0mm;vertical-align:bottom;display:inline;">
								<br/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/GrossRevenueTotalEventsAmt"/>
								</xsl:call-template>
							  </td>
							</tr>
						</table>
					</td>
				</tr>
                
				<!--   PART II  Lines 4 - 11 -->
				<tr>
					<td class="styIRS990ScheduleGVTImageBox" style="height:46mm;width:6mm;padding-top:0mm;border-bottom-width:0px;">
						<br/>
						<br/>
						<br/>
						<img src="{$ImagePath}/990SchG_DirectExpenses.gif" alt="VerticalDirectExpenses"/>
					</td>
					<td>
						<table class="styTable" style="font-size: 7pt;height:auto;width:181mm;display:inline;" cellspacing="0" cellpadding="0">
							<!-- PART  II    Line 4  -->
							<tr>
							  <td style="height:auto;width:5mm;float:left;clear:none;display:inline;">
								<span class="styLNLeftLtrBox" style="width: 5mm;text-align:left;padding-left:1mm;padding-top:2mm;">4</span>
							  </td>
							  <td class="styLNDesc" style="height:auto;width: 48mm;padding-top:2mm;float:left;clear:none;display:inline;">
								Cash prizes
								<b>
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								</b>
							  </td>
							  <td class="styLNAmountBox" style="height:auto;width:32mm;text-align:right;padding-top:2mm;display:inline;">
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/CashPrizesEvent1Amt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:auto;width:32mm;text-align:right;padding-top:2mm;display:inline;">
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/CashPrizesEvent2Amt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:auto;width:32mm;text-align:right;padding-top:2mm;display:inline;">
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/CashPrizesOtherEventsAmt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:auto;width:31mm; border-right-width:0px; text-align:right;padding-top:2mm;display:inline;">
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/CashPrizesTotalEventsAmt"/>
								</xsl:call-template>
							  </td>
							</tr>
							<!-- PART  II    Line 5  -->
							<tr>
							  <td style="height:auto;width:5mm;display:inline;">
								<span class="styLNLeftLtrBox" style="width: 5mm;text-align:left;padding-left:1mm;padding-top:1mm;">5</span>
							  </td>
							  <td class="styLNDesc" style="height:auto;width: 48mm;padding-top:1.5mm;display:inline;">
								Noncash prizes
								<b>
								  <span style="width:6mm;"/>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								</b>
							  </td>
							  <td class="styLNAmountBox" style="height:auto;width:32mm;text-align:right;padding-top:2mm;display:inline;">
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/NonCashPrizesEvent1Amt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:auto;width:32mm;text-align:right;padding-top:2mm;display:inline;">
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/NonCashPrizesEvent2Amt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:auto;width:32mm;text-align:right;padding-top:2mm;display:inline;">
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/NonCashPrizesOtherEventsAmt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:auto;width:31mm; border-right-width:0px; text-align:right;padding-top:2mm;display:inline;">
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/NonCashPrizesTotalEventsAmt"/>
								</xsl:call-template>
							  </td>
							</tr>
							<!-- PART  II    Line 6  -->
							<tr>
							  <td style="height:auto;width:5mm;display:inline;">
								<span class="styLNLeftLtrBox" style="width: 5mm;text-align:left;padding-left:1mm;padding-top:1mm;">6</span>
							  </td>
							  <td class="styLNDesc" style="height:auto;width: 48mm;padding-top:1.5mm;display:inline;">
								Rent/facility costs
								<b>
								  <span style="width:2.5mm;"/>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								</b>
							  </td>
							  <td class="styLNAmountBox" style="height:auto;width:32mm;text-align:right;padding-top:2mm;display:inline;">
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/RentFacilityCostsEvent1Amt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:auto;width:32mm;text-align:right;padding-top:2mm;display:inline;">
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/RentFacilityCostsEvent2Amt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:auto;width:32mm;text-align:right;padding-top:2mm;display:inline;">
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/RentFcltyCostsOtherEventsAmt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:auto;width:31mm; border-right-width:0px; text-align:right;padding-top:2mm;display:inline;">
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/RentFcltyCostsTotalEventsAmt"/>
								</xsl:call-template>
							  </td>
							</tr>
							<!-- PART  II    Line 7  -->
							<tr>
							  <td style="height:auto;width:5mm;display:inline;">
								<span class="styLNLeftLtrBox" style="width: 5mm;text-align:left;padding-left:1mm;padding-top:1mm;">7</span>
							  </td>
							  <td class="styLNDesc" style="height:auto;width: 48mm;padding-top:1.5mm;display:inline;">
								Food and beverages
								<b>
								  <span style="width:5.5mm;"/>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								</b>
							  </td>
							  <td class="styLNAmountBox" style="height:auto;width:32mm;text-align:right;padding-top:2mm;display:inline;">
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/FoodAndBeverageEvent1Amt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:auto;width:32mm;text-align:right;padding-top:2mm;display:inline;">
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/FoodAndBeverageEvent2Amt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:auto;width:32mm;text-align:right;padding-top:2mm;display:inline;">
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/FoodAndBeverageOtherEventsAmt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:auto;width:31mm; border-right-width:0px; text-align:right;padding-top:2mm;display:inline;">
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/FoodAndBeverageTotalEventsAmt"/>
								</xsl:call-template>
							  </td>
							</tr>
							<!-- PART  II    Line 8  -->
							<tr>
							  <td style="height:auto;width:5mm;display:inline;">
								<span class="styLNLeftLtrBox" style="width: 5mm;text-align:left;padding-left:1mm;padding-top:1mm;">8</span>
							  </td>
							  <td class="styLNDesc" style="height:auto;width: 48mm;padding-top:1.5mm;display:inline;">
								Entertainment
								<b>
								  <span style="width:6mm;"/>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								</b>
							  </td>
							  <td class="styLNAmountBox" style="height:auto;width:32mm;text-align:right;padding-top:2mm;display:inline;">
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/EntertainmentEvent1Amt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:auto;width:32mm;text-align:right;padding-top:2mm;display:inline;">
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/EntertainmentEvent2Amt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:auto;width:32mm;text-align:right;padding-top:2mm;display:inline;">
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/EntertainmentOtherEventsAmt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:auto;width:31mm; border-right-width:0px; text-align:right;padding-top:2mm;display:inline;">
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/EntertainmentTotalEventsAmt"/>
								</xsl:call-template>
							  </td>
							</tr>
							<!-- PART  II    Line 9  -->
							<tr>
							  <td style="height:auto;width:5mm;display:inline;">
								<span class="styLNLeftLtrBox" style="width: 5mm;text-align:left;padding-left:1mm;padding-top:1mm;">9</span>
							  </td>
							  <td class="styLNDesc" style="height:auto;width: 48mm;padding-top:1.5mm;display:inline;">
								Other direct expenses
								<span style="width:2mm;"/>
								<b>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								</b>
							  </td>
							  <td class="styLNAmountBox" style="height:auto;width:32mm;text-align:right;padding-top:2mm;display:inline;">
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/OtherDirectExpensesEvent1Amt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:auto;width:32mm;text-align:right;padding-top:2mm;display:inline;">
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/OtherDirectExpensesEvent2Amt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:auto;width:32mm;text-align:right;padding-top:2mm;display:inline;">
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/OthDirectExpnssOtherEventsAmt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:auto;width:31mm; border-right-width:0px; text-align:right;padding-top:2mm;display:inline;">
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/OthDirectExpnssTotalEventsAmt"/>
								</xsl:call-template>
							  </td>
							</tr>
							<!-- PART  II    Line 10  -->
							<tr>
							  <td style="height:auto;width:5mm;display:inline;">
								<span class="styLNLeftLtrBox" style="width: 5mm;text-align:left;padding-left:1mm;padding-top:1.5mm;">10</span>
							  </td>
							  <td class="styLNDesc" style="height:auto;width: 144mm;padding-top:1.5mm;display:inline;" colspan="4">
								<span class="styNormalText" style="font-size:7pt;">Direct expense summary. Add lines 4 through 9 in column (d) </span>
								<b>
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
								</b>
								<span style="width:4mm"/>
								<img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/>
							  </td>
							  <td class="styLNAmountBox" style="height:auto;width:31mm; border-right-width:0px; text-align:right;padding-top:2mm;display:inline;">
								<xsl:choose>
									<xsl:when test="$Form990ScheduleGData/FundraisingEventInformationGrp/DirectExpenseSummaryEventsAmt &lt; 0">
										<xsl:call-template name="PopulateNegativeNumber">
										  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/DirectExpenseSummaryEventsAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
										  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/DirectExpenseSummaryEventsAmt"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							  </td>
							</tr>
							<!-- PART  II    Line 11  -->
							<tr>
							  <td style="height:auto;width:5mm;display:inline;">
								<span class="styLNLeftLtrBox" style="width: 5mm;text-align:left;padding-left:1mm;padding-top:1.5mm;">11</span>
							  </td>
							  <td class="styLNDesc" style="height:auto;width: 144mm;padding-top:1.5mm;display:inline;" colspan="4">
								<span class="styNormalText" style="font-size:7pt;">Net income summary. Subtract line 10 from line 3, column (d)</span>
								<b>
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
								</b>
								<span style="width:3.5mm"/>
								<img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/>
							  </td>
							  <td class="styLNAmountBox" style="height:auto;width:31mm; border-right-width:0px; border-bottom-width:0px;text-align:right;padding-top:2mm;display:inline;">
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraisingEventInformationGrp/NetIncomeSummaryAmt"/>
								</xsl:call-template>
							  </td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
  
            <!--  PART III   GAMING   -->
            <!-- BEGIN Part III Title -->
			<div class="styBB" style="height:7.5mm;width:187mm;border-top-width:1px;">
			  <div class="styPartName" style="height:4mm;padding-bottom:.5mm;">Part III</div>
			  <div class="styPartDesc" style="width:170mm;padding-bottom:.5mm;"><b>Gaming. </b> 
				<span class="styNormalText" style="display:inline;">
				  Complete if the organization answered "Yes" on Form 990, Part IV, line 19, or reported more than $15,000 on Form 990-EZ, line 6a. 
				</span>
			  </div>
			</div>
        
			<!-- PART III TABLE -->
			<table class="styTable" style="font-size: 7pt;height:auto;width:187mm;display:inline;" cellspacing="0" cellpadding="0">
				<tr>
					<td class="styIRS990ScheduleGVTImageBox" style="height:18.5mm;width:6mm;padding-top:1.5mm;border-bottom-width:1px;">
						<img src="{$ImagePath}/990SchG_Revenue.gif" alt="VerticalRevenue" style=""/>
					</td>
					<td>
						<table class="styTable" style="font-size: 7pt;height:auto;width:181mm;display:inline;" cellspacing="0" cellpadding="0">
							<tr>
							  <th colspan="2" style="height:12mm;width:53mm;float:left;clear:none;display:inline;">
								<span style="width: 53mm;display:inline;"/>
							  </th>               
							  <th class="styLNAmountBox" scope="col" style="height:12mm;width:32mm; border-right-width: 0px;vertical-align:top;text-align:center;vertical-align:center;padding-top:4mm;display:inline;">
								<b>(a)</b><span class="styNormalText" style="display:inline;"> Bingo</span>
							  </th>
							  <th class="styLNAmountBox" scope="col" style="height:12mm;width:32mm; border-right-width: 0px;vertical-align:top;text-align:center;vertical-align:center;padding-top:3mm;font-size:6.5pt;display:inline;">
								<b>(b)</b><span class="styNormalText" style="display:inline;"> Pull tabs/Instant</span><br/>
								<span class="styNormalText">bingo/progressive bingo</span>
							  </th>
							  <th class="styLNAmountBox" scope="col" style="height:12mm;width:32mm; border-right-width: 0px;vertical-align:top;text-align:center;vertical-align:center;padding-top:4mm;display:inline;">
								<b>(c)</b><span class="styNormalText" style="display:inline;"> Other gaming</span>
							  </th>
							  <th class="styLNAmountBox" scope="col" style="height:12mm;font-size:6.5pt;width:31mm; border-right-width: 0px;vertical-align:top;text-align:center;vertical-align:center;padding-top:3mm;display:inline;">
								<b>(d)</b><span class="styNormalText" style="display:inline;"> Total gaming (add col.<b>(a)</b> through col.<b>(c)</b>)</span>
							  </th>
							</tr>
							<!--   BEGIN PART III  LINE 1   -->
							<tr>
							  <td style="height:6.5mm;border-bottom:1px solid black;float:left;clear:none;display:inline;">
								<br/>
								<span class="styLNLeftLtrBox" style="width: 5mm;text-align:left;padding-left:1.25mm;padding-top:0mm;">1</span>
							  </td>
							  <td class="styLNDesc" style="height:6.5mm;width: 48mm;padding-top:0mm;border-bottom:1px solid black;display:inline;">
								<br/>
								Gross revenue 
								<span style="width:1mm;"/>
								<b>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								</b>
							  </td>
							  <td class="styLNAmountBox" style="height:6.5mm;width: 32mm;padding-top:0mm;display:inline;">
								<br/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/GrossRevenueBingoAmt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:6.5mm;width: 32mm;padding-top:0mm;display:inline;">
								<br/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/GrossRevenuePullTabsAmt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:6.5mm;width:32mm;text-align:right;padding-top:0mm;display:inline;">
								<br/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/GrossRevenueOtherGamingAmt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:6.5mm;width:31mm; border-right-width:0px; text-align:right;padding-top:0mm;display:inline;">
								<br/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/GrossRevenueTotalGamingAmt"/>
								</xsl:call-template>
							  </td>
							</tr>
						</table>
					</td>
				</tr>
                
				<!--   PART III  Lines 2 - 5 -->
				<tr>
					<td class="styIRS990ScheduleGVTImageBox" style="height:28mm;width:6mm;padding-top:0mm;border-bottom-width:1px;">
						<img src="{$ImagePath}/990SchG_DirectExpenses.gif" alt="VerticalDirectExpenses"/>
					</td>
					<td>
						<table class="styTable" style="font-size: 7pt;height:auto;width:181mm;display:inline;" cellspacing="0" cellpadding="0">
							<!-- PART  III    Line 2  -->
							<tr>
							  <td style="height:7mm;width:5mm;padding-top:0.5mm;float:left;clear:none;display:inline;">
								<br/>
								<span class="styLNLeftLtrBox" style="width: 5mm;text-align:left;padding-left:1mm;">2</span>
							  </td>
							  <td class="styLNDesc" style="height:7mm;width: 48mm;padding-top:0.5mm;float:left;clear:none;display:inline;">
								<br/>
								Cash prizes
								<b>
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								</b>
							  </td>
							  <td class="styLNAmountBox" style="height:7mm;width:32mm;text-align:right;padding-top:0.5mm;display:inline;">
								<br/>
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/CashPrizesBingoAmt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:7mm;width:32mm;text-align:right;padding-top:0.5mm;display:inline;">
								<br/>
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/CashPrizesPullTabsAmt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:7mm;width:32mm;text-align:right;padding-top:0.5mm;display:inline;">
								<br/>
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/CashPrizesOtherGamingAmt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:7mm;width:31mm; border-right-width:0px; text-align:right;padding-top:0.5mm;display:inline;">
								<br/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/CashPrizesTotalGamingAmt"/>
								</xsl:call-template>
							  </td>
							</tr>
							<!-- PART  III    Line 3  -->
							<tr>
							  <td style="height:7mm;width:5mm;padding-top:0.5mm;float:left;clear:none;display:inline;">
								<br/>
								<span class="styLNLeftLtrBox" style="width: 5mm;text-align:left;padding-left:1mm;;">3</span>
							  </td>
							  <td class="styLNDesc" style="height:7mm;width: 48mm;padding-top:0.5mm;float:left;clear:none;display:inline;">
								<br/>
								Noncash prizes
								<b>
								  <span style="width:6mm;"/>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								</b>
							  </td>
							  <td class="styLNAmountBox" style="height:7mm;width:32mm;text-align:right;padding-top:0.5mm;display:inline;">
								<br/>
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/NonCashPrizesBingoAmt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:7mm;width:32mm;text-align:right;padding-top:0.5mm;display:inline;">
								<br/>
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/NonCashPrizesPullTabsAmt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:7mm;width:32mm;text-align:right;padding-top:0.5mm;display:inline;">
								<br/>
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/NonCashPrizesOtherGamingAmt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:7mm;width:31mm; border-right-width:0px; text-align:right;padding-top:0.5mm;display:inline;">
								<br/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/NonCashPrizesTotalGamingAmt"/>
								</xsl:call-template>
							  </td>
							</tr>
							<!-- PART  III    Line 4  -->
							<tr>
							  <td style="height:7mm;width:5mm;padding-top:0.5mm;float:left;clear:none;display:inline;">
								<br/>
								<span class="styLNLeftLtrBox" style="width: 5mm;text-align:left;padding-left:1mm;">4</span>
							  </td>
							  <td class="styLNDesc" style="height:7mm;width: 48mm;padding-top:0.5mm;float:left;clear:none;display:inline;">
								<br/>
								Rent/facility costs
								<b>
								  <span style="width:2.5mm;"/>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								</b>
							  </td>
							  <td class="styLNAmountBox" style="height:7mm;width:32mm;text-align:right;padding-top:0.5mm;display:inline;">
								<br/>
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/RentFacilityCostsBingoAmt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:7mm;width:32mm;text-align:right;padding-top:0.5mm;display:inline;">
								<br/>
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/RentFacilityCostsPullTabsAmt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:7mm;width:32mm;text-align:right;padding-top:0.5mm;display:inline;">
								<br/>
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/RentFcltyCostsOtherGamingAmt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:7mm;width:31mm; border-right-width:0px; text-align:right;padding-top:0.5mm;display:inline;">
								<br/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/RentFcltyCostsTotalGamingAmt"/>
								</xsl:call-template>
							  </td>
							</tr>
							<!-- PART  III    Line 5  -->
							<tr>
							  <td style="height:7mm;width:5mm;padding-top:0.5mm;border-bottom:1px solid black;float:left;clear:none;display:inline;">
								<br/>
								<span class="styLNLeftLtrBox" style="width: 5mm;text-align:left;padding-left:1mm;">5</span>
							  </td>
							  <td class="styLNDesc" style="height:7mm;width: 48mm;padding-top:0.5mm;border-bottom:1px solid black;float:left;clear:none;display:inline;">
								<br/>
								Other direct expenses
								<span style="width:2mm;"/>
								<b>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								</b>
							  </td>
							  <td class="styLNAmountBox" style="height:7mm;width:32mm;text-align:right;padding-top:0.5mm;display:inline;">
								<br/>
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/OtherDirectExpensesBingoAmt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:7mm;width:32mm;text-align:right;padding-top:0.5mm;display:inline;">
								<br/>
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/OtherDirectExpensesPullTabsAmt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:7mm;width:32mm;text-align:right;padding-top:0.5mm;display:inline;">
								<br/>
								<span class="styTableCellPad"/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/OthDirectExpnssOtherGamingAmt"/>
								</xsl:call-template>
							  </td>
							  <td class="styLNAmountBox" style="height:7mm;width:31mm; border-right-width:0px; text-align:right;padding-top:0.5mm;display:inline;">
								<br/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/OthDirectExpnssTotalGamingAmt"/>
								</xsl:call-template>
							  </td>
							</tr>
						</table>
					</td>
				</tr>
				
				<!--   PART III  Lines 6 - 8 -->
				<tr>
					<td class="styIRS990ScheduleGVTImageBox" style="height:26mm;width:6mm;padding-top:0mm;border-bottom-width:1px;">
						<span style="width:6mm;"/>
					</td>
					<td>
						<table class="styTable" style="font-size: 7pt;height:auto;width:181mm;display:inline;" cellspacing="0" cellpadding="0">
							<!-- PART  III    Line 6  -->
							<tr>
							  <td style="height:12mm;width:5mm;float:left;clear:none;display:inline;">
								<br/>
								<br/>
								<span class="styLNLeftLtrBox" style="width: 5mm;text-align:left;padding-left:1mm;padding-top:1mm;">6</span>
							  </td>
							  <td class="styLNDesc" style="height:12mm;width: 48mm;padding-top:1mm;float:left;clear:none;display:inline;">
								<br/>
								<br/>
								Volunteer labor
								<span style="width:4mm;"/>
								<b>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								  <span class="styNBSP"/>.
								</b>
							  </td>
							  <td class="styLNAmountBox" style="height:12mm;width:32mm;text-align:right;padding-top:0mm;display:inline;">
								<!-- Line 6  col a  -->
								<table style="width:32mm;font-size:7pt;">
								  <tbody>
									<tr>
									  <td style="width:5mm;text-align:center;">
										<xsl:call-template name="PopulateSpan">
										  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/VolunteerLaborBingoInd"/>
										</xsl:call-template>
										<span style="float:left;clear:none;display:inline;">
										  <input type="checkbox" class="styCkbox" name="Checkbox">
											<xsl:call-template name="PopulateYesCheckbox">
											  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/VolunteerLaborBingoInd"/>
											  <xsl:with-param name="BackupName">VolunteerLaborBingo</xsl:with-param>
											</xsl:call-template>
										  </input>
										</span>
									  </td> 
									  <td style="width:25mm;text-align:left;padding-left:1mm;"> 
										<label>
										  <xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/VolunteerLaborBingoInd"/>
											<xsl:with-param name="BackupName">VolunteerLaborBingo</xsl:with-param>
										  </xsl:call-template>
										  <b>Yes</b>
										</label>
										<xsl:choose>									
											<xsl:when test="$Form990ScheduleGData/GamingInformationGrp/VolunteerLaborBingoPct !=''">
												<span class="styIRS990ScheduleGUnderlinedText" style="padding-right:1mm;text-align: right;width:17mm;border-style: dashed;">  
												  <xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/VolunteerLaborBingoPct"/>
												  </xsl:call-template>
												</span>
											</xsl:when>
											<xsl:otherwise>
												<span class="styIRS990ScheduleGUnderlinedText" style="padding-right:1mm;text-align: right;width:15mm;border-style: dashed;">  
													%
												</span>
											</xsl:otherwise>
										</xsl:choose>
									  </td> 
									</tr>
									<tr>
									  <td style="width:5mm;text-align:center;">
										<xsl:call-template name="PopulateSpan">
										  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/VolunteerLaborBingoInd"/>
										</xsl:call-template>    
										<span style="float:left;clear:none;display:inline;">
										  <input type="checkbox" class="styCkbox" name="Checkbox">
											<xsl:call-template name="PopulateNoCheckbox">
											  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/VolunteerLaborBingoInd"/>
											  <xsl:with-param name="BackupName">VolunteerLaborBingo</xsl:with-param>
											</xsl:call-template>
										  </input>
										</span>
									  </td> 
									  <td style="width:25mm;text-align:left;padding-left:1mm;"> 
										<label>
										  <xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/VolunteerLaborBingoInd"/>
											<xsl:with-param name="BackupName">VolunteerLaborBingo</xsl:with-param>
										  </xsl:call-template>
										  <b>No</b>
										</label>
									  </td> 
									</tr>
								  </tbody>
								</table>
							  </td>
							  <td class="styLNAmountBox" style="height:12mm;width:32mm;text-align:right;padding-top:0mm;display:inline;">
								<!-- Line 6  col b  -->
								<table style="width:32mm;font-size:7pt;">
								  <tbody>
									<tr>
									  <td style="width:5mm;text-align:center;">
										<xsl:call-template name="PopulateSpan">
										  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/VolunteerLaborPullTabsInd"/>
										</xsl:call-template>
										<span style="float:left;clear:none;display:inline;">
										  <input type="checkbox" class="styCkbox" name="Checkbox">
											<xsl:call-template name="PopulateYesCheckbox">
											  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/VolunteerLaborPullTabsInd"/>
											  <xsl:with-param name="BackupName">VolunteerLaborPullTabs</xsl:with-param>
											</xsl:call-template>
										  </input>
										</span> 
									  </td> 
									  <td style="width:25mm;text-align:left;padding-left:1mm;">          
										<label>
										  <xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/VolunteerLaborPullTabsInd"/>
											<xsl:with-param name="BackupName">VolunteerLaborPullTabs</xsl:with-param>
										  </xsl:call-template>
										  <b>Yes</b>
										</label>
										<xsl:choose>									
											<xsl:when test="$Form990ScheduleGData/GamingInformationGrp/VolunteerLaborPullTabsPct !=''">
												<span class="styIRS990ScheduleGUnderlinedText" style="padding-right:1mm;text-align: right;width:15mm;border-style: dashed;">  
												  <xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/VolunteerLaborPullTabsPct"/>
												  </xsl:call-template>
												</span>
											</xsl:when>
											<xsl:otherwise>
												<span class="styIRS990ScheduleGUnderlinedText" style="padding-right:1mm;text-align: right;width:17mm;border-style: dashed;">  
													%
												</span>
											</xsl:otherwise>
										</xsl:choose>
									  </td> 
									</tr>
									<tr>
									  <td style="width:5mm;text-align:center;">
										<xsl:call-template name="PopulateSpan">
										  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/VolunteerLaborPullTabsInd"/>
										</xsl:call-template>
										<span style="float:left;clear:none;display:inline;">
										  <input type="checkbox" class="styCkbox" name="Checkbox">
											<xsl:call-template name="PopulateNoCheckbox">
											  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/VolunteerLaborPullTabsInd"/>
											  <xsl:with-param name="BackupName">VolunteerLaborPullTabs</xsl:with-param>
											</xsl:call-template>
										  </input>
										</span>
									  </td> 
									  <td style="width:25mm;text-align:left;padding-left:1mm;">     
										<label>
										  <xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/VolunteerLaborPullTabsInd"/>
											<xsl:with-param name="BackupName">VolunteerLaborPullTabs</xsl:with-param>
										  </xsl:call-template>
										  <b>No</b>
										</label>
									  </td> 
									</tr>
								  </tbody>
								</table>
							  </td>
							  <td class="styLNAmountBox" style="height:12mm;width:32mm;text-align:right;padding-top:0mm;display:inline;">
								<!-- Line 6  col c  -->
								<table style="width:32mm;font-size:7pt;">
								  <tbody>
									<tr>
									  <td style="width:5mm;text-align:center;">
										<xsl:call-template name="PopulateSpan">
										  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/VolunteerLaborOtherGamingInd"/>
										</xsl:call-template>
										<span style="float:left;clear:none;display:inline;">
										  <input type="checkbox" class="styCkbox" name="Checkbox">
											<xsl:call-template name="PopulateYesCheckbox">
											  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/VolunteerLaborOtherGamingInd"/>
											  <xsl:with-param name="BackupName">VolunteerLaborPullTabs</xsl:with-param>
											</xsl:call-template>
										  </input>
										</span>  
									  </td> 
									  <td style="width:25mm;text-align:left;padding-left:1mm;">         
										<label>
										  <xsl:call-template name="PopulateLabelYes">
											<xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/VolunteerLaborOtherGamingInd"/>
											<xsl:with-param name="BackupName">VolunteerLaborPullTabs</xsl:with-param>
										  </xsl:call-template>
										  <b>Yes</b>
										</label>
										<xsl:choose>									
											<xsl:when test="$Form990ScheduleGData/GamingInformationGrp/VolunteerLaborOtherGamingPct !=''">
												<span class="styIRS990ScheduleGUnderlinedText" style="padding-right:1mm;text-align: right;width:15mm;border-style: dashed;">  
												  <xsl:call-template name="PopulatePercent">
													<xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/VolunteerLaborOtherGamingPct"/>
												  </xsl:call-template>
												</span>
											</xsl:when>
											<xsl:otherwise>
												<span class="styIRS990ScheduleGUnderlinedText" style="padding-right:1mm;text-align: right;width:17mm;border-style: dashed;">  
													%
												</span>
											</xsl:otherwise>
										</xsl:choose>
									  </td> 
									</tr>
									<tr>
									  <td style="width:5mm;text-align:center;">
										<xsl:call-template name="PopulateSpan">
										  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/VolunteerLaborOtherGamingInd"/>
										</xsl:call-template>
										<span style="float:left;clear:none;display:inline;">
										  <input type="checkbox" class="styCkbox" name="Checkbox">
											<xsl:call-template name="PopulateNoCheckbox">
											  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/VolunteerLaborOtherGamingInd"/>
											  <xsl:with-param name="BackupName">VolunteerLaborOtherGaming</xsl:with-param>
											</xsl:call-template>
										  </input>
										</span>
									  </td> 
									  <td style="width:27mm;text-align:left;padding-left:1mm;">  
										<label>
										  <xsl:call-template name="PopulateLabelNo">
											<xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/VolunteerLaborOtherGamingInd"/>
											<xsl:with-param name="BackupName">VolunteerLaborOtherGaming</xsl:with-param>
										  </xsl:call-template>
										  <b>No</b>
										</label>
									  </td> 
									</tr>
								  </tbody>
								</table>
							  </td>
							  <td class="styShadingCell" style="height:12mm;width:31mm; border-right-width:0px; border-bottom-width:1px;text-align:right;padding-top:0mm;display:inline;">
								<br/>
								<span style="width:30mm;"/>
							  </td>
							</tr>
							<!-- PART  III    Line 7  -->
							<tr>
							  <td style="height:7mm;width:5mm;padding-top:0.5mm;float:left;clear:none;display:inline;">
								<br/>
								<span class="styLNLeftLtrBox" style="width: 5mm;text-align:left;padding-left:1mm;">7</span>
							  </td>
							  <td class="styLNDesc" style="height:7mm;width: 144mm;padding-top:0.5mm;float:left;clear:none;display:inline;" colspan="4">
								<br/>
								<span class="styNormalText" style="font-size:7pt;">Direct expense summary. Add lines 2 through 5 in column (d) </span>
								<b>
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
								</b>
								<span style="width:4mm"/>
								<img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/>
							  </td>
							  <td class="styLNAmountBox" style="height:7mm;width:31mm; border-right-width:0px; text-align:right;padding-top:0.5mm;display:inline;">
								<br/>
								<xsl:choose>
									<xsl:when test="$Form990ScheduleGData/GamingInformationGrp/DirectExpenseSummaryGamingAmt &lt; 0">
										<xsl:call-template name="PopulateNegativeNumber">
										  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/DirectExpenseSummaryGamingAmt"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateAmount">
										  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/DirectExpenseSummaryGamingAmt"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							  </td>
							</tr>
							<!-- PART  III    Line 8  -->
							<tr>
							  <td style="height:7mm;width:5mm;padding-top:0.5mm;border-bottom:1px solid black;float:left;clear:none;display:inline;">
								<br/>
								<span class="styLNLeftLtrBox" style="width: 5mm;text-align:left;padding-left:1mm;">8</span>
							  </td>
							  <td class="styLNDesc" style="height:7mm;width: 144mm;padding-top:0.5mm;border-bottom:1px solid black;float:left;clear:none;display:inline;" colspan="4">
								<br/>
								<span class="styNormalText" style="font-size:7pt;">Net gaming income summary. Subtract line 7 from line 1, column (d)</span>
								<span style="width:0.5mm"/>
								<b>.
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
									<span style="width:4mm"/>.
								</b>
								<span style="width:3.5mm"/>
								<img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/>
							  </td>
							  <td class="styLNAmountBox" style="height:7mm;width:31mm; border-right-width:0px; border-bottom:1px solid black;text-align:right;padding-top:0.5mm;display:inline;">
								<br/>
								<xsl:call-template name="PopulateAmount">
								  <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingInformationGrp/NetGamingIncomeSummaryAmt"/>
								</xsl:call-template>
							  </td>
							</tr>
						</table>
					</td>
				</tr>
			</table>    

     <!-- LINE 9  -->
    <div style="width:187mm;">
      <span style="height:2mm; width:84mm;"/>
      <div class="styLNLeftNumBox" style="width:8mm;padding-bottom:.5mm;padding-left:1mm;font-size:7pt;float:left;clear:none;"><br/>9</div>
      <div class="styLNDesc" style="width:179mm;padding-top:.5mm;padding-bottom:0mm;font-size:7pt;float:left;clear:none;">
        <span class="styNormalText;display:inline;">
          Enter the state(s) in which the organization conducts gaming activities: </span>
          <span class="styIRS990ScheduleGUnderlinedText" style="font-size: 7pt; width:84mm;text-align: left;">
            <xsl:if test="($Print = $Separated) and (count($Form990ScheduleGData/StatesWhereGamingConductedCd) &gt;8)">
              <xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/StatesWhereGamingConductedCd"/>
              </xsl:call-template>
            </xsl:if>
            <xsl:if test="($Print != $Separated) or (($Print = $Separated) and (count($Form990ScheduleGData/StatesWhereGamingConductedCd) &lt;9))">
              <xsl:for-each select="$Form990ScheduleGData/StatesWhereGamingConductedCd">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="."/>
                </xsl:call-template>
                <xsl:if test="position()!=last()">
                  , <span style="width: 1mm"/>    
                </xsl:if>
              </xsl:for-each>
            </xsl:if>
          </span>
     </div>
    </div>

    
    <!-- Line 9a  -->
        <div class="styLNLeftNumBox" style="height:5mm;padding-top:1mm;padding-left:3mm;">a</div>
        <div class="styLNDesc" style="width:150mm;height:5mm;vertical-align:bottom;padding-top:1mm;padding-bottom:0mm;font-size:7pt;display:inline;">
          <span class="styNormalText">
            Is the organization licensed to conduct gaming activities in each of these states?
            <span style="width:3mm;"/>.
            <span style="width:4mm;"/>.
            <span style="width:4mm;"/>.
            <span style="width:4mm;"/>.
            <span style="width:4mm;"/>.
            <span style="width:4mm;"/>.
            <span style="width:4mm;"/>.
            <span style="width:4mm;"/>.
          </span>
        </div>
             
        <div style="height:5mm;font-size:7pt;vertical-align:center;display:inline;">
            <input type="checkbox" class="IRS990ScheduleG_Checkbox" style="height:3mm;width:3mm;">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/LicensedInd"/>
              </xsl:call-template>
            </input>
          <label>
            <xsl:call-template name="PopulateLabelYes">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/LicensedInd"/>
            </xsl:call-template>
            <span><b>Yes</b></span>
          </label>
          <span style="width:2mm;"/>
            <input type="checkbox" class="IRS990ScheduleG_Checkbox" style="height:3mm;width:3mm;">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/LicensedInd"/>
              </xsl:call-template>
            </input>
          <label>
            <xsl:call-template name="PopulateLabelNo">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/LicensedInd"/>
            </xsl:call-template>
            <span><b>No</b></span>
          </label>
        </div>


<!--  Line 9b  --> 
  <div style="width:187mm">
     <div class="styLNLeftNumBox" style="height:3mm;padding-left:3mm;">b</div>
       <div class="styLNDesc" style="width:178mm;height:3mm;padding-top:.25mm;padding-bottom:0mm;">
        If "No," explain:
        <span class="styIRS990ScheduleGUnderlinedText" style="width:155mm;"/>
      </div>

      <div class="IRS990ScheduleG_LineContainer" style="height:auto">
      <div class="IRS990ScheduleG_LineIndex"/>
      <div class="IRS990ScheduleG_LineDesc" style="height:auto;width:178mm;border-bottom-style:dashed;border-bottom-width:1px;border-right-width:0px;">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/ExplanationIfNoTxt"/>
        </xsl:call-template>
      </div>
    </div>
 <xsl:if test="string-length($Form990ScheduleGData/ExplanationIfNoTxt) &lt;1">
   <div class="IRS990ScheduleG_LineContainer">
    <div class="IRS990ScheduleG_LineIndex"/>
    <div class="IRS990ScheduleG_LineDesc" style="width:178mm;border-bottom-style:dashed;border-bottom-width:1px;"/>
</div>
</xsl:if>
</div>


<!-- LINE  10a  -->

      <div class="styLNLeftNumBox" style="height:3mm;padding-top:1mm;padding-left:0mm;">10a</div>
      <div class="styLNDesc" style="width:150mm;height:3mm;padding-top:1mm;padding-bottom:0mm;font-size:7pt;">
        <span class="styNormalText">
          Were any of the organization's gaming licenses revoked, suspended or terminated during the tax year?
            <span style="width:4mm;"/>.
            <span style="width:4mm;"/>.
            <span style="width:4mm;"/>.
        </span>
      </div>
      <div style="height:5mm;padding-top:1mm;font-size:7pt;vertical-align:center;">
            <input type="checkbox" class="IRS990ScheduleG_Checkbox" style="height:3mm;width:3mm;">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/LicenseSuspendedEtcInd"/>
              </xsl:call-template>
            </input>
          <label>
            <xsl:call-template name="PopulateLabelYes">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/LicenseSuspendedEtcInd"/>
            </xsl:call-template>
            <span><b>Yes</b></span>
          </label>
          <span style="width:2mm;"/>
            <input type="checkbox" class="IRS990ScheduleG_Checkbox" style="height:3mm;width:3mm;">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/LicenseSuspendedEtcInd"/>
              </xsl:call-template>
            </input>
          <label>
            <xsl:call-template name="PopulateLabelNo">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/LicenseSuspendedEtcInd"/>
            </xsl:call-template>
            <span><b>No</b></span>
          </label>
        </div>  

<!--  Line 10b  --> 
  <div style="width:187mm">
     <div class="styLNLeftNumBox" style="height:3mm;padding-left:3mm;">b</div>
       <div class="styLNDesc" style="width:178mm;height:3mm;padding-top:.25mm;padding-bottom:0mm;">
         If "Yes," explain:
        <span class="styIRS990ScheduleGUnderlinedText" style="width:154mm;"/>
     </div>

      <div class="IRS990ScheduleG_LineContainer" style="height:auto">
      <div class="IRS990ScheduleG_LineIndex"/>
      <div class="IRS990ScheduleG_LineDesc" style="height:auto;width:178mm;border-bottom-style:dashed;border-bottom-width:1px;border-right-width:0px;">
       <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/ExplanationIfYesTxt"/>
      </xsl:call-template>
  </div>
 </div>
 <xsl:if test="string-length($Form990ScheduleGData/ExplanationIfYesTxt) &lt;1">
   <div class="IRS990ScheduleG_LineContainer">
    <div class="IRS990ScheduleG_LineIndex"/>
    <div class="IRS990ScheduleG_LineDesc" style="width:178mm;border-bottom-style:dashed;border-bottom-width:1px;"/>
</div>
</xsl:if>
</div>
	
    <div style="height:4mm;width:187mm;border-top-width:0px;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;border-style:solid;border-color:black"><span style="width:1mm;"/></div>
    </div>
    <!-- Page 2 Footer -->
    <div class="pageEnd" style="width:187mm;">
      <span style="width:139mm;"/>
      <span style="font-weight:bold;font-size:6pt;">Schedule G (Form 990 or 990-EZ) 2016</span>
    </div>
 
     <!-- PAGE 3 HEADER  -->
          <div style="display:block;">
 <div class="styBB" style="width:187mm; padding-bottom:.5mm;border-bottom-width:1.75px;">  
    <div style="float:left;font-size;6pt;">Schedule G (Form 990 or 990-EZ) 2016</div>
    <div style="float:right;font-size:6pt;">Page <span style="font-weight:bold;font-size:7pt;">3</span></div>                    
  </div> 
<!-- END Page Header  -->  

  <!-- Line 11  -->
      <div class="styLNLeftNumBox" style="height:3mm;padding-left:0mm;padding-top:1mm;">11</div>
      <div class="styLNDesc" style="width:150mm;height:3mm;padding-top:1mm;padding-bottom:0mm;">
        <span class="styNormalText">
          Does the organization conduct gaming activities with nonmembers? 
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
        </span></div>
        <div style="height:5mm;padding-top:1mm;font-size:7pt;vertical-align:center;">
            <input type="checkbox" class="IRS990ScheduleG_Checkbox" style="height:3mm;width:3mm;">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingWithNonmembersInd"/>
              </xsl:call-template>
            </input>
          <label>
            <xsl:call-template name="PopulateLabelYes">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingWithNonmembersInd"/>
            </xsl:call-template>
            <span><b>Yes</b></span>
          </label>
          <span style="width:2mm;"/>
            <input type="checkbox" class="IRS990ScheduleG_Checkbox" style="height:3mm;width:3mm;">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingWithNonmembersInd"/>
              </xsl:call-template>
            </input>
          <label>
            <xsl:call-template name="PopulateLabelNo">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingWithNonmembersInd"/>
            </xsl:call-template>
            <span><b>No</b></span>
          </label>
        </div> 

<!--  LINE  12  -->

    <div class="styBB" style="border-bottom-width:0px;">
     <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:3mm;padding-top:1mm;padding-left:0mm;">12</div>
      <div class="styLNDesc" style="width:155mm;height:3mm;padding-top:1mm;padding-bottom:0mm;font-size:7pt;">
        <span class="styNormalText">
         Is the organization a grantor, beneficiary or trustee of a trust or a member of a partnership or other entity
        </span></div>
    </div>

      <div class="styLNLeftNumBox" style="height:3mm;padding-left:1mm;padding-top:1mm;"/>
      <div class="styLNDesc" style="width:150mm;height:4mm;padding-top:1mm;font-size:7pt;">
        <span class="styNormalText">
          formed to administer charitable gaming? <span style="width:3mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
        </span></div>
        <div style="height:5mm;padding-top:1mm;font-size:7pt;vertical-align:center;">
            <input type="checkbox" class="IRS990ScheduleG_Checkbox" style="height:3mm;width:3mm;">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/MemberOfOtherEntityInd"/>
              </xsl:call-template>
            </input>
          <label>
            <xsl:call-template name="PopulateLabelYes">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/MemberOfOtherEntityInd"/>
            </xsl:call-template>
            <span><b>Yes</b></span>
          </label>
          <span style="width:2mm;"/>
            <input type="checkbox" class="IRS990ScheduleG_Checkbox" style="height:3mm;width:3mm;">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/MemberOfOtherEntityInd"/>
              </xsl:call-template>
            </input>
          <label>
            <xsl:call-template name="PopulateLabelNo">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/MemberOfOtherEntityInd"/>
            </xsl:call-template>
            <span><b>No</b></span>
          </label>
        </div>
</div>
      
<!-- LINE 13  -->
<div class="styNBB" style="width:187mm;"> 
     <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:3mm;padding-left:0mm;">13</div>
      <div class="styLNDesc" style="width:139mm;height:4.5mm;">
        Indicate the percentage of gaming activity conducted in:
        <!--Dotted Line-->
        <span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:2mm;"/>
      </div>
      <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0px;"/>
      <div class="styLNAmountBox" style="height:4.5mm;padding-right:0.5mm;border-bottom-width:0px;"/>
    </div>
    <!-- Line 13a-->
    <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:3mm;padding-left:3mm;">a</div>
      <div class="styLNDesc" style="width:139mm;height:4.5mm;">
       The organization's facility
        <!--Dotted Line-->
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
      </div>
      <div class="styLNRightNumBox" style="height:4.5mm;">13a</div>
      <div class="styLNAmountBox" style="height:4.5mm;padding-right:0.5mm;">
		<xsl:choose>									
			<xsl:when test="$Form990ScheduleGData/GamingOwnFacilityPct !=''">
				<xsl:call-template name="PopulatePercent">
				 <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingOwnFacilityPct"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<span>%</span>
			</xsl:otherwise>
		</xsl:choose>
	  </div>
    </div>
  <!-- Line 13b  --> 
 <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:3mm;padding-left:3mm;">b</div>
      <div class="styLNDesc" style="width:139mm;height:4.5mm;">
          An outside facility
        <!--Dotted Line-->        
          <span style="width:2mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
      </div>
      <div class="styLNRightNumBox" style="height:4.5mm;">13b</div>
      <div class="styLNAmountBox" style="height:4.5mm;padding-right:0.5mm;">
		<xsl:choose>									
			<xsl:when test="$Form990ScheduleGData/GamingOtherFacilityPct !=''">
				<xsl:call-template name="PopulatePercent">
				 <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingOtherFacilityPct"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<span>%</span>
			</xsl:otherwise>
		</xsl:choose>
      </div>
    </div>
    
    
<!-- Line 14 -->
<div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:8mm;padding-left:0px;">14</div>
      <div class="styLNDesc" style="width:155mm;height:8mm;">
       Enter the name and address of the person who prepares the organization's gaming/special events books and records:
      </div>
       
      <div class="styLNLeftNumBox" style="height:4mm;"/>
   </div>

   <div style="width:187mm">
     <div class="IRS990ScheduleG_LineContainer" style="height:8mm;"> 
       <div class="styLNDesc" style="width:24mm;height:8mm;padding-left:8mm;padding-right:2.5mm;">
        Name  <img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/>
       </div>
          <div class="styFixedUnderline" style="width:163mm;padding-left:2mm;border-bottom-style:dashed;border-bottom-width:1px;border-right-width:0px;">
         <xsl:choose>
                  <xsl:when test="$Form990ScheduleGData/IndividualWithBooksNm != ''">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/IndividualWithBooksNm"/>
                    </xsl:call-template>
                  </xsl:when>
                </xsl:choose>
                <xsl:choose>
                  <xsl:when test="$Form990ScheduleGData/PersonsWithBooksName/BusinessNameLine1Txt != ''">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/PersonsWithBooksName/BusinessNameLine1Txt"/>
                    </xsl:call-template>
                  </xsl:when>
                </xsl:choose>
                <xsl:choose>
                  <xsl:when test="$Form990ScheduleGData/PersonsWithBooksName/BusinessNameLine2Txt != ''">
                    <br/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/PersonsWithBooksName/BusinessNameLine2Txt"/>
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
     <div class="IRS990ScheduleG_LineContainer" style="height:auto;"> 
       <div class="styLNDesc" style="width:25mm;height:auto;padding-left:8mm;padding-right:2.5mm;">
        Address  <img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/>  </div>
          <div class="styFixedUnderline" style="width:162mm;padding-left:2mm;border-bottom-style:dashed;border-bottom-width:1px;border-right-width:0px;">
    
    <xsl:if test="$Form990ScheduleGData/PersonsWithBooksUSAddress != ''">
                  <xsl:call-template name="PopulateUSAddressTemplate">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/PersonsWithBooksUSAddress"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="$Form990ScheduleGData/PersonsWithBooksForeignAddress != ''">
                  <xsl:call-template name="PopulateForeignAddressTemplate">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/PersonsWithBooksForeignAddress"/>
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

<!--  LINE  15a  -->

     <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:3mm;padding-left:0mm;">15a</div>
      <div class="styLNDesc" style="width:155mm;height:3mm;padding-top:.5mm;padding-bottom:0mm;font-size:7pt;">
        <span class="styNormalText">
         Does the organization have a contract with a third party from whom the organization receives gaming
        </span></div>
    </div>

      <div class="styLNLeftNumBox" style="height:3mm;padding-left:1mm;padding-top:1mm;"/>
      <div class="styLNDesc" style="width:150mm;height:4mm;padding-top:1mm;font-size:7pt;">
        <span class="styNormalText">
         revenue?
        <!--Dotted Line-->        
          <span style="width:2mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
          <span style="width:4mm;"/>.
        </span></div>
        <div style="height:5mm;padding-top:1mm;font-size:7pt;vertical-align:center;">
            <input type="checkbox" class="IRS990ScheduleG_Checkbox" style="height:3mm;width:3mm;">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/CntrctWith3rdPrtyForGameRevInd"/>
              </xsl:call-template>
            </input>
          <label>
            <xsl:call-template name="PopulateLabelYes">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/CntrctWith3rdPrtyForGameRevInd"/>
            </xsl:call-template>
            <span><b>Yes</b></span>
          </label>
          <span style="width:2mm;"/>
            <input type="checkbox" class="IRS990ScheduleG_Checkbox" style="height:3mm;width:3mm;">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/CntrctWith3rdPrtyForGameRevInd"/>
              </xsl:call-template>
            </input>
          <label>
            <xsl:call-template name="PopulateLabelNo">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/CntrctWith3rdPrtyForGameRevInd"/>
            </xsl:call-template>
            <span><b>No</b></span>
          </label>
        </div>

<!--  Line 15b  -->  
 <div style="width: 187mm">
    <div class="styLNLeftLtrBox" style="padding-left:3mm;">b</div>
    <div class="styLNDesc" style="width: 155mm">
      If "Yes," enter the amount of gaming revenue received by the organization <img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/>  $  <span class="styIRS990ScheduleGUnderlinedText" style="text-align: right">  
          <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingRevenueReceivedByOrgAmt"/>
                </xsl:call-template></span>
             <span style="width: 1mm"/>and the </div>
  </div>

  <div style="width: 187mm">
    <div class="styLNLeftLtrBox"/>
    <div class="styLNDesc" style="width: 155mm;height:3mm;">
        amount of gaming revenue retained by the third party <img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/> $ <span class="styIRS990ScheduleGUnderlinedText" style="text-align: right">
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingRevenueRtnBy3PrtyAmt"/>
           </xsl:call-template>  
        </span>  <span style="width: 1mm">.</span>
        </div>
  </div> 

<!-- LINE  15c  -->
      <div style="width:187mm">
        <div class="styLNLeftNumBox" style="height:3mm;padding-left:3mm;padding-top:1mm;">c</div>
         <div class="styLNDesc" style="width:155mm;height:4mm;padding-top:1.5mm;padding-bottom:0mm;">
         If "Yes," enter name and address of the third party:
     </div>
   </div>
   <div class="styLNLeftNumBox" style="height:4mm;"/>
      
    <div style="width:187mm">
     <div class="IRS990ScheduleG_LineContainer" style="height:8mm;"> 
       <div class="styLNDesc" style="width:24mm;height:8mm;padding-left:8mm;padding-right:2.5mm;">
        Name  <img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/>  </div>
          <div class="styFixedUnderline" style="width:163mm;padding-left:2mm;border-bottom-style:dashed;border-bottom-width:1px;border-right-width:0px;">
      <xsl:choose>
                  <xsl:when test="$Form990ScheduleGData/ThirdPartyPersonNm!= ''">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/ThirdPartyPersonNm"/>
                    </xsl:call-template>
                  </xsl:when>
                </xsl:choose>
                <xsl:choose>
                <xsl:when test="$Form990ScheduleGData/ThirdPartyBusinessName/BusinessNameLine1 != ''">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/ThirdPartyBusinessName/BusinessNameLine1"/>
                    </xsl:call-template>
                  </xsl:when>
                </xsl:choose>
                <xsl:choose>
                <xsl:when test="$Form990ScheduleGData/ThirdPartyBusinessName/BusinessNameLine2 != ''">
                    <br/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/ThirdPartyBusinessName/BusinessNameLine2"/>
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
   
  <!-- Line 15c  Address  -->
    <div style="width:187mm">
     <div class="IRS990ScheduleG_LineContainer" style="height:8mm;"> 
       <div class="styLNDesc" style="width:25mm;height:8mm;padding-left:8mm;padding-right:2.5mm;">
        Address  <img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/>  </div>
          <div class="styFixedUnderline" style="width:162mm;padding-left:2mm;border-bottom-style:dashed;border-bottom-width:1px;border-right-width:0px;">

      <xsl:choose>
                  <xsl:when test="$Form990ScheduleGData/ThirdPartyUSAddress">                    
                      <xsl:call-template name="PopulateUSAddressTemplate">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/ThirdPartyUSAddress"/>
                      </xsl:call-template>                    
                  </xsl:when>
                  <xsl:otherwise>
                      <xsl:call-template name="PopulateForeignAddressTemplate">
                        <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/ThirdPartyForeignAddress"/>
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
        <div class="styLNLeftNumBox" style="height:5mm;padding-left:0mm;padding-top:3mm;">16</div>
         <div class="styLNDesc" style="width:155mm;height:5mm;padding-top:3mm;padding-bottom:0mm;">
        Gaming manager information:
     </div>
   </div>
   <div class="styLNLeftNumBox" style="height:4mm;"/>
      <div class="styLNDesc" style="width:155mm;height:4mm;">
        </div>
        
    <div style="width:187mm">
     <div class="IRS990ScheduleG_LineContainer" style="height:auto;"> 
       <div class="styLNDesc" style="width:24mm;height:auto;padding-left:8mm;padding-right:2mm;padding-top:1mm;">
        Name  <img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/>
</div>
          <div class="styFixedUnderline" style="height:auto;width:163mm;padding-left:1mm;border-bottom-style:dashed;border-bottom-width:1px;border-right-width:0px;">
        <xsl:choose>
                  <xsl:when test="$Form990ScheduleGData/GamingManagerPersonNm!= ''">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingManagerPersonNm"/>
                    </xsl:call-template>
                  </xsl:when>
                </xsl:choose>
                <xsl:choose>
                  <xsl:when test="$Form990ScheduleGData/GamingManagerBusinessName/BusinessNameLine1 != ''">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingManagerBusinessName/BusinessNameLine1"/>
                    </xsl:call-template>
                  </xsl:when>
                </xsl:choose>
                <xsl:choose>
                  <xsl:when test="$Form990ScheduleGData/GamingManagerBusinessName/BusinessNameLine2 != ''">
                    <br/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingManagerBusinessName/BusinessNameLine2"/>
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

    <div class="styLNLeftNumBox" style="height:4mm;"/>
      <div class="styLNDesc" style="width:155mm;height:4mm;">
        </div>
        
    <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:3mm;padding-left:2mm;font-size:7pt;"/>
      <div class="styLNDesc" style="width:155mm;height:3mm;padding-top:0mm;padding-bottom:0mm;font-size:7pt;">
        <span class="styNormalText">
          Gaming manager compensation  <img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/> $ </span>
           <span class="styIRS990ScheduleGUnderlinedBox" style="font-size: 7pt; width:40mm;text-align: right;padding-right:1mm;border-bottom-style:dashed;">
          <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingManagerCompensationAmt"/>
                </xsl:call-template>
              </span>
     </div>
    </div>
    
    <div class="styLNLeftNumBox" style="height:auto;"/>
      <div class="styLNDesc" style="width:155mm;height:auto;">
        </div>

  <div style="height:auto;width:187mm">
     <div class="IRS990ScheduleG_LineContainer" style="height:auto;padding-top:4mm;"> 
       <div class="styLNDesc" style="width:54mm;height:auto;padding-left:8mm;padding-right:2mm;">
          Description of services provided  
          <img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/>
       </div>
       <div class="styFixedUnderline" style="height:auto;width:131mm;padding-left:0mm;border-bottom-style:dashed;border-bottom-width:1px;border-right-width:0px;">
           <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingManagerServicesProvTxt"/>
           </xsl:call-template>
       </div> 
    </div>
  </div>

 <!-- line 16 check boxes --> 
 
    <div class="styLNLeftNumBox" style="height:4mm;"/>
      <div class="styLNDesc" style="width:155mm;height:4mm;">
        </div>
        
    <div style="width:187mm">
     <div class="styLNLeftNumBox" style="height:4mm;"/>
      <div class="styLNDesc" style="width:155mm;height:5mm;"> 
       <span style="width:50mm;">
        <input type="checkbox" class="IRS990ScheduleG_Checkbox" style="height:3mm;width:3mm;">
         <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingManagerIsDirectorOfcrInd"/>
          <xsl:with-param name="BackupName">GamingManagerIsDirectorOfficer</xsl:with-param>
         </xsl:call-template>
        </input>
        <label>
          <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingManagerIsDirectorOfcrInd"/>
            <xsl:with-param name="BackupName">GamingManagerIsDirectorOfficer
            </xsl:with-param>
          </xsl:call-template>
          Director/officer
        </label>
      </span>     
      
      <span style="width:45mm;">
      <input type="checkbox" class="IRS990ScheduleG_Checkbox" style="height:3mm;width:3mm;">
         <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingManagerIsEmployeeInd"/>
          <xsl:with-param name="BackupName">GamingManagerIsEmployee</xsl:with-param>
         </xsl:call-template>
        </input>
        <label>
          <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingManagerIsEmployeeInd"/>
            <xsl:with-param name="BackupName">GamingManagerIsEmployee
            </xsl:with-param>
          </xsl:call-template>
         Employee
        </label>
      </span>

      <span style="width:45mm;">
      <input type="checkbox" class="IRS990ScheduleG_Checkbox" style="height:3mm;width:3mm;">
         <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingManagerIsIndCntrctInd"/>
          <xsl:with-param name="BackupName">GamingManagerIsIndContractor</xsl:with-param>
         </xsl:call-template>
        </input>
        <label>
          <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/GamingManagerIsIndCntrctInd"/>
            <xsl:with-param name="BackupName">GamingManagerIsIndContractor
            </xsl:with-param>
          </xsl:call-template>
          Independent contractor
        </label>
      </span></div>
</div>

<span style="height:4mm;width:187mm;"/>

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

      <div class="styLNLeftNumBox" style="height:3mm;padding-left:1mm;padding-top:1mm;"/>
      <div class="styLNDesc" style="width:150mm;height:4mm;padding-top:1mm;font-size:7pt;">
        <span class="styNormalText">
         retain the state gaming license? 
         <span style="width:2mm;"/>.
         <span style="width:4mm;"/>.
         <span style="width:4mm;"/>.
         <span style="width:4mm;"/>.
         <span style="width:4mm;"/>.
         <span style="width:4mm;"/>.
         <span style="width:4mm;"/>.
         <span style="width:4mm;"/>.
         <span style="width:4mm;"/>.
         <span style="width:4mm;"/>.
         <span style="width:4mm;"/>.
         <span style="width:4mm;"/>.
         <span style="width:4mm;"/>.
         <span style="width:4mm;"/>.
         <span style="width:4mm;"/>.
         <span style="width:4mm;"/>.
         <span style="width:4mm;"/>.
         <span style="width:4mm;"/>.
         <span style="width:4mm;"/>.
        </span></div>
        <div style="height:5mm;padding-top:1mm;font-size:7pt;vertical-align:center;">
            <input type="checkbox" class="IRS990ScheduleG_Checkbox" style="height:3mm;width:3mm;">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/CharitableDistributionRqrInd"/>
              </xsl:call-template>
            </input>
          <label>
            <xsl:call-template name="PopulateLabelYes">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/CharitableDistributionRqrInd"/>
            </xsl:call-template>
            <span>Yes</span>
          </label>
          <span style="width:2mm;"/>
            <input type="checkbox" class="IRS990ScheduleG_Checkbox" style="height:3mm;width:3mm;">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/CharitableDistributionRqrInd"/>
              </xsl:call-template>
            </input>
          <label>
            <xsl:call-template name="PopulateLabelNo">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/CharitableDistributionRqrInd"/>
            </xsl:call-template>
            <span>No</span>
          </label>
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
   <div class="styLNLeftLtrBox"/>
    <div class="styLNDesc" style="width: 155mm;height:3mm;">
      in the organization's own exempt activities during the tax year  <img src="{$ImagePath}/990SchG_Bullet_Line.gif" alt="right arrow"/>  
      <span style="width: 2mm;">  </span>$
          <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/DistributedAmt"/>
           </xsl:call-template>  
          </div>
  </div>
</div> 

  <!-- BEGIN Part IV Title -->
  <div class="styBB" style="height:8mm;width:187mm;border-bottom-width:0px;">
    <div class="styPartName" style="height:4mm;">Part IV</div>
    <div class="styPartDesc" style="width:170mm;padding-bottom:.5mm;">
      <span class="styNormalText">  
        <b>Supplemental Information.</b> Provide the explanations required by Part I, line 2b,
		columns (iii) and (v); and Part III, lines 9, 9b, 10b, 15b, 15c, 16, and 17b, as applicable. Also 
		provide any additional information (see instructions).
      </span>
    </div>
  </div>
  <!-- END Part IV Title -->
 
            <table cellspacing="0" cellpadding="0" style="font-size:7pt;">
              <thead class="styTableThead">
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell" scope="col" style="width:57mm;height:5mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-left-width:0px;">Return Reference </th>
                  <th class="styDepTblCell" scope="col" style="width:130mm;height:5mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-left-width:0px;border-right:none;">Explanation  </th>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="$Form990ScheduleGData/SupplementalInformationDetail">
                  <tr>
                    <xsl:attribute name="class">
                      <xsl:choose>
                        <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                        <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>
                    <td class="styTableCell" style="font-size:7pt;border-color:black;text-align:left;padding-top:1mm;vertical-align:top;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="FormAndLineReferenceDesc"/>
                      </xsl:call-template>
                      <span class="styTableCellPad "/>
                    </td>
                    <td class="styTableCell" style="font-size:7pt;border-color:black;border-right:none;text-align:left;vertical-align:top;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="ExplanationTxt"/>
                      </xsl:call-template>
                      <span class="styTableCellPad "/>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
            </div>
 <!-- Page Footer -->
    <div class="pageEnd" style="width:187mm;">
      <span style="width:139mm;"/>
      <span style="font-weight:bold;font-size:6pt;">Schedule G (Form 990 or 990-EZ) 2016</span>
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
          <xsl:with-param name="TargetNode" select="$Form990ScheduleGData"/>
          <xsl:with-param name="DescWidth" select="100"/>
        </xsl:call-template>
      </table>
      
   
   <!-- PART I  Line 2b  -  Fundraising Activities Table -->
   <!-- Additonal Data Table for separated data from Part I, Line 2b -->

      <xsl:if test="($Print = $Separated) and (count($Form990ScheduleGData/FundraiserActivityInfoGrp) &gt; 10) ">
      <span class="styRepeatingDataTitle">
        <br/>Form 990, Schedule G, Part I, Line 2b - Fundraising Activities Table
      </span>
      <table class="styDepTbl" cellspacing="0" style="font-size:7pt">
        <thead class="styTableHead">
          <tr>
			<th class="IRS990ScheduleG_TableCell" style="vertical-align:top;padding-top:1mm; width:42mm;font-weight:normal;font-size:7pt;text-align:center;" scope="col" colspan="2"> 
			  <b>(i)</b> Name and address of individual <br/> or entity (fundraiser)
			</th>
			<th class="IRS990ScheduleG_TableCell" style="vertical-align:top;padding-top:1mm;width:27mm;text-align:center;font-size:7pt;font-weight:normal;" scope="col">
			  <span style="font-weight:bold;">(ii)</span> Activity
			</th>
			<th class="IRS990ScheduleG_TableCell" style="padding-right:0mm;padding-left:1mm; vertical-align:top;padding-top:1mm; width:22mm;text-align:center;font-size:6.5pt;font-weight:normal;" scope="col" colspan="2">
			  <span style="font-weight:bold;text-align:left;">(iii)</span> Did fundraiser have custody or control of contributions?
			</th>
			<th class="IRS990ScheduleG_TableCell" style="vertical-align:top;padding-top:1mm;width:32mm;text-align:center;font-size:7pt;font-weight:normal;" scope="col">
			  <span style="font-weight:bold;">(iv)</span> Gross receipts <br/>  from activity
			</th>
			<th class="IRS990ScheduleG_TableCell" style="vertical-align:top;padding-top:1mm;width:32mm;text-align:center;font-size:7pt;font-weight:normal;" scope="col">
			  <span style="font-weight:bold;">(v)</span> Amount paid to <br/>(or retained by)<br/> fundraiser listed in <br/>col. <b>(i)</b>
			</th>
			<th class="IRS990ScheduleG_TableCell" style="vertical-align:top;padding-top:1mm;width:32mm;border-right-width:0px;text-align:center;font-size:7pt; font-weight:normal;" scope="col">
			  <span style="font-weight:bold;">(vi)</span> Amount paid to <br/>  (or retained by) <br/> organization
			</th>
		  </tr>
		  <tr>
			<th scope="col" style="border-right:1px solid black;" colspan="2">
				<span style="width:1mm;"/>
			</th>
			<th scope="col" style="border-right:1px solid black;">
				<span style="width:1mm;"/>
			</th>
			<th class="IRS990ScheduleG_TableCell" style="width:11mm;font-size:7pt;border-right-width:1px;text-align:center" scope="col">
			  Yes
			</th>
			<th class="IRS990ScheduleG_TableCell" style="width:11mm;font-size:7pt;border-right-width:1px;text-align:center" scope="col">
			  No
			</th>
			<th scope="col" style="border-right:1px solid black;">
				<span style="width:1mm;"/>
			</th>
			<th scope="col" style="border-right:1px solid black;">
				<span style="width:1mm;"/>
			</th>
			<th scope="col"/>
		  </tr>
        </thead>
        <tbody>
		  <script language="JavaScript" type="text/javascript">
			  resetLineCount();
		  </script>
          <xsl:for-each select="$Form990ScheduleGData/FundraiserActivityInfoGrp">
            <tr>
              <!--Define background colors to the rows -->
              <xsl:attribute name="class">
                <xsl:choose>
                  <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                  <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
              <td style="width:5mm;border-bottom:1px solid black;text-align:right;vertical-align:top;padding-right:2mm;">
				  <script language="JavaScript" type="text/javascript">
					  getLineCount();
				  </script>
				</td>
				<td class="IRS990ScheduleG_TableCell" style="width:37mm;font-family:verdana;font-size:7pt;text-align:left;"> 
			  
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="PersonNm"/>
				  </xsl:call-template>
				  <xsl:if test="OrganizationBusinessName">
					<br/>
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="OrganizationBusinessName/BusinessNameLine1"/>
					</xsl:call-template>
				    <xsl:if test="OrganizationBusinessName/BusinessNameLine2">
						<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="OrganizationBusinessName/BusinessNameLine2"/>
						</xsl:call-template>
					</xsl:if>
				  </xsl:if>
				  
				  <xsl:if test="ForeignAddress">
					<br/>
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1"/>
					</xsl:call-template><br/>
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2"/>
					</xsl:call-template><br/>
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="ForeignAddress/City"/>
					</xsl:call-template>, 
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrState"/>
					</xsl:call-template><br/>
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="ForeignAddress/Country"/>
					</xsl:call-template><span style="width:1mm;"/>
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="ForeignAddress/PostalCode"/>
					</xsl:call-template>
				  </xsl:if>
				  <xsl:if test="USAddress">
					<br/>
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="USAddress/AddressLine1"/>
					</xsl:call-template><br/>
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="USAddress/AddressLine2"/>
					</xsl:call-template><br/>
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="USAddress/City"/>
					</xsl:call-template>, 
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="USAddress/State"/>
					</xsl:call-template><span style="width:1mm;"/>
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="USAddress/ZIPCode"/>
					</xsl:call-template>
				  </xsl:if>
				</td>
		
				<!-- Activity -->
				<td class="IRS990ScheduleG_TableCell" style="width:27mm;text-align:left;font-family:verdana;font-size:7pt;vertical-align:top;">
				  <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="ActivityTxt"/>
				  </xsl:call-template> 
				</td>  
		
				<!-- Fundraiser have Custody -->
				<td class="IRS990ScheduleG_TableCell" style="width:11mm;text-align:center;font-family:verdana;font-size:7pt;">
				  <xsl:call-template name="PopulateYesBoxText">
					<xsl:with-param name="TargetNode" select="FundraiserControlOfFundsInd"/>
				  </xsl:call-template> 
				</td>  
				<td class="IRS990ScheduleG_TableCell" style="width:11mm;text-align:center;font-family:verdana;font-size:7pt; ">
				  <xsl:call-template name="PopulateNoBoxText">
					<xsl:with-param name="TargetNode" select="FundraiserControlOfFundsInd"/>
				  </xsl:call-template> 
				</td>      
		
				<!-- Gross Receipts -->           
				<td class="IRS990ScheduleG_TableCell" style="width:32mm;text-align:right;font-family:verdana;font-size:7pt;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="GrossReceiptsAmt"/>
				  </xsl:call-template> 
				</td>      
		
				<!-- Amount paid to fundraiser -->           
				<td class="IRS990ScheduleG_TableCell" style="width:32mm;text-align:right;font-family:verdana;font-size:7pt;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="RetainedByContractorAmt"/>
				  </xsl:call-template> 
				</td>   
				   
				<!-- Amount paid to organization -->
				<td class="IRS990ScheduleG_TableCell" style="width:32mm;text-align:right;font-family:verdana;font-size:7pt;border-right-width:0px">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="NetToOrganizationAmt"/>
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
      
      
      
      <xsl:if test="($Print = $Separated) and (count($Form990ScheduleGData/StatesWhereGamingConductedCd) &gt;8)">
<br/>
<span class="styRepeatingDataTitle">Form 990 Schedule G Part III Line 9</span>
<table class="styDepTbl" cellspacing="0" style="font-size: 7pt">
  <thead class="styTableThead"/>
  <tbody>
    <tr class="styDepTblRow1">
          <td class="styDepTblCell" style="text-align: left; width:80mm"> Enter the state(s) in which the organization operates gaming activities:</td>
          <td class="styDepTblCell" style="text-align: left; width: 104mm">
     <xsl:if test="($Print = $Separated) and (count($Form990ScheduleGData/StatesWhereGamingConductedCd) &gt;8)">
          <xsl:for-each select="$Form990ScheduleGData/StatesWhereGamingConductedCd">     
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="."/>
      </xsl:call-template><xsl:if test="position()!=last()">,<span style="width: 2px"/></xsl:if>
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
          <xsl:with-param name="TargetNode" select="$Form990ScheduleGData/LicensedStatesCd"/>
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

<!--  PART  I  TEMP DATA  -->
  <xsl:template name="FundraiserActivityInformationTemp">
    <xsl:param name="IsSeparated">no</xsl:param>
	  <tr style="height:8mm;">
		<td style="width:5mm;border-bottom:1px solid black;text-align:right;vertical-align:top;padding-right:2mm;">
		  <script language="JavaScript" type="text/javascript">
			  getLineCount();
		  </script>
		</td>
		<td class="IRS990ScheduleG_TableCell" style="width:37mm;font-family:verdana;font-size:7pt;text-align:left;"> 
	  
		  <xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="PersonNm"/>
		  </xsl:call-template>
		  <xsl:if test="OrganizationBusinessName">
			<br/>
			<xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="OrganizationBusinessName/BusinessNameLine1Txt"/>
			</xsl:call-template>
			<xsl:if test="OrganizationBusinessName/BusinessNameLine2Txt">
				<br/>
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="OrganizationBusinessName/BusinessNameLine2Txt"/>
				</xsl:call-template>
			</xsl:if>
		  </xsl:if>
		  
		  <xsl:if test="ForeignAddress">
			<br/>
			<xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1Txt"/>
			</xsl:call-template><br/>
			<xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2Txt"/>
			</xsl:call-template><br/>
			<xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="ForeignAddress/CityNm"/>
			</xsl:call-template>, 
			<xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrStateNm"/>
			</xsl:call-template><br/>
			<xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="ForeignAddress/CountryCd"/>
			</xsl:call-template><span style="width:1mm;"/>
			<xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="ForeignAddress/ForeignPostalCd"/>
			</xsl:call-template>
		  </xsl:if>
		  <xsl:if test="USAddress">
			<br/>
			<xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="USAddress/AddressLine1Txt"/>
			</xsl:call-template><br/>
			<xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="USAddress/AddressLine2Txt"/>
			</xsl:call-template><br/>
			<xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="USAddress/CityNm"/>
			</xsl:call-template>, 
			<xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="USAddress/StateAbbreviationCd"/>
			</xsl:call-template><span style="width:1mm;"/>
			<xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="USAddress/ZIPCd"/>
			</xsl:call-template>
		  </xsl:if>
			<xsl:if test="$IsSeparated = 'yes' ">
			  <xsl:call-template name="PopulateAdditionalDataTableMessage">
				<xsl:with-param name="TargetNode" select="$Form990ScheduleGData/FundraiserActivityInfoGrp"/>
				<xsl:with-param name="ShortMessage" select="'true'"/>
			  </xsl:call-template>
			</xsl:if>
		</td>

		<!-- Activity -->
		<td class="IRS990ScheduleG_TableCell" style="width:27mm;text-align:left;font-family:verdana;font-size:7pt;vertical-align:top;">
		  <xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="ActivityTxt"/>
		  </xsl:call-template> 
		</td>  

		<!-- Fundraiser have Custody -->
		<td class="IRS990ScheduleG_TableCell" style="width:11mm;text-align:center;font-family:verdana;font-size:7pt;">
		  <xsl:call-template name="PopulateYesBoxText">
			<xsl:with-param name="TargetNode" select="FundraiserControlOfFundsInd"/>
		  </xsl:call-template> 
		</td>  
		<td class="IRS990ScheduleG_TableCell" style="width:11mm;text-align:center;font-family:verdana;font-size:7pt; ">
		  <xsl:call-template name="PopulateNoBoxText">
			<xsl:with-param name="TargetNode" select="FundraiserControlOfFundsInd"/>
		  </xsl:call-template> 
		</td>      

		<!-- Gross Receipts -->           
		<td class="IRS990ScheduleG_TableCell" style="width:32mm;text-align:right;font-family:verdana;font-size:7pt;">
		  <xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="GrossReceiptsAmt"/>
		  </xsl:call-template> 
		</td>      

		<!-- Amount paid to fundraiser -->           
		<td class="IRS990ScheduleG_TableCell" style="width:32mm;text-align:right;font-family:verdana;font-size:7pt;">
		  <xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="RetainedByContractorAmt"/>
		  </xsl:call-template> 
		</td>   
		   
		<!-- Amount paid to organization -->
		<td class="IRS990ScheduleG_TableCell" style="width:32mm;text-align:right;font-family:verdana;font-size:7pt;border-right-width:0px">
		  <xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="NetToOrganizationAmt"/>
		  </xsl:call-template> 
		</td>      
	  </tr>
  </xsl:template>
  
<!-- The param CalledTemplate is used to differentiate different elements for the additional data table as the different elements call the same template -->
<xsl:template name="EmptyIteratorTemp">
  <xsl:param name="NumEmptyRows"/>
  <xsl:param name="TempToCall"/>
  <xsl:param name="CalledTemplate" select="$Form990ScheduleGData"/>
  <xsl:param name="IsSeparated">no</xsl:param>
  <xsl:if test="$IsSeparated = 'no' ">
    <xsl:if test="$NumEmptyRows &gt; 0">
      <xsl:choose>
        <xsl:when test="$TempToCall = 'StatesTemp'">
          <xsl:call-template name="StatesTemp"/>
        </xsl:when>
          <xsl:when test="$TempToCall = 'FundraiserActivityInformationTemp'">
            <xsl:call-template name="FundraiserActivityInformationTemp"/>
          </xsl:when>
      
        <xsl:otherwise/>
      </xsl:choose>
      <xsl:call-template name="EmptyIteratorTemp">
        <xsl:with-param name="NumEmptyRows" select="$NumEmptyRows - 1"/>
        <xsl:with-param name="TempToCall" select="$TempToCall"/>
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
      <xsl:when test="$TempToCall = 'FundraiserActivityInformationTemp'">
        <xsl:call-template name="FundraiserActivityInformationTemp">
          <xsl:with-param name="IsSeparated">yes</xsl:with-param>
        </xsl:call-template>
      </xsl:when>
   
      <xsl:otherwise/>
    </xsl:choose>
    <xsl:call-template name="EmptyIteratorTemp">
      <xsl:with-param name="NumEmptyRows" select="$NumEmptyRows - 1"/>
      <xsl:with-param name="TempToCall" select="$TempToCall"/>
    </xsl:call-template>
  </xsl:if>



</xsl:template>
</xsl:stylesheet>