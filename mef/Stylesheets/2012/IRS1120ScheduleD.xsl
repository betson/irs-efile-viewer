<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
  ]>
  <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes"/>
    <xsl:strip-space elements="*"/>
    <xsl:include href="PopulateTemplate.xsl"/>
    <xsl:include href="AddHeader.xsl"/>  
    <xsl:include href="CommonPathRef.xsl"/>
    <xsl:include href="AddOnTable.xsl"/>
    <xsl:include href="IRS1120ScheduleDStyle.xsl"/>
    <xsl:param name="FormData" select="$RtnDoc/IRS1120ScheduleD"/>  
    <xsl:template match="/">
      <html>
        <head>
          <!-- Set Document Title -->
          <title>
            <xsl:call-template name="FormTitle">
              <xsl:with-param name="RootElement" select="local-name($FormData)"></xsl:with-param>
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
          <!-- Set Target to Top -->
          <!-- <meta http-equiv="Window-target" content="_top" /> -->
          <!-- Set Filename and Description -->
          <meta name="Description" content="Schedule D (Form 1120)"/>
          <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
          <xsl:call-template name="InitJS"></xsl:call-template>
          <style type="text/css">
            <!--Note:
							Part I, Line 1 Table: form PDF shows 6 rows of data and scroll button will display when data contained 7 rows;
							Part II, Line 6 Table: form PDF shows 5 rows of data and scroll button will display when data contained 6 rows 
						-->
            <xsl:if test="not($Print) or $Print=''">
              <xsl:call-template name="IRS1120ScheduleDStyle"/>
              <xsl:call-template name="AddOnStyle"></xsl:call-template>
            </xsl:if>
          </style>
          <xsl:call-template name="GlobalStylesForm"/>
        </head>
        <!-- <body onload="init();"> -->
        <body class="styBodyClass">
          <form name="Form1120ScheduleD">
            <!-- BEGIN WARNING LINE -->
            <xsl:call-template name="DocumentHeader"></xsl:call-template>  
            <!-- END WARNING LINE -->
            <!-- BEGIN FORM HEADER -->
            <div class="IRS1120ScheduleD_styBB" style="width:707px;">
              <!-- Form Name -->
              <div class="IRS1120ScheduleD_styFN" style="width:110px;height:97px;">
              <!-- Form Name -->
                <div class="styFormNumber" style="font-size: 10pt;">SCHEDULE D
                  <br />
                  <div class="styFormNumber" style="font-size: 9pt;">(Form 1120)</div>
                </div>
                <br/>
                <!-- Agency Name -->
                <div class="IRS1120ScheduleD_styAgency" style="height:25px;padding-top:7.5mm;">Department of the Treasury<br/>Internal Revenue Service</div>
              </div>
              <!-- Form Title Box -->
              <div class="IRS1120ScheduleD_styFTBox" style="width:472px;height:97px;">
              <!-- Form Title -->
                <div class="styMainTitle" style="height:26px;">Capital Gains and Losses</div>
                <!-- Form Subtitle -->
                <div class="IRS1120ScheduleD_styFST" style="height:34px;text-align:center;">                  
                  <span style=" padding-left:2mm;width:124mm;">
										<img src="{$ImagePath}/1120SchD_Bullet.gif" alt="Right arrow"/>  Attach to Form 1120, 1120-C, 1120-F, 1120-FSC, 1120-H, 1120-IC-DISC, 1120-L, 1120-ND, 
									1120-PC, 1120-POL, 1120-REIT, 1120-RIC, 1120-SF, or certain Forms 990-T.</span>
								</div>
								<span style="font-weight:bold; padding-bottom:4mm;">
								<img src="{$ImagePath}\8865_Bullet_Sm.gif" alt="Small Right Arrow" border="0"/> 
								Information about Schedule D (Form 1120) and its separate instructions is at <a href="http://www.irs.gov/form1120" title="Link to IRS.gov"><i>www.irs.gov/form1120</i></a>
                </span>
                <div style="width:472px;"/>
              </div>
              <!-- Tax Year Box -->
              <div class="IRS1120ScheduleD_styTYBox" style="width:125px;height:97px;">
                <!-- OMB No. -->
                <div class="IRS1120ScheduleD_styOMB" style="height:35px;line-height:15px;padding-top:4.5mm;">OMB No. 1545-0123</div>
                <!-- Tax Year -->
                <div class="IRS1120ScheduleD_styTY" style="height:45px;line-height:45px;color:Green;padding-top:1.5mm;">
                  <span style="color:black;">20</span>12
                </div>
              </div>
            </div>
            <!-- END FORM HEADER -->
            <!-- BEGIN TAXPAYER INFO -->
            <div style="width:707px;float:left;clear:left;border-top:1 solid black;">
              <!-- Name -->
              <div class="styNameBox" style="width:136mm;height:8mm;font-size:7pt;font-weight:normal;">
                Name
                <br/>
                <span>
                  <xsl:call-template name="PopulateReturnHeaderFiler">
                    <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                  </xsl:call-template>
                  <div >
                  <xsl:call-template name="PopulateReturnHeaderFiler">
                    <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                  </xsl:call-template>
                  </div>
                </span>
              </div>
              <!-- EIN -->
              <div class="styEINBox" style="width:50mm;height:8mm;padding-left:2mm;font-size:7pt;font-weight:bold;">
                Employer identification number
                <br/><br/>
                <div style="text-align:left;font-weight:normal;">
                  <xsl:call-template name="PopulateReturnHeaderFiler">
                    <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                  </xsl:call-template>              
                </div>
              </div>
            </div>
            <!-- END TAXPAYER INFO -->
            <!-- BEGIN PART I HEADER -->
            <div class="IRS1120ScheduleD_styPartHdr" style="width:707px;float:left;clear:both;">
              <div style="width:607px; float:left;">            
                <span style="width:76px">
                  <span class="IRS1120ScheduleD_styPartHdrSpanner"/>
                  <span class="IRS1120ScheduleD_styPartHdrTitle">Part I</span>
                  <span class="IRS1120ScheduleD_styPartHdrSpanner"/>
                </span>
                <span style="height:14px">Short-Term Capital Gains and Losses&#151;Assets Held One Year or Less</span>
              </div>
              </div>
            <!-- END PART I HEADER -->
             <!-- print logic -->
          <xsl:call-template name="SetInitialState"/>
          <!-- end -->
          <table class="IRS1120ScheduleD_styTable" style="width:187mm;" cellspacing="0" summary="Short-Term Capital Gains and Losses--Assets Held One Year or Less">
            <tr valign="top">
              <th class="IRS1120ScheduleD_DescCol" style="font-weight:normal;width:55mm;text-align:left;" scope="col">
               Complete Form 8949 before completing line 1, 2, or 3. This form may be easier to complete if you round off cents to whole dollars.</th>
              <th class="IRS1120ScheduleD_DescCol" style="font-weight:normal;width:40mm;text-align:left;" scope="col">
                <b>(d)</b> Sales price from Form(s) 8949, line 2, column (d)</th>
              <th class="IRS1120ScheduleD_DescCol" style="font-weight:normal;width:30mm;text-align:left;" scope="col">
                <b>(e)</b> Cost or other basis from Form(s) 8949, line 2, column (e)</th>
              <th class="IRS1120ScheduleD_DescCol" style="font-weight:normal;width:32mm;text-align:left;" scope="col">
                <b>(g)</b> Adjustments to gain or loss from Form(s) 8949, line 2, column (g)</th>
              <th class="IRS1120ScheduleD_DescCol" style="font-weight:normal;width:30mm;text-align:left;" scope="col">
                <b>(h) Gain or (loss)</b> Combine columns (d), (e), and (g)</th>
            </tr>            
						<!-- part I body -->
						<tr>
							<td class="IRS1120ScheduleD_DescCol" scope="row" style="vertical-align:top;">					       
								<span class="IRS1120ScheduleD_IndexCol" style="margin-right:3mm;">1</span>Short&#8211;term totals from all <br/> 
								<span class="IRS1120ScheduleD_IndexCol"  style="margin-right:4mm;"></span>Forms 8949 with <b>box A </b><br/>
								<span style="float:left;">
									<span class="IRS1120ScheduleD_IndexCol"  style="margin-right:3mm;"></span>checked in <b>Part I</b>
								</span>
								<span class="styDotLn" style="float:right;padding-right:2px;">...</span>  				
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:25px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotalSalesPrice"/>
								</xsl:call-template> 
							</td>
							<td class="IRS1120ScheduleD_MoneyCol"  scope="row" style="padding-left:16px;">						    
								(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotalCostOrOtherBasis"/>
								</xsl:call-template> )
							</td>					
							<td class="IRS1120ScheduleD_MoneyCol" scope="row">						   
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
								</xsl:call-template> 
							</td>
							<td class="IRS1120ScheduleD_MoneyCol"   scope="row">						    
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BShowsBasisGrp/TotalGainOrLossAmt"/>
								</xsl:call-template> 
							</td>											
						</tr>
						<tr>
							<td  class="IRS1120ScheduleD_DescCol" scope="row"  style="vertical-align:top;">
								<span class="IRS1120ScheduleD_IndexCol" style="margin-right:3mm;">2</span>Short&#8211;term totals from all <br/>  
								<span class="IRS1120ScheduleD_IndexCol"  style="margin-right:4mm;"></span>Forms 8949 with <b>box B</b><br/>
								<span style="float:left;"> 
									<span class="IRS1120ScheduleD_IndexCol"  style="margin-right:3mm;"></span>checked in <b>Part I</b>
								</span>
								<span class="styDotLn" style="float:right;padding-right:2px;">...</span>		
							</td>					
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:25px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotalSalesPrice"/>
								</xsl:call-template> 
							</td>
							<td class="IRS1120ScheduleD_MoneyCol"  scope="row" style="padding-left:16px;">
								(<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotalCostOrOtherBasis"/>
								</xsl:call-template>)
							</td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
								</xsl:call-template> 
							</td>
							<td class="IRS1120ScheduleD_MoneyCol"   scope="row">				
								 <xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotShowBasisGrp/TotalGainOrLossAmt"/>
								</xsl:call-template> 
							</td>											
						</tr>
						<tr>
							<td  class="IRS1120ScheduleD_DescCol" scope="row"  style="vertical-align:top;">
								<span class="IRS1120ScheduleD_IndexCol" style="margin-right:3mm;">3</span>Short&#8211;term totals from all <br/>
								<span class="IRS1120ScheduleD_IndexCol" style="margin-right:4mm;"></span>Forms 8949 with <b>box C</b><br/>
								<span style="float:left;"> 
									<span class="IRS1120ScheduleD_IndexCol" style="margin-right:3mm;"></span>checked in <b>Part I</b>
								</span>
								<span class="styDotLn" style="float:right;padding-right:2px;">...</span>	
							</td>							
							<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:25px;">  			
			  	      <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotalSalesPrice"/>
                </xsl:call-template>       
							</td>
							<td class="IRS1120ScheduleD_MoneyCol"  scope="row" style="padding-left:16px;">
								(<xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotalCostOrOtherBasis"/>
                </xsl:call-template>) 
              </td>
							<td class="IRS1120ScheduleD_MoneyCol" scope="row">
								<xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotAdjustmentsToGainOrLossAmt"/>
                </xsl:call-template>   				
							</td>
							<td class="IRS1120ScheduleD_MoneyCol"   scope="row"> 
						    <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/TotalSTCGL1099BNotReceivedGrp/TotalGainOrLossAmt"/>
								</xsl:call-template>   	
							</td>											
						</tr>    	    	
          </table>
          <!-- END PART I TABLE -->
          <!-- BEGIN LINE 4 -->
          <div style="width:187mm;">
						<div class="styLNLeftNumBoxSD" >4</div>
              <div class="styLNDesc" style="width:139mm;">     
                <span style="float:left;">Short-term capital gain from installment sales from Form 6252, line 26 or 37 </span> 
                <!--Dotted Line-->
								<span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">.........</span>
              </div>
              <div class="styLNRightNumBox">4</div>
              <div class="styLNAmountBox" >
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ShortTermCapitalGainInstalSale"/>
								</xsl:call-template>
							</div>                
            </div>
            <!-- END LINE 4 -->
            <!-- BEGIN LINE 5 -->
            <div style="width:187mm;">
							<div class="styLNLeftNumBoxSD" >5</div>
              <div class="styLNDesc" style="width:139mm;">     
                <span style="float:left;">Short-term capital gain or (loss) from like-kind exchanges from Form 8824</span> 
                <!--Dotted Line-->
								<span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">..........</span>
              </div>
              <div class="styLNRightNumBox">5</div>
              <div class="styLNAmountBox" >
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ShrtTrmCapGainLossFromLikeKind"/>
								</xsl:call-template>
							</div>                
            </div>              
            <!-- END LINE 5 -->
            <!-- BEGIN LINE 6 :EXCEPTION Per  Gwen Chambliss' email response to IBM Defect 20437 dated 9/19/08 to allow the descrepancy between Schema and Style sheet.  
                  Where Schema efile data type as USAMOUNT which allow neg and pos amount present in a hardcode bracket line 
                  and Style sheet guideline indicate only pos amount allow in a hard coded bracket line.-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBoxSD">6</div>
              <div class="styLNDesc" style="width:139mm;">     
                <span style="float:left;">Unused loss carryover (attach computation)
                  <span style="width:3px;"></span>
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$FormData/UnusedLossCarryover"/>
                  </xsl:call-template>      
                  <span style="width:15px;"></span>
                </span> 
                <!--Dotted Line-->
								<span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">..................</span>
              </div>
              <div class="styLNRightNumBox">6</div>
              <div class="styLNAmountBox" >
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/UnusedLossCarryover"/>
								</xsl:call-template>
							</div>                
            </div>             
            <!-- END LINE 6 -->
            <!-- BEGIN LINE 7 -->
            <div style="width:187mm;">
							<div class="styLNLeftNumBoxSD" >7</div>
              <div class="styLNDesc" style="width:139mm;">     
                <span style="float:left;">Net short-term capital gain or (loss). Combine lines 1 through 6 in column h </span>
                <!--Dotted Line-->
								<span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">.........</span>
              </div>
              <div class="styLNRightNumBox">7</div>
              <div class="styLNAmountBox" >
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetShortTermCapitalGainLoss"/>
								</xsl:call-template>
							</div>                
            </div>             
            <!-- END LINE 7 -->
            <!-- BEGIN PART II HEADER -->
            <div class="IRS1120ScheduleD_styPartHdr" style="width:707px;height:16px;">
              <span style="float:left;clear:left;">
                <span style="width:76px;">
                  <span class="IRS1120ScheduleD_styPartHdrSpanner"/>
                  <span class="IRS1120ScheduleD_styPartHdrTitle">Part II</span>
                  <span class="IRS1120ScheduleD_styPartHdrSpanner"/>
                </span>
                <span style="width:613px;height:14px;">Long-Term Capital Gains and Losses&#151;Assets Held More Than One Year</span>
              </span>                
            </div>
            <!-- END PART II HEADER -->
						<table class="IRS1120ScheduleD_styTable" style="width:187mm;" cellspacing="0" summary="Short-Term Capital Gains and Losses--Assets Held One Year or Less">
							<tr valign="top">
								<th class="IRS1120ScheduleD_DescCol" style="font-weight:normal;width:55mm;text-align:left;" scope="col">
									Complete Form 8949 before completing line 8, 9, or 10. This form may be easier to complete if you round off cents to whole dollars.</th>
								<th class="IRS1120ScheduleD_DescCol" style="font-weight:normal;width:40mm;text-align:left;" scope="col">
									<b>(d)</b> Sales price from Form(s) 8949, line 4, column (d)</th>
								<th class="IRS1120ScheduleD_DescCol" style="font-weight:normal;width:30mm;text-align:left;" scope="col">
									<b>(e)</b> Cost or other basis from Form(s) 8949, line 4, column (e)</th>
								<th class="IRS1120ScheduleD_DescCol" style="font-weight:normal;width:32mm;text-align:left;" scope="col">
									<b>(g)</b> Adjustments to gain or loss from Form(s) 8949, line 4, column (g)</th>
								<th class="IRS1120ScheduleD_DescCol" style="font-weight:normal;width:30mm;text-align:left;" scope="col">
									<b>(h) Gain or (loss)</b> Combine columns (d), (e), and (g)</th>
							</tr>
							<!-- part II  body -->  
							<tr>
								<td class="IRS1120ScheduleD_DescCol" scope="row"  style="vertical-align:top;">
									<span class="IRS1120ScheduleD_IndexCol" style="margin-right:3mm;">8</span>Long&#8211;term  totals from all<br/> 
									<span class="IRS1120ScheduleD_IndexCol" style="margin-right:4mm;"></span>Forms 8949 with <b>box A</b><br/>
									<span style="float:left;">
										<span class="IRS1120ScheduleD_IndexCol" style="margin-right:3mm;"></span>checked in <b>Part II</b>
									</span>
									<span class="styDotLn" style="float:right;padding-right:2px;">...</span>   	  
								</td>
								<td class="IRS1120ScheduleD_MoneyCol"  scope="row" style="padding-left:25px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotaLTCGL1099BShowsBasisGrp/TotalSalesPrice"/>
									</xsl:call-template> 
								</td>
								<td class="IRS1120ScheduleD_MoneyCol"  scope="row" style="padding-left:16px;">						    
									(<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotaLTCGL1099BShowsBasisGrp/TotalCostOrOtherBasis"/>
									</xsl:call-template> )
								</td>
								<td    class="IRS1120ScheduleD_MoneyCol" scope="row">						   
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotaLTCGL1099BShowsBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
									</xsl:call-template> 
								</td>
								<td    class="IRS1120ScheduleD_MoneyCol"  scope="row">						    
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotaLTCGL1099BShowsBasisGrp/TotalGainOrLossAmt"/>
									</xsl:call-template> 
								</td>											
							</tr>	
							<tr>
								<td  class="IRS1120ScheduleD_DescCol" scope="row"  style="vertical-align:top;">
									<span class="IRS1120ScheduleD_IndexCol" style="margin-right:3mm;">9</span>Long&#8211;term totals from all <br/>
									<span class="IRS1120ScheduleD_IndexCol" style="margin-right:4mm;"></span>Forms 8949 with <b>box B</b><br/>
									<span style="float:left;"> 
										<span class="IRS1120ScheduleD_IndexCol" style="margin-right:3mm;"></span>checked in <b>Part II</b>
									</span>
									<span class="styDotLn" style="float:right;padding-right:2px;">...</span>
								</td>
								<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:25px;">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotalSalesPrice"/>
									</xsl:call-template> 
								</td>
								<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;">
									(<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotalCostOrOtherBasis"/>
									</xsl:call-template>)
								</td>
								<td class="IRS1120ScheduleD_MoneyCol" scope="row">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotAdjustmentsToGainOrLossAmt"/>
									</xsl:call-template> 
								</td>
								<td class="IRS1120ScheduleD_MoneyCol" scope="row">				
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalLTCGL1099BNotShowBasisGrp/TotalGainOrLossAmt"/>
									</xsl:call-template> 
								</td>											
							</tr>
							<tr>
								<td  class="IRS1120ScheduleD_DescCol" scope="row"  style="vertical-align:top;">
									<span class="IRS1120ScheduleD_IndexCol" style="margin-right:4mm; text-indent:0.3mm;">10</span>Long&#8211;term totals from all <br/> 
									<span class="IRS1120ScheduleD_IndexCol"   style="margin-right:4mm;"></span>Forms 8949 with <b>box C</b><br/>
									<span style="float:left;"> 
										<span class="IRS1120ScheduleD_IndexCol"   style="margin-right:3mm;"></span><b>C</b> checked in <b>Part II</b>
									</span>
									<span class="styDotLn" style="float:right;padding-right:2px;">...</span>  	 						   
								</td>
								<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:25px;">  			
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotaLTCGL1099BNotReceivedGrp/TotalSalesPrice"/>
									</xsl:call-template>       
								</td>
								<td class="IRS1120ScheduleD_MoneyCol" scope="row" style="padding-left:16px;">
									(<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotaLTCGL1099BNotReceivedGrp/TotalCostOrOtherBasis"/>
									</xsl:call-template>) 
								</td>
								<td class="IRS1120ScheduleD_MoneyCol" scope="row">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotaLTCGL1099BNotReceivedGrp/TotAdjustmentsToGainOrLossAmt"/>
									</xsl:call-template>   				
								</td>
								<td class="IRS1120ScheduleD_MoneyCol" scope="row" >
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotaLTCGL1099BNotReceivedGrp/TotalGainOrLossAmt"/>
									</xsl:call-template>   	
								</td>											
							</tr> 		
            </table>
            <!-- END PART II TABLE -->
            <!-- BEGIN LINE 11 -->
            <div style="width:187mm;">
							<div class="styLNLeftNumBox" >11</div>
              <div class="styLNDesc" style="width:139mm;">     
                <span style="float:left;">Enter gain from Form 4797, line 7 or 9 </span>
                <!--Dotted Line-->
								<span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">.....................</span>
              </div>
              <div class="styLNRightNumBox">11</div>
              <div class="styLNAmountBox" >
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/GainFromForm4797"/>
								</xsl:call-template>
							</div>                
            </div>             
            <!-- END LINE 11 -->
            <!-- BEGIN LINE 12 -->
            <div style="width:187mm;">
							<div class="styLNLeftNumBox" >12</div>
              <div class="styLNDesc" style="width:139mm;">     
                <span style="float:left;">Long-term capital gain from installment sales from Form 6252, line 26 or 37 </span>
                <!--Dotted Line-->
								<span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">.........</span>
              </div>
              <div class="styLNRightNumBox">12</div>
              <div class="styLNAmountBox" >
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/LongTermCapitalGainInstalSales"/>
								</xsl:call-template>
							</div>                
            </div>             
            <!-- END LINE 12 -->
            <!-- BEGIN LINE 13 -->
            <div style="width:187mm;">
							<div class="styLNLeftNumBox" >13</div>
              <div class="styLNDesc" style="width:139mm;">     
                <span style="float:left;">Long-term capital gain or (loss) from like-kind exchanges from Form 8824 </span>
                <!--Dotted Line-->
								<span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">..........</span>
              </div>
              <div class="styLNRightNumBox">13</div>
              <div class="styLNAmountBox" >
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/LongTrmCapGainLossFromLikeKind"/>
								</xsl:call-template>
							</div>                
            </div> 
            <!-- BEGIN LINE 14 -->
            <div style="width:187mm;">
							<div class="styLNLeftNumBox" >14</div>
              <div class="styLNDesc" style="width:139mm;">     
                <span style="float:left;">Capital gain distributions (see instructions) </span>
                <!--Dotted Line-->
								<span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">....................</span>
              </div>
              <div class="styLNRightNumBox">14</div>
              <div class="styLNAmountBox" >
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CapitalGainDistributions"/>
								</xsl:call-template>
							</div>                
            </div> 
            <!-- BEGIN LINE 15 -->
            <div style="width:187mm;">
							<div class="styLNLeftNumBox" >15</div>
              <div class="styLNDesc" style="width:139mm;">     
                <span style="float:left;">Net long-term capital gain or (loss). Combine lines 8 through 14 in column h</span>
                <!--Dotted Line-->
								<span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">.........</span>
              </div>
              <div class="styLNRightNumBox">15</div>
              <div class="styLNAmountBox" >
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetLongTermCapitalGainLoss"/>
								</xsl:call-template>
							</div>                
            </div> 
            <!-- END LINE 15 -->
            <!-- BEGIN PART III HEADER -->
            <div class="IRS1120ScheduleD_styPartHdr" style="width:707px;float:left;clear:left;">
              <span style="width:76px;">
                <span class="IRS1120ScheduleD_styPartHdrSpanner"/>
                <span class="IRS1120ScheduleD_styPartHdrTitle">Part III</span>
                <span class="IRS1120ScheduleD_styPartHdrSpanner"/>
              </span>Summary of Parts I and II
            </div>
            <!-- END PART III HEADER -->
            <!-- BEGIN LINE 16 -->
            <div style="width:187mm;">
							<div class="styLNLeftNumBox" >16</div>
              <div class="styLNDesc" style="width:139mm;">     
                <span style="float:left;">Enter excess of net short-term capital gain (line 7) over net long-term capital loss (line 15) </span>
                <!--Dotted Line-->
								<span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">....</span>
              </div>
              <div class="styLNRightNumBox">16</div>
              <div class="styLNAmountBox" >
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ExcessNetSTGainOverNetLTLoss"/>
								</xsl:call-template>
							</div>                
            </div> 
            <!-- END LINE 16 -->
            <!-- BEGIN LINE 17 -->
            <div style="width:187mm;">
							<div class="styLNLeftNumBox" >17</div>
              <div class="styLNDesc" style="width:139mm;">     
                Net capital gain. Enter excess of net long-term capital gain (line 15) over net short-term capital  loss
                <span style="float:left;">(line 7) </span>
                <!--Dotted Line-->
								<span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">...............................</span>
              </div>
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">17</div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;" >
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/NetCapitalGain"/>
								</xsl:call-template>
							</div>                
            </div> 
            <!-- END LINE 17 -->
            <!-- BEGIN LINE 18 -->
            <div style="width:187mm;">
							<div class="styLNLeftNumBox" >18</div>
              <div class="styLNDesc" style="width:139mm;">     
                Add lines 16 and 17. Enter here and on Form 1120, page 1, line 8, or the proper line on other returns. 
                <span style="float:left;"></span> 
                <!--Dotted Line
								<span style="float:right;font-weight:bold;letter-spacing:3.3mm;padding-right:2mm;">............................</span>-->
              </div>
              <div class="styLNRightNumBox">18</div>
              <div class="styLNAmountBox" >
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/CapitalGainNetIncome"/>
								</xsl:call-template>
							</div>                
            </div> 
            <!-- END LINE 18 -->
            <!-- BEGIN NOTE -->
            <div style="width:187mm;">
							<div class="styLNLeftNumBox" ></div>
							<div class="styLNDesc" style="width:179mm;">     
								<span style="font-weight:bold;">Note: </span>
                <span style="font-style:italic;">If losses exceed gains, see <span style="font-weight:bold;">Capital losses</span> in the instructions.</span>
							</div>
            </div>
            <!-- END NOTE -->                 
            <!-- BEGIN FOOTER -->
            <div class="IRS1120ScheduleD_styFormFooter" style="width:707px;border-top-width: 1px;">
              <span style="width:104mm;font-weight:bold;font-size:7pt;" class="styGenericDiv">For Paperwork Reduction Act Notice, see the Instructions for Form 1120.</span>
              <span style="width:36mm;font-weight:normal;font-size:7pt;text-align:center;" class="styGenericDiv">Cat. No. 11460M</span>
              <span style="float:right;width:42mm;text-align:right;font-weight:bold;font-size:7pt;" class="styGenericDiv" >Schedule D (Form 1120) 2012</span>
            </div>
            <!-- BEGIN FOOTER -->
          </form>
          <!-- leftover data table -->
          <br class="pageend" />        
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
              <xsl:with-param name="TargetNode" select="$FormData" />
                <xsl:with-param name="DescWidth" select="100"/>
              </xsl:call-template>
          </table>
        </body>
      </html>
    </xsl:template>      
  </xsl:stylesheet>
