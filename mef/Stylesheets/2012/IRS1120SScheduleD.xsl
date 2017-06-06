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
    <html>
      <head>
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
              <img src="{$ImagePath}/1120SSchD_Bullet.gif" alt="Right arrow"/>Use Form 8949 to list your transactions for lines 1, 2, 3, 8, 9, and 10.
              <br/>
              <img src="{$ImagePath}/1120SSchD_Bullet.gif" alt="Right arrow"/>Information about Schedule D (Form 1120S) and its separate instructions is at <i><a href="http://www.irs.gov/form1120s">www.irs.gov/form1120s</a></i>.
    </span>
          </div>
          <!-- Tax Year Box -->
          <div class="styTYBox" style="height: 21.5mm;width:33mm;">
            <!-- OMB No. -->
            <div class="styOMB" style="text-align:center;">OMB No. 1545-0130</div>
            <!-- Tax Year -->
            <div class="styTY" style="text-align: center; padding-top: 2.8mm">
       20<span class="styTYColor">12</span>
            </div>
          </div>
        </div>
        <!-- Name and Address -->
        <div class="styBB" style="width:187mm;border-bottom-width:0px;">
          <div class="styNameBox" style="width:137mm;height:8mm;font-size:7pt;">
      Name<br/>
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
            </xsl:call-template>
            <br/>
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
            </xsl:call-template>
          </div>
          <div class="styEINBox" style="width:50mm;height:8mm;padding-left:2mm;font-weight:bold;font-size:7pt;">
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
                      Short-term Capital Gains and Losses&#151;Assets Held One Year or Less
          </div>          
        </div>
          <!-- print logic -->
          <xsl:call-template name="SetInitialState"/>
          <!-- end -->
          <table class="IRS1120SScheduleD_styTable" style="width:187mm;" cellspacing="0" summary="Short-Term Capital Gains and Losses--Assets Held One Year or Less">
            <tr valign="top">
              <th class="IRS1120SScheduleD_DescCol" style="font-weight:normal;width:53mm;text-align:left;" scope="col">
            Complete Form 8949 before completing line 1, 2, or 3. This form may be easier to complete if you round off cents to whole dollars.</th>
              <th class="IRS1120SScheduleD_DescCol" style="font-weight:normal;width:32mm;text-align:center;" scope="col">
               <b> (d) </b>Sales price from Form(s) 8949, line 2, column (d)</th>
              <th class="IRS1120SScheduleD_DescCol" style="font-weight:normal;width:36mm;text-align:center;" scope="col">
               <b> (e)</b> Cost or other basis from Form(s) 8949, line 2, column (e)</th>
              <th class="IRS1120SScheduleD_DescCol" style="font-weight:normal;width:33mm;text-align:center;" scope="col">
              <b>(g) </b>Adjustments to gain or loss from Form(s) 8949, line 2, column (g)</th>
              <th class="IRS1120SScheduleD_DescCol" style="font-weight:normal;width:33mm;text-align:center;" scope="col">
              <b>  (h) Gain or (loss)</b> Combine columns (d), (e), and (g)</th>
            </tr>            
    <!-- part I body -->
			    <tr>
					<td class="IRS1120SScheduleD_DescCol" scope="row" style="vertical-align:top;">
					       
							<span class="IRS1120SScheduleD_IndexCol"    style="margin-right:3mm;">1</span>Short&#8211;term totals from all<br/>
							<span class="IRS1120SScheduleD_IndexCol"  style="margin-right:4mm;"></span>
						     Forms 8949 with <b>box A </b>
							 <br/><span style="float:left;"><span class="IRS1120SScheduleD_IndexCol"   style="margin-right:3mm;"></span>checked in <b>Part I </b></span>
							 <span class="styDotLn" style="float:right;padding-right:2px;">...</span>
					</td>
					<td    class="IRS1120SScheduleD_MoneyCol"  scope="row" style="padding-top:4mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotalSalesPrice"/>
						</xsl:call-template> 
					</td>
					<td    class="IRS1120SScheduleD_MoneyCol"  scope="row" style="padding-left:16px;padding-top:4mm;">						    
							(<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotalCostOrOtherBasis"/>
							</xsl:call-template>)
					</td>
					<td    class="IRS1120SScheduleD_MoneyCol" scope="row"  style="padding-top:4mm;">						   
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
						</xsl:call-template> 
					</td>
					<td    class="IRS1120SScheduleD_MoneyCol"   scope="row"   style="padding-top:4mm;">						    
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotalGainOrLossAmt"/>
						</xsl:call-template> 
					</td>											
				</tr>
				<tr>
					<td  class="IRS1120SScheduleD_DescCol" scope="row"  style="vertical-align:top;">
					<span class="IRS1120SScheduleD_IndexCol"   style="margin-right:3mm;">2</span>Short&#8211;term totals from all <br/>
					<span class="IRS1120SScheduleD_IndexCol"  style="margin-right:4mm;"></span>Forms 8949 with <b>box B</b> <br/> 
					<span style="float:left;"><span class="IRS1120SScheduleD_IndexCol"   style="margin-right:3mm;"></span>checked in <b>Part I</b></span>
					<span class="styDotLn" style="float:right;padding-right:2px;">...</span>			
					</td>
					<td     class="IRS1120SScheduleD_MoneyCol" scope="row"  style="padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotalSalesPrice"/>
								</xsl:call-template> 
					</td>
					<td     class="IRS1120SScheduleD_MoneyCol"  scope="row"  style="padding-left:16px;padding-top:4mm;">
								(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotalCostOrOtherBasis"/>
								</xsl:call-template>)
					</td>
					<td     class="IRS1120SScheduleD_MoneyCol" scope="row"  style="padding-top:4mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
								</xsl:call-template> 
					</td>
					<td     class="IRS1120SScheduleD_MoneyCol"   scope="row"   style="padding-top:4mm;">				
								 <xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotalGainOrLossAmt"/>
								</xsl:call-template> 
					</td>											
			</tr>
			<tr>
				<td  class="IRS1120SScheduleD_DescCol" scope="row"  style="vertical-align:top;">
					<span class="IRS1120SScheduleD_IndexCol"   style="margin-right:3mm;">3</span>Short&#8211;term totals from all <br/>
					<span class="IRS1120SScheduleD_IndexCol"   style="margin-right:4mm;"></span>Forms 8949 with <b>box C</b> <br/> 
					<span style="float:left;"><span class="IRS1120SScheduleD_IndexCol"   style="margin-right:3mm;"></span>checked in <b>Part I</b></span>
				    <span class="styDotLn" style="float:right;padding-right:2px;">...</span>	 
	            </td>
				<td   class="IRS1120SScheduleD_MoneyCol" scope="row"   style="padding-top:4mm;">  			
			  	            <xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotalSalesPrice"/>
                            </xsl:call-template>       
				</td>
				<td     class="IRS1120SScheduleD_MoneyCol"  scope="row"  style="padding-left:16px;padding-top:4mm;">
							(<xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotalCostOrOtherBasis"/>
                            </xsl:call-template>) 
                </td>
				<td     class="IRS1120SScheduleD_MoneyCol" scope="row"  style="padding-top:4mm;">
							<xsl:call-template name="PopulateAmount">
                                <xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotAdjustmentsToGainOrLossAmt"/>
                            </xsl:call-template>   				
				</td>
				<td     class="IRS1120SScheduleD_MoneyCol"   scope="row"  style="padding-top:4mm;">
						    <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotalGainOrLossAmt"/>
                            </xsl:call-template>   	
				</td>											
			</tr>    	
            </table>

        <!-- line 4 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBoxSD" style="text-align: left; padding-left: 1en;">4</div>
          <div class="styLNDesc" style="width:139mm;">
           <span style="float:left;">Short&#8211;term capital gain from installment sales from Form 6252, line 26 or 37</span>
           <span class="styDotLn" style="float:right;padding-right:2px;">.........</span>
          </div>
          <div class="styLNRightNumBox">4</div>
          <div class="styLNAmountbox" style="">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/ShortTermCapGainInstalSales"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 5 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBoxSD" style="text-align: left; padding-left: 1en;">5</div>
          <div class="styLNDesc" style="width:139mm;">
           <span style="float:left;">Short&#8211;term capital gain or (loss) from like&#8211;kind exchanges from Form 8824</span>
           <span class="styDotLn" style="float:right;padding-right:2px;">..........</span>
          </div>
          <div class="styLNRightNumBox">5</div>
          <div class="styLNAmountbox">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/ShrtTrmCapGainLossFromLikeKind"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 6 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBoxSD" style="text-align: left; padding-left: 1en;">6</div>
          <div class="styLNDesc" style="width:139mm;">
           <span style="float:left;">Tax on short&#8211;term capital gain included on line 23 below</span>
           <span class="styDotLn" style="float:right;padding-right:2px;">................</span>
          </div>
          <div class="styLNRightNumBox">6</div>
          <div class="styLNAmountbox">
            <xsl:call-template name="PopulateNegativeNumber">
              <xsl:with-param name="TargetNode" select="$FormData/TaxOnShortTermCapitalGain"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 7 double lines -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBoxSD" style="text-align: left; padding-left: 1en;">7</div>
          <div class="styLNDesc" style="width:139mm;">
            <span style="font-weight:bold;">Net short&#8211;term capital gain or (loss). </span> Combine lines 1 through 6 in column (h). Enter here and on Form</div>
          <div class="styLNRightNumBoxNBB"/>
          <div class="styLNAmountboxNBB"/>
        </div>
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBoxSD"/>
          <div class="styLNDesc" style="width:139mm;">
           <span style="float:left;">1120S, Schedule K, line 7 or 10</span>
           <span class="styDotLn" style="float:right;padding-right:2px;">........................</span>
          </div>
          <div class="styLNRightNumBoxNBB">7</div>
          <div class="styLNAmountboxNBB" style="">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/NetShortTermCapitalGainLoss"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- part II header -->
        <div class="styBB" style="width:187mm;border-top-width:1px">
          <div class="styPartName" style="width:15mm;height:4mm;">Part II</div>
          <div class="styPartDesc" style="padding-left:3mm;width:150mm;border-top-width:1px;">
                 Long-term Capital Gains and Losses&#151;Assets Held More Than One Year
          </div>
        </div>
        <table class="IRS1120SScheduleD_styTable" style="width:187mm;" cellspacing="0" summary="Short-Term Capital Gains and Losses--Assets Held One Year or Less">
            <tr valign="top">
              <th class="IRS1120SScheduleD_DescCol" style="font-weight:normal;width:53mm;text-align:left;" scope="col">
               Complete Form 8949 before completing line 8, 9, or 10. This form may be easier to complete if you round off cents to whole dollars.</th>
              <th class="IRS1120SScheduleD_DescCol" style="font-weight:normal;width:32mm;text-align:center;" scope="col">
                <b>(d)</b> Sales price from Form(s) 8949, line 4, column (d)</th>
              <th class="IRS1120SScheduleD_DescCol" style="font-weight:normal;width:36mm;text-align:center;" scope="col">
               <b> (e) </b>Cost or other basis from Form(s) 8949, line 4, column (e)</th>
              <th class="IRS1120SScheduleD_DescCol" style="font-weight:normal;width:33mm;text-align:center;" scope="col">
                <b>(g)</b> Adjustments to gain or loss from Form(s) 8949, line 4, column (g)</th>
              <th class="IRS1120SScheduleD_DescCol" style="font-weight:normal;width:33mm;text-align:center;" scope="col">
                <b>(h) Gain or (loss)</b> Combine columns (d), (e), and (g)</th>
            </tr>
           <!-- part II  body -->  
			<tr>
				<td class="IRS1120SScheduleD_DescCol" scope="row"  style="vertical-align:top;">
					<span class="IRS1120SScheduleD_IndexCol"   style="margin-right:3mm;">8</span>Long&#8211;term  totals from all<br/> 
					 
					<span class="IRS1120SScheduleD_IndexCol"  style="margin-right:4mm;"></span>Forms 8949 with <b>box A</b><br/>
					<span style="float:left;">
				    <span class="IRS1120SScheduleD_IndexCol"  style="margin-right:3mm;"></span>checked in <b>Part II</b>
				     </span>
			    	 <span class="styDotLn" style="float:right;padding-right:2px;">...</span>   
			    	
				     
				</td>
				<td    class="IRS1120SScheduleD_MoneyCol"  scope="row" style="padding-top:20px;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotaLTCGL1099BShowsBasisGrp/TotalSalesPrice"/>
					</xsl:call-template> </td>
							<td    class="IRS1120SScheduleD_MoneyCol"  scope="row"    style="padding-left:16px;padding-top:20px;">						    
								(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotaLTCGL1099BShowsBasisGrp/TotalCostOrOtherBasis"/>
								</xsl:call-template>)
							</td>
							<td    class="IRS1120SScheduleD_MoneyCol" scope="row"  style="padding-top:20px;">						   
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotaLTCGL1099BShowsBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
								</xsl:call-template> 
							</td>
							<td    class="IRS1120SScheduleD_MoneyCol"   scope="row"  style="padding-top:20px;">						    
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotaLTCGL1099BShowsBasisGrp/TotalGainOrLossAmt"/>
								</xsl:call-template> 
							</td>											
						</tr>	
						<tr>
							<td  class="IRS1120SScheduleD_DescCol" scope="row"  style="vertical-align:top;">
								<span class="IRS1120SScheduleD_IndexCol"  style="margin-right:3mm;">9</span>Long&#8211;term  totals from all<br/> 
								<span class="IRS1120SScheduleD_IndexCol"  style="margin-right:4mm;"></span> Forms 8949 with <b>box B</b><br/> 
								<span style="float:left;"><span class="IRS1120SScheduleD_IndexCol"  style="margin-right:3mm;"></span> checked in <b>Part II</b>
								</span>
								<span class="styDotLn" style="float:right;padding-right:2px;">...</span>  
								
												       </td>
							<td     class="IRS1120SScheduleD_MoneyCol" scope="row"   style="padding-top:20px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotalSalesPrice"/>
								</xsl:call-template> 
							</td>
							<td     class="IRS1120SScheduleD_MoneyCol"  scope="row"   style="padding-left:16px;padding-top:20px;">
								(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotalCostOrOtherBasis"/>
								</xsl:call-template>)
							</td>
							<td     class="IRS1120SScheduleD_MoneyCol" scope="row"  style="padding-top:20px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
								</xsl:call-template> 
							</td>
							<td     class="IRS1120SScheduleD_MoneyCol"   scope="row"  style="padding-top:20px;" >				
								<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotalGainOrLossAmt"/>
								</xsl:call-template> 
							</td>											
						</tr>
						<tr>
							<td  class="IRS1120SScheduleD_DescCol" scope="row"  style="vertical-align:top;">
								<span class="IRS1120SScheduleD_IndexCol"  style="margin-right:4mm; text-indent:0.3mm;">10</span>Long&#8211;term  totals from all <br/>
								<span class="IRS1120SScheduleD_IndexCol"   style="margin-right:4mm;"></span>Forms 8949 with <b>box C</b><br/> 
								<span style="float:left;">
								<span class="IRS1120SScheduleD_IndexCol"   style="margin-right:3mm;"></span> checked in <b>Part II</b>
								</span>
								<span class="styDotLn" style="float:right;padding-right:2px;">...</span>    						   
						    </td>
							<td   class="IRS1120SScheduleD_MoneyCol" scope="row"   style="padding-top:20px;">  			
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotaLTCGL1099BNotReceivedGrp/TotalSalesPrice"/>
								</xsl:call-template>       
							</td>
							<td     class="IRS1120SScheduleD_MoneyCol"  scope="row"   style="padding-left:16px;padding-top:20px;">
								(<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="$FormData/TotaLTCGL1099BNotReceivedGrp/TotalCostOrOtherBasis"/>
								</xsl:call-template>) 
							</td>
							<td     class="IRS1120SScheduleD_MoneyCol" scope="row"   style="padding-top:20px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotaLTCGL1099BNotReceivedGrp/TotAdjustmentsToGainOrLossAmt"/>
								</xsl:call-template>   				
							</td>
							<td     class="IRS1120SScheduleD_MoneyCol"   scope="row"   style="padding-top:20px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotaLTCGL1099BNotReceivedGrp/TotalGainOrLossAmt"/>
								</xsl:call-template>   	
							</td>											
						</tr> 		
          </table>

        <!-- line 11-->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">11</div>
          <div class="styLNDesc" style="width:139mm;">
          <span style="float:left;">Long&#8211;term capital gain from installment sales from Form 6252, line 26 or 37</span>
          <span class="styDotLn" style="float:right;padding-right:2px;">.........</span>
          </div>
          <div class="styLNRightNumBox">11</div>
          <div class="styLNAmountBox">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/LongTermCapGainInstalSales"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 12-->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">12</div>
          <div class="styLNDesc" style="width:139mm;">
          <span  style="float:left;">Long&#8211;term capital gain or (loss) from like&#8211;kind exchanges from Form 8824</span>
          <span class="styDotLn" style="float:right;padding-right:2px;">..........</span>
          </div>
          <div class="styLNRightNumBox">12</div>
          <div class="styLNAmountBox">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/LongTrmCapGainLossFromLikeKind"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 13-->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">13</div>
          <div class="styLNDesc" style="width:139mm;">
           <span style="float:left;">Capital gain distributions (see instructions)</span>         
           <span class="styDotLn" style="float:right;padding-right:2px;">....................</span>
          </div>
          <div class="styLNRightNumBox">13</div>
          <div class="styLNAmountBox">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/CapitalGainDistributions"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 14 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">14</div>
          <div class="styLNDesc" style="width:139mm;">
          <span style="float:left;">Tax on long&#8211;term capital gain included on line 23 below</span>
          <span class="styDotLn" style="float:right;padding-right:2px;">................</span>
          </div>
          <div class="styLNRightNumBox">14</div>
          <div class="styLNAmountBox">
            <xsl:call-template name="PopulateNegativeNumber">
              <xsl:with-param name="TargetNode" select="$FormData/TaxOnLongTermCapitalGain"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 15double lines -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">15</div>
          <div class="styLNDesc" style="width:139mm;">
            <span style="font-weight:bold;">Net long&#8211;term capital gain or (loss). </span> Combine lines 8 through 14 in column (h).  Enter here and on Form 
        </div>
          <div class="styLNRightNumBoxNBB"/>
          <div class="styLNAmountBoxNBB"/>
        </div>
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox"/>
        <div class="styLNDesc" style="width:139mm;">
          <span style="float:left;">1120S, Schedule K, line 8a or 10</span>
          <span class="styDotLn" style="float:right;padding-right:2px;">........................</span>
          </div>
          <div class="styLNRightNumBoxNBB">15</div>
          <div class="styLNAmountBoxNBB">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/NetLongTermCapitalGainLoss"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- part III header-->
            <div class="styBB" style="width:187mm;border-top-width:1px">
          <div class="styPartName" style="width:15mm;height:4mm;">Part III</div>
          <div class="styPartDesc" style="padding-left:3mm;width:150mm;border-top-width:1px;"> 
 Built&#8211;In Gains Tax
          <span class="styNormalText">(See instructions
         <span class="styBoldText">before</span>
       completing this part.)</span>
          </div>
        </div>
        <!-- line 16 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">16</div>
          <div class="styLNDesc" style="width:139mm;">Excess of recognized built&#8211;in gains over recognized built&#8211;in losses (attach computation statement)
      <span style="width:3px;"/>
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$FormData/BuiltInGainsOverLosses"/>
            </xsl:call-template>
          </div>
          <div class="styLNRightNumBox">16</div>
          <div class="styLNAmountBox">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/BuiltInGainsOverLosses"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 17 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">17</div>
          <div class="styLNDesc" style="width:139mm;">
          <span style="float:left;">Taxable income (attach computation statement)
             <span style="width:3px;"/>
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$FormData/BuiltInGainsTaxableIncome"/>
            </xsl:call-template>
           </span>
            <span class="styDotLn" style="float:right;padding-right:2px;">.................</span>
          </div>
          <div class="styLNRightNumBox">17</div>
          <div class="styLNAmountBox">
            <xsl:call-template name="PopulateAmount">
           <xsl:with-param name="TargetNode" select="$FormData/BuiltInGainsTaxableIncome"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 18 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">18</div>
          <div class="styLNDesc" style="width:139mm;">
           <span style="float:left;">Net recognized built&#8211;in gain. Enter the smallest of line 16, line 17, or line 8 of Schedule B</span>
           <span class="styDotLn" style="float:right;padding-right:2px;">....</span>
          </div>
          <div class="styLNRightNumBox">18</div>
          <div class="styLNAmountBox">
            <xsl:call-template name="PopulateAmount">
             <xsl:with-param name="TargetNode" select="$FormData/NetRecognizedBuiltInGain"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 19 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">19</div>
          <div class="styLNDesc" style="width:139mm;">
            <span style="float:left;">Section 1374(b)(2) deduction</span>
            <span class="styDotLn" style="float:right;padding-right:2px;">........................</span>
          </div>
          <div class="styLNRightNumBox">19</div>
          <div class="styLNAmountBox" style="border-right-width: 0px">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/Section1374b2Deduction"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 20 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">20</div>
          <div class="styLNDesc" style="width:139mm;">
            <span style="float:left;">Subtract line 19 from line 18. If zero or less, enter &#8211;0&#8211; here and on line 23.</span>
            <span class="styDotLn" style="float:right;padding-right:2px;">..........</span>
          </div>
          <div class="styLNRightNumBox">20</div>
          <div class="styLNAmountBox">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/NetBuiltInGainLess1374b2Ded"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 19 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">21</div>
          <div class="styLNDesc" style="width:139mm;">
            <span style="float:left;">Enter 35% of line 20</span>
            <span class="styDotLn" style="float:right;padding-right:2px;">...........................</span>
          </div>
          <div class="styLNRightNumBox">21</div>
          <div class="styLNAmountBox">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/NetBuiltInGainLess1374b2Ded35"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 20 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">22</div>
          <div class="styLNDesc" style="width:139mm;">Section 1374(b)(3) business credit and minimum tax credit carryforwards from C corporation years</div>
          <div class="styLNRightNumBox">22</div>
          <div class="styLNAmountBox">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/BusinessAndMinimumTaxCredits"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 21 -->
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox">23</div>
          <div class="styLNDesc" style="width:139mm;">
            <span style="font-weight:bold">Tax.</span>
         Subtract line 22 from line 21 (if zero or less, enter &#8211;0&#8211;). Enter here and on Form 1120S, page 1,
        </div>
          <div class="styLNRightNumBoxNBB"/>
          <div class="styLNAmountBoxNBB"/>
        </div>
        <div class="IRS1120SScheduleD_LineContainer">
          <div class="styLNLeftNumBox"/>
          <div class="styLNDesc" style="width:139mm;">
          <span style="float:left;">line 22b</span>
         <span class="styDotLn" style="float:right;padding-right:2px;">...............................</span>
          </div>
          <div class="styLNRightNumBoxNBB">23</div>
          <div class="styLNAmountBoxNBB">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/BuiltInGainsTax"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- footer line -->
        <div class="IRS1120SScheduleD_LineContainer" style="font-size:6pt;border-top:1 solid black;">
          <div style="font-weight:bold;width:123mm;float:left;">
            For Paperwork Reduction Act Notice, see the Instructions for Form 1120S.
          </div>
          <div style="width:23mm;float:left;">
            Cat. No. 11516V
          </div>
          <div style="width:41mm;text-align:right;float:left;">
            <b>Schedule D (Form 1120S) 2012</b>
          </div>
        </div>
        <br/>
        <br class="pageEnd"/>     
         <!-- BEGIN Left Over Table -->
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
        </table>
        <!-- END Left Over Table -->
    
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
