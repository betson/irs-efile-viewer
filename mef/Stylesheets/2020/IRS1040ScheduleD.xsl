<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by James Ganzy on 09/08/2014 -->
  <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS1040ScheduleDStyle.xsl"/>
  <xsl:param name="FormData" select="$RtnDoc/IRS1040ScheduleD"/>
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <!-- Set Document Title -->
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($FormData)"/>
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
        <!-- Set Filename and Description -->
        <meta name="Description" content="Schedule D (Form 1040)"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
      <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS1040ScheduleDStyle"/>
            <xsl:call-template name="AddOnStyle"/>
       </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form1040ScheduleD">
          
          <xsl:call-template name="DocumentHeader"/>
          <!-- END WARNING LINE -->
          <!-- BEGIN FORM HEADER -->
          
          <div class="styBB" style="width: 187mm;">
            <!-- Form Name -->
            <div class="styFNBox" style="width:26mm;height:20mm;">
              <!-- Form Name -->
              <div class="styFormNumber" style="font-size: 10pt;height:13.3mm">SCHEDULE D<br/>
                <div class="styFormNumber" style="font-size: 8pt;">(Form 1040)</div>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData"/>
                </xsl:call-template>
              </div>
              <!-- Agency Name -->
              <span class="styAgency" style="font-size:6pt;">Department of the Treasury</span><br/>
				<span class="styAgency" style="font-size:6pt;">Internal Revenue Service (99)</span>
            </div>
            <!-- Form Title Box -->
            <div class="styFTBox" style="width:130mm;height:20mm;">
              <!-- Form Title -->
              <div class="styMainTitle" style="height:6.5mm;padding-top: 1.7mm;padding-bottom: 1.2mm;">Capital Gains and Losses</div>
              <!-- Form Subtitle -->
              <br/>
              <div>
                <span style="font-weight:bold; height:4mm;">
                  <img src="{$ImagePath}/1040SchD_Bullet.gif" alt="Right arrow" border="0"/> Attach to Form 1040, 1040-SR, or 1040-NR.
                </span>              
              </div>
              <div>
                <span style="font-weight: bold;height: 4mm;">   
                  <img src="{$ImagePath}/1040SchD_Bullet.gif" alt="Right arrow" border="0"/> Go to <a href="http://www.irs.gov/form1040" title="Link to IRS.gov"><i>www.irs.gov/ScheduleD</i></a> for instructions and the latest information.
                  <!--<a href="http://www.irs.gov/form1040" title="Link to IRS.gov"><i>www.irs.gov/scheduled</i></a>-->
                 <!-- Go to www.irs.gov/ScheduleD for instructions and the latest information.-->
                
                </span>
              </div>
              <div>
                <span style="font-weight: bold;height: 4mm;">
                  <img src="{$ImagePath}\1040SchD_Bullet.gif" alt="Right Arrow" border="0"/> Use Form 8949 to list your transactions for lines 1b, 2, 3, 8b, 9, and 10.
            </span>
              </div>
            </div>
            <!-- Tax Year Box -->
            <div class="styTYBox" style="width:31mm;height:20mm;">
               <!-- OMB No. -->
              <div class="styOMB" style="height: 4mm;">OMB No. 1545-0074</div>
              <!-- Tax Year -->
              <div class="styTaxYear" style="height:8mm;">20<span style="color:green;">20</span>
              </div>
              <div style="padding-left:5mm;font-weight:normal;text-align: left;font-size:7pt;">Attachment<br/> Sequence No. <span style="font-weight: bold">12</span>
              </div>
            </div>
          </div>
          <!-- END FORM HEADER -->
          <!-- BEGIN TAXPAYER INFO -->
          <div class="styBB" style="width:187mm;float:left;clear:none">
            <!-- Name -->
            <div class="styNameBox" style="width:136mm;height:10mm;font-size:7pt;font-weight:normal;">
              Name(s) shown on return<br/>
              <span>
                <xsl:call-template name="PopulateReturnHeaderFiler">
					<xsl:with-param name="TargetNode">Name</xsl:with-param>
                </xsl:call-template>
              </span>
            </div>
            <!-- SSN -->
            <div class="styEINBox" style="width:50mm;height:4mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
              Your social security number
              <br/>
              <span style="width:100%;text-align:center;font-weight:normal;">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <!-- END TAXPAYER INFO -->
          <!-- BEGIN PART I HEADER -->
          <div  class="styBB" style="width:187mm;margin-top:2mm;padding-bottom:2mm">
               Did you dispose of any investment(s) in a qualified opportunity fund during the tax year?<!-- <Insert Yes/No check box>--> 
<div class="styIRS4835CleanDiv" style="width:28mm;float:right;">
								<span style="width:7px;"/>
								<!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
								<span>
                                    <xsl:call-template name="PopulateSpan">
                                    <xsl:with-param name="TargetNode" select="$FormData/DisposeInvestmentQOFInd"/>
                                    </xsl:call-template>
                                    <input type="checkbox" alt="DisposeInvestmentQOF Yes" class="styCkbox">
                                       <xsl:call-template name="PopulateYesCheckbox">
                                       <xsl:with-param name="TargetNode" select="$FormData/DisposeInvestmentQOFInd"/>
                                       </xsl:call-template>
                                    </input>
                                    <label>
									<xsl:call-template name="PopulateLabelYes">
										<xsl:with-param name="TargetNode" select="$FormData/DisposeInvestmentQOFInd"/>
										<xsl:with-param name="BackupName">IRSFormData/DisposeInvestmentQOFInd.</xsl:with-param>
									</xsl:call-template>
									  Yes
								</label>
								<span style="width:1mm;"/>
                               </span>
                               <!-- ++++++++++++++ No Checkbox +++++++++++++ -->
                               <span>
                                      <xsl:call-template name="PopulateSpan">
										<xsl:with-param name="TargetNode" select="$FormData/DisposeInvestmentQOFInd"/>
									</xsl:call-template>
                               </span>
                               <input type="checkbox" alt="DisposeInvestmentQOF No" class="styCkbox">
                                    <xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/DisposeInvestmentQOFInd"/>
									     <xsl:with-param name="BackupName">IRSFormData/DisposeInvestmentQOFInd</xsl:with-param>
	                                </xsl:call-template>
                                </input>
                                	<label>
									<xsl:call-template name="PopulateLabelNo">
										<xsl:with-param name="TargetNode" select="$FormData/DisposeInvestmentQOFInd"/>
										<xsl:with-param name="BackupName">IRSDisposeInvestmentQOFInd</xsl:with-param>
									</xsl:call-template>
										  No
								</label>
								
								</div>
             <span style="width:160mm"> If "Yes," attach Form 8949 and see its instructions for additional requirements for reporting your gain or loss. </span>  <!--<Insert line across the page> -->
            </div><br/>
		  <div class="styBB" style="width:187mm;margin-top:2mm;padding-bottom:2mm">
		  
            
            <span class="styPartName" style="height:5mm;width:14mm;font-size:10pt;">Part I</span>
			<div style="padding-left:3mm;width:168mm;font-size:8pt;padding-bottom:2mm;">
          <b>Short-Term Capital Gains and Losses - Generally Assets Held One Year or Less</b> (see instructions) 
			</div>
          </div>
          <!-- END PART I HEADER -->
          <div class="styGenericDiv" id="STCapGainTableContainer">
            <table class="IRS1040ScheduleD_styTable" cellspacing="0" name="STCapGainTable" id="STCapGainTable">
              <!-- BEGIN PART I TABLE HEADER -->
              <tr>
                <th class="IRS1040ScheduleD_styTableCellNote" style="font-weight:normal;height:21mm;" scope="col">
                  See instructions for how to figure the amounts to enter on the lines below. <br/>
                  <span style="padding-top:0.8mm;">This form may be easier to complete if you round off cents to whole dollars.</span>
                </th>
                <th class="IRS1040ScheduleD_styTableCellAmt" style="text-align:center;font-weight:normal;height:21mm;" scope="col">
                  <span style="font-weight:bold;">(d)</span> <br/> Proceeds <br/> (sales price)</th>
                <th class="IRS1040ScheduleD_styTableCellAmt" style="text-align:center;font-weight:normal;height:21mm;" scope="col">
                  <span style="font-weight:bold;">(e)</span> <br/> Cost <br/> (or other basis) <br/></th>
                <th class="IRS1040ScheduleD_styTableCellAmt" style="text-align:center;font-weight:normal;height:21mm;" scope="col">
                  <span style="font-weight:bold;">(g)</span><br/> Adjustments to <br/>gain or loss from <br/>Form(s) 8949, Part 1, <br/>line 2, column (g)</th>
                <th class="IRS1040ScheduleD_styTableCellAmt" style="text-align:center;font-weight:normal;border-right-width:0px;height:21mm;" scope="col">
                  <b>(h)<br/> Gain or (loss)</b>
                  <br/>Subtract column (e) from column (d) and combine the result with column (g)
                </th>
              </tr>
              <!-- END PART I TABLE HEADER -->
              <!-- BEGIN PART I TABLE -->
              <!-- Line 1a -->
              <tr>
				<td class="IRS1040ScheduleD_styTableCellNote" style="height:26mm;" >
					<span class="styLNLeftNumBoxSD">1a</span>
					<span class="styLNDesc" style="width:48.7mm;padding-right:4px;">
					Totals for all short-term transactions reported on Form 1099-B for which basis was reported to the IRS and for which you have no adjustments (see instructions).  However, if you choose to report all these transactions on Form 8949, leave this line blank and go to line 1b 
					 <div class="styDotLn" style="float:right;padding-right:1mm;">.......</div>
				    </span>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt" style="height:26mm;">
					<br/>
					<br/>
					<br/>
					<br/>
					<br/>
					<br/>
					<br/>
					
					<xsl:call-template name="PopulateAmount" >
						<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BBssRptNoAdjGrp/TotalProceedsSalesPriceAmt"/>
						</xsl:call-template>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt" style="height:26mm;" >
					<br/>
					<br/>
					<br/>
					<br/>
					<br/>
					<br/>
					<br/>
					
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BBssRptNoAdjGrp/TotalCostOrOtherBasisAmt"/>
					</xsl:call-template>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt" style="background-color:lightgrey;height:26mm;">
				<br/>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt" style="border-right-width:0px;height:26mm; ">
					<br/>
     				<br/>
					<br/>
					<br/>
					<br/>
					<br/>
					<br/>
					
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BBssRptNoAdjGrp/TotalGainOrLossAmt"/>
					</xsl:call-template>
				</td>
              </tr>
              <!-- Line 1b -->
              <tr>
				<td class="IRS1040ScheduleD_styTableCellNote">
					<span class="styLNLeftNumBoxSD">1b</span>
					<span class="styLNDesc" style="width:48.7mm;padding-right:4px;">
						Totals for all transactions reported on Form(s) 8949 with <b>Box A</b> checked 
					</span>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt">
					<br/>
					
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotalProceedsSalesPriceAmt"/>
					</xsl:call-template>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt">
					<br/>
					
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotalCostOrOtherBasisAmt"/>
					</xsl:call-template>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt">
					<br/>
					
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
					</xsl:call-template>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt" style="border-right-width:0px;">
					<br/>
					
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotalGainOrLossAmt"/>
					</xsl:call-template>
				</td>
              </tr>
              <!-- Line 2-->
              <tr>
				<td class="IRS1040ScheduleD_styTableCellNote">
					<span class="styLNLeftNumBoxSD">2</span>
					<span class="styLNDesc" style="width:48.7mm;padding-right:4px;">
						Totals for all transactions reported on Form(s) 8949 with <b>Box B</b> checked 
					</span>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt">
					<br/>
					
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotalProceedsSalesPriceAmt"/>
					</xsl:call-template>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt">
					<br/>
					
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotalCostOrOtherBasisAmt"/>
					</xsl:call-template>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt">
					<br/>
					
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
					</xsl:call-template>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt" style="border-right-width:0px;">
					<br/>
					
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotalGainOrLossAmt"/>
					</xsl:call-template>
				</td>
              </tr>
              <!-- Line 3 -->
              <tr>
				<td class="IRS1040ScheduleD_styTableCellNote">
					<span class="styLNLeftNumBoxSD">3</span>
					<span class="styLNDesc" style="width:48.7mm;padding-right:4px;">
						Totals for all transactions reported on Form(s) 8949 with <b>Box C</b> checked
					</span>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt">
					<br/>
					
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotalProceedsSalesPriceAmt"/>
					</xsl:call-template>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt">
					<br/>
					
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotalCostOrOtherBasisAmt"/>
					</xsl:call-template>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt">
					<br/>
					
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotAdjustmentsToGainOrLossAmt"/>
					</xsl:call-template>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt" style="border-right-width:0px;">
					<br/>
					
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotalGainOrLossAmt"/>
					</xsl:call-template>
				</td>
              </tr>
            </table>
          </div>
          <!-- END PART I TABLE -->
          <!-- Line 4 -->
          <div class="styBB" style="width:187mm;border-bottom-width:0px;">
            <div class="styLNLeftNumBoxSD">4</div>
            <div class="styLNDesc" style="width:138.8mm;">
				<span style="float:left;">Short-term gain from Form 6252 and short-term gain or (loss) from Forms 4684, 6781, and 8824</span>
				<span style="float:right;font-weight:bold;padding-right:3mm;">
					.
					<span style="width:11px;"/>.
				</span>
            </div>
            <div class="styLNRightNumBox">4</div>
            <div class="styLNAmountBox">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/STGainOrLossFromFormsAmt"/>
				</xsl:call-template>
            </div>
          </div>
          <!-- END LINE 4 -->
          <!-- BEGIN LINE 5 -->
          <div class="styGenericDiv" style="width:187mm;height:6mm;">
			<div class="styLNLeftNumBoxSD">5</div>
            <div class="styLNDesc" style="width:138.8mm;">
				Net short-term gain or (loss) from partnerships, S corporations, estates, and trusts from <br/>
				<span style="float:left;">Schedule(s) K-1</span>
				<span style="float:right;font-weight:bold;padding-right:3mm;">
					.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
				</span>
            </div>
            <div class="styLNRightNumBox" style="height:7mm;"><br/>5</div>
            <div class="styLNAmountBox" style="height:7mm;">
				<br/>
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/NetSTGainOrLossFromSchK1Amt"/>
				</xsl:call-template>
            </div>
          </div>
          <!-- END LINE 5 -->
          <!-- BEGIN LINE 6 -->
          <div class="styGenericDiv" style="width:187mm;height:6mm;">
			<div class="styLNLeftNumBoxSD">6</div>
            <div class="styLNDesc" style="width:138.8mm;">
				Short-term capital loss carryover. Enter the amount, if any, from line 8 of your <b>Capital Loss</b> <br/> 
				<span style="float:left;"><b>Carryover Worksheet</b> in the instructions</span>
				<span style="float:right;font-weight:bold;padding-right:3mm;">
					.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
				</span>
            </div>
            <div class="styLNRightNumBox" style="height:7mm;"><br/>6</div>
            <div class="styLNAmountBox" style="height:7mm;">
				<br/>
				(<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/STCapitalLossCarryoverAmt"/>
				</xsl:call-template>)
            </div>
          </div>
          <!-- END LINE 6 -->
          <!-- BEGIN LINE 7 -->
          <div class="styBB" style="width:187mm;">
			<div class="styLNLeftNumBoxSD">7</div>
            <div class="styLNDesc" style="width:138.8mm;height:7.5mm"><b>Net short-term capital gain or (loss). </b>Combine lines 1a through 6 in column (h).  If you have any long-term capital gains or losses, go to Part II below.  Otherwise, go to Part III on the back
				<span class="styBoldText">
					<span style="width:11px"/>.
					<span style="width:11px"/>.
					<span style="width:11px"/>.					
					<span style="width:11px"/>.
					<span style="width:11px"/>.										
				</span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;border-bottom-width:0px;padding-top:3.5mm;">7</div>
            <div class="styLNAmountBox" style="height:7.5mm;border-bottom-width:0px;padding-top:3.5mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/NetSTCapitalGainOrLossAmt"/>
				</xsl:call-template>
            </div>
          </div>
          <!-- END LINE 7 -->
          <!-- BEGIN PART II HEADER -->
           <div class="styBB" style="width:192mm;margin-top:2mm;padding-bottom:2mm;">
               <span class="styPartName" style="float:left;height:4mm;width:14mm;font-size:9pt;padding-bottom:2mm;">Part II</span>
            <div style="float:right;padding-left:3mm;width:176mm;font-size:8.5pt;padding-bottom:2mm;">
          <b>Long-Term Capital Gains and Losses—Generally Assets Held More Than One Year</b> (see instructions)
			</div>
          </div>
          <!-- END PART II HEADER -->
          <!-- BEGIN PART II TABLE -->
          <div class="styGenericDiv" id="LTCapGainTableContainer">
            <table class="IRS1040ScheduleD_styTable" cellspacing="0" name="LTCapGainTable" id="LTCapGainTable">
              <!-- BEGIN PART II TABLE HEADER -->
              <tr>
                <th class="IRS1040ScheduleD_styTableCellNote" style="font-weight:normal;height:21mm;" scope="col">
                  See instructions for how to figure the amounts to enter on the lines below.<br/>
                  <span style="padding-top:0.8mm;">This form may be easier to complete if you round off cents to whole dollars.</span>
                </th>
                <th class="IRS1040ScheduleD_styTableCellAmt" style="text-align:center;font-weight:normal;height:21mm;" scope="col">
                  <span style="font-weight:bold;">(d)</span><br/> Proceeds <br/> (sales price) <br/> </th>
                <th class="IRS1040ScheduleD_styTableCellAmt" style="text-align:center;font-weight:normal;height:21mm;" scope="col">
                  <span style="font-weight:bold;">(e)</span> <br/>Cost <br/> (or other basis)<br/></th>
                <th class="IRS1040ScheduleD_styTableCellAmt" style="text-align:center;font-weight:normal;height:21mm;" scope="col">
                <span style="font-weight:bold;">(g)</span><br/> Adjustments to <br/>gain or loss from <br/>Form(s) 8949, Part II, <br/>line 2, column (g)</th>
                <th class="IRS1040ScheduleD_styTableCellAmt" style="text-align:center;font-weight:normal;border-right-width:0px;height:21mm;" scope="col">
                  <b>(h)<br/> Gain or (loss)</b>
                  <br/>Subtract column (e) from column (d) and combine the result with column (g) <br/></th>
              </tr>
              <!-- END PART II TABLE HEADER -->
              <!-- BEGIN PART II TABLE -->
              <!-- Line 8a -->
              <tr>
				<td class="IRS1040ScheduleD_styTableCellNote" style="height:26mm;">
					<span class="styLNLeftNumBoxSD">8a</span>
					<span class="styLNDesc" style="width:48.7mm;padding-right:4px;">
						Totals for all long-term transactions reported on Form 1099-B for which basis was reported to the IRS and for which you have no adjustments (see instructions).  However, if you choose to report all these transactions on Form 8949, leave this line blank and go to line 8b
						 <span class="styBoldText">
					<span style="width:6px"/>.
                    <span style="width:16px"/>.
                    <span style="width:16px"/>.
                    <span style="width:16px"/>.
                    <span style="width:16px"/>.
              
                   </span>
						
					</span>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt" style="height:26mm;">
					<br/>
					<br/>
					<br/>
					<br/>
					<br/>
					<br/>
					<br/>
					
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BBssRptNoAdjGrp/TotalProceedsSalesPriceAmt"/>
					</xsl:call-template>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt" style="height:26mm;">
					<br/>
					<br/>
					<br/>
					<br/>
					<br/>
					<br/>
					<br/>
				
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BBssRptNoAdjGrp/TotalCostOrOtherBasisAmt"/>
					</xsl:call-template>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt" style="background-color:lightgrey;height:26mm;">
					<br/>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt" style="border-right-width:0px;height:26mm;">
					<br/>
					<br/>
					<br/>
					<br/>
					<br/>
					<br/>
					<br/>
					
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BBssRptNoAdjGrp/TotalGainOrLossAmt"/>
					</xsl:call-template>
				</td>
              </tr>
              <!-- Line 8b -->
              <tr>
				<td class="IRS1040ScheduleD_styTableCellNote">
					<span class="styLNLeftNumBoxSD">8b</span>
					<span class="styLNDesc" style="width:48.7mm;padding-right:4px;">
						Totals for all transactions reported on Form(s) 8949 with <b>Box D</b> checked
					</span>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt">
					<br/>
					
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BShowsBasisGrp/TotalProceedsSalesPriceAmt"/>
					</xsl:call-template>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt">
					<br/>
					
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BShowsBasisGrp/TotalCostOrOtherBasisAmt"/>
					</xsl:call-template>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt">
					<br/>
					
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BShowsBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
					</xsl:call-template>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt" style="border-right-width:0px;">
					<br/>
					
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BShowsBasisGrp/TotalGainOrLossAmt"/>
					</xsl:call-template>
				</td>
              </tr>
              <!-- Line 9-->
              <tr>
				<td class="IRS1040ScheduleD_styTableCellNote">
					<span class="styLNLeftNumBoxSD">9</span>
					<span class="styLNDesc" style="width:48.7mm;padding-right:4px;">
						Totals for all transactions reported on Form(s) 8949 with <b>Box E</b> checked
					</span>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt">
					<br/>
					
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotalProceedsSalesPriceAmt"/>
					</xsl:call-template>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt">
					<br/>
					
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotalCostOrOtherBasisAmt"/>
					</xsl:call-template>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt">
					<br/>
					
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
					</xsl:call-template>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt" style="border-right-width:0px;">
					<br/>
					
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotalGainOrLossAmt"/>
					</xsl:call-template>
				</td>
              </tr>
              <!-- Line 10 -->
              <tr>
				<td class="IRS1040ScheduleD_styTableCellNote">
					<span class="styLNLeftNumBox">10</span>
					<span class="styLNDesc" style="width:48.7mm;padding-right:4px;">
						Totals for all transactions reported on Form(s) 8949 with <b>Box F</b> checked
					</span>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt">
					<br/>
					
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotReceivedGrp/TotalProceedsSalesPriceAmt"/>
					</xsl:call-template>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt">
					<br/>
					
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotReceivedGrp/TotalCostOrOtherBasisAmt"/>
					</xsl:call-template>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt">
					<br/>
					
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotReceivedGrp/TotAdjustmentsToGainOrLossAmt"/>
					</xsl:call-template>
				</td>
				<td class="IRS1040ScheduleD_styTableCellAmt" style="border-right-width:0px;">
					<br/>
					
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotReceivedGrp/TotalGainOrLossAmt"/>
					</xsl:call-template>
				</td>
              </tr>
            </table>
          </div>
          <!-- END PART II TABLE -->
          <!-- BEGIN LINE 11 -->
          <div class="styGenericDiv" style="width:187mm;height:6mm;">
			  <div class="styLNLeftNumBox">11</div>
			  <div class="styLNDesc" style="width:138.8mm;height:6mm;">
				  Gain from Form 4797, Part I; long-term gain from Forms 2439 and 6252; and long-term gain or (loss) <br/>
				  <span style="float:left;">from Forms 4684, 6781, and 8824</span>
				<span style="float:right;font-weight:bold;padding-right:3mm;">
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
				</span>
			  </div>
			  <div class="styLNRightNumBox" style="height:6mm;padding-top:2.5mm;">11</div>
			  <div class="styLNAmountBox" style="height:6mm;padding-top:2.5mm;">
				  
				  <xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$FormData/LTGainOrLossFromFormsAmt"/>
				  </xsl:call-template>
			  </div>
          </div>
          <!-- END LINE 11 -->
          <!-- BEGIN LINE 12 -->
          <div class="styGenericDiv" style="width:187mm;height:4mm;">
			  <div class="styLNLeftNumBox" >12</div>
			  <div class="styLNDesc" style="width:138.8mm;">
				  Net long-term gain or (loss) from partnerships, S corporations, estates, and trusts from Schedule(s) K-1
			  </div>
			  <div class="styLNRightNumBox" >12</div>
			  <div class="styLNAmountBox" >
				  <xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$FormData/NetLTGainOrLossFromSchK1Amt"/>
				  </xsl:call-template>
			  </div>
          </div>
          <!-- END LINE 12 -->
          <!-- BEGIN LINE 13 -->
          <div class="styGenericDiv" style="width:187mm;height:4mm">
			  <div class="styLNLeftNumBox" >13</div>
			  <div class="styLNDesc" style="width:138.8mm;">
				<span style="float:left;">
				  Capital gain distributions. See the instructions
				  <span style="width:2px;"/>
				  <xsl:call-template name="SetFormLinkInline">
					  <xsl:with-param name="TargetNode" select="$FormData/CapitalGainDistributionsAmt"/>
				  </xsl:call-template>
				  <span style="width:2px;"/>
				  <xsl:call-template name="LinkToLeftoverDataTableInline">
					  <xsl:with-param name="Desc">Part II, Line 13 - Form 8814 Literal Code</xsl:with-param>
					  <xsl:with-param name="TargetNode" select="$FormData/Form8814LiteralCd"/>
				  </xsl:call-template>
				  <span style="width:2px;"/>
				  <xsl:call-template name="LinkToLeftoverDataTableInline">
					  <xsl:with-param name="Desc">Part II, Line 13 - Form 8814 Amount</xsl:with-param>
					  <xsl:with-param name="TargetNode" select="$FormData/Form8814Amt"/>
				  </xsl:call-template>
				  </span>
				<span style="float:right;font-weight:bold;padding-right:3mm;">
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
				</span>
			  </div>
			  <div class="styLNRightNumBox" >13</div>
			  <div class="styLNAmountBox" >
				  <xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$FormData/CapitalGainDistributionsAmt"/>
				  </xsl:call-template>
			  </div>
          </div>
          <!-- END LINE 13 -->
          <!-- BEGIN LINE 14 -->
          <div style="width:187mm;height:6mm;">
			  <div class="styLNLeftNumBox">14</div>
			  <div class="styLNDesc" style="width:138.8mm;height:6mm;">
				  Long-term capital loss carryover. Enter the amount, if any, from line 13 of your <b>Capital Loss Carryover </b><br/>
				  <span style="float:left;clear:none"><b>Worksheet</b> in the instructions</span>
				<span style="float:right;clear:none;font-weight:bold;padding-right:3mm;">
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
				</span>
			  </div>
			  <div class="styLNRightNumBox" style="height:8mm;"><br/>14</div>
			  <div class="styLNAmountBox" style="height:8mm;">
				  <br/>
				  (<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$FormData/LTCapitalLossCarryoverAmt"/>
				  </xsl:call-template>)
			  </div>
          </div>
          <!-- END LINE 14 -->
          <!-- BEGIN LINE 15 -->
          <div class="styBB" style="width:187mm;height:8mm;">
			  <div class="styLNLeftNumBox">15</div>
			  <div class="styLNDesc" style="width:138.8mm;height:6mm;">
				  <b>Net long-term capital gain or (loss). </b>Combine lines 8a through 14 in column (h). Then go to Part III <br/>
				  <span style="float:left;clear:none">on the back</span>
				<span style="float:right;clear:none;font-weight:bold;padding-right:3mm;">
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
				</span>
			  </div>
			  <div class="styLNRightNumBox" style="height:8mm;border-bottom-width:0px;"><br/>15</div>
			  <div class="styLNAmountBox" style="height:8mm;border-bottom-width:0px;">
				  <br/>
				  <xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="$FormData/NetLTCapitalGainOrLossAmt"/>
				  </xsl:call-template>
			  </div>
          </div>
          <!-- END LINE 15 -->
          <!-- page footer -->
          <div class="pageEnd" style="width:187mm;padding-top:1mm;border-top:1 solid black;border-top-width:1px;">
          <div class="stySmallText" style="width:110mm;">
           <span class="styBoldText">For Paperwork Reduction Act Notice, see your tax return instructions.</span>
            </div>
            <div class="stySmallText" style="width:22mm;">Cat. No. 11338H</div>
            <div class="stySmallText" style="width:55mm;text-align:right;"><span class="styBoldText">Schedule D (Form 1040) 2020</span>
                   </div>
          </div>
          <p style="page-break-before:always"/>
        <!--Begin Page 2 -->
        <div class="styBB" style="width:187mm;border-bottom-width:1px;">
          <span style="width:65mm;font-size:7pt;" class="styGenericDiv">Schedule D (Form 1040) 2020</span>
          <span style="float:right;font-size:7pt;text-align:center;" class="styGenericDiv">Page <b>2</b></span>
        </div>
        <!--  PART III HEADER -->
        <div class="styBB" style="width:187mm;margin-top:2mm;">
            <span class="styPartName" style="height:4mm;width:17mm;font-size:9pt;">Part III</span>
			<div class="styPartDesc" style="padding-left:1mm;width:168mm;font-size:9pt;height:4mm;padding-bottom:3mm;">
			<span style="width:3mm;"/>
          Summary <span style="padding-left:20mm;font-size:8pt;font-weight:normal;"/>
			</div>
        	</div> 
        <!-- END PART III HEADER -->
        <!-- BEGIN LINE 16 -->
       <div class="styBB" style="width:187mm;border-bottom-width:0px;">
            <div class="styLNLeftNumBox" style="width:6mm;padding-top:1mm;">16</div>
            <div class="styLNDesc" style="width:135mm;padding-top:1mm;">Combine lines 7 and 15 and enter the result
             <span class="styBoldText">
					<span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                      <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                   </span>
            </div>
            <div class="styLNRightNumBox" style="height:6mm;padding-top:1mm;width:8.2mm;">16</div>
            <div class="styLNAmountBox" style="width:37mm;height:6mm;padding-top:1mm;">
            <xsl:call-template name="PopulateAmount">
             <xsl:with-param name="TargetNode" select="$FormData/NetSTAndLTCapitalGainOrLossAmt"/>
              </xsl:call-template>
            </div>
          </div>
        <!-- Line 16 - first bulleted item -->
        <div class="styGenericDiv " style="width:187mm;">
           <div class="styLNLeftNumBox" style="width:6mm;padding-top:1mm;"/>
          <div class="styLNDesc" style="width: 135mm;">
              <img src="{$ImagePath}/1040SchD_Bullet_Round.gif" alt="bullet image"/>
            <span style="width: .5mm"/>  If line 16 is a<b> gain, </b>enter the amount from line 16 on Form 1040, 1040-SR, or 1040-NR, line 7. Then go to line 17 below.
          </div>
          <div class="styLNRightNumBox" style="width:8.2mm;background-color:lightgrey;border-bottom-width:0px;height:8mm;"/>
          <div class="styLNAmountBox" style="width: 37mm;border-bottom-width:0px;height:8mm;"/>
        </div>
        <!-- Line 16 - second bulleted item -->
        <div class="styGenericDiv " style="width:187mm;">
          <div class="styLNLeftNumBox" style="width:6mm;padding-top:1mm;"/>
          <div class="styLNDesc" style="width: 135mm;">
            <span>
              <img src="{$ImagePath}/1040SchD_Bullet_Round.gif" alt="bullet image"/>
            </span>
            <span style="width:1mm"/> If line 16 is a <b>loss,</b> skip lines 17 through 20 below. Then go to line 21. Also be sure to complete <br/>
            <span style="width: 2mm"/> line 22.
          </div>
          <div class="styLNRightNumBox" style="width:8.2mm;background-color:lightgrey;border-bottom-width:0px;height:8mm;"/>
          <div class="styLNAmountBox" style="width: 37mm;border-bottom-width:0px;height:8mm;"/>
        </div>
        <!-- Line 16 - third bulleted item, line 1 -->
        <div class="styGenericDiv " style="width:187mm;">
        <div class="styLNLeftNumBox" style="width:6mm;padding-top:1mm;"/>
          <div class="styLNDesc" style="width: 135mm;">
            <span>
              <img src="{$ImagePath}/1040SchD_Bullet_Round.gif" alt="bullet image"/>
            </span>
              <span style="width:1mm"/> If line 16 is <b>zero,</b> skip lines 17 through 21 below and enter -0- on Form 1040, 1040-SR, or 1040-NR, line 7. Then go to line 22.    
          </div>
          <div class="styLNRightNumBox" style="width:8.2mm;background-color:lightgrey;border-bottom-width:0px;height:9mm;"/>
          <div class="styLNAmountBox" style="width:37mm;border-bottom-width:0px;height:9mm;"/>
        </div>
        <!-- END LINE 16 -->
        <!-- BEGIN LINE 17 -->
        <div class="styGenericDiv " style="width:187mm;height:3mm;padding-top:0mm;">
             <div class="styLNLeftNumBox" style="width:6mm;padding-top:0mm;height:3mm;">17</div>
          <div class="styLNDesc" style="width:135mm;padding-top:0mm;height:3mm;">Are lines 15 and 16 <span style="font-weight:bold">both</span> gains?</div>
          <div class="styLNRightNumBox" style="width:8.2mm;background-color:lightgrey;border-bottom-width:0px;height:3mm;"/>
          <div class="styLNAmountBox" style="width:37mm;border-bottom-width:0px;height:3mm;"/>
        </div>
        <!-- LINE 17 2nd line, YES checkbox -->
        <div class="styGenericDiv " style="width:187mm;height:5mm;">
             <xsl:call-template name="PopulateSpan">
			 <xsl:with-param name="TargetNode" select="$FormData/STAndLTGainInd"/>
			</xsl:call-template>
            <div class="styLNLeftNumBox" style="width:6mm;height:5mm;"/>
          <div class="styLNDesc" style="width:135mm;height:5mm;">
            <input type="checkbox" alt="STAndLTGainIn Yes" class="styCkBox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/STAndLTGainInd"/>
                 <xsl:with-param name="BackupName">IRS1040ScheduleD/STAndLTGainInd</xsl:with-param>
              </xsl:call-template>
            </input>
            <label>
				<xsl:call-template name="PopulateLabelYes">
				  <xsl:with-param name="TargetNode" select="$FormData/STAndLTGainInd"/>
				  <xsl:with-param name="BackupName">IRS1040ScheduleD/STAndLTGainInd</xsl:with-param>
				</xsl:call-template>
				<span style="font-weight:bold;padding-left:1mm;">Yes.</span>
			</label>
          Go to line 18.</div>
		  <div class="styLNRightNumBox" style="width:8.2mm;background-color:lightgrey;border-bottom-width:0px;height:5mm;"/>
          <div class="styLNAmountBox" style="width:37mm;border-bottom-width:0px;height:5mm;"/>
        </div>
        <!-- LINE 17 2nd line end -->
        <!-- LINE 17 3rd line, No checkbox -->
        <div class="styGenericDiv " style="width:187mm;">
           <div class="styLNLeftNumBox" style="width:6mm;padding-top:1mm;"/>
          <div class="styLNDesc" style="width:135mm;">
            <input type="checkbox"  alt="STAndLTGainIn No" class="styCkBox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/STAndLTGainInd"/>
                 <xsl:with-param name="BackupName">IRS1040ScheduleD/STAndLTGainInd</xsl:with-param>
              </xsl:call-template>
            </input>
            <label>
				<xsl:call-template name="PopulateLabelNo">
				  <xsl:with-param name="TargetNode" select="$FormData/STAndLTGainInd"/>
				  <xsl:with-param name="BackupName">IRS1040ScheduleD/STAndLTGainInd</xsl:with-param>
				</xsl:call-template>
				<span style="font-weight:bold;padding-left:1mm;">No.</span>
            </label>
          Skip lines 18 through 21, and go to line 22.</div>
          <div class="styLNRightNumBox" style="width:8.2mm;background-color:lightgrey;border-bottom-width:0px;height:6mm;"/>
          <div class="styLNAmountBox" style="width:37mm;border-bottom-width:0px;height:6mm;"/>
        </div>
        <!-- END LINE 17 -->
        <!-- BEGIN Line 18  -->
        <div class="styGenericDiv" style="width:187mm;height:7.4mm;">
            <div class="styLNLeftNumBox" style="width:6mm;">18</div>
          <div class="styLNDesc" style="width: 135mm;"> If you are required to complete the <b>28% Rate Gain Worksheet</b> (see instructions), enter the
             amount, if any, from line 7 of that worksheet
          <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$FormData/RateGainWrkshtAmt"/>
            </xsl:call-template>
            <span class="styBoldText">
                    <span style="width:11px"/>.
                      <span style="width:11px"/>.
                     <span style="width:11px"/>.
                     <span style="width:11px"/>.
                      <span style="width:11px"/>.
                     <span style="width:11px"/>.
                     <span style="width:11px"/>.
                     <span style="width:11px"/>.
                     <span style="width:11px"/>.  
                      <span style="width:11px"/>.
                      <span style="width:11px"/>.
                     <span style="width:11px"/>.
                     <span style="width:11px"/>.
                      <span style="width:11px"/>.
                     <span style="width:11px"/>.
                     <span style="width:11px"/>.
                     <span style="width:11px"/>. 
                      <span style="width:11px"/>. 
                   </span>
                   <span style="width:2mm;"/>
            <img src="{$ImagePath}/1040SchD_Bullet.gif" alt="right pointing bullet image" border="0"/>
          </div>
          <div class="styLNRightNumBox" style="width:8.2mm;height:7.4mm;padding-top:3mm;">18</div>
          <div class="styLNAmountBox" style="width: 37mm;height:7.4mm;padding-top:3mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/RateGainWrkshtAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- END LINE 18 -->
        <div class="styGenericDiv" style="width:187mm;">
			<div class="styLNLeftNumBox" style="width:6mm;"/>
			<div class="styLNDesc" style="width:135mm;"/>
			<div class="styLNRightNumBox" style="width:8.2mm;border-bottom-width:0px;background-color:lightgrey;height:6mm"/>
			<div class="styLNAmountBox" style="width:37mm;border-bottom-width:0px;height:6mm"/>
        </div>
        <!-- BEGIN LINE 19 -->
           <div class="styGenericDiv" style="width:187mm;height:7.4mm;">
            <div class="styLNLeftNumBox" style="width:6mm;">19</div>
          <div class="styLNDesc" style="width: 135mm;">If you are required to complete the <b> Unrecaptured Section 1250 Gain Worksheet</b> (see
             instructions), enter the amount, if any, from line 18 of that worksheet
                     <span class="styBoldText">
                      <span style="width:11px"/>.
                     <span style="width:11px"/>.
                     <span style="width:11px"/>.
                     <span style="width:11px"/>.
                     <span style="width:11px"/>.
                     <span style="width:11px"/>.  
                     <span style="width:11px"/>.
                     <span style="width:11px"/>.
                     <span style="width:11px"/>.
                     <span style="width:11px"/>.
                     <span style="width:11px"/>.
                    <span style="width:11px"/>.
                   </span>
                   <span style="width:2mm;"/>
            <img src="{$ImagePath}/1040SchD_Bullet.gif" alt="right pointing bullet image" border="0"/>
          </div>
          <div class="styLNRightNumBox" style="width:8.2mm;height:7.4mm;padding-top:3mm;">19</div>
          <div class="styLNAmountBox" style="width: 37mm;height:7.4mm;padding-top:3mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/UnrcptrSect1250GainWrkshtAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- END LINE 19 -->
        <div class="styGenericDiv" style="width:187mm;">
			<div class="styLNLeftNumBox" style="width:6mm;"/>
			<div class="styLNDesc" style="width:135mm;"/>
			<div class="styLNRightNumBox" style="width:8.2mm;border-bottom-width:0px;background-color:lightgrey;"/>
			<div class="styLNAmountBox" style="width:37mm;border-bottom-width:0px;"/>
        </div>
        <!-- BEGIN LINE 20 -->
        <div class="styGenericDiv " style="width:187mm;">
          <div class="styLNLeftNumBox" style="width:6mm;">20</div>
          <div class="styLNDesc" style="width:135mm;">Are lines 18 and 19 <span style="font-weight:bold">both</span> zero or blank?
			</div>
          <div class="styLNRightNumBox" style="width:8.2mm;background-color:lightgrey;border-bottom-width:0px;"/>
          <div class="styLNAmountBox" style="width:37mm;border-bottom-width:0px;"/>
        </div>
        <!-- LINE 20 2nd line, YES checkbox -->
        <div class="styGenericDiv " style="width:187mm;">
             <xsl:call-template name="PopulateSpan">
			<xsl:with-param name="TargetNode" select="$FormData/ZeroOrBlankInd"/>
			</xsl:call-template>
         <div class="styLNLeftNumBox" style="width:6mm;"/>
          <div class="styLNDesc" style="width: 135mm;">
            <input type="checkbox"  alt="ZeroOrBlankInd Yes" class="styCkBox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/ZeroOrBlankInd"/>
                <xsl:with-param name="BackupName">IRS1040ScheduleD/ZeroOrBlankInd</xsl:with-param>
              </xsl:call-template>
            </input>
              <label>
        <xsl:call-template name="PopulateLabelYes">
          <xsl:with-param name="TargetNode" select="$FormData/ZeroOrBlankInd"/>
          <xsl:with-param name="BackupName">IRS1040ScheduleD/ZeroOrBlankInd</xsl:with-param>
        </xsl:call-template>
        <span style="font-weight:bold;padding-left:1mm;">Yes.</span>
      </label>
			Complete the <b>Qualified Dividends and Capital Gain Tax Worksheet </b>
			in the instructions for<br/>
			<span style="width: 6mm" />Forms 1040 and 1040-SR, line 16. <b>Don't</b> 
			complete lines 21 and 22 below.
          </div>
          <div class="styLNRightNumBox" style="width:8.2mm;background-color:lightgrey;border-bottom-width:0px;height:10.5mm;"/>
          <div class="styLNAmountBox" style="width:37mm;border-bottom-width:0px;height:10.5mm;"/>
        </div>
        <!-- LINE 20 2nd line end -->
        <!-- LINE 20 3rd line, No checkbox -->
        <div class="styGenericDiv " style="width:187mm;">
          <div class="styLNLeftNumBox" style="width:6mm;"/>
          <div class="styLNDesc" style="width: 135mm;">
            <input type="checkbox"  alt="ZeroOrBlankInd No" class="styCkBox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/ZeroOrBlankInd"/>
                <xsl:with-param name="BackupName">IRS1040ScheduleD/ZeroOrBlankInd</xsl:with-param>
              </xsl:call-template>
            </input>
              <label>
        <xsl:call-template name="PopulateLabelNo">
          <xsl:with-param name="TargetNode" select="$FormData/ZeroOrBlankInd"/>
          <xsl:with-param name="BackupName">IRS1040ScheduleD/ZeroOrBlankInd</xsl:with-param>
        </xsl:call-template>
        <span style="font-weight:bold;padding-left:1mm;">No.</span>
      </label>
           Complete the <b>Schedule D Tax Worksheet</b> in the instructions. <b> Don't</b> complete lines 21 and 22<br/> 		   <span style="padding-left:7mm;"/>  below.
          </div>
          <div class="styLNRightNumBox" style="width:8.2mm;background-color:lightgrey;border-bottom-width:0px;height:11mm;"/>
          <div class="styLNAmountBox" style="width:37mm;border-bottom-width:0px;height:11mm;"/>
          <br/>
        </div>
        <!-- END LINE 20 -->
        <!-- BEGIN LINE 21 -->
        <div class="styGenericDiv " style="width:187mm;">
            <div class="styLNLeftNumBox" style="width:6mm;">21</div>
          <div class="styLNDesc" style="width: 135mm;">If line 16 is a loss, enter here and on Form 1040, 1040-SR, or 1040-NR, line 7, the <b>smaller</b> of:
          </div>
          <div class="styLNRightNumBox" style="width:8.2mm;background-color:lightgrey;border-bottom-width:0px;height:6mm"/>
          <div class="styLNAmountBox" style="width:37mm;border-bottom-width:0px;height:6mm"/>
          <br/>
          <!-- BEGIN LINEs 21 a, b, and Note line -->
          <div class="styGenericDiv " style="width:187mm;">
           <div class="styLNLeftNumBox" style="width:6mm;"/>
            <div class="styLNDesc" style="width:70.2mm;height:8mm;">
            <img src="{$ImagePath}/1040SchD_Bullet_Round.gif" alt="bullet image"/>
                The loss on line 16; or<br/>
                 <img src="{$ImagePath}/1040SchD_Bullet_Round.gif" alt="bullet image"/>
              ($3,000), or if married filing separately, ($1,500)
                   </div>
                  <div class="styLNDesc" style="width:2mm;height:8mm;"> 
                  <img src="{$ImagePath}/1040SchD_Bracket.gif" alt="bracket image"/>
            </div>
              <div class="styLNDesc" style="width:62.8mm;height:8mm;"> 
              <span class="styBoldText">
					<span style="width:16px;padding-top:4mm;"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                    <span style="width:16px"/>.
                     <span style="width:16px"/>.
                     <span style="width:16px"/>.
                   </span>
                </div>
              <div class="styLNRightNumBox" style="width:8.2mm;height:6mm;padding-top:2mm">21</div>
              <div class="styLNAmountBox" style="width: 37mm;height:6mm;padding-top:2mm">
               (
              <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/AllowableLossAmt"/>
                </xsl:call-template>
              )
            </div>
         <div class="styLNRightNumBox" style="height:4mm;width:8.2mm;border-bottom-width:0px;px;border-left-width:1px;float:left;background-color:lightgrey"/>
            <div class="styLNAmountBox" style="height:4mm;width:37mm;border-bottom-width:0px;border-left-width:0px;background-color:lightgrey"/>
          </div>
        </div>
        <div class="styGenericDiv " style="width:187mm;height:6mm;">
          <div class="styLNLeftNumBox" style="width:6mm;height:6mm;"/>
          <div class="styLNDesc" style="width:135mm;height:6mm;">
            <span class="styBoldText">Note.</span> When figuring which amount is smaller, treat both amounts as positive numbers.  </div>
          <div class="styLNRightNumBox" style="width:8.2mm;background-color:lightgrey;border-bottom-width:0px;border-right-width:0px;height:6mm;"/>
          <div class="styLNAmountBox" style="width: 37mm;border-bottom-width:0px;border-left-width:0px;background-color:lightgrey;height:6mm;"/>
        </div>
        <!-- END LINE 21 -->
        <!-- BEGIN LINE 22 -->
        <div class="styGenericDiv " style="width:187mm;">
          <div class="styLNLeftNumBox" style="width:6mm;">22</div>
          <div class="styLNDesc" style="width:135mm;">Do you have qualified dividends on Form 1040, 1040-SR, or 1040-NR, line 3a?
             </div>
          <div class="styLNRightNumBox" style="width:8.2mm;background-color:lightgrey;border-bottom-width:0px;"/>
          <div class="styLNAmountBox" style="width: 37mm;border-bottom-width:0px;border-left-width:0;background-color:lightgrey;"/>
        </div>
        <!-- LINE 22 2nd line, YES checkbox -->
        <div class="styGenericDiv " style="width:187mm;height:7.5mm">
               <xsl:call-template name="PopulateSpan">
		        <xsl:with-param name="TargetNode" select="$FormData/QualifiedDividendsInd"/>
		       </xsl:call-template>
           <div class="styLNLeftNumBox" style="width:6mm;"/>
          <div class="styLNDesc" style="width:135mm;">
            <input type="checkbox"  alt="QualifiedDividendsInd Yes" class="styCkBox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/QualifiedDividendsInd"/>
                <xsl:with-param name="BackupName">IRS1040ScheduleD/QualifiedDividendsInd</xsl:with-param>
              </xsl:call-template>
            </input>
            <label>
             <xsl:call-template name="PopulateLabelYes">
          <xsl:with-param name="TargetNode" select="$FormData/QualifiedDividendsInd"/>
          <xsl:with-param name="BackupName">IRS1040ScheduleD/QualifiedDividendsInd</xsl:with-param>
        </xsl:call-template>
        <span style="font-weight:bold;padding-left:1mm;">Yes.</span>
      </label>
          Complete the <b>Qualified Dividends and Capital Gain Tax Worksheet</b> in the instructions for<br/>
          <span style="padding-left:6mm;"/>  Forms 1040 and 1040-SR, line 16. </div>
          <div class="styLNRightNumBox" style="width:8.2mm;background-color:lightgrey;border-bottom-width:0px;height:7.5mm"/>
          <div class="styLNAmountBox" style="width:37mm;border-bottom-width:0px;height:7.5mm;border-left-width:0;background-color:lightgrey;"/>
        </div>
        <!-- LINE 22 2nd line end -->
        <!-- LINE 22 3rd line, No checkbox -->
        <div class="styGenericDiv " style="width:187mm;height:8mm">
          <div class="styLNLeftNumBox" style="width:6mm;"/>
          <div class="styLNDesc" style="width:135mm;">
            <input type="checkbox"  alt="QualifiedDividendsInd No" class="styCkBox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/QualifiedDividendsInd"/>
                <xsl:with-param name="BackupName">IRS1040ScheduleD/QualifiedDividendsInd</xsl:with-param>
              </xsl:call-template>
            </input>
            <label>
             <xsl:call-template name="PopulateLabelNo">
          <xsl:with-param name="TargetNode" select="$FormData/QualifiedDividendsInd"/>
          <xsl:with-param name="BackupName">IRS1040ScheduleD/QualifiedDividendsInd</xsl:with-param>
        </xsl:call-template>
        <span style="font-weight:bold;padding-left:1mm;">No.</span>
      </label>
           Complete the rest of Form 1040, Form 1040-SR, or Form 1040-NR.			
			</div>
          <div class="styLNRightNumBox" style="width:8.2mm;background-color:lightgrey;border-bottom-width:0px;height:8mm"/>
          <div class="styLNAmountBox" style="width: 37mm;border-bottom-width:0px;height:8mm;border-left-width:0;background-color:lightgrey;"/>
        </div>
        <!-- END LINE 22 -->
        <div class="styBB" style="width:187mm;border-top-width: 1px;border-bottom-width:0px;">
          <span style="font-weight:bold;float:right" class="styGenericDiv">Schedule D (Form 1040) 2020</span>
        </div>
        <!--  PART III HEADER -->
       <p style="page-break-before:always"/>
        <div class="styLeftOverTitleLine" id="LeftoverData">
          <div class="styLeftOverTitle">
          Additional Data        
          </div>
          <div class="styLeftOverButtonContainer">
            <input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
          </div>
        </div>
        <table class="styLeftOverTbl">
          <xsl:call-template name="PopulateCommonLeftover">
            <xsl:with-param name="TargetNode" select="$FormData"/>
            <xsl:with-param name="DescWidth" select="100"/>
          </xsl:call-template>
          <xsl:call-template name="PopulateLeftoverRow">
			  <xsl:with-param name="Desc">Part II, Line 13 - Form 8814 Literal Code</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$FormData/Form8814LiteralCd"/>
			  <xsl:with-param name="DescWidth" select="100"/>
          </xsl:call-template>
          <xsl:call-template name="PopulateLeftoverRowAmount">
			  <xsl:with-param name="Desc">Part II, Line 13 - Form 8814 Amount</xsl:with-param>
			  <xsl:with-param name="TargetNode" select="$FormData/Form8814Amt"/>
			  <xsl:with-param name="DescWidth" select="100"/>
          </xsl:call-template>
        </table>
         </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
