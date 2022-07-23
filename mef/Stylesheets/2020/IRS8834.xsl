<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<!-- 05/04/2015 - Changes made for IE11 compatibility - Jeremy Nichols -->
<!-- 06/23/2015 - Changes made for UWR 151655 - Jeremy Nichols -->
<!-- 05/09/2017 - Changes made for UWR 194393 - Jeremy Nichols -->
<!-- 08/10/2017 - Changes made for UWR 200408 - Jeremy Nichols -->
<!-- 08/25/2017 - Changes made for 2017 pdf review under defect 61535 - Jeremy Nichols -->
<!-- 03/21/2018 - Changes made for UWR 205661 - Jeremy Nichols -->
<!-- 07/20/2018 - Changes made for UWR 211897 - Jeremy Nichols -->
<!-- 08/27/2018 - Changes made for 2018 pdf review under defect ##### - Jeremy Nichols -->
<!-- 11/20/2018 - Changes made for defect 126841 - Jeremy Nichols -->
<!-- 11/21/2018 - Changes made for defect 126895 - Jeremy Nichols -->
<!-- 01/17/2019 - Changes made for defect 126841 - Jeremy Nichols -->
<!-- 09/30/2019 - Changes made for UWR 225247 - Jeremy Nichols -->
<!-- 12/16/2019 - Changes made for defect 128868 - Jeremy Nichols -->
<!-- 01/14/2020 - Changes made for KISAMS IM00887331 - Jeremy Nichols -->
<!-- 09/02/2020 - Changes made for UWR 239493 - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="IRS8834Style.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="FormData" select="$RtnDoc/IRS8834"/>
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
        <!-- No Browser Caching -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <meta name="Description" content="Form IRS 8834"/>
        <meta name="GENERATOR" content="IBM WebSphere Studio"/>
        <xsl:call-template name="GlobalStylesForm"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS8834Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
      </head>
      <body class="styBodyClass">
        <form name="Form8834">
          <xsl:call-template name="DocumentHeader"/>
          <!--Title of Form -->
          <div class="styBB" style="width:187mm;height: 18mm">
            <div class="styFNBox" style="width:33mm;font-size: 7pt;height: 18mm">
			    Form <span class="styFormNumber">8834</span>
                <span style="width:2px;"/>
                <xsl:call-template name="SetFormLinkInline">
                  <xsl:with-param name="TargetNode" select="$FormData"/>
                </xsl:call-template>
                <br/>            
				(Rev. November 2020)
              <br/>
              <span class="styAgency">Department of the Treasury</span>
              <br/>
              <span class="styAgency">Internal Revenue Service</span>
            </div>
            <div class="styFTBox" style="height: 18mm;width:122mm">
              <div class="styMainTitle" style="height: 7mm;padding-top:1mm;">Qualified Electric Vehicle Credit</div>
              <div class="styFST" style="font-size:7pt;margin-left:3mm;font-weight:bold"> 
                <div style="margin-left: 1.5mm;">
                  <img src="{$ImagePath}/8834_Bullet.gif" alt="MediumBullet"/>  
				  Attach to your tax return.
				</div>
               <div style="padding-top:1.5mm">
                  <img src="{$ImagePath}/8834_Bullet.gif" alt="MediumBullet"/>  
				  Go to <i>www.irs.gov/Form8834</i> for the latest information.
				</div>
              </div>
            </div>
            <div class="styTYBox" style="width:30mm;height:18mm; border-left-width: 1px">
              <div class="styOMB" style="height:7mm;padding-top:1mm;">OMB No. 1545-1374</div>
              <div class="stySequence"><span style="width:20mm;height:1mm;"/>Attachment<br/>Sequence No. <b>111</b>
              </div>
            </div>
         </div>
          <!--  End title of Form  -->
          <!--  Name and Employer identification number  -->
          <div class="styBB" style="width:187mm">
            <div class="styNameBox" style="width:141mm;font-size:7pt;">
      Name(s) shown on return<br/>
              <div style="font-family:verdana;font-size:6pt;height:6mm">
                <xsl:call-template name="PopulateFilerName">
				  <xsl:with-param name="TargetNode" select="$FormData"/>
				</xsl:call-template>
              </div>
            </div>
            <div class="styEINBox" style=" padding-left:2mm; font-size:7pt;">
              <span class="BoldText">Identifying number</span>
                <br/> <br/>
              <div style="text-align:left;font-weight:normal; ">
                <xsl:call-template name="PopulateFilerTIN">
				   <xsl:with-param name="TargetNode" select="$FormData"/>
				</xsl:call-template>
              </div>
            </div>
          </div>
         
          <div class="styBB" style="width:187mm;font-size:8pt;">
            <b>Caution:</b> This form only applies to qualified electric vehicle passive activity credits from prior
             years (allowed on <br/>Form 8582-CR or Form 8810 for the current year).  The qualified electric vehicle 
			credit was available for certain vehicles placed in service before 2007.</div>
             
             <!-- Line 1  -->
             <div style="width:187mm">
				<div class="styLNLeftNumBox" style="height:8mm;padding-top:4mm;vertical-align:bottom;">1</div>
				<div class="styLNDesc" style="width:138mm;height:8mm;padding-top:4mm;vertical-align:bottom;">
				  Qualified electric vehicle passive activity credits allowed for your current tax year (see instructions)
				</div>
				<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">1  </div>
				<div class="styLNAmountBox" style="height:8mm;padding-top:4mm;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehPssvActyCrAllwAmt"/>
				  </xsl:call-template>
				</div>
			  </div>
          
          <!--  Line 2 -->
          <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="padding-top:4mm;">2</div>
        <div class="styLNDesc" style="width:117mm;padding-top:4mm;">
          Regular tax before credits:     <br/>    
       <img src="{$ImagePath}/8844_Bullet_Round.gif" title="bullet" alt="bullet"/>    Individuals. Enter the sum of the amounts from Form 1040, 1040-SR, or 1040-NR, line 16, and Schedule 2 (Form 1040), line 2.<br/>
        <img src="{$ImagePath}/8844_Bullet_Round.gif" title="bullet" alt="bullet"/>    Corporations. Enter the amount from Form 1120, Schedule J, line 2; or the
applicable line of your return.<br/>
        <img src="{$ImagePath}/8844_Bullet_Round.gif" title="bullet" alt="bullet"/>    Estates and trusts. Enter the sum of the amounts from Form 1041, Schedule G,
lines 1a and 1b, or the amount from the applicable line of your return.                   
        </div>
        <div class="styLNDesc" style="width:5mm; height:4mm;padding-top:4.5mm;">
          <img src="{$ImagePath}/8844_Bracket_Lger.gif" title="bracket" alt="bracket" border="0"/>        
        </div>
		<div class="styDotLn" style="padding-top:10mm;" title="dotted line" >....</div>
        <div class="styLNRightNumBox" style="height:14mm;padding-top:10mm;">
         <!-- <div class="styLNRightNumBoxNBB" style="width:7.75mm;padding-top=0.5mm;border-left-width:0px;background-color:lightgrey;"></div>-->
         2
        </div>
        <div class="styLNAmountBox" style="width:32.2mm;height:14mm;padding-top: 10mm;">
          <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehRegularTxBfrCrAmt"/>
        </xsl:call-template>
        </div>
        <div style="float:right;padding-right:32.75mm;">
			<div class="styLNRightNumBoxNBB" style="width:8.25mm;background-color:lightgrey;height:15.75mm;border-right-width:1px;"/>
		
        </div>
        </div>
          <!-- End Line 2 -->
          
       <div class="styBB" style="width:187mm;">
       <!-- Line 3a-->
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:4.5mm;">3</div>
        <div class="styLNDesc" style="width:138mm;height:4.5mm">
          Credits that reduce regular tax before the qualified electric vehicle credit:
        </div>
        <div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey; border-bottom-width: 0px"/>
        <div class="styLNAmountBox" style="height:4.5mm;border-bottom-width: 0px">
        </div>
      </div>
      <div style="width:187mm;">
        <div class="styLNLeftLtrBox" style="height:4mm;">a</div>
        <div class="styLNDesc" style="width:98mm;height:4mm">
          Foreign tax credit
          <span style="letter-spacing:4mm; font-weight:bold">  
            ...............
          </span>  
        </div>
        <div class="styLNRightNumBox" style="height:4.5mm;">3a</div>
        <div class="styLNAmountBox" style="height:4.5mm;width:32mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/ForeignTaxCreditAmt"/>
          </xsl:call-template>
        </div>
        <div class="styLNRightNumBoxNBB" style="width:8.4mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;"/>
      </div>
            

            
      <!-- Line 3b-->
    
      <div style="width:187mm;">
        <div class="styLNLeftLtrBox" style="height:4mm;">b</div>
        <div class="styLNDesc" style="width:98mm;height:4mm">
        Certain allowable credits (see instructions)
         <span style="letter-spacing:4mm; font-weight:bold">........
          </span> 
        </div>
        <div class="styLNRightNumBox" style="height:4.5mm;">3b</div>
        <div class="styLNAmountBox" style="height:4.5mm;">
        <!--
          NO SCHEMA ELEMENT FOR THIS FIELD-->        
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/CertainAllowableCreditsAmt"/>
          </xsl:call-template>
        </div>
        <div class="styLNRightNumBoxNBB" style="width:8.4mm;background-color:lightgrey;height:4.5mm;border-right-width:1px;"/>
      </div>
      <!-- End Line 3b-->
      
      <!-- Line 3c -->
      <div style="width:187mm;">
        <div class="styLNLeftLtrBox" style="height:4mm;">c</div>
        <div class="styLNDesc" style="width:138mm;height:4mm;">
          Add lines 3a and 3b
            <!--Dotted Line-->
            <span style="letter-spacing:4mm; font-weight:bold">  
              .....................
            </span>  
        </div>
        <div class="styLNRightNumBox" style="height:4.5mm;">3c</div>
        <div class="styLNAmountBox" style="height:4.5mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/TotTaxCrBfrQlfyElecVehCrAmt"/>
          </xsl:call-template>
        </div>
      </div>
      <!-- End Line 3c -->
      
      <!-- Line 4  -->      
      <div style="height:6mm;width:187mm">
        <div class="styLNLeftNumBox" style="height:6mm;padding-top:3mm;vertical-align:bottom;">4</div>
        <div class="styLNDesc" style="width:138mm;height:6mm;padding-top:3mm;vertical-align:bottom;">
          Net regular tax. Subtract line 3c from line 2. If zero or less, enter -0- here and on line 7
          <!--Dotted Line-->
            <span style="letter-spacing:4mm; font-weight:bold">  
              ....
            </span>  
        </div>
        <div class="styLNRightNumBox" style="height:6mm;vertical-align:bottom;padding-top:2mm;">4 </div>
        <div class="styLNAmountBox" style="height:6mm;vertical-align:bottom;padding-top:2mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehNetRegularTaxAmt"/>
          </xsl:call-template>
        </div>
      </div>
      
      <!--  Line 5  -->    
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:18mm;padding-top:3mm;">5</div>
        <div class="styLNDesc" style="width:117.1mm;height:18mm;padding-top:3mm;">
          Tentative minimum tax:            
        <li style="height:4mm; padding-top: .75mm" title="bullet" alt="bullet">Individuals. Enter the amount from Form 6251, line 9.</li>
        <li style="height: 4mm; padding-top: .75mm" title="bullet" alt="bullet">Corporations. Enter -0-.</li>
        <li style="height: 4mm; padding-top: .75mm" title="bullet" alt="bullet">Estates and trusts. Enter the amount from Schedule I (Form 1041), line 52.</li>                   
        </div>
        <div class="styLNDesc" style="width:5mm; height:1mm;padding-top:4.5mm;">
          <img src="{$ImagePath}/8834_Bracket_Md.gif" style="padding-top:2mm" title="curly bracket" alt="Curly Bracket Image"/>        
        </div>
		<div class="styDotLn" style="padding-top:14mm;" title="dotted line">....</div>

        <div class="styLNRightNumBox" style="width:8mm;height:18mm;padding-top:14.5mm;border-bottom-width: 1px">
        5
        </div>
        <div class="styLNAmountBox" style="height:18mm;padding-top:11.5mm; border-bottom-width: 1px">
          <br/>
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehTentativeMinTaxAmt"/>
          </xsl:call-template>
        </div>
      </div>
      <!--  End Line 5  -->
  
      <!--  Line 6  -->
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="padding-top:3mm;">6</div>
        <div class="styLNDesc" style="width:138mm;padding-top:3mm;">
          Subtract line 5 from line 4. If zero or less, enter -0- here and on line 7
<span style="letter-spacing:4mm; font-weight:bold"> .........
            </span>  
        </div>
        <div class="styLNRightNumBox" style="height:6mm;padding-top:3mm;">6
        </div>
        <div class="styLNAmountBox" style="height:6mm;padding-top:3mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyElecVehAdjRegularTaxAmt"/>
          </xsl:call-template>
          
        </div>
      </div>
      
      <!--  Line 7 -->
      <div class="styLNLeftNumBox" style="height:4.5mm;"/>
  <div class="styLNDesc" style="width:138mm;height:4mm;float:right:"/>
  <div class="styLNRightNumBoxNBB" style="width:8.4mm;height:4.5mm;border-right-width:1px;padding-top:0mm;background-color:lightgrey;"/>

  
      
      
      <div style="width:187mm;">
        <div class="styLNLeftNumBox" style="height:10mm;">7</div>
        <div class="styLNDesc" style="width:138mm;height:10mm;">
          <span class="styBoldText">Qualified electric vehicle credit.</span> Enter the <span class="styBoldText">smaller</span> of line 1 or line 6. Report this
				amount on Schedule 3(Form 1040), line 6; Form 1120, Schedule J, line 5b; or the appropriate line of your return.
				If line 6 is smaller than line 1, see instructions    
          <!--Dotted Line-->

          <span style="letter-spacing:4mm; font-weight:bold">  
            ...................
            <img src="{$ImagePath}/8834_Bullet.gif" title="arrow" alt="Medium arrow"/>
          </span>
            
        </div>
        
     <div class="styLNRightNumBox" style="height:10mm;padding-top:6mm; border-bottom-width: 0px;">7</div>
           
        <div class="styLNAmountBox" style="height:10mm; padding-top:6mm; border-bottom-width: 0px">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$FormData/QlfyElecMotorVehCrAmt"/>
          </xsl:call-template>
        </div>  
       </div> 
     </div>
     <div style="width:187mm; border-style: solid; border-color: black; border-left-width: 0px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px">
            <div class="styGenericDiv" style="width:117mm;font-weight:bold;">For  Paperwork Reduction Act Notice, see instructions.</div>
            <div class="styGenericDiv" style="width:23mm;">Cat. No. 14953G</div>
            <div class="styGenericDiv" style="float:right;">Form <span class="styBoldText">8834</span> (Rev. 10-2020)</div>
          </div><br/><br/>
          
          <!-- BEGIN Left Over Table -->
          <!-- Additonal Data Title Bar and Button -->
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
              <xsl:with-param name="TargetNode" select="$FormData"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
          
         </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>