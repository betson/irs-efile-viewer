<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS8861Style.xsl"/>
<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />
<xsl:param name="Form8861Data" select="$RtnDoc/IRS8861" />
<xsl:template match="/">
<html lang="EN-US">
  <head>
    <title>
      <xsl:call-template name="FormTitle">
        <xsl:with-param name="RootElement" select="local-name($Form8861Data)"></xsl:with-param>
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
    <meta name="Description" content="IRS Form 8861" />
    <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
    <xsl:call-template name="InitJS"></xsl:call-template>
    <style type="text/css"><!--test-->
      <!-- HINTS: -->
      <xsl:if test="not($Print) or $Print=''">
        <!-- Form 8861 CSS Styles are located in the template called below -->
        <xsl:call-template name="IRS8861Style"></xsl:call-template>
        <xsl:call-template name="AddOnStyle"></xsl:call-template>
      </xsl:if>  
    </style>
    <xsl:call-template name="GlobalStylesForm"/>
  </head>
  <body class="styBodyClass">
    <form name="Form8861">
      <xsl:call-template name="DocumentHeader"></xsl:call-template>
      <!-- Begin Form Number and Name -->
      <div class="styBB" style="width:187mm;">      
        <div class="styFNBox" style="width:30mm;height:16mm;">
          <div style="height:11mm;">
            Form <span class="styFormNumber">8861</span>
            <br/>
            <span style="font-size:6pt;">(Rev. December 2006)</span>
          </div>
          <div style="height:5mm;">
            <span class="styAgency">Department of the Treasury</span>
            <br/>
            <span class="styAgency">Internal Revenue Service</span>
          </div>
        </div>
        <div class="styFTBox" style="width:125mm;height:16mm;">
          <div class="styMainTitle" style="height:8mm;padding-top:4mm;">Welfare-to-Work Credit</div>
          <div class="styFST" style="height:8mm;font-size:7pt;padding-top:5mm;">
            <img src="{$ImagePath}/8861_Bullet.gif" alt="Bullet Image"/>
            <span style="width: .5mm" /> Attach to your tax return.</div>
          </div>
          <div class="styTYBox" style="width:32mm;height:17mm;">
            <div class="styOMB" style="height:8.5mm;text-align:center;padding-top:2mm;padding-bottom:2mm;">OMB No. 1545-1569</div>
            <div class="stySequence" style="height:8.5mm;padding-top:2mm;padding-bottom:2mm;">Attachment<br/>Sequence No.<b> 107</b></div>
          </div>
        </div>
        <!-- Names and Identifying number Lines  -->
        <div class="styBB" style="width:187mm;">
          <div class="styNameBox" style="width:155mm;height:8mm;font-weight:normal;font-size:7pt;">
            Name(s) shown on return
            <br/>
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
            </xsl:call-template>
            <br/>  
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
            </xsl:call-template>        
          </div>
          <div class="styEINBox" style="width:31mm;height:4mm;padding-left:2mm;font-size:7pt;">
            Identifying number
            <br/>
            <br/>
            <span style="font-weight:normal;">  
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">EIN</xsl:with-param>
              </xsl:call-template>
            </span>          
          </div>
        </div>
        <!-- Part I Current Year Credit -->
        <!-- Line 1 -->
        <div class="styBB" style="width:187mm;">
    	   <div style="float:left;clear:none;">
            <div class="styLNLeftNumBoxSD" style="padding-top:1mm;">1</div>      
            <div class="styLNDesc" style="width:139mm;padding-top:1mm;">        
              Enter on the applicable line below the qualified first- or second-year wages paid or incurred
              during the tax year and multiply by the percentage shown for services of employees who began
		 work for you before the date in the instructions, and are certified as long-term family assistance recipients.
              <!-- Members of a controlled group, see instructions.-->
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBoxNBB" style="padding-top:7.75mm;"/>
		 <div class="styLNAmountBoxNBB" style="width:32mm;height:11.5mm;"></div>
            </div>
          </div>
          <!-- Line 1a -->
          <div style="width:187mm;">
      	     <div style="float:left;clear:none;">
              <div class="styLNLeftLtrBoxDD" style="height:4mm;padding-top:1mm;">a</div>
              <div class="styLNDesc" style="width:81.25mm;height:4mm;padding-top:1mm">
                Qualified first-year wages
                <!--Dotted Line-->
                <span style="letter-spacing:3.5mm;font-weight:bold;padding-top:1mm;">...........</span>
              </div>
              <div class="styBB"  style ="width:3mm;float:left;clear:none;padding-top:1mm;">$</div>
              <div class="styBB"  style ="width:32mm;text-align:right;float:left;clear:none;padding-top:1mm;">
                <xsl:if test="not($Form8861Data/TotalQualifiedFirstYearWages) or $Form8861Data/TotalQualifiedFirstYearWages = ''">
                  <span style="width:1px;"></span>
                </xsl:if>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8861Data/QualifiedFirstYearWages"/>
                </xsl:call-template>
              </div>
              <div style="width:18mm;float:left;Clear:none;padding-top:1mm;"><span style="width:4px;"></span>X 35% (.35)</div>
            </div>
            <div style="float:right;Clear:none;">
              <div class="styLNRightNumBox" style="padding-top:1mm;">1a</div>
              <div class="styLNAmountBox" style="width:32mm;padding-top:1mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8861Data/TotalQualifiedFirstYearWages"/>
                </xsl:call-template>        
              </div>
            </div>
          </div>
          <!-- Line 1b -->      
          <div style="width:187mm;">
      	      <div style="float:left;clear:none">
               <div class="styLNLeftLtrBoxDD" style="height:4mm;padding-top:1mm;">b</div>
               <div class="styLNDesc" style="width:81.25mm;height:4mm;padding-top:1mm;">
                  Qualified second-year wages
                  <!--Dotted Line-->
                  <span style="letter-spacing:3.5mm;font-weight:bold;padding-top:1mm;">..........</span>
               </div>
             </div>
             <div class="styBB"  style ="width:3mm;float:left;clear:none;padding-top:1mm;">$</div>
             <div class="styBB"  style ="width:32mm;text-align:right;float:left;clear:none;padding-top:1mm;"> 
                <xsl:if test="not($Form8861Data/QualifiedSecondYearWages) or $Form8861Data/QualifiedSecondYearWages = ''">
                  <span style="width:1px;"></span>
                </xsl:if>
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8861Data/QualifiedSecondYearWages"/>
                </xsl:call-template>
             </div>
             <div style="width:18mm;float:left;Clear:none;padding-top:1mm;"><span style="width:4px;"></span>X 50% (.50)</div>
             <div style="float:right;Clear:none;">
               <div class="styLNRightNumBox" style="padding-top:1mm;">1b</div>
               <div class="styLNAmountBox" style="padding-top:1mm;">
                 <xsl:call-template name="PopulateAmount">
                   <xsl:with-param name="TargetNode" select="$Form8861Data/TotalQualifiedSecondYearWages"/>
                 </xsl:call-template>
                </div>
             </div>
          </div>
          <!-- Line 2 -->
          <div style="width:187mm;">
      	     <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD" style="padding-top:1mm;">2</div>
              <div class="styLNDesc" style="padding-top:1mm;">
                Add lines 1a and 1b. See instructions for the adjustment you must make for salaries and wages 
                <!--Dotted Line-->
                <span style="width:2px;"></span>  
                <!-- Form to Form Link -->
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$Form8861Data/TotalQualified1stAnd2ndYrWages"/>
                </xsl:call-template>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:4mm;padding-top:1mm;">2</div>
              <div class="styLNAmountBox" style="padding-top:1mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8861Data/TotalQualified1stAnd2ndYrWages"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--Line 3--> 
	   <div style="width:187mm;">
	     <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD" style="padding-top:1mm;">3</div>
              <div class="styLNDesc" style="padding-top:1mm;">
                Welfare-to-work credit from partnerships, S corporations, cooperatives, estates, and trusts . 
               <!--Dotted Line--> 
               <span style="width:2px;"></span>  
              </div>
            </div>
            <div style="float:right;clear:none;">        
              <div class="styLNRightNumBox" style="padding-top:1mm;">3</div>
              <div class="styLNAmountBox" style="padding-top:1mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8861Data/WelfareToWorkCredits"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- Line 4 -->            
          <div style="width:187mm;">
            <div style="float:left;clear:none">
              <div class="styLNLeftNumBoxSD" style="height:8mm;padding-top:1mm;">4</div>
              <div class="styLNDesc" style="height:8mm;padding-top:1mm;">
                Add lines 2 and 3. Cooperatives, estates, and trusts, go to line 5; partnerships and S corporations,
		  report this amount on Schedule K; all others, report this amount on the applicable line of Form
		  3800 (e.g., line 1c of the 2006 Form 3800)         
		  <!--Dotted Line-->
               <span style="letter-spacing:3.5mm;font-weight:bold;">.....................</span>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:8mm;padding-top:5mm;">
                <br/>
                4
              </div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:8.25mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8861Data/CurrentYearCredit"/>
                </xsl:call-template>        
              </div>
            </div>
          </div>  
          <!-- Line 5 -->
	    <div style="width:187mm;">
	      <div style="float:left;clear:none">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-top:1mm;">5</div>
              <div class="styLNDesc" style="height:4mm;padding-top:1mm;">
                Amount allocated to the patrons of the cooperative or the beneficiaries of the estate or trust (see instructions)       
		  <!--Dotted Line-->
               <span style="letter-spacing:3.5mm;font-weight:bold;">...........................</span>
              </div>
             </div>
             <div style="float:right;clear:none;">
               <div class="styLNRightNumBox" style="height:4mm;padding-top:4px;">
                 <br/>
                  5
               </div>
               <div class="styLNAmountBox" style="height:4mm;padding-top:16.9px;">
                 <xsl:call-template name="PopulateAmount">
                   <xsl:with-param name="TargetNode" select="$Form8861Data/BeneficiariesAllocatedAmount"/>
                 </xsl:call-template>        
               </div>
              </div>
           </div> 
           <!-- Line 6 -->
	    <div style="width:187mm;">
	       <div style="float:left;clear:none;">
               <div class="styLNLeftNumBoxSD" style="height:4mm;padding-top:1mm;">6</div>
               <div class="styLNDesc" style="height:4mm;padding-top:1mm;">
                 Cooperatives, estates, and trusts, subtract line 5 from line 4. Report the amount on the applicable
		    line of Form 3800 (e.g., line 1c of the 2006 Form 3800)     
		    <!--Dotted Line-->
                 <span style="letter-spacing:3.5mm;font-weight:bold;">.................</span>
                </div>
              </div>
              <div style="float:right;clear:none;">
                <div class="styLNRightNumBoxNBB" style="height:4mm;padding-top:1mm;">
                  <br/>
                  6
                </div>
                <div class="styLNAmountBoxNBB" style="height:4mm;padding-top:4mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$Form8861Data/EstatesTrustsCoopCredit"/>
                  </xsl:call-template>        
                </div>
              </div>
           </div>
        </div><!--Line 1 -->
        <!-- Page End -->
        <div style="width:187mm;">
          <span class="styBoldText">For Paperwork Reduction Act Notice, see instructions. </span> 
          <span style="width:27mm"></span>  
            Cat. No. 24858E 
          <span style="width:28mm"></span>  
            Form <span class="styBoldText">8861</span> (Rev. 12-2006)
        </div>
        <p class="pageEnd"></p> 
        <!-- BEGIN Left Over Table -->  
        <!-- ADDITIONAL DATA Title Bar and Button -->
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
            <xsl:with-param name="TargetNode" select="$Form8861Data" />
            <xsl:with-param name="DescWidth" select="100"/>
          </xsl:call-template>          
        </table> 
        <!-- END Left Over Table -->    
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
