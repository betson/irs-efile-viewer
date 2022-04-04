<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<!-- 04/24/2017 - Modified per UWR 195015 - Jeremy Nichols-->
<!-- 05/07/2018 - Changes made for UWR 207539 - Jeremy Nichols -->
<!-- 08/02/2018 - Changes made for KISAM IM00341446 - Jeremy Nichols -->
<!-- 09/14/2018 - Changes made for defect 126528 - Jeremy Nichols -->
<!-- 06/18/2019 - Changes made for UWR 220903 - Jeremy Nichols -->
<!-- 09/10/2019 - Changes made for KISAM IM00786687 - Jeremy Nichols -->
<!-- 11/05/2019 - Changes made for defect 128309 - Jeremy Nichols -->
<!-- 01/16/2020 - Changes made for 2019 pdf review - Jeremy Nichols -->
<!-- 06/15/2020 - Changes made for UWR 233977 - Jeremy Nichols -->
<!-- 11/16/2020 - Changes made for defect 65249 - Jeremy Nichols -->
<!-- 07/20/2021 - Changes made for UWR 368250 - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS990ScheduleFStyle.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form990ScheduleFData" select="$RtnDoc/IRS990ScheduleF"/>
  <xsl:param name="FormData" select="$RtnDoc/IRS990ScheduleF"/>
  <xsl:variable name="AcctsActvsOutUSTableSize" select="count($FormData/AccountActivitiesOutsideUSGrp)"/>
  <xsl:variable name="RowsToShow1" select="17"/>
  <xsl:variable name="GrantsToOrgsOutsideUSSize" select="count($FormData/GrantsToOrgOutsideUSGrp)"/>
  <xsl:variable name="RowsToShow2" select="16"/>
  <xsl:variable name="GrantsToIndOutsideUSSize" select="count($FormData/ForeignIndividualsGrantsGrp)"/>
  <xsl:variable name="RowsToShow3" select="18"/>
  <xsl:variable name="SupplementalSize" select="count($FormData/Form990ScheduleFPartIV)"/>
  <xsl:variable name="RowsToShow4" select="22"/>
  <xsl:template match="/">
  
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($FormData)">
       </xsl:with-param>
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
        <meta name="Description" content="IRS Form 990 Schedule F"/>
        <xsl:call-template name="GlobalStylesForm"/>
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
        returnValue = "( "+ lineCount + ")";
        document.write(returnValue);
      }
  </script>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS990ScheduleFStyle"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
      </head>
      <body class="styBodyClass">
        <form style="font-family:verdana; font-size:7pt" name="Form990ScheduleF">
          <xsl:call-template name="DocumentHeader"/>
          <!--     <xsl:call-template name="DocumentHeaderLandscape" />-->
          <!-- BEGIN FORM HEADER -->
          <div class="styTBB" style="width:187mm;height:25mm;">
            <div class="styFNBox" style="width:31mm;padding-top:1mm;">
              <div style="height:14mm;">
                <span class="styFormNumber" style="font-size:10pt;">SCHEDULE F<span style="width:5mm;"/>(Form 990)<br/>
                </span>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData"/>
                </xsl:call-template>
              </div>
              <div style="padding-top:3.2mm;padding-bottom:.25mm;">
                <span class="styAgency">Department of the Treasury</span>
                <br/>
                <span class="styAgency">Internal Revenue Service</span>
              </div>
            </div>
            <div class="styFTBox" style="width:124mm;height:25mm;">
              <div class="styMainTitle" style="height:8mm;padding-top:1.5mm;">Statement of Activities Outside the United States</div>
              <div class="styFBT" style="height:6mm;margin-top:0mm;font-weight:bold;">
                <span style="width:124mm;font-size:6pt;font-weight:bold;padding-bottom:0mm;padding-top:1mm;"><img src="{$ImagePath}/990SchF_Bullet_Line.gif" alt="Right pointing arrow large image" width="6"/> Complete if the organization answered "Yes" to Form 990, Part IV, line 14b, 15, or 16.</span>
                <span style="width:124mm;font-size:6pt;font-weight:bold;padding-bottom:0mm;padding-top:1mm;"><img src="{$ImagePath}/990SchF_Bullet_Line.gif" alt="Right pointing arrow large image" width="6"/>  Attach to Form 990.</span>
                <span style="width:124mm;font-size:6pt;font-weight:bold;padding-bottom:0mm;padding-top:1mm;"><img src="{$ImagePath}/990SchF_Bullet_Line.gif" alt="Right pointing arrow large image" width="6"/> Go to <i>www.irs.gov/Form990</i> for instructions and the latest information.</span>
              </div>
            </div>
            <div class="styTYBox" style="width:31.5mm;height:25mm;">
              <div class="styOMB" style="width:31.5mm;">OMB No. 1545-0047</div>
              <div class="styTaxYear" style="height:11mm;padding-top:2mm;padding-bottom:2mm;">
                20<span class="styTYColor">21</span>
              </div>
              <div class="styPartName" style="font-size:7pt;height:10mm;width:31.5mm;padding-top:1mm;padding-bottom:.5mm;text-align:left;padding-left:6mm;">
                Open to Public Inspection
             </div>
            </div>
          </div>
          <!-- Begin Name and Identifying Number Section-->
          <div class="styBB" style="width:187mm;clear:both;font-family:verdana;font-size:7pt;">
            <div class="styNameBox" style="width:135mm;height:10mm;font-size:7pt;">
          Name of the organization<br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
              </xsl:call-template>
              <br/>
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
              </xsl:call-template>
              <br/>
            </div>
            <div class="styEINBox" style="width:50mm;height:8mm;padding-left:2mm;font-size:7pt;">
         Employer identification number<br/>
              <br/>
              <span style="font-weight:normal;">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <!-- End Name and Identifying Number Section-->
          <!-- BEGIN PART I  GENERAL INFORMATION ON ACTIVITIES OUTSIDE THE US  -->
          <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
          <!-- BEGIN PART I TITLE -->
          <!-- <div class="styGenericDiv" style="width: 187mm;background-color:yellow;">-->
          <div class="styBB" style="width:187mm;height:8mm;">
            <div class="styPartName">Part I</div>
            <div class="styPartDesc"> General Information on Activities Outside the United States. 
				<span class="styNormalText" style="display:inline;">Complete if the organization answered "Yes" on Form 990, Part IV, line 14b.</span>
            </div>
          </div>
          <!-- LINE 1  -->
          <div class="IRS990ScheduleF_LineContainer" style="padding-top:1mm;width:160mm;">
            <div class="IRS990ScheduleF_LineIndex" style="padding-right:5mm;">1</div>
            <div class="IRS990ScheduleF_LineDesc" style="width:152mm;border-right-width:0px;font-size:7.5pt;">
              <b>For grantmakers.</b> Does the organization maintain records to substantiate the amount of its grants and

		  </div>
          </div>
          <div class="IRS990ScheduleF_LineContainer">
            <div class="IRS990ScheduleF_LineIndex"/>
            <div class="IRS990ScheduleF_LineDesc" style="width:155mm;border-right-width:0px;font-size:7.5pt;">
				other assistance, the grantees’ eligibility for the grants or assistance, and the selection criteria used
		  </div>
          </div>
          <div class="IRS990ScheduleF_LineContainer">
            <div class="IRS990ScheduleF_LineIndex"/>
            <div class="IRS990ScheduleF_LineDesc" style="width:149mm;border-right-width:0px;font-size:7.5pt;">
				to award the grants or assistance?
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
				<span style="width:2mm;"/>.
				<span style="width:2mm;"/>.
				<span style="width:2mm;"/>.
				<span style="width:2mm;"/>.
				<span style="width:2mm;"/>.
            </div>
            <div class="IRS990ScheduleF_LineDesc" style="width:15mm;border-right-width:0px;text-align:right;">
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$FormData/GrantRecordsMaintainedInd"/>
                </xsl:call-template>
                <input type="checkbox" class="IRS990ScheduleF_Checkbox" id="checkGrantRecordsMaintainedYes" alt="checkGrantRecordsMaintainedYes">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/GrantRecordsMaintainedInd"/>
					<xsl:with-param name="BackupName">CheckGrantRecordsMaintainedYes</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <span style="width:3mm;"/>
              <label name="GrantRecordsMaintainedIndYes" id="checkGrantRecordsMaintainedYes">
                <xsl:call-template name="PopulateLabelYes">
					<xsl:with-param name="TargetNode" select="$FormData/GrantRecordsMaintainedInd"/>
					<xsl:with-param name="BackupName">CheckGrantRecordsMaintainedYes</xsl:with-param>
                </xsl:call-template>
                <span style="font-weight:bold;">Yes</span>
              </label>
            </div>
            <div class="IRS990ScheduleF_LineDesc" style="width:15mm;border-right-width:0px;text-align:right;">
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$FormData/GrantRecordsMaintainedInd"/>
                </xsl:call-template>
                <input type="checkbox" class="IRS990ScheduleF_Checkbox" alt="CheckGrantRecordsMaintainedNo" id="CheckGrantRecordsMaintainedNo">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/GrantRecordsMaintainedInd"/>
					<xsl:with-param name="BackupName">CheckGrantRecordsMaintainedNo</xsl:with-param>
                  </xsl:call-template>
                </input>
              </span>
              <span style="width:3mm;"/>
              <label name="CheckGrantRecordsMaintainedNo" id="CheckGrantRecordsMaintainedNo">
                <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$FormData/GrantRecordsMaintainedInd"/>
					<xsl:with-param name="BackupName">CheckGrantRecordsMaintainedNo</xsl:with-param>
                </xsl:call-template>
                <span style="font-weight:bold;">No</span>
              </label>
            </div>
          </div>
          <!-- Start Line 2 -->
          <div style="width:187mm;height:9mm;display:block;">
            <div class="styLNLeftNumBox" style="padding-top:2mm;">2</div>
            <div class="styLNDesc" style="width:175mm;padding-top:2mm;font-size:7.5pt;">
              <b>For grantmakers.</b> Describe in Part V the organization’s procedures for monitoring the use of its grants and other
				assistance outside the United States.</div>
          </div>
          <!-- End Line 2 -->
          <!-- Start Line 3-->
          <div class="styBB" style="width:187mm;height:6mm;border-top-width:0px;display:block inline;">
            <span class="styLNLeftNumBox" style="height:4mm;padding-top:2mm;">3</span>
            <div class="styLNDesc" style="width:175mm;padding-top:2mm;">Activites per Region. (The following Part I, line 3 table can be duplicated if additional space is needed.) </div>
          </div>
          <!-- BEGIN TABLE FOR  PART I   GENERAL INFORMATION ON ACTIVITIES OUTSIDE THE US  -->
          <!-- BEGIN Table expand/collapse toggle button end -->
          <!-- Test for size of AcctsActvsOutUSTable collection, don't display table expand / colapse toggle button if not needed -->
          <xsl:if test="$AcctsActvsOutUSTableSize&gt; $RowsToShow1">
            <div class="styBB" style="width:187mm;border-top-width:0px;display:block inline;">
              <!-- Table expand/collapse toggle button-->
              <span class="styGenericDiv" style="float:right;clear:none;width:7mm;text-align:right;">
                <xsl:call-template name="SetDynamicTableToggleButton">
                  <xsl:with-param name="TargetNode" select="$FormData/AccountActivitiesOutsideUSGrp"/>
                  <xsl:with-param name="containerHeight" select="$RowsToShow1"/>
                  <xsl:with-param name="containerID" select=" 'Part1' "/>
                </xsl:call-template>
              </span>
            </div>
          </xsl:if>
          <!-- END Table expand/collapse toggle button end-->
          <div class="IRS990ScheduleF_TableContainer" id="Part1" style="display:block;">
            <xsl:call-template name="SetInitialState"/>
            <table cellspacing="0" class="styTable" cellpadding="0" style="height:auto;">
              <thead class="styTableThead">
                <tr>
                  <th class="styTableCell" colspan="2" scope="col" style="width:52mm;vertical-align:top;padding-top:1mm;text-align:center;font-size:6pt;font-weight:normal;border-color:black;">
                    <b>(a)</b> Region</th>
                  <th class="styTableCell" scope="col" style="width:22mm;text-align:center;vertical-align:top;padding-top:1mm;font-size:6pt;font-weight:normal;border-color:black;">
                    <b>(b)</b> Number of offices in the region</th>
                  <th class="styTableCell" scope="col" style="width:22mm;text-align:center;vertical-align:top;padding-top:1mm;font-size:6pt;font-weight:normal;border-color:black;">
                    <b>(c)</b> Number of employees, agents, and independent contractors in the region</th>
                  <th class="styTableCell" scope="col" style="width:34mm;text-align:center;vertical-align:top;padding-top:1mm;font-size:6pt;font-weight:normal;border-color:black;">
                    <b>(d)</b> Activities conducted in region (by type) (such as, fundraising, program services, investments, grants to recipients located in the region)</th>
                  <th class="styTableCell" scope="col" style="width:35mm;text-align:center;vertical-align:top;padding-top:1mm;font-size:6pt;font-weight:normal;border-color:black;">
                    <b>(e)</b> If activity listed in (d) is a program service, describe specific type of<br/> service(s) in the region</th>
                  <th class="styTableCell" scope="col" style="width:33mm;vertical-align:top;padding-top:1mm;text-align:center;font-size:6pt;font-weight:normal;border-color:black;border-right:none;">
                    <b>(f)</b> Total expenditures<br/> for and investments<br/> in the region  </th>
                </tr>
              </thead>
              <tbody>
                <script language="JavaScript" type="text/javascript">
                  resetLineCount();
                </script>
                <xsl:if test="($Print != $Separated) or (count($FormData/AccountActivitiesOutsideUSGrp) &lt;= 17) ">
                  <xsl:for-each select="$FormData/AccountActivitiesOutsideUSGrp">
                    <xsl:call-template name="AcctsActvsOutUSTableTemp"/>
                  </xsl:for-each>
                  <!-- Render out the rest of the empty rows if less than $RowsToShow1 data items present for consistency with PDF display. -->
                  <xsl:call-template name="EmptyIteratorTemp">
                    <xsl:with-param name="NumEmptyRows" select="$RowsToShow1 - $AcctsActvsOutUSTableSize"/>
                    <xsl:with-param name="TempToCall" select="'AcctsActvsOutUSTableTemp'"/>
                  </xsl:call-template>
                </xsl:if>
                <xsl:if test="($Print = $Separated) and (count($FormData/AccountActivitiesOutsideUSGrp) &gt; 17) ">
                  <xsl:call-template name="EmptyIteratorTemp">
                    <xsl:with-param name="NumEmptyRows" select="17"/>
                    <xsl:with-param name="TempToCall" select="'AcctsActvsOutUSTableTemp'"/>
                    <xsl:with-param name="IsSeparated" select="'yes' "/>
                  </xsl:call-template>
                </xsl:if>
              </tbody>
              <tr>
                <td class="styTableCell" style="width:7mm;text-align:right;vertical-align:bottom;padding-right:1.5mm;font-size:7pt;border-color:black;border-bottom:0px;border-right-width:0px;">
                  <b>3a</b>
                </td>
                <td class="styTableCell" style="width:45mm;text-align:left;vertical-align:bottom;font-size:7pt;border-color:black;border-bottom:0px;">Sub-total
                  <!--dotted line-->
                  <span style="letter-spacing:4mm;">....</span>
                </td>
                <td class="styTableCell " style="width:22mm;border-color:black;border-right-width:1px;font-size:7pt;padding-top:2mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/SubtotalOfficesCnt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:22mm;text-align:right;vertical-align:bottom;font-size:7pt;border-color:black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/SubtotalEmployeesCnt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell " style="width:34mm;background-color:lightgrey;border-color:black;Vborder-right-width:1px;">
                  <span class="styNBSP"/>
                </td>
                <td class="styTableCell " style="width:35mm;background-color:lightgrey;border-color:black;Vborder-right-width:1px;">
                  <span class="styNBSP"/>
                </td>
                <td class="styTableCell" style="width:33mm;vertical-align:bottom;text-align:right;font-size:7pt;border-color:black;border-right-width:0px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/SubtotalSpentAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styTableCell" style="width:7mm;text-align:right;vertical-align:top;padding-right:1.5mm;font-size:7pt;border-color:black;border-bottom:0px;border-right-width:0px;">
                  <b>b</b>
                </td>
                <td class="styTableCell" style="width:45mm;text-align:left;vertical-align:top;font-size:7pt;border-color:black;border-bottom:0px;">Total from continuation sheets to Part I
        <!--dotted line-->
                  <span style="letter-spacing:4mm;"> ...</span>
                </td>
                <td class="styTableCell " style="width:22mm;vertical-align:top;border-color:black;border-right-width:1px;font-size:7pt;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/ContinuationTotalOfficeCnt"/>
                  </xsl:call-template>                </td>
                <td class="styTableCell" style="width:22mm;text-align:right;vertical-align:top;font-size:7pt;border-color:black;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/ContinuationTotalEmployeeCnt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell " style="width:34mm;background-color:lightgrey;vertical-align:top;border-color:black;border-right-width:1px;">
                  <span class="styNBSP"/>
                </td>
                <td class="styTableCell " style="width:35mm;background-color:lightgrey;vertical-align:top;border-color:black;border-right-width:1px;">
                  <span class="styNBSP"/>
                </td>
                <td class="styTableCell" style="width:33mm;vertical-align:top;text-align:right;vertical-align:top;font-size:7pt;border-color:black;border-right-width:0px;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/ContinuationSpentAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
              <tr>
                <td class="styTableCell" style="width:7mm;text-align:right;vertical-align:top;padding-right:1.5mm;font-size:7pt;border-color:black;border-right-width:0px;">
                  <b>c</b>
                </td>
                <td class="styTableCell" style="width:45mm;text-align:left;vertical-align:bottom;font-size:7pt;border-color:black;">
                  <b>Totals</b> (add lines 3a and 3b)
                </td>
                <td class="styTableCell " style="width:22mm;border-color:black;border-right-width:1px;font-size:7pt;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TotalOfficeCnt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell" style="width:22mm;text-align:right;font-size:7pt;border-color:black;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TotalEmployeeCnt"/>
                  </xsl:call-template>
                </td>
                <td class="styTableCell " style="width:34mm;background-color:lightgrey;border-color:black;border-right-width:1px;">
                  <span class="styNBSP"/>
                </td>
                <td class="styTableCell " style="width:35mm;background-color:lightgrey;border-color:black;border-right-width:1px;">
                  <span class="styNBSP"/>
                </td>
                <td class="styTableCell" style="width:33mm;text-align:right;font-size:7pt;border-color:black;border-right-width:0px;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TotalSpentAmt"/>
                  </xsl:call-template>
                </td>
              </tr>
            </table>
          </div>
          <xsl:call-template name="SetInitialDynamicTableHeight">
            <xsl:with-param name="TargetNode" select="$FormData/AccountActivitiesOutsideUSGrp"/>
            <xsl:with-param name="containerHeight" select="$RowsToShow1"/>
            <xsl:with-param name="headerHeight" select="1"/>
            <xsl:with-param name="containerID" select=" 'Part1' "/>
          </xsl:call-template>
          <!-- END TABLE FOR AcctsActvsOutUSTable -->
            <xsl:if test="($Print = $Separated)"><br/><br/><br/><br/><br/></xsl:if>
          
          <!-- Page Footer -->
          <div class="pageEnd" style="width:187mm;">
            <span style="width:113mm;font-size:6.25pt;font-weight:bold;">For Paperwork Reduction Act Notice, see the Instructions for Form 990.</span>
            <span style="width:5mm;font-size:6.25pt;"/>Cat. No. 50082W
			<span style="width:7mm;"/>
            <span style="font-weight:bold;font-size:6.25pt;">Schedule F (Form 990) 2021</span>
          </div>
          <div class="pageEnd" />
          
          <!-- PAGE 2 HEADER  -->
          <div class="styBB" style="width:256mm; padding-bottom:.5mm;">
            <div style="float:left;">Schedule F (Form 990) 2021</div>
            <div style="float:right;padding-right:4mm;">Page <span style="font-weight:bold;font-size:7pt;padding-right:1mm;">2</span>
            </div>
          </div>
          <!-- END Page Header  -->
          <!--  BEGIN   PART II  GRANTS TO ORGANIZATIONS OR ENTITIES OUTSIDE THE US -->
          <!-- ##########################################################################################-->
          <div class="styBB" style="width:256mm;height:8mm;border-bottom-width:0px;display:block;">
            <div class="styPartName" style="width:13mm;height:4mm;font-size:8.5pt;">Part II</div>
            <div class="styPartDesc" style="width:240mm;height:8mm;font-size:8.5pt;border-bottom-width:0px;border-color:black;padding-top:0mm;padding-bottom:0mm;"> Grants and Other Assistance to Organizations or Entities Outside the United States.
				<span class="styNormalText" style="border-bottom-width:0px;display:inline;">Complete if the organization answered "Yes" on Form 990, Part IV, line 15, for any recipient who received more than $5,000. Part II can be duplicated if additional space is needed.</span>

            </div>
            <!-- BEGIN TABLE FOR PART  2     GrantsToOrgsOutsideUS -->
            <!-- BEGIN Table expand/collapse toggle button end -->
            <!-- Test for size of GrantsToOrgsOutsideUS collection, don't display table expand / colapse toggle button if not needed -->
            <xsl:if test="$GrantsToOrgsOutsideUSSize&gt; $RowsToShow2">
              <div class="styBB" style="width:256mm;border-top-width:1px">
                <!-- Table expand/collapse toggle button-->
                <span class="styGenericDiv" style="float:right;clear:none;width:7mm;text-align:right;">
                  <xsl:call-template name="SetDynamicTableToggleButton">
                    <xsl:with-param name="TargetNode" select="$FormData/GrantsToOrgOutsideUSGrp"/>
                    <xsl:with-param name="containerHeight" select="$RowsToShow2"/>
                    <xsl:with-param name="containerID" select=" 'Part2' "/>
                  </xsl:call-template>
                </span>
              </div>
            </xsl:if>
            <!-- END Table expand/collapse toggle button end-->
            <div class="styTableContainerLandscape" id="Part2" style="display:block;">
              <xsl:call-template name="SetInitialState"/>
              <table cellspacing="0" class="styTable" cellpadding="0">
                <thead class="styTableThead">
                  <tr>
                    <th class="styTableCell" scope="col" colspan="2" style="width:30mm;text-align:center;vertical-align:top;padding-top:1mm; font-size:7pt;font-weight:normal;border-color:black;border-top-width:1px;">
                      <b><span style="float:left">1</span> (a)</b> Name of <span style="width:2mm;"/>organization
                    </th>
                    <th class="styTableCell" scope="col" style="width:20mm;vertical-align:top; padding-top:1mm; text-align:center; font-size:7pt; font-weight:normal; border-color:black;border-top-width:1px;">
                      <b>(b)</b> IRS code section<br/>and EIN (if applicable)</th>
                    <th class="styTableCell" scope="col" style="width:30mm;vertical-align:top;padding-top:1mm; text-align:center;font-size:7pt; font-weight:normal; border-color:black;border-top-width:1px;">
                      <b>(c)</b> Region</th>
                    <th class="styTableCell" scope="col" style="width:29mm; vertical-align:top;padding-top:1mm; text-align:center;font-size:7pt; font-weight:normal; border-color:black;border-top-width:1px;">
                      <b>(d)</b> Purpose of <br/>grant  </th>
                    <th class="styTableCell" scope="col" style="width:30mm; vertical-align:top;padding-top:1mm; text-align:center;font-size:7pt; font-weight:normal; border-color:black;border-top-width:1px;">
                      <b>(e)</b> Amount of <br/>cash grant      </th>
                    <th class="styTableCell" scope="col" style="width:29mm; vertical-align:top;padding-top:1mm; text-align:center;font-size:7pt;font-weight:normal; border-color:black;border-top-width:1px;">
                      <b>(f)</b> Manner of  <br/> cash <br/>disbursement  </th>
                    <th class="styTableCell" scope="col" style="width:30mm;vertical-align:top;padding-top:1mm; text-align:center;font-size:7pt;font-weight:normal; border-color:black;border-top-width:1px;">
                      <b>(g)</b> Amount <br/>of noncash <br/> assistance      </th>
                    <th class="styTableCell" scope="col" style="width:29mm;vertical-align:top;padding-top:1mm; text-align:center;font-size:7pt;font-weight:normal; border-color:black;border-top-width:1px;">
                      <b>(h)</b> Description  <br/>of noncash <br/> assistance      </th>
                    <th class="styTableCell" scope="col" style="width:29mm;vertical-align:top;padding-top:1mm; text-align:center;font-size:7pt;font-weight:normal; border-color:black;border-top-width:1px;border-right:none;">
                      <b>(i)</b> Method of <br/> valuation  <br/>(book, FMV,  <br/>appraisal, other) </th>
                  </tr>
                </thead>
                <tbody>
                  <script language="JavaScript" type="text/javascript">
                    resetLineCount();
                  </script>
                  <xsl:if test="($Print != $Separated) or (count($FormData/GrantsToOrgOutsideUSGrp) &lt;= 16) ">
                    <xsl:for-each select="$FormData/GrantsToOrgOutsideUSGrp">
                      <xsl:call-template name="GrantsToOrgsOutsideUSTemp"/>
                    </xsl:for-each>
                    <!-- Render out the rest of the empty rows if less than $RowsToShow2 data items present for consistency with PDF display. -->
                    <xsl:call-template name="EmptyIteratorTemp">
                      <xsl:with-param name="NumEmptyRows" select="$RowsToShow2 - $GrantsToOrgsOutsideUSSize"/>
                      <xsl:with-param name="TempToCall" select="'GrantsToOrgsOutsideUSTemp'"/>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="($Print = $Separated) and (count($FormData/GrantsToOrgOutsideUSGrp) &gt; 16) ">
                    <xsl:call-template name="EmptyIteratorTemp">
                      <xsl:with-param name="NumEmptyRows" select="16"/>
                      <xsl:with-param name="TempToCall" select="'GrantsToOrgsOutsideUSTemp'"/>
                      <xsl:with-param name="IsSeparated" select="'yes' "/>
                    </xsl:call-template>
                  </xsl:if>
                </tbody>
              </table>
            </div>
            <xsl:call-template name="SetInitialDynamicTableHeight">
              <xsl:with-param name="TargetNode" select="$FormData/GrantsToOrgOutsideUSGrp"/>
              <xsl:with-param name="containerHeight" select="$RowsToShow2"/>
              <xsl:with-param name="headerHeight" select="1"/>
              <xsl:with-param name="containerID" select=" 'Part2' "/>
            </xsl:call-template>
            <!-- END TABLE FOR GrantsToOrgsOutsideUS -->
            <!-- Part II  Line 2 -->
            <table style="height:auto;width:256mm;display:inline;clear:none;" cellpadding="0" cellspacing="0">
				<tr>
					<td style="width:5mm;padding-left:1mm;padding-top:1mm;font-size:8pt;vertical-align:top;">2</td>
					<td style="width:197mm;font-size:8pt;">
						Enter total number of recipient organizations listed above that are recognized as charities by the foreign country, 
						recognized as tax-exempt by the IRS, or for which the grantee or counsel has provided a section 501(c)(3) equivalency letter
						<!--Dotted Line-->
							<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; margin-left:1mm;">.......</span>
							<span style="width:2mm;"/>
							<img src="{$ImagePath}/990SchF_Bullet_Line.gif" alt="MediumBullet"/>
					</td>
					<td>
					  <div class="styIRS990ScheduleF_LNAmountBoxNLB" style="padding-right:1mm;width:48mm;font-size:8pt;height:9mm;padding-top:4mm;margin-right:3mm;">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$FormData/Total501c3OrgCnt"/>
						</xsl:call-template>
					  </div>
					</td>
				</tr>
				<tr ><!-- Part II  Line 3 -->
					<td style="width:5mm;padding-left:1mm;padding-top:0.5mm;font-size:8pt;vertical-align:top;border-bottom:2px solid black;">3</td>
					<td style="width:197mm;font-size:8pt;border-bottom:2px solid black;">
						Enter total number of other organizations or entities 
						<!--Dotted Line-->
						<span style="width:1mm;"/>
						<span style="letter-spacing:4mm; font-weight:bold; font-size:7pt; ">.......................</span>
						<span style="width:2mm;"/>
						<img src="{$ImagePath}/990SchF_Bullet_Line.gif" alt="MediumBullet"/>
					</td>
					<td style="border-bottom:2px solid black;">
					  <div class="styLNAmountBoxNBB" style="width:48mm;font-size:8pt;border-left:0px;padding-right:1mm;padding-top:0.5mm;margin-right:2mm">
						<xsl:call-template name="PopulateAmount">
						  <xsl:with-param name="TargetNode" select="$FormData/TotalOtherOrgCnt"/>
						</xsl:call-template>
					  </div>
					</td>
				</tr>
			</table>
		
            <!-- Page 2 Footer -->
            <div style="width:256mm;">
              <span style="width:213mm;"/>
              <span style="font-weight:bold;font-size:7pt;">Schedule F (Form 990) 2021</span>
            </div>
            <div class="pageEnd" />
            <!-- PAGE 3 HEADER  -->
            <div style="display:block;">
            <div class="styBB" style="width:256mm; padding-bottom:.5mm;">
              <span style="width:212mm;float:left;">Schedule F (Form 990) 2021</span>
              <span style="float:right;padding-right:4mm;">Page <span style="font-weight:bold;width:1mm;font-size:8pt;">3</span>
              </span>
            </div>
            <!-- END Page Header  -->
            <!--  BEGIN   PART 3   @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
            <!-- Begin PART III  Grants and Other Assistance  -->
            <div class="styBB" style="width: 256mm;height:8mm;">
              <div class="styPartName" style="width:15mm;height:4mm;font-size:8.5pt;">Part III</div>
              <div class="styPartDesc" style="width:238mm;font-size:8.5pt;border-bottom-width:1px;border-color:black;padding-top:0mm;padding-bottom:0mm;"> Grants and Other Assistance to Individuals Outside the United States.
        <span class="styNormalText" style="display:inline;">Complete if the organization answered "Yes" on Form 990, Part IV, line 16.</span>
                <!--<div style="width:238mm;height:3mm;border-top-width: 1px;font-size:8.5pt;font-weight:normal;" >on Form 990, Part IX, line 3, if the aggregate amount of all grants and assistance, made to individuals located outside the U.S. exceeded $5,000. -->
                <div style="width:238mm;height:3mm;border-top-width: 1px;font-size:8.5pt;font-weight:normal;">Part III can be duplicated if additional space is needed.</div>
              </div>
            </div>
            <!-- BEGIN TABLE FOR PART  3     GrantsToIndOutsideUS -->
            <!-- BEGIN Table expand/collapse toggle button end -->
            <!-- Test for size of GrantsToIndOutsideUS collection, don't display table expand / colapse toggle button if not needed -->
            <xsl:if test="$GrantsToIndOutsideUSSize&gt; $RowsToShow3">
              <div class="styBB" style="width:256mm;border-top-width:0px;display:inline;clear:none;">
                <!-- Table expand/collapse toggle button-->
                <span class="styGenericDiv" style="float:right;clear:none;width:7mm;text-align:right;">
                  <xsl:call-template name="SetDynamicTableToggleButton">
                    <xsl:with-param name="TargetNode" select="$FormData/ForeignIndividualsGrantsGrp"/>
                    <xsl:with-param name="containerHeight" select="$RowsToShow3"/>
                    <xsl:with-param name="headerHeight" select="1"/>
                    <xsl:with-param name="containerID" select=" 'Part3' "/>
                  </xsl:call-template>
                </span>
              </div>
            </xsl:if>
            <!-- END Table expand/collapse toggle button end-->
            <div class="styTableContainerLandscape" id="Part3" style="display:block;">
              <xsl:call-template name="SetInitialState"/>
              <table cellspacing="0" class="styTable" cellpadding="0" style="height:auto;width:256mm;">
                <thead class="styTableThead">
                  <tr>
                    <th class="styTableCell" colspan="2" scope="col" style="width:40mm;vertical-align:top; padding-top: 1mm; text-align:center;font-size:7pt;font-weight:normal;border-color:black;">
                      <b>(a)</b> Type of grant or assistance</th>
                    <th class="styTableCell" scope="col" style="width:30mm;vertical-align:top; padding-top: 1mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">
                      <b>(b)</b> Region</th>
                    <th class="styTableCell" scope="col" style="width:20mm;vertical-align:top; padding-top: 1mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">
                      <b>(c)</b> Number of recipients</th>
                    <th class="styTableCell" scope="col" style="width:30mm;vertical-align:top; padding-top: 1mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">
                      <b>(d)</b> Amount of <br/>cash grant  </th>
                    <th class="styTableCell" scope="col" style="width:34mm;vertical-align:top; padding-top: 1mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">
                      <b>(e)</b> Manner of cash <br/>disbursement      </th>
                    <th class="styTableCell" scope="col" style="width:30mm;vertical-align:top; padding-top: 1mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">
                      <b>(f)</b> Amount of <br/>noncash <br/> assistance  </th>
                    <th class="styTableCell" scope="col" style="width:36mm;vertical-align:top; padding-top: 1mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">
                      <b>(g)</b> Description  <br/>of noncash <br/> assistance      </th>
                    <th class="styTableCell" scope="col" style="width:36mm;vertical-align:top; padding-top: 1mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-right:none;">
                      <b>(h)</b> Method of <br/> valuation  <br/>(book, FMV,  <br/>appraisal, other) </th>
                  </tr>
                </thead>
                <tbody>
                  <script language="JavaScript" type="text/javascript">
                    resetLineCount();
                  </script>
                  <xsl:if test="($Print != $Separated) or (count($FormData/ForeignIndividualsGrantsGrp) &lt;= 18) ">
                    <xsl:for-each select="$FormData/ForeignIndividualsGrantsGrp">
                      <xsl:call-template name="GrantsToIndOutsideUSTemp"/>
                    </xsl:for-each>
                    <!-- Render out the rest of the empty rows if less than $RowsToShow3 data items present for consistency with PDF display. -->
                    <xsl:call-template name="EmptyIteratorTemp">
                      <xsl:with-param name="NumEmptyRows" select="$RowsToShow3 - $GrantsToIndOutsideUSSize"/>
                      <xsl:with-param name="TempToCall" select="'GrantsToIndOutsideUSTemp'"/>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="($Print = $Separated) and (count($FormData/ForeignIndividualsGrantsGrp) &gt; 18) ">
                    <xsl:call-template name="EmptyIteratorTemp">
                      <xsl:with-param name="NumEmptyRows" select="18"/>
                      <xsl:with-param name="TempToCall" select="'GrantsToIndOutsideUSTemp'"/>
                      <xsl:with-param name="IsSeparated" select="'yes' "/>
                    </xsl:call-template>
                  </xsl:if>
                </tbody>
              </table>
              </div>
              </div>
            <xsl:call-template name="SetInitialDynamicTableHeight">
              <xsl:with-param name="TargetNode" select="$FormData/ForeignIndividualsGrantsGrp"/>
              <xsl:with-param name="containerHeight" select="$RowsToShow3"/>
              <xsl:with-param name="headerHeight" select="1"/>
              <xsl:with-param name="containerID" select=" 'Part3' "/>
            </xsl:call-template>
            <!-- END TABLE FOR GrantsToIndOutsideUS -->
            <xsl:if test="($Print = $Separated)"><br/></xsl:if>
            
            <!-- PAGE 3 FOOTER -->
            <div class="pageEnd" style="width:256mm;">
              <span style="width:212mm;"/>
              <span style="font-weight:bold;font-size:7pt;">Schedule F (Form 990) 2021</span>
            </div>
            
            <!-- PAGE 4 HEADER  -->
            <div class="styNBB" style="width:187mm; padding-bottom:.5mm;">
              <div style="float:left;">Schedule F (Form 990) 2021</div>
              <div style="float:right;">Page <span style="font-weight:bold;font-size:7pt;padding-right:1mm;">4</span>
              </div>
            </div>
            <!-- END Page Header  -->
            <!--   BEGIN  PART  IV   Supplemental Information
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
            <div class="styBB" style="width:187mm;height:4.5mm;border-top-width:2px;">
              <div class="styPartName" style="height:4mm;">Part IV</div>
              <div class="styPartDesc" style="height:4mm;"> Foreign Forms</div>
            </div>
            
            <table class="styTable" style="height:auto;width:187mm;display:inline;">
              <tbody>
                <tr>
                  <td style="font-size:7pt;padding-top:3mm;text-align:center;vertical-align:top;width:7mm;"> 1</td>
                  <td style="font-size:7pt;padding-top:3mm;text-align:left;vertical-align:top;width:150mm;">
                    Was the organization a U.S. transferor of property to a foreign corporation during the tax year? 
                    <i>If "Yes," the organization may be required to file Form 926, Return by a U.S. Transferor of Property 
                    to a Foreign Corporation (see Instructions for Form 926)</i>
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
                  </td>
                  <td style="font-size:7pt;padding-left:1mm;padding-top:3mm;text-align:left;vertical-align:bottom;width:15mm;">  
                    <div class="IRS990ScheduleF_LineDesc" style="width:10mm;border-right-width:0px;text-align:right;">
                      <span>
                        <xsl:call-template name="PopulateSpan">
                          <xsl:with-param name="TargetNode" select="$FormData/TransferToForeignCorpInd"/>
                        </xsl:call-template>
                        <input type="checkbox" class="IRS990ScheduleF_Checkbox" id="checkTransferToForeignCorpYes" alt="checkTransferToForeignCorpYes">
                          <xsl:call-template name="PopulateYesCheckbox">
                            <xsl:with-param name="TargetNode" select="$FormData/TransferToForeignCorpInd"/>
							<xsl:with-param name="BackupName">CheckTransferToForeignCorpYes</xsl:with-param>
                          </xsl:call-template>
                        </input>
                      </span>
                      <label id="checkTransferToForeignCorpYes">
                        <xsl:call-template name="PopulateLabelYes">
                          <xsl:with-param name="TargetNode" select="$FormData/TransferToForeignCorpInd"/>
							<xsl:with-param name="BackupName">CheckTransferToForeignCorpYes</xsl:with-param>
                        </xsl:call-template>
                        <span>Yes</span>
                      </label>
                    </div>                  
                  </td>
                  <td style="font-size:7pt;padding-left:1mm;padding-top:3mm;text-align:left;vertical-align:bottom;width:15mm;">
                    <div class="IRS990ScheduleF_LineDesc" style="width:10mm;border-right-width:0px;text-align:right;">
                      <span>
                        <xsl:call-template name="PopulateSpan">
                          <xsl:with-param name="TargetNode" select="$FormData/TransferToForeignCorpInd"/>
                        </xsl:call-template>
                        <input type="checkbox" class="IRS990ScheduleF_Checkbox" id="checkTransferToForeignCorpNo" alt="checkTransferToForeignCorpNo">
                          <xsl:call-template name="PopulateNoCheckbox">
                            <xsl:with-param name="TargetNode" select="$FormData/TransferToForeignCorpInd"/>
							<xsl:with-param name="BackupName">CheckTransferToForeignCorpNo</xsl:with-param>
                          </xsl:call-template>
                        </input>
                      </span>
                      <label id="checkTransferToForeignCorpNo">
                        <xsl:call-template name="PopulateLabelNo">
                          <xsl:with-param name="TargetNode" select="$FormData/TransferToForeignCorpInd"/>
							<xsl:with-param name="BackupName">CheckTransferToForeignCorpNo</xsl:with-param>
                        </xsl:call-template>
                        <span>No</span>
                      </label>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td style="font-size:7pt;padding-top:3mm;text-align:center;vertical-align:top;width:7mm;"> 2</td>
                  <td style="font-size:7pt;padding-top:3mm;text-align:left;vertical-align:top;width:150mm;">
                    Did the organization have an interest in a foreign trust during the tax year? 
                    <i>If "Yes," the organization may be required to separately file Form 3520, Annual Return to 
                    Report Transactions with Foreign Trusts and Receipt of Certain Foreign Gifts, and/or 
                    Form 3520-A, Annual Information Return of Foreign Trust With a U.S. Owner (see 
                    Instructions for Forms 3520 and 3520-A; don't file with Form 990)</i>
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
                    <span style="width:2mm;"/>.
                    <span style="width:2mm;"/>.
                    <span style="width:2mm;"/>.
                    <span style="width:2mm;"/>.
                  </td>
                  <td style="font-size:7pt;padding-left:1mm;padding-top:3mm;text-align:left;vertical-align:bottom;width:15mm;">  
                    <div class="IRS990ScheduleF_LineDesc" style="width:10mm;border-right-width:0px;text-align:right;">
                      <span>
                        <xsl:call-template name="PopulateSpan">
                          <xsl:with-param name="TargetNode" select="$FormData/InterestInForeignTrustInd"/>
                        </xsl:call-template>
                        <input type="checkbox" class="IRS990ScheduleF_Checkbox" id="checkInterestInForeignTrustYes" alt="checkInterestInForeignTrustYes">
                          <xsl:call-template name="PopulateYesCheckbox">
                            <xsl:with-param name="TargetNode" select="$FormData/InterestInForeignTrustInd"/>
							<xsl:with-param name="BackupName">CheckInterestInForeignTrustYes</xsl:with-param>
                          </xsl:call-template>
                        </input>
                      </span>
                      <label id="checkInterestInForeignTrustYes">
                        <xsl:call-template name="PopulateLabelYes">
                          <xsl:with-param name="TargetNode" select="$FormData/InterestInForeignTrustInd"/>
							<xsl:with-param name="BackupName">CheckInterestInForeignTrustYes</xsl:with-param>
                        </xsl:call-template>
                        <span>Yes</span>
                      </label>
                    </div>                  
                  </td>
                  <td style="font-size:7pt;padding-left:1mm;padding-top:3mm;text-align:left;vertical-align:bottom;width:15mm;">
                    <div class="IRS990ScheduleF_LineDesc" style="width:10mm;border-right-width:0px;text-align:right;">
                      <span>
                        <xsl:call-template name="PopulateSpan">
                          <xsl:with-param name="TargetNode" select="$FormData/InterestInForeignTrustInd"/>
                        </xsl:call-template>
                        <input type="checkbox" class="IRS990ScheduleF_Checkbox" id="checkInterestInForeignTrustNo" alt="checkInterestInForeignTrustNo">
                          <xsl:call-template name="PopulateNoCheckbox">
                            <xsl:with-param name="TargetNode" select="$FormData/InterestInForeignTrustInd"/>
							<xsl:with-param name="BackupName">CheckInterestInForeignTrustNo</xsl:with-param>
                          </xsl:call-template>
                        </input>
                      </span>
                      <label id="checkInterestInForeignTrustNo">
                        <xsl:call-template name="PopulateLabelNo">
                          <xsl:with-param name="TargetNode" select="$FormData/InterestInForeignTrustInd"/>
							<xsl:with-param name="BackupName">CheckInterestInForeignTrustNo</xsl:with-param>
                        </xsl:call-template>
                        <span>No</span>
                      </label>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td style="font-size:7pt;padding-top:3mm;text-align:center;vertical-align:top;width:7mm;"> 3</td>
                  <td style="font-size:7pt;padding-top:3mm;text-align:left;vertical-align:top;width:150mm;">
                    Did the organization have an ownership interest in a foreign corporation during the tax year?  <i>If "Yes," the organization may be 
                    required to file Form 5471, Information Return of U.S. Persons with Respect to Certain Foreign Corporations. (see Instructions
                    for Form 5471)</i>
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
                    <span style="width:2mm;"/>.
                    <span style="width:2mm;"/>.
                    <span style="width:2mm;"/>.
                    <span style="width:2mm;"/>.
                    <span style="width:2mm;"/>.
                    <span style="width:2mm;"/>.
                    <span style="width:2mm;"/>.
                    <span style="width:2mm;"/>.
                  </td>
                  <td style="font-size:7pt;padding-left:1mm;padding-top:3mm;text-align:left;vertical-align:bottom;width:15mm;">  
                    <div class="IRS990ScheduleF_LineDesc" style="width:10mm;border-right-width:0px;text-align:right;">
                      <span>
                        <xsl:call-template name="PopulateSpan">
                          <xsl:with-param name="TargetNode" select="$FormData/ForeignCorpOwnershipInd"/>
                        </xsl:call-template>
                        <input type="checkbox" class="IRS990ScheduleF_Checkbox" id="checkForeignCorpOwnershipYes" alt="checkForeignCorpOwnershipYes">
                          <xsl:call-template name="PopulateYesCheckbox">
                            <xsl:with-param name="TargetNode" select="$FormData/ForeignCorpOwnershipInd"/>
							<xsl:with-param name="BackupName">CheckForeignCorpOwnershipYes</xsl:with-param>
                          </xsl:call-template>
                        </input>
                      </span>
                      <label id="checkForeignCorpOwnershipYes">
                        <xsl:call-template name="PopulateLabelYes">
                          <xsl:with-param name="TargetNode" select="$FormData/ForeignCorpOwnershipInd"/>
							<xsl:with-param name="BackupName">CheckForeignCorpOwnershipYes</xsl:with-param>
                        </xsl:call-template>
                        <span>Yes</span>
                      </label>
                    </div>                  
                  </td>
                  <td style="font-size:7pt;padding-left:1mm;padding-top:3mm;text-align:left;vertical-align:bottom;width:15mm;">
                    <div class="IRS990ScheduleF_LineDesc" style="width:10mm;border-right-width:0px;text-align:right;">
                      <span>
                        <xsl:call-template name="PopulateSpan">
                          <xsl:with-param name="TargetNode" select="$FormData/ForeignCorpOwnershipInd"/>
                        </xsl:call-template>
                        <input type="checkbox" class="IRS990ScheduleF_Checkbox" id="checkForeignCorpOwnershipNo" alt="checkForeignCorpOwnershipNo">
                          <xsl:call-template name="PopulateNoCheckbox">
                            <xsl:with-param name="TargetNode" select="$FormData/ForeignCorpOwnershipInd"/>
							<xsl:with-param name="BackupName">CheckForeignCorpOwnershipNo</xsl:with-param>
                          </xsl:call-template>
                        </input>
                      </span>
                      <label id="checkForeignCorpOwnershipNo">
                        <xsl:call-template name="PopulateLabelNo">
                          <xsl:with-param name="TargetNode" select="$FormData/ForeignCorpOwnershipInd"/>
							<xsl:with-param name="BackupName">CheckForeignCorpOwnershipNo</xsl:with-param>
                        </xsl:call-template>
                        <span>No</span>
                      </label>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td style="font-size:7pt;padding-top:3mm;text-align:center;vertical-align:top;width:7mm;"> 4</td>
                  <td style="font-size:7pt;padding-top:3mm;text-align:left;vertical-align:top;width:150mm;">
                    Was the organization a direct or indirect shareholder of a passive foreign investment company or a
					qualified electing fund during the tax year? <i>If “Yes,” the organization may be required to file Form 8621,
					Information Return by a Shareholder of a Passive Foreign Investment Company or Qualified Electing
					Fund. (see Instructions for Form 8621)</i> .
                  </td>
                  <td style="font-size:7pt;padding-left:1mm;padding-top:3mm;text-align:left;vertical-align:bottom;width:15mm;">  
                    <div class="IRS990ScheduleF_LineDesc" style="width:10mm;border-right-width:0px;text-align:right;">
                      <span>
                        <xsl:call-template name="PopulateSpan">
                          <xsl:with-param name="TargetNode" select="$FormData/PassiveForeignInvestmestCoInd"/>
                        </xsl:call-template>
                        <input type="checkbox" class="IRS990ScheduleF_Checkbox" id="CheckPassiveForeignInvestmestCoYes" alt="CheckPassiveForeignInvestmestCoYes">
                          <xsl:call-template name="PopulateYesCheckbox">
                            <xsl:with-param name="TargetNode" select="$FormData/PassiveForeignInvestmestCoInd"/>
							<xsl:with-param name="BackupName">CheckPassiveForeignInvestmestCoYes</xsl:with-param>
                          </xsl:call-template>
                        </input>
                      </span>
                      <label id="CheckPassiveForeignInvestmestCoYes">
                        <xsl:call-template name="PopulateLabelYes">
                          <xsl:with-param name="TargetNode" select="$FormData/PassiveForeignInvestmestCoInd"/>
							<xsl:with-param name="BackupName">CheckPassiveForeignInvestmestCoYes</xsl:with-param>
                        </xsl:call-template>
                        <span>Yes</span>
                      </label>
                    </div>                  
                  </td>
                  <td style="font-size:7pt;padding-left:1mm;padding-top:3mm;text-align:left;vertical-align:bottom;width:15mm;">
                    <div class="IRS990ScheduleF_LineDesc" style="width:10mm;border-right-width:0px;text-align:right;">
                      <span>
                        <xsl:call-template name="PopulateSpan">
                          <xsl:with-param name="TargetNode" select="$FormData/PassiveForeignInvestmestCoInd"/>
                        </xsl:call-template>
                        <input type="checkbox" class="IRS990ScheduleF_Checkbox" id="CheckPassiveForeignInvestmestCoNo" alt="CheckPassiveForeignInvestmestCoNo">
                          <xsl:call-template name="PopulateNoCheckbox">
                            <xsl:with-param name="TargetNode" select="$FormData/PassiveForeignInvestmestCoInd"/>
							<xsl:with-param name="BackupName">CheckPassiveForeignInvestmestCoNo</xsl:with-param>
                          </xsl:call-template>
                        </input>
                      </span>
                      <label id="CheckPassiveForeignInvestmestCoNo">
                        <xsl:call-template name="PopulateLabelNo">
                          <xsl:with-param name="TargetNode" select="$FormData/PassiveForeignInvestmestCoInd"/>
							<xsl:with-param name="BackupName">CheckPassiveForeignInvestmestCoNo</xsl:with-param>
                        </xsl:call-template>
                        <span>No</span>
                      </label>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td style="font-size:7pt;padding-top:3mm;text-align:center;vertical-align:top;width:7mm;"> 5</td>
                  <td style="font-size:7pt;padding-top:3mm;text-align:left;vertical-align:top;width:150mm;">
                    Did the organization have an ownership interest in a foreign partnership during the tax year?  <i>If "Yes," the organization
                    may be required to file Form 8865, Return of U.S. Persons with Respect to Certain Foreign Partnerships (see Instructions for Form 8865)</i>
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
                  </td>
                  <td style="font-size:7pt;padding-left:1mm;padding-top:3mm;text-align:left;vertical-align:bottom;width:15mm;">  
                    <div class="IRS990ScheduleF_LineDesc" style="width:10mm;border-right-width:0px;text-align:right;">
                      <span>
                        <xsl:call-template name="PopulateSpan">
                          <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipInd"/>
                        </xsl:call-template>
                        <input type="checkbox" class="IRS990ScheduleF_Checkbox" id="CheckForeignPartnershipYes" alt="CheckForeignPartnershipYes">
                          <xsl:call-template name="PopulateYesCheckbox">
                            <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipInd"/>
							<xsl:with-param name="BackupName">CheckForeignPartnershipYes</xsl:with-param>
                          </xsl:call-template>
                        </input>
                      </span>
                      <label id="CheckForeignPartnershipYes">
                        <xsl:call-template name="PopulateLabelYes">
                          <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipInd"/>
							<xsl:with-param name="BackupName">CheckForeignPartnershipYes</xsl:with-param>
                        </xsl:call-template>
                        <span>Yes</span>
                      </label>
                    </div>                  
                  </td>
                  <td style="font-size:7pt;padding-left:1mm;padding-top:3mm;text-align:left;vertical-align:bottom;width:15mm;">
                    <div class="IRS990ScheduleF_LineDesc" style="width:10mm;border-right-width:0px;text-align:right;">
                      <span>
                        <xsl:call-template name="PopulateSpan">
                          <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipInd"/>
                        </xsl:call-template>
                        <input type="checkbox" class="IRS990ScheduleF_Checkbox" id="CheckForeignPartnershipNo" alt="CheckForeignPartnershipNo">
                          <xsl:call-template name="PopulateNoCheckbox">
                            <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipInd"/>
							<xsl:with-param name="BackupName">CheckForeignPartnershipNo</xsl:with-param>
                          </xsl:call-template>
                        </input>
                      </span>
                      <label id="CheckForeignPartnershipNo">
                        <xsl:call-template name="PopulateLabelNo">
                          <xsl:with-param name="TargetNode" select="$FormData/ForeignPartnershipInd"/>
							<xsl:with-param name="BackupName">CheckForeignPartnershipNo</xsl:with-param>
                        </xsl:call-template>
                        <span>No</span>
                      </label>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td style="font-size:7pt;padding-top:3mm;text-align:center;vertical-align:top;width:7mm;"> 6</td>
                  <td style="font-size:7pt;padding-top:3mm;text-align:left;vertical-align:top;width:150mm;">
                    Did the organization have any operations in or related to any boycotting countries during the tax year?  <i>If "Yes," the 
                    organization may be required to separately file Form 5713, International Boycott Report (see Instructions for Form 5713; don't file with Form 990).</i>
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
                    <span style="width:2mm;"/>.
                    <span style="width:2mm;"/>.
                    <span style="width:2mm;"/>.
                    <span style="width:2mm;"/>.
                    <span style="width:2mm;"/>.
                    <span style="width:2mm;"/>.
                    <span style="width:2mm;"/>.
                    <span style="width:2mm;"/>.
                  </td>
                  <td style="font-size:7pt;padding-left:1mm;padding-top:3mm;text-align:left;vertical-align:bottom;width:15mm;">  
                    <div class="IRS990ScheduleF_LineDesc" style="width:10mm;border-right-width:0px;text-align:right;">
                      <span>
                        <xsl:call-template name="PopulateSpan">
                          <xsl:with-param name="TargetNode" select="$FormData/BoycottCountriesInd"/>
                        </xsl:call-template>
                        <input type="checkbox" class="IRS990ScheduleF_Checkbox" id="CheckBoycottCountriesYes" alt="CheckBoycottCountriesYes">
                          <xsl:call-template name="PopulateYesCheckbox">
                            <xsl:with-param name="TargetNode" select="$FormData/BoycottCountriesInd"/>
							<xsl:with-param name="BackupName">CheckBoycottCountriesYes</xsl:with-param>
                          </xsl:call-template>
                        </input>
                      </span>
                      <label id="CheckBoycottCountriesYes">
                        <xsl:call-template name="PopulateLabelYes">
                          <xsl:with-param name="TargetNode" select="$FormData/BoycottCountriesInd"/>
							<xsl:with-param name="BackupName">CheckBoycottCountriesYes</xsl:with-param>
                        </xsl:call-template>
                        <span>Yes</span>
                      </label>
                    </div>                  
                  </td>
                  <td style="font-size:7pt;padding-left:1mm;padding-top:3mm;text-align:left;vertical-align:bottom;width:15mm;">
                    <div class="IRS990ScheduleF_LineDesc" style="width:10mm;border-right-width:0px;text-align:right;">
                      <span>
                        <xsl:call-template name="PopulateSpan">
                          <xsl:with-param name="TargetNode" select="$FormData/BoycottCountriesInd"/>
                        </xsl:call-template>
                        <input type="checkbox" class="IRS990ScheduleF_Checkbox" id="CheckBoycottCountriesNo" alt="CheckBoycottCountriesNo">
                          <xsl:call-template name="PopulateNoCheckbox">
                            <xsl:with-param name="TargetNode" select="$FormData/BoycottCountriesInd"/>
							<xsl:with-param name="BackupName">CheckBoycottCountriesNo</xsl:with-param>
                          </xsl:call-template>
                        </input>
                      </span>
                      <label id="CheckBoycottCountriesNo">
                        <xsl:call-template name="PopulateLabelNo">
                          <xsl:with-param name="TargetNode" select="$FormData/BoycottCountriesInd"/>
							<xsl:with-param name="BackupName">CheckBoycottCountriesNo</xsl:with-param>
                        </xsl:call-template>
                        <span>No</span>
                      </label>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td colspan="4" style="border-bottom:1px solid black;width:187mm;"><span class="styNBSP"/></td>
                </tr>
              </tbody>
            </table>
            
            <!-- Page Footer For Page  4   -->
            <div class="pageEnd" style="width:187mm;">
              <span style="width:145mm;"/>
              <span style="font-weight:bold;font-size:7pt;">Schedule F (Form 990) 2021</span>
            </div>
            
            <!-- PAGE 5 HEADER  -->
            <div class="styNBB" style="width:187mm; padding-bottom:.5mm;">
              <div style="float:left;">Schedule F (Form 990) 2021</div>
              <div style="float:right;">Page <span style="font-weight:bold;font-size:7pt;padding-right:1mm;">5</span>
              </div>
            </div>
            <!-- END Page Header  -->
            
            <!--   BEGIN  PART  V   Supplemental Information
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
            <div class="styBB" style="width:187mm;height:19mm;border-top-width:2px;border-bottom-width:0px;">
              <div class="styPartName" style="height:4mm;">Part V</div>
              <div class="styPartDesc"> Supplemental Information <br/>
                <span class="styNormalText">Provide the information required by Part I, line 2 (monitoring of funds); Part I, line 3, column (f) (accounting method; amounts of investments vs. expenditures per region); Part II, line 1 (accounting method); Part III (accounting method); and Part III, column (c) (estimated number of recipients), as applicable. Also complete this part to provide any additional information.  See instructions.</span>
              </div>
            </div>
            <!-- BEGIN TABLE FOR SUPPLEMENTAL INFORMATION   PART V  -->
            <!-- BEGIN Table expand/collapse toggle button end -->
            <!-- Test for size of Form990ScheduleFPartV collection, don't display table expand / colapse toggle button if not needed -->
            <xsl:if test="$SupplementalSize&gt; $RowsToShow4">
              <div class="styTBB" style="width:187mm;border-top-width:0px">
                <!-- Table expand/collapse toggle button-->
                <span class="styGenericDiv" style="float:right;clear:none;width:7mm;text-align:right;">
                  <xsl:call-template name="SetDynamicTableToggleButton">
                    <xsl:with-param name="TargetNode" select="$FormData/SupplementalInformationDetail"/>
                    <xsl:with-param name="containerHeight" select="$RowsToShow4"/>
                    <xsl:with-param name="headerHeight" select="1"/>
                    <xsl:with-param name="containerID" select=" 'Part5' "/>
                  </xsl:call-template>
                </span>
              </div>
            </xsl:if>
            <!-- END Table expand/collapse toggle button end-->
            <div class="IRS990ScheduleF_TableContainer" id="Part5" style="display:block;clear:none;">
              <xsl:call-template name="SetInitialState"/>
              <table cellspacing="0" class="styTable" cellpadding="0" style="height:auto;display:inline;">
                <thead class="styTableThead">
                  <tr class="styDepTblHdr">
                    <th class="styDepTblCell" scope="col" style="width:57mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-left-width:0px;">ReturnReference</th>
                    <th class="styDepTblCell" scope="col" style="width:130mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-left-width:0px;border-right:none;">Explanation  </th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:if test="($Print != $Separated) or (count($FormData/SupplementalInformationDetail) &lt;= 21) ">
                    <xsl:for-each select="$FormData/SupplementalInformationDetail">
                      <xsl:call-template name="SupplementalTemp"/>
                    </xsl:for-each>
                    <!-- Render out the rest of the empty rows if less than $RowsToShow data items present for consistency with PDF display. -->
                    <xsl:call-template name="EmptyIteratorTemp">
                      <xsl:with-param name="NumEmptyRows" select="$RowsToShow4 - $SupplementalSize"/>
                      <xsl:with-param name="TempToCall" select="'SupplementalTemp'"/>
                    </xsl:call-template>
                  </xsl:if>
                  <xsl:if test="($Print = $Separated) and (count($FormData/SupplementalInformationDetail) &gt; 20) ">
                    <xsl:call-template name="EmptyIteratorTemp">
                      <xsl:with-param name="NumEmptyRows" select="20"/>
                      <xsl:with-param name="TempToCall" select="'SupplementalTemp'"/>
                      <xsl:with-param name="IsSeparated" select="'yes' "/>
                    </xsl:call-template>
                  </xsl:if>
                </tbody>
              </table>
            </div>
            <xsl:call-template name="SetInitialDynamicTableHeight">
              <xsl:with-param name="TargetNode" select="$FormData/SupplementalInformationDetail"/>
              <xsl:with-param name="containerHeight" select="$RowsToShow4"/>
              <xsl:with-param name="headerHeight" select="1"/>
              <xsl:with-param name="containerID" select=" 'Part5' "/>
            </xsl:call-template>
            <!-- END TABLE FOR SUPPLEMENTAL INFORMATION -->
            
            <!-- Page Footer For Page  5   -->
            <div style="width:187mm;border-bottom-width:0px;">
              <span style="width:146mm;"/>
              <span style="font-weight:bold;font-size:7pt;">Schedule F (Form 990) 2021</span>
            </div>
            <div class="pageEnd" />
            
            <!-- Recycle Image -->
            <div style="height:auto;width:187mm;display:block inline;">
            <div class="styLeftOverTitleLine" id="LeftoverData" style="height:auto;width:187mm;display:block;">
              <div class="styLeftOverTitle" style="width:187mm;">
				  Additional Data        
			  </div>
            </div>
            <table class="styLeftOverTbl" style="height:auto;border-bottom-width:0px;display:block;">
              <xsl:call-template name="PopulateCommonLeftover">
                <xsl:with-param name="TargetNode" select="$FormData"/>
                <xsl:with-param name="DescWidth" select="100"/>
              </xsl:call-template>
            </table>
          </div>
            <!-- Begin Separated Repeating Data table -->
            <!-- Begin SRD for PART I   -->
            <div style="padding-top:9mm;display:block;">
            <xsl:if test="($Print = $Separated) and (count($FormData/AccountActivitiesOutsideUSGrp) &gt;17)">
              <span class="styRepeatingDataTitle">Form 990 Schedule F Part I - Activities Outside The United States</span>
              <table class="styLeftOverTbl" cellspacing="0" style="height:auto;font-size:7pt;display:block;clear:none;">
                <thead class="styTableThead">
                  <tr class="styDepTblHdr">
                    <th class="styDepTblCell" scope="col" style="width:40mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">(a) Region</th>
                    <th class="styDepTblCell" scope="col" style="width:22mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">(b) Number of offices in the region </th>
                    <th class="styDepTblCell" scope="col" style="width:22mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">(c) Number of employees or agents in region </th>
                    <th class="styDepTblCell" scope="col" style="width:34mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">(d) Activities conducted in region (by type) (i.e., fundraising, program services, grants to recipients located in the region)       </th>
                    <th class="styDepTblCell" scope="col" style="width:35mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">(e) If activity listed in (d) is a program service, describe specific type of service(s) in region     </th>
                    <th class="styDepTblCell" scope="col" style="width:33mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-right:none;">(f) Total expenditures for region    </th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="$FormData/AccountActivitiesOutsideUSGrp">
                    <tr>
                      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                      <td class="styTableCell" style="font-size:7pt;font-weight:normal;border-color:black;                 text-align:left;height:7mm;width:40mm;vertical-align:top;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="RegionTxt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad "/>
                      </td>
                      <td class="styTableCell" style="font-size:7pt;border-color:black;width:22mm;text-align:right;padding-top:1mm;vertical-align:top;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="OfficesCnt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad "/>
                      </td>
                      <td class="styTableCell" style="font-size:7pt;border-style:solid;border-color:black;width:22mm;text-align:right;vertical-align:top;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="EmployeeCnt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="font-size:7pt;border-color:black;text-align:left;width:34mm;vertical-align:top;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="TypeOfActivitiesConductedTxt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad "/>
                      </td>
                      <td class="styTableCell" style="font-size:7pt;border-color:black;width:35mm;text-align:left;vertical-align:top;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="SpecificServicesProvidedTxt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="font-size:7pt;padding-right:0mm;vertical-align:top;border-color:black;border-right:none;width:33mm;text-align:right;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="RegionTotalExpendituresAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad "/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </xsl:if>
            </div>
            <br/>
            <!-- End SRD for PART I   -->
            <!-- Begin Separated Repeating Data for PART II  TABLE -->
            <div style="width:256mm;display:block;">
            <xsl:if test="($Print = $Separated) and (count($FormData/GrantsToOrgOutsideUSGrp) &gt;16)">
              <span class="styRepeatingDataTitle">Form 990 Schedule F Part II - Grants or Entities Outside The United States</span>
              <table class="styLeftOverTblLandscape" cellspacing="0" style="height:auto;width:256mm;font-size:7pt;display:inline;clear:none;">
                <thead class="styTableThead">
                  <tr class="styDepTblHdr">
                    <th class="styTableCellHeader" scope="col" style="width:30mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-right-width:1px;">(a) Name of organization</th>
                    <th class="styTableCellHeader" scope="col" style="width:20mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">(b) IRS code section<br/>and EIN(if applicable) </th>
                    <th class="styTableCellHeader" scope="col" style="width:30mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">(c) Region</th>
                    <th class="styTableCellHeader" scope="col" style="width:29mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">(d) Purpose of grant    </th>
                    <th class="styTableCellHeader" scope="col" style="width:30mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">(e) Amount of<br/>cash grant   </th>
                    <th class="styTableCellHeader" scope="col" style="width:29mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">
(f) Manner of <br/>cash disbursement  </th>
                    <th class="styTableCellHeader" scope="col" style="width:30mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">(g) Amount of non-cash<br/>assistance   </th>
                    <th class="styTableCellHeader" scope="col" style="width:29mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">(h) Description of <br/>non-cash<br/>assistance    </th>
                    <th class="styTableCellHeader" scope="col" style="width:29mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-right:none;">(i) Method of<br/>valuation <br/>(book, FMV, <br/> appraisal, other)    </th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="$FormData/GrantsToOrgOutsideUSGrp">
                    <tr>
                      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                      <td class="styTableCell" style="background-color:lightgrey;font-size:7pt;font-weight:normal;border-color:black;border-style:solid;border-bottom-width:1px; border-right-width:1px;text-align:left;height:7mm;width:30mm;vertical-align:top;">
                        <span class="styNBSP"/>
                        <!--  <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param></xsl:call-template><br/>
          <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param></xsl:call-template>-->
                      </td>
                      <td class="styTableCell" style="background-color:lightgrey;font-size:7pt;border-color:black;border-style:solid;width:20mm;text-align:left; padding-top:1mm;vertical-align:top;border-bottom-width:1px;border-right-width:1px;">
                        <span class="styNBSP"/>
                        <!--    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="IRCSubsection" />
                    </xsl:call-template>  <br />
                    <xsl:call-template name="PopulateEIN">
                    <xsl:with-param name="TargetNode" select="EIN"></xsl:with-param>
                    </xsl:call-template>    -->
                      </td>
                      <td class="styTableCell" style="font-size:7pt;border-style:solid;border-color:black;width:30mm;text-align:left;vertical-align:top;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="RegionTxt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="font-size:7pt;border-color:black;text-align:left;width:29mm;vertical-align:top;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="PurposeOfGrantTxt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad "/>
                      </td>
                      <td class="styTableCell" style="font-size:7pt;border-color:black;width:30mm;text-align:right;vertical-align:top;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="CashGrantAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="font-size:7pt;border-color:black;text-align:left;width:29mm;vertical-align:top;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="MannerOfCashDisbursementTxt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad "/>
                      </td>
                      <td class="styTableCell" style="font-size:7pt;border-color:black;width:30mm;text-align:right;vertical-align:top;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="NonCashAssistanceAmt"/>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" style="font-size:7pt;border-color:black;width:29mm;text-align:left;vertical-align:top;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="DescriptionOfNonCashAsstTxt"/>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" style="font-size:7pt;border-color:black;border-right:none;width:29mm;text-align:left;vertical-align:top;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="ValuationMethodUsedDesc"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </xsl:if>
            </div>
            <br/>
            <!-- End SRD for PART  II   -->
            
            <!-- Begin Separated Repeating Data for PART 3  TABLE -->
            <div style="width:256mm;display:block;">
            <xsl:if test="($Print = $Separated) and (count($FormData/ForeignIndividualsGrantsGrp) &gt;18)">
              <span class="styRepeatingDataTitle">Form 990 Schedule F Part III - Grants and Assistance to Individuals Outside The U S</span>
              <table class="styLeftOverTblLandscape" cellspacing="0" style="height:auto;width:256mm;font-size:7pt;display:inline;clear:none;">
                <thead class="styTableThead">
                  <tr class="styDepTblHdr">
                    <th class="styDepTblCell" scope="col" style="width:40mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">(a) Type of grant or assistance</th>
                    <th class="styDepTblCell" scope="col" style="width:30mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">(b) Region </th>
                    <th class="styDepTblCell" scope="col" style="width:20mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">(c)Number of recipients </th>
                    <th class="styDepTblCell" scope="col" style="width:30mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">(d) Amount of cash grant      </th>
                    <th class="styDepTblCell" scope="col" style="width:34mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">(e) Manner of cash disbursement    </th>
                    <th class="styDepTblCell" scope="col" style="width:30mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">
(f) Amount of non-cash assistance      </th>
                    <th class="styDepTblCell" scope="col" style="width:36mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;">(g) Description of non-cash assistance    </th>
                    <th class="styDepTblCell" scope="col" style="width:36mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-right:none;">(h) Method of valuation (book, FMV, appraisal, other)    </th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="$FormData/ForeignIndividualsGrantsGrp">
                    <tr>
                      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                      <td class="styTableCell" style="font-size:7pt;font-weight:normal;border-color:black;text-align:left;width:40mm;vertical-align:top;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="TypeOfAssistanceTxt"/>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" style="font-size:7pt;border-color:black;width:30mm;text-align:left;padding-top:1mm;vertical-align:top;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="RegionTxt"/>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" style="font-size:7pt;border-style:solid;border-color:black;width:20mm;text-align:right;vertical-align:top;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="RecipientCnt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="font-size:7pt;border-color:black;text-align:right;width:30mm;vertical-align:top;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="CashGrantAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad "/>
                      </td>
                      <td class="styTableCell" style="font-size:7pt;border-color:black;width:34mm;text-align:left;vertical-align:top;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="MannerOfCashDisbursementTxt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styTableCell" style="font-size:7pt;border-color:black;text-align:right;width:30mm;vertical-align:top;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="NonCashAssistanceAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad "/>
                      </td>
                      <td class="styTableCell" style="font-size:7pt;border-color:black;width:36mm;text-align:left;vertical-align:top;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="DescriptionOfNonCashAsstTxt"/>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" style="font-size:7pt;border-color:black;border-right:none;width:36mm;text-align:left;vertical-align:top;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="ValuationMethodUsedDesc"/>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </xsl:if>
            </div>
            <br/>
            <!-- End SRD for PART  3   -->
            
            <!-- Begin Separated Repeating Data FOR PART 4 TABLE -->
            <!-- Begin SRD for first part -->
            <div style="display:block;">
            <xsl:if test="($Print = $Separated) and (count($FormData/SupplementalInformationDetail) &gt;20)">
              <span class="styRepeatingDataTitle">Form 990 Schedule F - Supplemental Information</span>
              <table cellspacing="0" class="styDepTbl" cellpadding="0" style="height:auto;font-size:7pt;display:inline;clear:none;">
                <thead class="styTableThead">
                  <tr class="styDepTblHdr">
                    <th class="styDepTblCell" scope="col" style="width:57mm;height:5mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-left-weight:0px;">ReturnReference </th>
                    <th class="styDepTblCell" scope="col" style="width:130mm;height:5mm;text-align:center;font-size:7pt;font-weight:normal;border-color:black;border-right:none;">Explanation  </th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="$FormData/SupplementalInformationDetail">
                    <tr>
                      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                      <td class="styTableCell" style="font-size:7pt;border-color:black;width:50mm;text-align:left;padding-top:1mm;vertical-align:top;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="FormAndLineReferenceDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad "/>
                      </td>
                      <td class="styTableCell" style="font-size:7pt;border-color:black;border-right:none;width:87mm;text-align:left;vertical-align:top;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="ExplanationTxt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad "/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </xsl:if>
            </div>
            </div>
            <!-- End SRD for PART 4   -->
        </form>
      </body>
    </html>
  </xsl:template>
  <!--  PART  I  TEMP DATA  -->
  <xsl:template name="AcctsActvsOutUSTableTemp">
    <xsl:param name="IsSeparated">no</xsl:param>
    <tr>
      <td class="styTableCell" style="font-size:6pt;font-weight:normal;text-align:right;vertical-align:top;width:7mm;height:5mm;padding-right:1.5mm;border-color:black;border-top-width:0px;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;">
        <b>
          <script language="JavaScript" type="text/javascript">
            getLineCount();
          </script>
        </b>
      </td>
      <td class="styTableCell" style="font-size:7pt;font-weight:normal;border-color:black;text-align:left;width:45mm;vertical-align:top;">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="RegionTxt"/>
        </xsl:call-template>
        <xsl:if test="$IsSeparated = 'yes' ">
          <xsl:call-template name="PopulateAdditionalDataTableMessage">
            <xsl:with-param name="TargetNode" select="$FormData/AccountActivitiesOutsideUSGrp"/>
            <xsl:with-param name="ShortMessage" select="'true'"/>
          </xsl:call-template>
        </xsl:if>
      </td>
      <td class="styTableCell" style="font-size:7pt;border-color:black;width:22mm;text-align:right;vertical-align:top;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="OfficesCnt"/>
        </xsl:call-template>
        <span class="styTableCellPad"/>
      </td>
      <td class="styTableCell" style="font-size:7pt;border-style:solid;border-color:black;width:22mm;text-align:right;vertical-align:top;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="EmployeeCnt"/>
        </xsl:call-template>
        <span class="styTableCellPad"/>
      </td>
      <td class="styTableCell" style="font-size:7pt;border-color:black;text-align:left;width:34mm;vertical-align:top;">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="TypeOfActivitiesConductedTxt"/>
        </xsl:call-template>
      </td>
      <td class="styTableCell" style="font-size:7pt;border-color:black;text-align:left;width:35mm;vertical-align:top;">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="SpecificServicesProvidedTxt"/>
        </xsl:call-template>
      </td>
      <td class="styTableCell" style="font-size:7pt;border-color:black;border-right:none;width:33mm;text-align:right;vertical-align:top;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="RegionTotalExpendituresAmt"/>
        </xsl:call-template>
      </td>
    </tr>
  </xsl:template>
  <!--   PART II  TEMP DATA -->
  <xsl:template name="GrantsToOrgsOutsideUSTemp">
    <xsl:param name="IsSeparated">no</xsl:param>
    <tr>
      <td class="styTableCell" style="background-color:lightgrey;font-size:6pt;font-weight:normal;text-align:right;vertical-align:top;width:7mm;height:7mm;padding-right:1.5mm;border-color:black;border-top-width:0px;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;">
        <b>
          <script language="JavaScript" type="text/javascript">
            getLineCount();
          </script>
        </b>
      </td>
      <td class="styTableCell" style="font-size:7pt;background-color:lightgrey;font-weight:normal;border-color:black;text-align:left;height:7mm;width:23mm;">
        <span class="styNBSP"/>
        <!--  <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="NameOfOrganization" />
        </xsl:call-template>-->
        <xsl:if test="$IsSeparated = 'yes' ">
          <xsl:call-template name="PopulateAdditionalDataTableMessage">
            <xsl:with-param name="TargetNode" select="$FormData/GrantsToOrgOutsideUSGrp"/>
            <xsl:with-param name="ShortMessage" select="'true'"/>
          </xsl:call-template>
        </xsl:if>
      </td>
      <td class="styTableCell" style="background-color:lightgrey;font-size:7pt;border-color:black;width:20mm;text-align:left;">
        <span class="styNBSP"/>
        <!--  <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="IRCSubsection" />
          </xsl:call-template>  <br />
           <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="EIN" />
          </xsl:call-template>-->
      </td>
      <td class="styTableCell" style="font-size:7pt;border-style:solid;border-color:black;width:30mm;text-align:left;vertical-align:top;">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="RegionTxt"/>
        </xsl:call-template>
        <span class="styTableCellPad"/>
      </td>
      <td class="styTableCell" style="font-size:7pt;border-color:black;text-align:left;width:29mm;vertical-align:top;">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="PurposeOfGrantTxt"/>
        </xsl:call-template>
        <span class="styTableCellPad"/>
      </td>
      <td class="styTableCell" style="font-size:7pt;border-color:black;text-align:right;width:30mm;vertical-align:top;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="CashGrantAmt"/>
        </xsl:call-template>
      </td>
      <td class="styTableCell" style="font-size:7pt;border-color:black;text-align:left;width:29mm;vertical-align:top;">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="MannerOfCashDisbursementTxt"/>
        </xsl:call-template>
        <span class="styTableCellPad"/>
      </td>
      <td class="styTableCell" style="font-size:7pt;border-color:black;text-align:right;width:30mm;vertical-align:top;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="NonCashAssistanceAmt"/>
        </xsl:call-template>
      </td>
      <td class="styTableCell" style="font-size:7pt;border-color:black;text-align:left;width:29mm;vertical-align:top;">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="DescriptionOfNonCashAsstTxt"/>
        </xsl:call-template>
      </td>
      <td class="styTableCell" style="font-size:7pt;border-color:black;border-right:none;width:29mm;text-align:left;vertical-align:top;">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="ValuationMethodUsedDesc"/>
        </xsl:call-template>
      </td>
    </tr>
  </xsl:template>
  <!--  PART III TEMP DATA  -->
  <xsl:template name="GrantsToIndOutsideUSTemp">
    <xsl:param name="IsSeparated">no</xsl:param>
    <tr>
      <td class="styTableCell" style="font-size:6pt;font-weight:normal;text-align:right;vertical-align:top;width:7mm;height:7mm;padding-right:1.5mm;border-color:black;border-top-width:0px;border-bottom-width:1px;border-left-width:0px;border-right-width:0px;">
        <b>
          <script language="JavaScript" type="text/javascript">
            getLineCount();
          </script>
        </b>
      </td>
      <td class="styTableCell" style="font-size:7pt;font-weight:normal;border-color:black;text-align:left;width:33mm;vertical-align:top;">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="TypeOfAssistanceTxt"/>
        </xsl:call-template>
        <xsl:if test="$IsSeparated = 'yes' ">
          <xsl:call-template name="PopulateAdditionalDataTableMessage">
            <xsl:with-param name="TargetNode" select="$FormData/ForeignIndividualsGrantsGrp"/>
            <xsl:with-param name="ShortMessage" select="'true'"/>
          </xsl:call-template>
        </xsl:if>
      </td>
      <td class="styTableCell" style="font-size:7pt;border-color:black;width:30mm;vertical-align:top;text-align:left;">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="RegionTxt"/>
        </xsl:call-template>
      </td>
      <td class="styTableCell" style="font-size:7pt;border-style:solid;vertical-align:top;border-color:black;width:20mm;text-align:right;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="RecipientCnt"/>
        </xsl:call-template>
        <span class="styTableCellPad"/>
      </td>
      <td class="styTableCell" style="font-size:7pt;vertical-align:top;border-color:black;text-align:right;width:30mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="CashGrantAmt"/>
        </xsl:call-template>
        <span class="styTableCellPad"/>
      </td>
      <td class="styTableCell" style="font-size:7pt;vertical-align:top;border-color:black;text-align:left;width:34mm;">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="MannerOfCashDisbursementTxt"/>
        </xsl:call-template>
      </td>
      <td class="styTableCell" style="font-size:7pt;vertical-align:top;border-color:black;text-align:right;width:30mm;">
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="NonCashAssistanceAmt"/>
        </xsl:call-template>
        <span class="styTableCellPad"/>
      </td>
      <td class="styTableCell" style="font-size:7pt;vertical-align:top;border-color:black;text-align:left;width:36mm;">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="DescriptionOfNonCashAsstTxt"/>
        </xsl:call-template>
      </td>
      <td class="styTableCell" style="font-size:7pt;vertical-align:top;border-color:black;border-right:none;width:36mm;text-align:left;">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="ValuationMethodUsedDesc"/>
        </xsl:call-template>
      </td>
    </tr>
  </xsl:template>
  <!--  PART V  TEMP DATA  -->
  <xsl:template name="SupplementalTemp">
    <xsl:param name="IsSeparated">no</xsl:param>
    <tr>
      <td class="styTableCell" style="width:57mm;font-size:7pt;border-color:black;text-align:left;vertical-align:top;">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="FormAndLineReferenceDesc"/>
        </xsl:call-template>
      </td>
      <td class="styTableCell" style="width:130mm;font-size:7pt;border-color:black;border-right:none;text-align:left;vertical-align:top;">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="ExplanationTxt"/>
        </xsl:call-template>
      </td>
    </tr>
  </xsl:template>
  <!-- The param CalledTemplate is used to differentiate different elements for the additional data table as the different elements call the same template -->
  <xsl:template name="EmptyIteratorTemp">
    <xsl:param name="NumEmptyRows"/>
    <xsl:param name="TempToCall"/>
    <xsl:param name="CalledTemplate" select="$FormData"/>
    <xsl:param name="IsSeparated">no</xsl:param>
    <xsl:if test="$IsSeparated = 'no' ">
      <xsl:if test="$NumEmptyRows &gt; 0">
        <xsl:choose>
          <xsl:when test="$TempToCall = 'AcctsActvsOutUSTableTemp'">
            <xsl:call-template name="AcctsActvsOutUSTableTemp"/>
          </xsl:when>
          <xsl:when test="$TempToCall = 'GrantsToOrgsOutsideUSTemp'">
            <xsl:call-template name="GrantsToOrgsOutsideUSTemp"/>
          </xsl:when>
          <xsl:when test="$TempToCall = 'GrantsToIndOutsideUSTemp'">
            <xsl:call-template name="GrantsToIndOutsideUSTemp"/>
          </xsl:when>
          <xsl:when test="$TempToCall = 'SupplementalTemp'">
            <xsl:call-template name="SupplementalTemp"/>
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
        <xsl:when test="$TempToCall = 'AcctsActvsOutUSTableTemp'">
          <xsl:call-template name="AcctsActvsOutUSTableTemp">
            <xsl:with-param name="IsSeparated">yes</xsl:with-param>
            <xsl:with-param name="CalledTemplate" select="$CalledTemplate"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:when test="$TempToCall = 'GrantsToOrgsOutsideUSTemp'">
          <xsl:call-template name="GrantsToOrgsOutsideUSTemp">
            <xsl:with-param name="IsSeparated">yes</xsl:with-param>
            <xsl:with-param name="CalledTemplate" select="$CalledTemplate"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:when test="$TempToCall = 'GrantsToIndOutsideUSTemp'">
          <xsl:call-template name="GrantsToIndOutsideUSTemp">
            <xsl:with-param name="IsSeparated">yes</xsl:with-param>
            <xsl:with-param name="CalledTemplate" select="$CalledTemplate"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:when test="$TempToCall = 'SupplementalTemp'">
          <xsl:call-template name="SupplementalTemp">
            <xsl:with-param name="IsSeparated">yes</xsl:with-param>
            <xsl:with-param name="CalledTemplate" select="$CalledTemplate"/>
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