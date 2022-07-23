<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
    <!ENTITY nbsp "&#160;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:include href="PopulateTemplate.xsl"/>
    <xsl:include href="CommonPathRef.xsl"/>
    <xsl:include href="AddHeader.xsl"/>
    <xsl:include href="AddOnTable.xsl"/>
    <xsl:include href="IRS8925Style.xsl"/>
    <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
    <xsl:strip-space elements="*"/>
    <xsl:param name="Form8925Data" select="$RtnDoc/IRS8925"/>
    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
            <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
                <title>
                    <xsl:call-template name="FormTitle">
                        <xsl:with-param name="RootElement" select="local-name($Form8925Data)"/>
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
                <meta name="Description" content="IRS Form 1065"/>
                <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
                <xsl:call-template name="InitJS"/>
                <style type="text/css">
                    <xsl:if test="not($Print) or $Print=''">
                        <xsl:call-template name="IRS8925Style"/>
                        <xsl:call-template name="AddOnStyle"/>
                    </xsl:if>
                </style>
                <xsl:call-template name="GlobalStylesForm"/>
            </head>
            <body class="styBodyClass">
                <form name="Form8925">
                    <xsl:call-template name="DocumentHeader"/>
                    <div class="styBB" style="width:187mm;">
                        <div class="styFNBox" style="height:19mm; width:33mm;">
                            <div>
         Form<span class="styFormNumber">8925</span>
                                <br/>(Rev. September 2017)<br/>
                                <div style="font-size:6pt; padding-top:1.8mm">
              Department of the Treasury<br/>Internal Revenue Service  (99)
                                </div>
                            </div>
                        </div>
                        <div class="styFTBox" style="width:123mm">
                            <div class="styMainTitle" style="padding-top:1mm">Report of Employer-Owned Life Insurance Contracts</div>
                            <div class="styFBT" style="margin-top:6.5mm;">
                                <img src="{$ImagePath}/8925_Bullet_Title.gif" alt="Arrow Bullet"/> Attach to policyholder's tax return. See instructions.<br/>
                                <img src="{$ImagePath}/8925_Bullet_Title.gif" alt="Arrow Bullet Image"/>
								Go to <i><a href="http://www.irs.gov/form8925">www.irs.gov/Form8925</a></i> for the latest information.
                            </div>
                        </div>
                        <div class="styTYBox" style="width:31mm;border-left-width:1px;">
<div class="styOMB" style="height:7mm;font-size:7pt;padding-top:1mm;">OMB No. 1545-2089</div>
<div style="margin-left:1mm;text-align:left;font-size:7pt;height:12mm;padding-top:4mm;">
Attachment<br/>Sequence No. 
<span class="styBoldText" style="font-size:9pt;">160</span>
</div>
</div>
</div>

                    <div class="styBB" style="width:187mm;">
                        <div class="styFNBox" style="width:144mm; height:9mm">
                    Name(s) shown on return<br/>
                            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8925Data/FilerShownOnReturnNm"/></xsl:call-template><br/>  
                            <div style="line-height:100%; font-family:verdana;font-size:7pt">
                            </div>
                        </div>
                             <b>Identifying number</b><br/>
                           <xsl:if test="$Form8925Data/FilerSSN !=''">
                               <xsl:call-template name="PopulateSSN">
                                  <xsl:with-param name="TargetNode" select="$Form8925Data/FilerSSN"/>
                               </xsl:call-template>
                           </xsl:if> 
                            
                            <xsl:if test="$Form8925Data/FilerEIN !='' ">
                               <xsl:call-template name="PopulateEIN">
                                  <xsl:with-param name="TargetNode" select="$Form8925Data/FilerEIN"/>
                               </xsl:call-template>          
                           </xsl:if>  
                 </div>
                    <div class="styBB" style="width:187mm;">
                        <div class="styFNBox" style="width:144mm; height:9mm">
 Name of policyholder, if different from above<br/>
                            <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form8925Data/PolicyHolderNm"/></xsl:call-template><br/>  
                        </div>
                           <div style="line-height:100%; font-family:arial;font-size:6pt">
                              Identifying number, if different from above<br/>
                           <div style="font-family:verdana;font-size:7pt">
                           <xsl:if test="$Form8925Data/PolicyHolderSSN !=''">
                               <xsl:call-template name="PopulateSSN">
                                  <xsl:with-param name="TargetNode" select="$Form8925Data/PolicyHolderSSN"/>
                               </xsl:call-template>
                           </xsl:if> 
                            
                            <xsl:if test="$Form8925Data/PolicyHolderEIN !='' ">
                               <xsl:call-template name="PopulateEIN">
                                  <xsl:with-param name="TargetNode" select="$Form8925Data/PolicyHolderEIN"/>
                               </xsl:call-template>          
                           </xsl:if>
                           </div>  
                            </div>
                    </div>
                     <div class="styBB" style="width:187mm;">
                        <div style="height:9mm;font-family:verdana;font-size:7pt">
                        Type of business<br/>
                       <xsl:call-template name="PopulateText">
		                  <xsl:with-param name="TargetNode" select="$Form8925Data/TradeOrBusinessDesc"/>
	                </xsl:call-template>
                       </div>
                    </div>
<!-- MAIN SECTION -->    
 <!-- Start Line 1 -->
        
                     <div class="styBB" style="width:187mm;font-size:8pt">
                        <div style="width:187mm;float:right;clear:none;">
                            <div class="styLNLeftNumBox" style="height:auto;padding-top:1mm;">1
                            </div>
                            <div class="styLNDesc" style="width:136mm;height:auto;padding-top:1mm;">Enter the number of employees the policyholder had at the end of the tax year
                    <!--Dotted Line-->
					<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">.....</span>	 
                             </div>
                             <div class="styLNRightNumBox" style="height:auto;padding-top:1mm;border-right-width:1px">1                            
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:auto;width:35mm;padding-top:1mm;border-left-width:0px;">
                                    <xsl:call-template name="PopulateAmount">
                                        <xsl:with-param name="TargetNode" select="$Form8925Data/EndOfYearEmployeesQty"/>
                                    </xsl:call-template>
                            </div>
                        </div>
<!-- End Line 1 -->

<!-- Start Line 2 -->
                        
                        <div style="width:187mm;float:right;clear:none;">
                            <div class="styLNLeftNumBox" style="height:auto;padding-bottom:5mm;">2
                            </div>
           <div class="styLNDesc" style="width:136mm;height:auto;">Enter the number of employees included on line 1 who were insured at the end of the tax
                            year under the policyholder’s employer-owned life insurance contract(s) issued after August
                            17, 2006. See <i>Section 1035 exchanges</i> on page 2 for an exception
                      <!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">..........</span>	 
                            </div>
                            <div class="styLNRightNumBox" style="height:auto;padding-top:7.5mm;border-right-width:1px">2
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:auto;width:35mm;padding-top:7.5mm;border-left-width:0px;">
                                     <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8925Data/EndOfYearEmployeesInsuredQty"/>
                                    </xsl:call-template>
                             </div>
                        </div>
<!-- End Line 2 -->

<!-- Start Line 3 -->
                        
                         <div style="width:187mm;float:right;clear:none;">
                            <div class="styLNLeftNumBox" style="height:auto;padding-bottom:0mm;">3
                            </div>
                            <div class="styLNDesc" style="width:136mm;height:auto;">Enter the total amount of employer-owned life insurance in force at the end of the tax year
                                 for employees who were insured under the contract(s) specified on line 2
                      <!--Dotted Line-->
								<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">........</span>	 
                            </div>
                            <div class="styLNRightNumBox" style="height:auto;padding-top:4mm;border-right-width:1px">3
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:auto;width:35mm;padding-top:4mm;border-left-width:0px;">
                                      <xsl:call-template name="PopulateAmount">
                                         <xsl:with-param name="TargetNode" select="$Form8925Data/TotalEOYInsuranceAmt"/>
                                    </xsl:call-template>
                           </div>
                        </div>
<!-- End Line 3 -->

<!-- Start Line 4a -->
                        
                        <div style="width:187mm;float:right;clear:none;">
                            <div class="styLNLeftNumBox" style="height:auto;padding-bottom:2mm;">4a
                            </div>
                            <div class="styLNDesc" style="width:136mm;height:auto;">Does the policyholder have a valid consent for each<br/> 
                            employee included on line 2? See instructions.
                       <!--Dotted Line-->
									<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">........</span>	 
								    <input class="styCkbox"  alt="Does the policyholder have a valid consent for each employee included on line 2? Yes"
											type="checkbox" name="Checkbox" id="dummyidyes" style="width:3mm;">
                                        <xsl:call-template name="PopulateYesCheckbox">
                                            <xsl:with-param name="TargetNode"
                                             select= "$Form8925Data/ValidConsentForEachEmployeeInd" />
                                              <xsl:with-param name="BackupName">IRS8925/ValidConsentForEachEmployeeInd</xsl:with-param>
                                        </xsl:call-template> 											
									</input>
									<span style="width:5px"></span>
                                    <!-- </span>-->
								    <span class="styBoldText">
										<label for="dummyidyes">
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode"
                                             select= "$Form8925Data/ValidConsentForEachEmployeeInd" />
												<xsl:with-param name="BackupName">IRS8925/ValidConsentForEachEmployeeInd</xsl:with-param>
											</xsl:call-template>	
											    Yes
											</label>
									</span>
									<span style="width:16px"></span>
									<input class="styCkbox"  alt="Does the policyholder have a valid consent for each employee included on line 2? No" 
											type="checkbox" name="Checkbox" id="dummyidno" style="width:3mm;">
										<xsl:call-template name="PopulateNoCheckbox">
											<xsl:with-param name="TargetNode"
                                             select= "$Form8925Data/ValidConsentForEachEmployeeInd" />
										    <xsl:with-param name="BackupName">IRS8925/ValidConsentForEachEmployeeInd</xsl:with-param>
										</xsl:call-template>
								   </input>
								   <span style="width:5px"></span>
								   <span class="styBoldText">
										<label for="dummyidno">
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode"
                                             select= "$Form8925Data/ValidConsentForEachEmployeeInd" />
												<xsl:with-param name="BackupName">IRS8925/ValidConsentForEachEmployeeInd</xsl:with-param>
											</xsl:call-template>	
												No
										</label>
								   </span>
                            </div>
                            
                           <div class="styLNRightNumBox" style="height:auto;padding-top:9.3mm;border-right-width:0px;border-bottom-width:0px;background-color:lightgrey;width:7.7mm;">
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:auto;width:35.3mm;padding-top:4.5mm;border-left-width:0px;border-left-width: 1px;border-bottom-width:0px;background-color:lightgrey;">
                            </div>
                            <div class="styLNAmountBox" 
                                    style="height:auto;width:35.3mm;padding-top:4.5mm;border-left-width:0px;border-left-width: 1px;border-bottom-width:0px;background-color:lightgrey;">
                            </div>
                        </div>
<!-- End Line 4a -->

<!-- Start Line 4b -->
                        
                        <div style="width:187mm;float:right;clear:none;">
                            <div class="styLNLeftLtrBox" style="height:auto;"><span style="width:1px;"></span>b</div>
                            <div class="styLNDesc" style="width:136mm;height:auto;">If "No," enter the number of employees included on line 2 for whom the policyholder does
				not have a valid consent     
                       <!--Dotted Line-->
							<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">.........................</span>	 
                           </div>
                            <div class="styLNRightNumBox" style="width:7.7mm;border-bottom-width:0px;padding-top:4.5mm;padding-bottom:0mm;height:auto;background-color:lightgrey"/>
                            
                            <div class="styLNAmountBox" style="border-bottom-width:0px;height:auto;padding-top:4.5mm;padding-bottom:0mm;width:35.3mm;background-color:lightgrey"/>
                            <div class="styLNRightNumBox" style="width:7.7mm;height:auto;border-bottom-width:0px;">4b</div>
                            <div class="styLNAmountBox"  style="width:35.3mm;height:auto;border-bottom-width:0px; ">
								<xsl:call-template name="PopulateAmount">
                                    <xsl:with-param name="TargetNode" select="$Form8925Data/EmployeesWithoutValidCnsntQty"/>
                                </xsl:call-template></div>
							</div>
						</div>     
<!-- End Line 4b -->
                        
                    
   <!--  FOOTER-->
        <div style="width:187mm;border-top:1px solid black;">
          <span class="styBoldText"  style="width:105mm">For Paperwork Reduction Act Notice, see instructions. </span> 
          <span style="width:30mm;font-size:6pt">Cat. No. 37737A</span>                      
          
          <span style="width:13mm;"></span>  
          Form <span class="styBoldText" style="width:10mm;font-size:9pt">8925</span> (Rev. 9-2017)
        </div> 
        
         <div style="width:187mm;"/>
             
        <!-- Additonal Data Title Bar and Button -->
        <div class="styLeftOverTitleLine" id="LeftoverData">
          <div class="styLeftOverTitle">
            Additional Data        
          </div>
          <div class="styLeftOverButtonContainer">
            <input class="styLeftoverTableBtn" TabIndex="1"  type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
          </div>      
        </div>
        
        <!-- Additional Data Table -->
        <table class="styLeftOverTbl">
          <xsl:call-template name="PopulateCommonLeftover">
            <xsl:with-param name="TargetNode" select="$Form8925Data" />
            <xsl:with-param name="DescWidth" select="100"/>
          </xsl:call-template>                   
        </table>
      <!-- END Left Over Table -->      
                </form>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
