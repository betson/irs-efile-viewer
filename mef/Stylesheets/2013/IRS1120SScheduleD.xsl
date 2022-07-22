<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS1120SScheduleDStyle.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
   <xsl:param name="FormData" select="$RtnDoc/IRS1120SScheduleD"/>
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($FormData)"/>
          </xsl:call-template>
        </title>
        <!-- No Browser Caching  -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <!-- Define Character Set  -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Description" content="IRS Form 1120S Schedule D"/>
        <!-- javascript include -->
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
       <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS1120SScheduleDStyle"/>
            <xsl:call-template name="AddOnStyle"/>
        </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <!-- Standard Warning Line -->
        <xsl:call-template name="DocumentHeader"/>
        <!-- BEGIN FORM HEADER -->
        <div class="styBB" style="width: 187mm">
          <!-- Form Name -->
          <div class="styFNBox" style="height: 21.5mm;width:30mm;">
            <span class="styFormNumber" style="font-size:10pt;">SCHEDULE D</span>
            <br/>
            <span class="styFormNumber" style="font-size:10pt;">(Form 1120S)
             <br/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$FormData"/>
              </xsl:call-template>
            </span>
        <div class="styAgency" style="padding-top:1.8mm;">Department of the Treasury<br/>Internal Revenue Service</div>
        </div>
          <!-- Form Title Box -->
          <div class="styFTBox" style="height: 21.5mm;width:123mm;">
            <!-- Form Title -->
            <span class="styMainTitle">Capital Gains and Losses and Built-in Gains</span>
            <br/>
            <span style="font-weight:bold;">
              <br/>
              <img src="{$ImagePath}/1120SSchD_Bullet.gif" alt="Right arrow"/>Attach to Form 1120S.
              <br/>
              <img src="{$ImagePath}/1120SSchD_Bullet.gif" alt="Right arrow"/>Use Form 8949 to list your transactions for lines 1b, 2, 3, 8b, 9, and 10.
              <br/>
              <img src="{$ImagePath}/1120SSchD_Bullet.gif" alt="Right arrow"/>Information about Schedule D and its separate instructions is 
              <br/>
              at <a href="http://www.irs.gov/form1120s"><i>www.irs.gov/form1120s</i></a>.
    </span>
          </div>
          <!-- Tax Year Box -->
          <div class="styTYBox" style="height: 21.5mm;width:33mm;">
            <!-- OMB No. -->
            <div class="styOMB" style="text-align:center;">OMB No. 1545-0130</div>
            <!-- Tax Year -->
            <div class="styTY" style="text-align: center; padding-top: 2.8mm">
       20<span class="styTYColor">13</span>
            </div>
          </div>
        </div>
        <!-- Name and Address -->
        <div class="styBB" style="width:187mm;border-bottom-width:0px;">
          <div class="styNameBox" style="width:137mm;height:10mm;font-size:7pt;">
      Name<br/>
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
            </xsl:call-template>
            <br/>
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styEINBox" style="width:50mm;height:10mm;padding-left:2mm;font-weight:bold;font-size:7pt;">
      Employer identification number <br/>
            <br/>
            <span style="width:40mm;text-align:left;font-weight:normal;">
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">EIN</xsl:with-param>
              </xsl:call-template>
            </span>
          </div>
        </div>
        <!--Part I -->
        <!-- part I table header -->
           <!--Part I -->
        <div class="styBB" style="width:187mm;border-top-width:1px">
          <div class="styPartName" style="width:15mm;height:4mm;">Part I</div>
          <div class="styPartDesc" style="padding-left:3mm;width:150mm;border-top-width:1px;"> 
                      Short-term Capital Gains and Losses&#8212;Assets Held One Year or Less
          </div>          
        </div>
          <!-- print logic -->
          <xsl:call-template name="SetInitialState"/>
          <!-- end -->
          <table class="IRS1120SScheduleD_styTable" style="width:187mm;" cellspacing="0" summary="Short-Term Capital Gains and Losses--Assets Held One Year or Less">
            <tr valign="top">
              <th class="IRS1120SScheduleD_DescCol" style="font-weight:normal;width:80mm;text-align:left;" scope="col">
           See instructions for how to figure the amounts to enter on the lines below.<br/><br/>
This form may be easier to complete if you round off cents to whole dollars.</th>
              <th class="IRS1120SScheduleD_DescCol" style="font-weight:normal;text-align:center;vertical-align:middle;" scope="col">
				  <b> (d) </b><br/> Proceeds<br/>  (sales price)</th>
              <th class="IRS1120SScheduleD_DescCol" style="font-weight:normal;width:36mm;text-align:center;vertical-align:middle;" scope="col">
               <b> (e) </b><br/>Cost<br/> (or other basis)</th>
              <th class="IRS1120SScheduleD_DescCol" style="font-weight:normal;width:33mm;text-align:center;vertical-align:middle;" scope="col">
              <b>(g) </b>Adjustments to gain or loss from Form(s) 8949, line 2, column (g)</th>
              <th class="IRS1120SScheduleD_DescCol" style="font-weight:normal;width:33mm;text-align:center; vertical-align:middle; height: 18mm;" scope="col">
              <b>  (h) Gain or (loss)</b>Subtract column (e) from column (d) and combine the result with column (g)</th>
            </tr>            
				<!-- part I body -->
				<tr>
					<td class="IRS1120SScheduleD_DescCol" scope="row" style="vertical-align:top;">
					<div class="styLNLeftNumBoxSD" style="width:7mm; height: 24mm; padding-left:1mm;">1a</div>
						Totals for all short-term transactions reported on Form 1099-B for which basis was reported to the IRS and for which you have no adjustments (see instructions). However, if you choose to report all these transactions Form 8949, leave this line blank and on go to line 1b
					</td>
					<td class="IRS1120SScheduleD_MoneyCol" scope="row" align="right" style="padding-right:0px;vertical-align:bottom;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BBssRptNoAdjGrp/TotalProceedsSalesPriceAmt"/>
						</xsl:call-template> 
					</td>
					<td class="IRS1120SScheduleD_MoneyCol" scope="row"  align="right"  style="padding-left:10px;vertical-align:bottom;">					    
						(<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BBssRptNoAdjGrp/TotalCostOrOtherBasisAmt"/>
						</xsl:call-template>)
					</td>
					<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="background-color:lightgrey;">
					</td>
					<td class="IRS1120SScheduleD_MoneyCol" scope="row"  align="right"  style="vertical-align:bottom;">						    
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BBssRptNoAdjGrp/TotalGainOrLossAmt"/>
						</xsl:call-template> 
					</td>											
				</tr>
			    <tr>
					<td class="IRS1120SScheduleD_DescCol" scope="row" style="vertical-align:top;">	
						<span class="IRS1120SScheduleD_IndexCol" style="margin-right:2mm;">1b</span>	     
						Totals for all transactions reported on<br/>
						<span style="width:7mm;" />Form(s) 8949 with Box A checked
					</td>
					<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotalProceedsSalesPriceAmt"/>
						</xsl:call-template> 
					</td>
					<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="padding-left:10px;vertical-align:bottom;;">						    
							(<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotalCostOrOtherBasisAmt"/>
							</xsl:call-template>)
					</td>
					<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;;">						   
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
						</xsl:call-template> 
					</td>
					<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;;">						    
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotalGainOrLossAmt"/>
						</xsl:call-template> 
					</td>											
				</tr>
				<tr>
					<td class="IRS1120SScheduleD_DescCol" scope="row" style="vertical-align:top;">
						<div class="styLNLeftNumBoxSD"  style="width:7mm;">2</div>
							Totals for all transactions reported on Form(s) 8949 with Box B checked
					</td>
					<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotalProceedsSalesPriceAmt"/>
								</xsl:call-template> 
					</td>
					<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="padding-left:10px;vertical-align:bottom;;">
								(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>)
					</td>
					<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
								</xsl:call-template> 
					</td>
					<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;;">				
								 <xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotalGainOrLossAmt"/>
								</xsl:call-template> 
					</td>											
			</tr>
			<tr>
				<td class="IRS1120SScheduleD_DescCol" scope="row" style="vertical-align:top;">
                    <div class="styLNLeftNumBoxSD" style="width:7mm;">3</div>
						Totals for all transactions reported on Form(s) 8949 with Box C checked
	            </td>
				<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;;">  			
			  	            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotalProceedsSalesPriceAmt"/>
                            </xsl:call-template>       
				</td>
				<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="padding-left:10px;vertical-align:bottom;;">
							(<xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotalCostOrOtherBasisAmt"/>
                            </xsl:call-template>) 
                </td>
				<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;;">
							<xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotAdjustmentsToGainOrLossAmt"/>
                            </xsl:call-template>   				
				</td>
				<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;;">
						    <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotalGainOrLossAmt"/>
                            </xsl:call-template>   	
				</td>											
			</tr>    	
            </table>

        <!-- line 4 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBoxSD" style="text-align: left;">4</div>
          <div class="styLNDesc" style="width:143.5mm;">
			 Short-term capital gain from installment sales from Form 6252, line 26 or 37
           <span class="styDotLn" style="float:right;">...........</span>
          </div>
          <div class="styLNRightNumBox">4</div>
          <div class="styLNAmountbox" style="height:4mm; width: 27.5mm; border-left: 1px solid black; border-bottom: 1px solid black;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/STCapGainInstalSlsAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 5 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBoxSD" style="text-align: left;">5</div>
          <div class="styLNDesc" style="width:143.5mm;">
           <span style="float:left;">Short term capital gain or (loss) from likekind exchanges from Form 8824</span>
           <span class="styDotLn" style="float:right;">............</span>
          </div>
          <div class="styLNRightNumBox">5</div>
          <div class="styLNAmountbox" style="height:4mm; width: 27.5mm; border-left: 1px solid black; border-bottom: 1px solid black;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/STCapGainLossLikeKindExchAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 6 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBoxSD" style="text-align: left;">6</div>
          <div class="styLNDesc" style="width:143.5mm;">
           <span style="float:left;">Tax on shortterm capital gain included on line 23 below</span>
           <span class="styDotLn" style="float:right;">..................</span>
          </div>
          <div class="styLNRightNumBox">6</div>
          <div class="styLNAmountbox" style="height:4mm; width: 27.5mm; border-left: 1px solid black; border-bottom: 1px solid black;">
            <xsl:call-template name="PopulateNegativeNumber">
              <xsl:with-param name="TargetNode" select="$FormData/TaxOnShortTermCapitalGainAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 7 double lines -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBoxSD" style="text-align: left;">7</div>
          <div class="styLNDesc" style="width:143.5mm;">
            <span style="font-weight:bold;">Net shortterm capital gain or (loss). </span> Combine lines 1a through 6 in column (h). Enter here and on Form</div>
          <div class="styLNRightNumBoxNBB"/>
          <div class="styLNAmountboxNBB" style="height:4mm; border-left: 1px solid black;"/>
        </div>
        <div class="IRS1120SScheduleD_LineContainer" style="border-bottom: 1px solid black">
          <div class="styLNLeftNumBoxSD"/>
          <div class="styLNDesc" style="width:143.5mm;">
           <span style="float:left;">1120S, Schedule K, line 7 or 10</span>
           <span class="styDotLn" style="float:right;">..........................</span>
          </div>
          <div class="styLNRightNumBoxNBB">7</div>
          <div class="styLNAmountboxNBB" style="height:4mm; width: 27.5mm; border-left: 1px solid black;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/NetSTCapitalGainOrLossAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- part II header -->
        <div class="styBB" style="width:187mm;border-top-width:1px">
          <div class="styPartName" style="width:15mm;height:4mm;">Part II</div>
          <div class="styPartDesc" style="padding-left:3mm;width:150mm;border-top-width:1px;">
                 Long-term Capital Gains and Losses&#8212;Assets Held More Than One Year
          </div>
        </div>
        <table class="IRS1120SScheduleD_styTable" style="width:187mm;" cellspacing="0" summary="Short-Term Capital Gains and Losses--Assets Held One Year or Less">
            <tr valign="top">
              <th class="IRS1120SScheduleD_DescCol" style="font-weight:normal;width:80mm;text-align:left;" scope="col">
               See instructions for how to figure the amounts to enter on the lines below.<br/><br/>
This form may be easier to complete if you round off cents to whole dollars.</th>
              <th class="IRS1120SScheduleD_DescCol" style="font-weight:normal;text-align:center;" scope="col">
               <br/> <b>(d)</b><br/> Proceeds<br/>(sales price)</th>
              <th class="IRS1120SScheduleD_DescCol" style="font-weight:normal;width:33mm;text-align:center;" scope="col">
              <br/> <b> (e) </b><br/>Cost<br/> (or other basis)</th>
              <th class="IRS1120SScheduleD_DescCol" style="font-weight:normal;width:33mm;text-align:center;" scope="col">
               <br/> <b>(g)</b> Adjustments to gain or loss from Form(s) 8949, line 2, column (g)</th>
              <th class="IRS1120SScheduleD_DescCol" style="font-weight:normal;width:33mm;text-align:center;" scope="col">
               <br/> <b>(h) Gain or (loss)</b> Subtract column (e) from column (d) and combine the result with column (g)</th>
            </tr>
           <!-- part II  body -->  
           	<tr>
				<td class="IRS1120SScheduleD_DescCol" scope="row" style="vertical-align:top;">
					<div class="styLNLeftNumBoxSD" style="width:7mm; height: 24mm; padding-left:1mm;">8a</div>
					Totals for all long-term transactions reported on Form 1099-B for which basis was reported to the IRS and for which you have no adjustments(see instructions). However, if you choose to report all these transactions on Form 8949, leave this line blank and go to line 8b
				</td>
				<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BBssRptNoAdjGrp/TotalProceedsSalesPriceAmt"/>
					</xsl:call-template> 
				</td>
				<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="padding-left:10px;vertical-align:bottom;width:33mm;">				    
								(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BBssRptNoAdjGrp/TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>)
				</td>
				<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="background-color:lightgrey;width:33mm;">
					
				</td>
				<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;width:33mm;">						    
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BBssRptNoAdjGrp/TotalGainOrLossAmt"/>
								</xsl:call-template> 
				</td>											
			</tr>	
			<tr>
				<td class="IRS1120SScheduleD_DescCol" scope="row" style="vertical-align:top;">
					<span class="IRS1120SScheduleD_IndexCol" style="margin-right:2mm;">8b</span>	     
						Totals for all transactions reported on<br/>
						<span style="width:7mm;" />Form(s) 8949 with Box D checked
						<!--<span class="styDotLn" style="float:right;">....</span>-->
				</td>
				<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BShowsBasisGrp/TotalProceedsSalesPriceAmt"/>
					</xsl:call-template> </td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="padding-left:8px;vertical-align:bottom;">						    
								(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BShowsBasisGrp/TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>)
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">						   
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BShowsBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
								</xsl:call-template> 
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">						    
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BShowsBasisGrp/TotalGainOrLossAmt"/>
								</xsl:call-template> 
							</td>											
						</tr>	
						<tr>
							<td class="IRS1120SScheduleD_DescCol" scope="row" style="vertical-align:top;">
								<div class="styLNLeftNumBoxSD" style="width:7mm;">9</div>
								Totals for all transactions reported on Form(s) 8949 with Box E checked
								<!--<span class="styDotLn" style="float:right;">.......</span>-->
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotalProceedsSalesPriceAmt"/>
								</xsl:call-template> 
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="padding-left:8px;vertical-align:bottom;">
								(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>)
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
								</xsl:call-template> 
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">				
								<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotalGainOrLossAmt"/>
								</xsl:call-template> 
							</td>
						</tr>
						<tr>
							<td class="IRS1120SScheduleD_DescCol" scope="row" style="vertical-align:top;">
								<div class="styLNLeftNumBox" style="width:7mm;padding-left:0.9mm;">10</div>
									Totals for all transactions reported on Form(s) 8949 with Box F checked
									<!--<span class="styDotLn" style="float:right;">.......</span>-->
						    </td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">  			
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotReceivedGrp/TotalProceedsSalesPriceAmt"/>
								</xsl:call-template>       
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="padding-left:8px;vertical-align:bottom;">
								(<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotReceivedGrp/TotalCostOrOtherBasisAmt"/>
								</xsl:call-template>) 
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotReceivedGrp/TotAdjustmentsToGainOrLossAmt"/>
								</xsl:call-template>   				
							</td>
							<td class="IRS1120SScheduleD_MoneyCol" scope="row" style="vertical-align:bottom;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotReceivedGrp/TotalGainOrLossAmt"/>
								</xsl:call-template>   	
							</td>											
						</tr> 		
          </table>

        <!-- line 11-->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">11</div>
          <div class="styLNDesc" style="width:143.25mm;">
          <span style="float:left;">Longterm capital gain from installment sales from Form 6252, line 26 or 37</span>
          <span class="styDotLn" style="float:right;">...........</span>
          </div>
          <div class="styLNRightNumBox">11</div>
          <div class="styLNAmountBox" style="width: 27.75mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/LTCapGainInstalSlsAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 12-->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">12</div>
          <div class="styLNDesc" style="width:143.25mm;">
          <span style="float:left;">Longterm capital gain or (loss) from likekind exchanges from Form 8824</span>
          <span class="styDotLn" style="float:right;">............</span>
          </div>
          <div class="styLNRightNumBox">12</div>
          <div class="styLNAmountBox" style="width: 27.75mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/LTCapGainLossLikeKindExchAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 13-->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">13</div>
          <div class="styLNDesc" style="width:143.25mm;">
           <span style="float:left;">Capital gain distributions (see instructions)</span>         
           <span class="styDotLn" style="float:right;">......................</span>
          </div>
          <div class="styLNRightNumBox">13</div>
          <div class="styLNAmountBox" style="width: 27.75mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/CapitalGainDistributionsAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 14 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">14</div>
          <div class="styLNDesc" style="width:143.25mm;">
          <span style="float:left;">Tax on longterm capital gain included on line 23 below</span>
          <span class="styDotLn" style="float:right;">..................</span>
          </div>
          <div class="styLNRightNumBox">14</div>
          <div class="styLNAmountBox" style="width: 27.75mm;">
            <xsl:call-template name="PopulateNegativeNumber">
              <xsl:with-param name="TargetNode" select="$FormData/TaxOnLongTermCapitalGainAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 15double lines -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">15</div>
          <div class="styLNDesc" style="width:143.25mm;">
            <span style="font-weight:bold;">Net longterm capital gain or (loss). </span> Combine lines 8a through 14 in column (h).  Enter here and on Form 
        </div>
          <div class="styLNRightNumBoxNBB"/>
          <div class="styLNAmountBoxNBB"  style="width: 27.75mm;"/>
        </div>
        <div class="IRS1120SScheduleD_LineContainer" style="border-bottom: 1px solid black; float:none; clear:both; ">
          <div class="styLNLeftNumBox"/>
			<div class="styLNDesc" style="width:143.25mm;">
          <span style="float:left;">1120S, Schedule K, line 8a or 10</span>
          <span class="styDotLn" style="float:right;">.........................</span>
          </div>
          <div class="styLNRightNumBoxNBB">15</div>
          <div class="styLNAmountBoxNBB" style="width: 27.75mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/NetLTCapitalGainOrLossAmt"/>
            </xsl:call-template>
          </div>
        </div>
		<!-- page footer -->
		<div class="pageEnd" style="width:187mm;padding-top:1mm;border-top:1px solid black;border-top-width:1px;">
			<div class="stySmallText" style="width:110mm;">
				<span class="styBoldText">For Paperwork Reduction Act Notice, see your tax return instructions.</span>
			</div>
			<div class="stySmallText" style="width:29mm;">Cat. No. 11516V</div>
			<div class="stySmallText" style="width:48mm;text-align:right;"><b>Schedule D (Form 1120S) 2013</b></div>
		</div>
		<!-- part 2 header-->
		<div class="styBB" style="width:187mm;border-bottom-width:1px; float:none; clear:both;">
          <span style="width:65mm;font-size:7pt;" class="styGenericDiv">Schedule D (Form 1120S) 2013</span>
          <span style="float:right;font-size:7pt;text-align:center;" class="styGenericDiv">Page <b>2</b></span>
        </div>
		<!-- part III header-->
        <div class="styBB" style="width:187mm;border-top-width:1px; float:none; clear:both; ">
          <div class="styPartName" style="width:15mm;height:4mm;">Part III</div>
          <div class="styPartDesc" style="padding-left:3mm;width:150mm;border-top-width:1px;"> 
 BuiltIn Gains Tax
          <span class="styNormalText">(See instructions
         <span class="styBoldText">before</span>
       completing this part.)</span>
          </div>
        </div>
        <!-- line 16 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">16</div>
          <div class="styLNDesc" style="width:143.25mm;">
			  Excess of recognized builtin gains over recognized builtin losses (attach computation statement)
				<span class="styDotLn" style="float:right;">...</span>
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$FormData/BuiltInGainsOverLossesAmt"/>
            </xsl:call-template>
          </div>
          <div class="styLNRightNumBox">16</div>
          <div class="styLNAmountBox" style="width: 27.75mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/BuiltInGainsOverLossesAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 17 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">17</div>
          <div class="styLNDesc" style="width:143.25mm;">
          <span style="float:left;">Taxable income (attach computation statement)
             <span style="width:3px;"/>
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$FormData/BuiltInGainsTaxableIncomeAmt"/>
            </xsl:call-template>
           </span>
            <span class="styDotLn" style="float:right;">...................</span>
          </div>
          <div class="styLNRightNumBox">17</div>
          <div class="styLNAmountBox" style="width: 27.75mm;">
            <xsl:call-template name="PopulateAmount">
           <xsl:with-param name="TargetNode" select="$FormData/BuiltInGainsTaxableIncomeAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 18 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">18</div>
          <div class="styLNDesc" style="width:143.25mm;">
           <span style="float:left;">Net recognized builtin gain. Enter the smallest of line 16, line 17, or line 8 of Schedule B</span>
           <span class="styDotLn" style="float:right;">.......</span>
          </div>
          <div class="styLNRightNumBox">18</div>
          <div class="styLNAmountBox" style="width: 27.75mm;">
            <xsl:call-template name="PopulateAmount">
             <xsl:with-param name="TargetNode" select="$FormData/NetRecognizedBuiltInGainAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 19 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">19</div>
          <div class="styLNDesc" style="width:143.25mm;">
            <span style="float:left;">Section 1374(b)(2) deduction</span>
            <span class="styDotLn" style="float:right;">..........................</span>
          </div>
          <div class="styLNRightNumBox">19</div>
          <div class="styLNAmountBox" style="border-right-width: 0px; width: 27.75mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/Section1374b2DeductionAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 20 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">20</div>
          <div class="styLNDesc" style="width:143.25mm;">
            <span style="float:left;">Subtract line 19 from line 18. If zero or less, enter 0 here and on line 23</span>
            <span class="styDotLn" style="float:right;">............</span>
          </div>
          <div class="styLNRightNumBox">20</div>
          <div class="styLNAmountBox" style="width: 27.75mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/NetBuiltInGainLessDeductionAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 21 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">21</div>
          <div class="styLNDesc" style="width:143.25mm;">
            <span style="float:left;">Enter 35% of line 20</span>
            <span class="styDotLn" style="float:right;">.............................</span>
          </div>
          <div class="styLNRightNumBox">21</div>
          <div class="styLNAmountBox" style="width: 27.75mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/NetBuiltInGainLessPctDedAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 22 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">22</div>
          <div class="styLNDesc" style="width:143.25mm;">
			  Section 1374(b)(3) business credit and minimum tax credit carryforwards from C corporation years
			  <span class="styDotLn" style="float:right;">....</span>
          </div>
          <div class="styLNRightNumBox">22</div>
          <div class="styLNAmountBox" style="width: 27.75mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/BusinessAndMinimumTaxCrAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 23 -->
        <div class="IRS1120SScheduleD_LineContainer" style="border-bottom: 2px solid black;">
			<div class="styLNLeftNumBox">23</div>
			<div class="styLNDesc" style="width:143.25mm;">
				<b>Tax.</b> Subtract line 22 from line 21 (if zero or less, enter 0). Enter here and on Form 1120S, page 1, line 22b
				<span class="styDotLn" style="float:right;">.</span>
			</div>
			<div class="styLNRightNumBoxNBB">23</div>
			<div class="styLNAmountBoxNBB" style="width: 27.75mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/BuiltInGainsTaxAmt"/>
				</xsl:call-template>
			</div>
        </div>
        <!-- footer line -->
        <div class="IRS1120SScheduleD_LineContainer" style="font-size:6pt;border-top:1 solid black;float:none; clear:both;">
          <div style="font-weight:bold;width:123mm;float:left;">
            For Paperwork Reduction Act Notice, see the Instructions for Form 1120S.
          </div>
          <div style="width:23mm;float:left;">
            Cat. No. 11516V
          </div>
          <div style="width:41mm;text-align:right;float:left;">
            <b>Schedule D (Form 1120S) 2013</b>
          </div>
        </div>
        <br/>
        <div class="pageEnd"/>     
         <!-- BEGIN Left Over Table -->
        <div class="styLeftOverTitleLine" id="LeftoverData" style="float:none; clear:both;">
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
        </table>
        <!-- END Left Over Table -->
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>