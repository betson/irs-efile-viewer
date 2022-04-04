<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS5452Style.xsl"/>
<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
<xsl:strip-space elements="*"/>
<xsl:param name="FormData" select="$RtnDoc/IRS5452"/>
<xsl:template match="/">
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
<html>
  <head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($FormData)"/></xsl:call-template></title>    
    <!-- No Browser Caching -->
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <!-- No Proxy Caching -->
    <meta http-equiv="Cache-Control" content="private"/>    
    <meta name="Description" content="Form 5452"/>
    <meta name="GENERATOR" content="IBM WebSphere Studio"/>
    <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
    <xsl:call-template name="InitJS"/>
    <style type="text/css">    
      <xsl:if test="not($Print) or $Print=''">
        <xsl:call-template name="IRS5452Style"/>    
        <xsl:call-template name="AddOnStyle"/>    
      </xsl:if>
    </style>    
    <xsl:call-template name="GlobalStylesForm"/>
  </head>
  <body class="styBodyClass">          
    <form style="font-family:arial; font-size:8pt" name="Form5452">      
      <xsl:call-template name="DocumentHeader"/>    
      <div class="styTBB" style="width:187mm; clear:both;">
        <div class="styFNBox" style="height:20mm; width:30mm; font-size:7pt">
          <div>
            Form &#160;<span class="styFormNumber">5452</span>
            <br/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$FormData"/>
              </xsl:call-template>
            <br/>(Rev. October 2018)
            <div style="font-size:6pt;">
              Department of the Treasury<br/>Internal Revenue Service
            </div>
          </div>          
        </div>
        <div class="styFTBox" style="width:126mm;">
            <div class="styMainTitle" style="height:8mm;">
              Corporate Report of Nondividend Distributions
            </div>
             <div class="styFST" style="font-size:8pt;;font-weight:bold;;padding-top:2mm;">
              <img src="{$ImagePath}/5452_Bullet.gif" alt="right pointing arrow"/>
              For calendar year ending December 31,
              <span style="text-decoration:underline;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/CalendarYr"/>
                </xsl:call-template>
              </span>
              <br/>
              <img src="{$ImagePath}/5452_Bullet.gif" alt="right pointing arrow"/>
              Attach to the corporation’s income tax return.   
              <br/>         
				<img src="{$ImagePath}/5452_Bullet.gif" alt="right pointing arrow"/>
				Go to 
			   <a style="text-decoration:none; color:black;" href="http://www.irs.gov/form5452" title="Link to IRS.gov">
					<i>www.irs.gov/Form5452</i>
				</a> for instructions and the latest information.    
            </div>    
        </div>
        <div class="styTYBox" style="font-size:7pt; height:20mm; width:30mm; padding-top:3mm">
          <br/><br/>OMB No. 1545-0123  
        </div>
      </div>
      <!-- Name and EIN -->
      <div class="styIRS5452BB">
        <div class="styFNBox" style="width:125mm; height:10mm;">
          Name  <br/>        
            <div style="line-height:100%; padding-top:1mm;">
				<!-- Choice between 1120, 1041 Return Header Filer info -->
				 <xsl:call-template name="PopulateFilerName">
					<xsl:with-param name="TargetNode" select="$FormData"/>
				 </xsl:call-template> 
            </div>        
        </div>
        <div style="float:left; width:61mm;">
            <span style="width:2mm;"/><b>Employer identification number</b>
            <div style="text-align:left; width:100%; padding-top:3mm; padding-left:3mm;">
				<!-- Choice between 1120, 1041 Return Header Filer info -->
				 <xsl:call-template name="PopulateFilerTIN">
				   <xsl:with-param name="TargetNode" select="$FormData"/>
				 </xsl:call-template>    
            </div>            
        </div>
      </div>    
      <!-- line A -->
      <div style="height:4mm;"/>
      <div style="width:187mm; padding-top:1mm">
        <div class="styIRS5452Idx">A</div>        
        <div style="float:left;">
          Has the corporation filed a Form 5452 for a prior calendar year?
        </div>    
        <div style="float:right; margin-right:1mm;">          
          <span class="styDotLn" style="padding-top:0.5mm;">  
            ................      
          </span>
          <div style="padding-bottom:3.5mm;"><img src="{$ImagePath}/5452_Bullet.gif" alt="right pointing arrow"/></div>
          <span style="width:3mm;"/>    
          <div style="padding-bottom:2.5mm;">          
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$FormData/Form5452FiledForPriorYearInd"/>
            </xsl:call-template>
            <input type="Checkbox" alt="HasCorpFiledForm5452ForPriorYearYes" class="styCkbox" style="height:3.5mm">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/Form5452FiledForPriorYearInd"/>
                <xsl:with-param name="BackupName">HasCorpFiledForm5452ForPriorYearYes</xsl:with-param>
              </xsl:call-template>
            </input>          
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$FormData/Form5452FiledForPriorYearInd"/>
                <xsl:with-param name="BackupName">HasCorpFiledForm5452ForPriorYearLabeYes</xsl:with-param>
              </xsl:call-template>
             <div style="padding-bottom:1mm;">Yes</div>
            </label>
            <span style="width:7mm;"/>
             <span>          
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$FormData/Form5452FiledForPriorYeaearInd"/>
            </xsl:call-template>
            <input type="Checkbox" alt="HasCorpFiledForm5452ForPriorYearNo" class="styCkbox" style="height:3.5mm;">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/Form5452FiledForPriorYearInd"/>
                <xsl:with-param name="BackupName">HasCorpFiledForm5452ForPriorYearNo</xsl:with-param>
              </xsl:call-template>
            </input>  
            </span>             
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$FormData/Form5452FiledForPriorYearInd"/>
                <xsl:with-param name="BackupName">5452HasCorpFiledForm5452ForPriorYearLabelNo</xsl:with-param>
              </xsl:call-template>
             <div style="padding-bottom:1mm;">No</div>
            </label>            
            </div>          
		</div>            
      </div>
      <!-- line A -->
      <div style="width:187mm; padding-top:1mm;">
        <div class="styIRS5452Idx"/>        
        <div style="float:left;padding-left:6mm;">
          If "Yes," enter the applicable year(s)<span style="width:2mm;"/>
        </div>
        <xsl:choose>
			<xsl:when test="(count($FormData/ApplicableYr) = 0)">
				<div style="float:left;width:105mm;border-bottom:1px solid black;padding-top:3mm;"></div>
			</xsl:when>
          <xsl:when test="($Print != $Separated) or (($Print = $Separated) and (count($FormData/ApplicableYr) &lt;13))">
			<div style="float:left; width:105mm; border-bottom:1px solid black;">
			  <xsl:for-each select="$FormData/ApplicableYr">
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="."/>
				</xsl:call-template>
				<span style="width:2mm;"/>
			  </xsl:for-each>
			</div>  
        </xsl:when>
        <xsl:otherwise>
			<div style="float:left; width:105mm; border-bottom:1px solid black;">
			  <xsl:call-template name="PopulateAdditionalDataTableMessage">
				  <xsl:with-param name="TargetNode" select="$FormData/ApplicableYr"/>
			  </xsl:call-template>
			</div>  
        </xsl:otherwise>
        </xsl:choose>
      </div>
      <!-- line B -->
      <div style="height:3mm;"/>
      <div style="width:187mm; padding-top:1mm;">
        <div class="styIRS5452Idx" style="padding-top:1mm;">B</div>        
        <div style="float:left;padding-top:1mm;">
          Are any of the distributions part of a partial or complete liquidation?
        </div>    
        <div style="float:right; margin-right:1mm;">          
          <span class="styDotLn" style="padding-top:0.5mm;">  
            ...............      
          </span>
          <div style="padding-bottom:3.5mm;"><img src="{$ImagePath}/5452_Bullet.gif" alt="right pointing arrow"/></div>
          <span style="width:3mm;"/> 
          <div style="padding-bottom:2.5mm;">             
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$FormData/DistriPartOfLiquidationInd"/>
            </xsl:call-template>
            <input type="Checkbox" alt="DistriPartOrCompLiquidationYes" class="styCkbox" style="height:3.5mm">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/DistriPartOfLiquidationInd"/>
                <xsl:with-param name="BackupName">DistriPartOrCompLiquidationYes</xsl:with-param>
              </xsl:call-template>
            </input>
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$FormData/DistriPartOfLiquidationInd"/>
                <xsl:with-param name="BackupName">DistriPartOrCompLiquidationLabelYes</xsl:with-param>
              </xsl:call-template>
             <div style="padding-bottom:1mm;">Yes</div>
            </label>
            <span style="width:7mm"/>
            <span>          
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$FormData/DistriPartOfLiquidationInd"/>
            </xsl:call-template>
            <input type="Checkbox" alt="DistriPartOrCompLiquidationNo" class="styCkbox" style="height: 3.5mm">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/DistriPartOfLiquidationInd"/>
                <xsl:with-param name="BackupName">DistriPartOrCompLiquidationNo</xsl:with-param>
              </xsl:call-template>
            </input> 
            </span>              
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$FormData/DistriPartOfLiquidationInd"/>
                <xsl:with-param name="BackupName">DistriPartOrCompLiquidationLabelNo</xsl:with-param>
              </xsl:call-template>
             <div style="padding-bottom:1mm;">No</div>
            </label>      
		   </div>
        </div>            
      </div>
      <!-- line B -->
      <div style="width:187mm; padding-top:1mm;">
        <div class="styIRS5452Idx"/>        
        <div style="float:left;padding-left:6mm;">
          If "Yes," attach explanation.
        </div>
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$FormData/DistriPartOfLiquidationInd"/>
          </xsl:call-template>
      </div>
      <!-- line C -->
      <div style="height:3mm;"/>
      <div style="width:187mm; padding-top:1mm;">
        <div class="styIRS5452Idx" style="padding-top:1mm;">C</div>        
        <div style="float:left;padding-top:1mm;">
          Are any of the distributions from an S corporation's accumulated adjustments account?
        </div>    
        <div style="float:right; margin-right:1mm;">          
          <span class="styDotLn" style="padding-top:0.5mm;">  
            .........      
          </span>
          <div style="padding-bottom:3.5mm;"><img src="{$ImagePath}/5452_Bullet.gif" alt="right pointing arrow"/></div>
          <span style="width:3mm;"/> 
          <div style="padding-bottom:2.5mm;">    
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$FormData/AccumulatedAdjAccountDistriInd"/>
            </xsl:call-template>
            <input type="Checkbox" alt="AccumulatedAdjAccountDistriYes" class="styCkbox" style="height:3.5mm">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/AccumulatedAdjAccountDistriInd"/>
                <xsl:with-param name="BackupName">AccumulatedAdjAccountDistriYes</xsl:with-param>
              </xsl:call-template>
            </input>
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$FormData/AccumulatedAdjAccountDistriInd"/>
                <xsl:with-param name="BackupName">AccumulatedAdjAccountDistriYes</xsl:with-param>
              </xsl:call-template>
             <div style="padding-bottom:1mm;">Yes</div>
            </label>
            <span style="width:7mm;"/>
            <span>          
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$FormData/AccumulatedAdjAccountDistriInd"/>
            </xsl:call-template>
            <input type="Checkbox" alt="AccumulatedAdjAccountDistriNo" class="styCkbox" style="height:3.5mm;">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/AccumulatedAdjAccountDistriInd"/>
                <xsl:with-param name="BackupName">AccumulatedAdjAccountDistriNo</xsl:with-param>
              </xsl:call-template>
            </input> 
            </span>              
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$FormData/AccumulatedAdjAccountDistriInd"/>
                <xsl:with-param name="BackupName">AccumulatedAdjAccountDistriNo</xsl:with-param>
              </xsl:call-template>
             <div style="padding-bottom:1mm;">No</div>
            </label>         
          </div> 
        </div>            
      </div>
      <!-- line C -->
      <div style="width:187mm; padding-top:1mm;">
        <div class="styIRS5452Idx"/>        
        <div style="float:left; padding-left:6mm;">
          If "Yes," enter the balance at the beginning of the tax year <span style="width:2mm;"/>
        </div>
		<div style="float:left; width:105mm; border-bottom:1px solid black;">
			<xsl:call-template name="PopulateAmount">
			  <xsl:with-param name="TargetNode" select="$FormData/BeginningYearBalanceAmt"/>
			</xsl:call-template>
		</div>  
      </div>
      <div style="height:1mm;"/>
      <!-- line D -->      
      <div style="width:187mm; border-top:1px solid black; border-bottom:1px solid black;">
        <div style="width:93mm; height:40mm; border-right:1px solid black ;float:left;">
          <div style="height:2mm; font-size:1pt;"/>
          <div style="width:93mm;">
            <div class="styIRS5452Idx" style="height:8mm;">D</div>
            <div style="float:left;">
              <span style="font-weight:bold; display:inline;">  Earnings and Profits </span>(See <span style="font-weight:bold; display:inline;">Supporting<br/>
              Information </span>in instructions.)
            </div>
          </div>
          <div style="height:1mm; font-size:1pt;"/>
          <div style="width:93mm;">
            <div class="styIRS5452Idx" style="height:8mm;"/>
            <div style="float:left;">
              <img src="{$ImagePath}/5452_Bullet_Round.gif" alt="Round Bullet"/> Accumulated earnings and profits<br/>
              (since February 28, 1913) at the
            </div>
          </div>          
          <div style="width:93mm;">
            <div class="styIRS5452Idx" style="height:4mm;"/>
            <div style="float:left;">beginning of the tax year</div>
            <div style="float:right;"><span class="styDotLn">....</span><img src="{$ImagePath}/5452_Bullet.gif" alt="right pointing arrow"/>
              <span style="width:2mm;"/>$<span style="width:2mm;"/>
              <span class="styIRS5452Num">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/AccumulatedEarnAndPrftAtBOYAmt"/>
                </xsl:call-template>
              </span>
              <span style="width:2mm;"/>
            </div>
          </div>
          <div style="height:2mm; font-size:1pt;"/>
          <div style="width:93mm;">
            <div class="styIRS5452Idx" style="height:4mm;"/>
            <div style="float:left;">
              <img src="{$ImagePath}/5452_Bullet_Round.gif" alt="Round Bullet"/> Actual earnings and profits for the 
            </div>
          </div>          
          <div style="width:93mm;">
            <div class="styIRS5452Idx" style="height:4mm;"/>
            <div style="float:left;">current tax year</div>
            <div style="float:right;"><span class="styDotLn">.......</span><img src="{$ImagePath}/5452_Bullet.gif" alt="right pointing arrow"/>
              <span style="width:2mm;"/>$<span style="width:2mm;"/>
              <span class="styIRS5452Num">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/ActualEarnAndPrftCurrentTYAmt"/>
                </xsl:call-template>
              </span>
              <span style="width:2mm;"/>
            </div>
          </div>
        </div>
        <!-- line E -->
        <div style="float:left; width:93mm;">
          <div style="height:2mm; font-size:1pt;"/>
          <div style="width:93mm;">
            <div class="styIRS5452Idx" style="height:8mm;">E</div>
            <div style="float:left;">
              <span style="font-weight:bold; display:inline;">  Shareholders at Date of Last Dividend <br/>Payment</span>
            </div>
          </div>
          <div style="width:93mm;">
            <div class="styIRS5452Idx" style="height:4mm;"/>
            <div style="float:left;">
              <img src="{$ImagePath}/5452_Bullet_Round.gif" alt="Round Bullet"/> Number of individuals
            </div>
            <div style="float:right;"><span class="styDotLn">....</span><span style="width:2mm;"/>
             <!-- HINT: this span class styIRS5452Num defined font-size:6.5pt to allow amount to display within the underline-->
              <span class="styIRS5452Num">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="MaxSize" select="20"/>
                  <xsl:with-param name="TargetNode" select="$FormData/IndividualCnt"/>
                </xsl:call-template>
              </span>
            </div>
          </div>          
          <div style="width:93mm;">
            <div class="styIRS5452Idx" style="height:4mm;"/>
            <div style="float:left;">
              <img src="{$ImagePath}/5452_Bullet_Round.gif" alt="Round Bullet"/> Number of partnerships
            </div>
            <div style="float:right;"><span class="styDotLn">...</span><span style="width:2mm;"/>
              <span class="styIRS5452Num">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="MaxSize" select="20"/>
                  <xsl:with-param name="TargetNode" select="$FormData/PartnershipCnt"/>
                </xsl:call-template>
              </span>
            </div>
          </div>          
          <div style="width:93mm;">
            <div class="styIRS5452Idx" style="height:4mm;"/>
            <div style="float:left;">
              <img src="{$ImagePath}/5452_Bullet_Round.gif" alt="Round Bullet"/> Number of corporations and other
            </div>
          </div>          
          <div style="width:93mm;">
            <div class="styIRS5452Idx" style="height:4mm;"/>
            <div style="float:left;padding-left:2mm;">shareholders</div>
            <div style="float:right;"><span class="styDotLn">.......</span><span style="width:2mm;"/>
              <span class="styIRS5452Num">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="MaxSize" select="20"/>
                  <xsl:with-param name="TargetNode" select="$FormData/CorporationAndOtherShrCnt"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
        </div>
      </div>
      <!-- table F -->
      <!--*************************************************-->
      <!--KNOWN ISSUE exception for table F: -->
      <!--Form was designed by IBM and customer has approved this design becuase these lines are repeating. So the $ and % signs will repeat every line. -->
      <!--*************************************************-->
      <div style="width:187mm; height:8mm; border-bottom:1px solid black; padding-top:2mm;">
        <div class="styIRS5452Idx">F</div>        
        <div style="float:left;">
          <span style="font-weight:bold; display:inline;">Corporate Distributions </span>(see instructions) 
        </div>
        <div style="float:right; vertical-align:middle;">              
          <!-- button display logic -->          
          <xsl:call-template name="SetDynamicTableToggleButton">
            <xsl:with-param name="TargetNode" select="$FormData/CorporateDistributions"/>
            <xsl:with-param name="containerHeight" select="11"/>
            <xsl:with-param name="containerID" select=" 'LineETable' "/>
          </xsl:call-template>               
           <!-- end button display logic -->  
        </div>      
      </div>
      <div style="width:187mm; height:auto; overflow-y:auto; display:block;" name="LineETable" id="LineETable">
      <!-- print logic -->
        <xsl:call-template name="SetInitialState"/>
      <!-- end -->
         <table cellspacing="0" style="width:187mm; font-size:7pt;" cellpadding="0">
           <thead style="text-align:center;">
              <tr style="width:187mm;">
                <td rowspan="2" class="styIRS5452TabCell" style="width:13.5mm; height:16mm;">Date Paid</td>
                <td rowspan="2" colspan="2" class="styIRS5452TabCell" style="width:27mm; height:16mm;">
					Total Amount Paid<br/>(Common (C),<br/>Preferred (P),<br/>Other(O))
				</td>
                <td rowspan="2" class="styIRS5452TabCellThick" style="width:24mm; height:16mm;">Amount<br/>Per<br/> Share</td>
                <td colspan="3" class="styIRS5452TabCell" style="width:72mm;">
					Amount Paid During Calendar Year From Earnings &amp; Profits<br/>Since February 28, 1913
				</td>
                <td rowspan="2" class="styIRS5452TabCellThick" style="width:13mm; height:16mm;">Percentage<br/>Taxable</td>
                <td rowspan="2" class="styIRS5452TabCell" style="width:24mm; height:16mm;">
					Amount Paid During<br/>Calendar Year From<br/>Other Than Earnings<br/>&amp; Profits Since<br/>February 28, 1913
				</td>
                <td rowspan="2" class="styIRS5452TabCell" style="width:13.5mm; height:16mm; border-right:0;">Percentage<br/>Nontaxable</td>
              </tr>
              <tr>
                <td class="styIRS5452TabCell" style="width:23mm;">From the<br/>Current Year</td>
                <td class="styIRS5452TabCell" style="width:23mm;">Accumulated</td>
                <td class="styIRS5452TabCell" style="width:23mm;">Total</td>
              </tr>
          </thead>
          <tbody style="text-align:right; vertical-align:bottom;">
          <xsl:choose>
            <xsl:when test="($Print != $Separated) or (count($FormData/CorporateDistributions) &lt;12)">
            <xsl:for-each select="$FormData/CorporateDistributions">
            <tr>
              <td class="styIRS5452TabCell" style="width:13.5mm; text-align:center;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="DistributionPaidDt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS5452TabCell" style="width:24mm; border-right:0;font-size:6.5pt;">
                <span style="float:left; padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="TotalDistributionPaidAmt"/>
                  </xsl:call-template>
                </span>
              </td>
              <td class="styIRS5452TabCell" style="width:4mm; text-align:center;font-size:6.5pt;">
                (<xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="TotalDistributionPaidAmt/@distributionShareTypeCd"/>
                </xsl:call-template>)
              </td>
              <td class="styIRS5452TabCellThick" style="width:24mm;font-size:6.5pt;">
                <span style="float:left;">$</span>
                <span style="float:right;">
              <xsl:choose> 
          		<xsl:when test="DistributionPerShareAmt">
		            <xsl:call-template name="PopulateAmount">
		              <xsl:with-param name="TargetNode" select="DistributionPerShareAmt"/>
		            </xsl:call-template>  
		          </xsl:when> 
		          <xsl:otherwise>
		            <xsl:call-template name="PopulateText">
		              <xsl:with-param name="TargetNode" select="DistributionPerShareRt"/>
		            </xsl:call-template>  
		          </xsl:otherwise>
		        </xsl:choose> 
                </span>
              </td>
              <td class="styIRS5452TabCell" style="width:24mm;font-size:6.5pt;">
                <span style="float:left; padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="EarnAndPrftPaidCYAmt"/>
                  </xsl:call-template>
                </span>
              </td>
              <td class="styIRS5452TabCell" style="width:24mm;font-size:6.5pt;">
                <span style="float:left; padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="AccumEarnAndPrftPaidAmt"/>
                  </xsl:call-template>
                </span>
              </td>
              <td class="styIRS5452TabCell" style="width:24mm;font-size:6.5pt;">
                <span style="float:left; padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="TotalEarnAndPrftPaidAmt"/>
                  </xsl:call-template>
                </span>
              </td>
              <td class="styIRS5452TabCellThick" style="width:13mm;font-size:6.5pt;">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="TaxableDistributionPct"/>
                </xsl:call-template>
              </td>
              <td class="styIRS5452TabCell" style="width:24mm;font-size:6.5pt;">
                <span style="float:left; padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="OthThanEarnAndPrftPaidAmt"/>
                  </xsl:call-template>
                </span>
              </td>            
              <td class="styIRS5452TabCell" style="width:13.5mm; border-right:0;font-size:6.5pt;">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="NontaxableDistributionPct"/>
                </xsl:call-template>
              </td>            
            </tr>
            </xsl:for-each>
            </xsl:when>
          </xsl:choose>
            <!-- filler rows -->
              <xsl:if test="((count ($FormData/CorporateDistributions)&gt;11) and ($Print=$Separated)) or (count($FormData/CorporateDistributions) &lt;1)">
                <tr>
                  <td class="styIRS5452TabCell" style="text-align:center;">&#160;</td>
                  <td class="styIRS5452TabCell" style="border-right:0; text-align:left; padding-left:.4mm;">$
                  <xsl:if test="(count ($FormData/CorporateDistributions)&gt;11) and ($Print=$Separated)">
                      <xsl:call-template name="PopulateAdditionalDataTableMessage">
                      <xsl:with-param name="TargetNode" select="$FormData/CorporateDistributions/TotalDistributionPaidAmt"/>
                        </xsl:call-template>
                  </xsl:if></td>
                  <td class="styIRS5452TabCell" style="width:4mm; text-align:center;"><span style="width:4px;"/></td>
                  <td class="styIRS5452TabCellThick" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCellThick" style="text-align:right; padding-right:.4mm;">%</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>            
                  <td class="styIRS5452TabCell" style="text-align:right; padding-right:.4mm; border-right:0;">%</td>            
                </tr>  
              </xsl:if>
              <xsl:if test="((count ($FormData/CorporateDistributions)&gt;11) and ($Print=$Separated)) or (count($FormData/CorporateDistributions) &lt;2)">
                <tr>
                  <td class="styIRS5452TabCell" style="text-align:center;">&#160;</td>
                  <td class="styIRS5452TabCell" style="border-right:0; text-align:left; padding-left:.4mm;">$
                  </td>
                  <td class="styIRS5452TabCell" style="width:4mm; text-align:center;"><span style="width:4px;"/></td>
                  <td class="styIRS5452TabCellThick" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCellThick" style="text-align:right; padding-right:.4mm;">%</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>            
                  <td class="styIRS5452TabCell" style="text-align:right; padding-right:.4mm; border-right:0;">%</td>            
                </tr>  
              </xsl:if>
              <xsl:if test="((count ($FormData/CorporateDistributions)&gt;11) and ($Print=$Separated)) or (count($FormData/CorporateDistributions) &lt;3)">
                <tr>
                  <td class="styIRS5452TabCell" style="text-align:center;">&#160;</td>
                  <td class="styIRS5452TabCell" style="border-right:0; text-align:left; padding-left:.4mm;">$
                  </td>
                  <td class="styIRS5452TabCell" style="width:4mm; text-align:center;"><span style="width:4px;"/></td>
                  <td class="styIRS5452TabCellThick" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCellThick" style="text-align:right;p adding-right:.4mm;">%</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>            
                  <td class="styIRS5452TabCell" style="text-align:right; padding-right:.4mm;border-right:0;">%</td>            
                </tr>  
              </xsl:if>
              <xsl:if test="((count ($FormData/CorporateDistributions)&gt;11) and ($Print=$Separated)) or (count($FormData/CorporateDistributions) &lt;4)">
                <tr>
                  <td class="styIRS5452TabCell" style="text-align:center;">&#160;</td>
                  <td class="styIRS5452TabCell" style="border-right:0; text-align:left; padding-left:.4mm;">$
                  </td>
                  <td class="styIRS5452TabCell" style="width:4mm; text-align:center;"><span style="width:4px;"/></td>
                  <td class="styIRS5452TabCellThick" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCellThick" style="text-align:right; padding-right:.4mm;">%</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>            
                  <td class="styIRS5452TabCell" style="text-align:right; padding-right:.4mm; border-right:0;">%</td>            
                </tr>  
              </xsl:if>
              <xsl:if test="((count ($FormData/CorporateDistributions)&gt;11) and ($Print=$Separated)) or (count($FormData/CorporateDistributions) &lt;5)">
                <tr>
                  <td class="styIRS5452TabCell" style="text-align:center;">&#160;</td>
                  <td class="styIRS5452TabCell" style="border-right:0; text-align:left; padding-left:.4mm;">$
                  </td>
                  <td class="styIRS5452TabCell" style="width:4mm; text-align:center;"><span style="width:4px;"/></td>
                  <td class="styIRS5452TabCellThick" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCellThick" style="text-align:right; padding-right:.4mm;">%</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>            
                  <td class="styIRS5452TabCell" style="text-align:right; padding-right:.4mm; border-right:0;">%</td>            
                </tr>  
              </xsl:if>
              <xsl:if test="((count ($FormData/CorporateDistributions)&gt;11) and ($Print=$Separated)) or (count($FormData/CorporateDistributions) &lt;6)">
                <tr>
                  <td class="styIRS5452TabCell" style="text-align:center;">&#160;</td>
                  <td class="styIRS5452TabCell" style="border-right:0; text-align:left; padding-left:.4mm;">$
                  </td>
                  <td class="styIRS5452TabCell" style="width:4mm; text-align:center;"><span style="width:4px;"/></td>
                  <td class="styIRS5452TabCellThick" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCellThick" style="text-align:right; padding-right:.4mm;">%</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>            
                  <td class="styIRS5452TabCell" style="text-align:right; padding-right:.4mm; border-right:0;">%</td>            
                </tr>  
              </xsl:if>
              <xsl:if test="((count ($FormData/CorporateDistributions)&gt;11) and ($Print=$Separated)) or (count($FormData/CorporateDistributions) &lt;7)">
                <tr>
                  <td class="styIRS5452TabCell" style="text-align:center;">&#160;</td>
                  <td class="styIRS5452TabCell" style="border-right:0; text-align:left; padding-left:.4mm;">$
                  </td>
                  <td class="styIRS5452TabCell" style="width:4mm; text-align:center;"><span style="width:4px;"/></td>
                  <td class="styIRS5452TabCellThick" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCellThick" style="text-align:right; padding-right:.4mm;">%</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>            
                  <td class="styIRS5452TabCell" style="text-align:right; padding-right:.4mm; border-right:0;">%</td>            
                </tr>  
              </xsl:if>
              <xsl:if test="((count ($FormData/CorporateDistributions)&gt;11) and ($Print=$Separated)) or (count($FormData/CorporateDistributions) &lt;8)">
                <tr>
                  <td class="styIRS5452TabCell" style="text-align:center;">&#160;</td>
                  <td class="styIRS5452TabCell" style="border-right:0; text-align:left; padding-left:.4mm;">$
                  </td>
                  <td class="styIRS5452TabCell" style="width:4mm; text-align:center;"><span style="width:4px;"/></td>
                  <td class="styIRS5452TabCellThick" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCellThick" style="text-align:right; padding-right:.4mm;">%</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>            
                  <td class="styIRS5452TabCell" style="text-align:right; padding-right:.4mm; border-right:0;">%</td>            
                </tr>  
              </xsl:if>
              <xsl:if test="((count ($FormData/CorporateDistributions)&gt;11) and ($Print=$Separated)) or (count($FormData/CorporateDistributions) &lt;9)">
                <tr>
                  <td class="styIRS5452TabCell" style="text-align:center;">&#160;</td>
                  <td class="styIRS5452TabCell" style="border-right:0; text-align:left; padding-left:.4mm;">$
                  </td>
                  <td class="styIRS5452TabCell" style="width:4mm; text-align:center;"><span style="width:4px;"/></td>
                  <td class="styIRS5452TabCellThick" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCellThick" style="text-align:right; padding-right:.4mm;">%</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>            
                  <td class="styIRS5452TabCell" style="text-align:right; padding-right:.4mm; border-right:0;">%</td>            
                </tr>  
              </xsl:if>
              <xsl:if test="((count ($FormData/CorporateDistributions)&gt;11) and ($Print=$Separated)) or (count($FormData/CorporateDistributions) &lt;10)">
                <tr>
                  <td class="styIRS5452TabCell" style="text-align:center;">&#160;</td>
                  <td class="styIRS5452TabCell" style="border-right:0; text-align:left; padding-left:.4mm;">$
                  </td>
                  <td class="styIRS5452TabCell" style="width:4mm; text-align:center;"><span style="width:4px;"/></td>
                  <td class="styIRS5452TabCellThick" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCellThick" style="text-align:right; padding-right:.4mm;">%</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>            
                  <td class="styIRS5452TabCell" style="text-align:right; padding-right:.4mm; border-right:0;">%</td>            
                </tr>  
              </xsl:if>
              <xsl:if test="((count ($FormData/CorporateDistributions)&gt;11) and ($Print=$Separated)) or (count($FormData/CorporateDistributions) &lt;11)">
                <tr>
                  <td class="styIRS5452TabCell" style="text-align:center;">&#160;</td>
                  <td class="styIRS5452TabCell" style="border-right:0; text-align:left; padding-left:.4mm;">$
                  </td>
                  <td class="styIRS5452TabCell" style="width:4mm; text-align:center;"><span style="width:4px;"/></td>
                  <td class="styIRS5452TabCellThick" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCellThick" style="text-align:right; padding-right:.4mm;">%</td>
                  <td class="styIRS5452TabCell" style="text-align:left; padding-left:.4mm;">$</td>            
                  <td class="styIRS5452TabCell" style="text-align:right; padding-right:.4mm; border-right:0;">%</td>            
                </tr>  
              </xsl:if>
<!--				<xsl:if test="((count ($FormData/CorporateDistributions)&gt;11) and not ($Print=$Separated))">-->
				<tr>
					<td class="styIRS5452TabCell" style="height:12mm; text-align:center; font-weight:bold; font-size:8pt;">Totals</td>
					<td class="styIRS5452TabCell" style="height:12mm; border-right:1px solid black;font-size:6.5pt;" colspan="2">
						<span style="float:left; padding-left:.4mm;">$</span>
						<span style="float:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalOfTotalDistriPaidAmt"/>
							</xsl:call-template>
						</span>
					</td>
					<td class="styIRS5452TabCellThick" style="height:12mm; background-color:lightgrey;">&#160;</td>
					<td class="styIRS5452TabCell" style="height:12mm;font-size:6.5pt;">
						<span style="float:left; padding-left:.4mm;">$</span>
						<span style="float:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalEarnAndPrftPaidCYAmt"/>
							</xsl:call-template>
						</span>
					</td>
					<td class="styIRS5452TabCell" style="height:12mm;font-size:6.5pt;">
						<span style="float:left; padding-left:.4mm;">$</span>
						<span style="float:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotAccumEarnAndPrftPaidAmt"/>
							</xsl:call-template>
						</span>
					</td>
					<td class="styIRS5452TabCell" style="height:12mm;font-size:6.5pt;">
						<span style="float:left; padding-left:.4mm;">$</span>
						<span style="float:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalOfTotalEarnAndPrftPaidAmt"/>
							</xsl:call-template>
						</span>
					</td>
					<td class="styIRS5452TabCellThick" style="height:12mm; background-color:lightgrey;">&#160;</td>
					<td class="styIRS5452TabCell" style="height:12mm;font-size:6.5pt;">
						<span style="float:left; padding-left:.4mm;">$</span>
						<span style="float:right;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$FormData/TotalOthThanEarnAndPrftPaidAmt"/>
							</xsl:call-template>
						</span>
					</td>            
					<td class="styIRS5452TabCell" style="height:12mm; border-right:0; background-color:lightgrey;">&#160;</td>      
				</tr>
          </tbody>
          <tfoot style="height:12mm; text-align:right; vertical-align:bottom;">
          </tfoot>
         </table>
      </div>
		<!-- Set Initial Height of Above Table -->
		<xsl:if test="((count ($FormData/CorporateDistributions)&gt;11) and not ($Print=$Separated))">
				<xsl:call-template name="SetInitialDynamicTableHeight">
					<xsl:with-param name="TargetNode" select="$FormData/CorporateDistributions"/>
					<xsl:with-param name="containerHeight" select="11"/>
					<xsl:with-param name="containerID" select=" 'LineETable' "/>
				</xsl:call-template>
		</xsl:if>		
		<!-- End Set Initial Height of Above Table -->
      <!-- footer line -->
      <div style="width:187mm;">
      <span class="styBoldText" style="font-size:8pt;">For Paperwork Reduction Act Notice, see the instructions.</span> 
        <span style="width:100px;"/>  
        Cat. No. 11881T
        <span style="width:96px;"/>  
        Form <span class="styBoldText">5452 </span> (Rev. 10-2018)
             </div><div class="pageEnd"/>
      <!--Note because the E table is a few mm off on the right hand side that is why the page end look misaligned -->
      <!-- leftover data -->        
      <div class="styLeftOverTitleLine" id="LeftoverData" style="font-family:verdana, arial, sans-serif">
        <div class="styLeftOverTitle">
          Additional Data        
        </div>
        <div class="styLeftOverButtonContainer">
          <input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage()" tabindex="1"/>
        </div>      
      </div>
      <table class="styLeftOverTbl">
        <xsl:call-template name="PopulateCommonLeftover">
          <xsl:with-param name="TargetNode" select="$FormData"/>        
        </xsl:call-template>
      </table>
    <xsl:if test="($Print = $Separated) and (count($FormData/ApplicableYr) &gt;12)">
	<br/>
	<span class="styRepeatingDataTitle">Form 5452 Line A - Has the corporation filed a Form 5452 for a prior calendar year? </span>
		<table class="styDepTbl" style="font-size:7pt">
			<thead class="styTableThead"/>
			<tbody>
				<tr class="styDepTblRow1">
						<td class="styDepTblCell" style="text-align:left; width:50mm">If "Yes," enter the applicable year(s):</td>
						<td class="styDepTblCell" style="text-align:left; width:134mm">   
						  <xsl:for-each select="$FormData/ApplicableYr">
							<xsl:call-template name="PopulateText">
							  <xsl:with-param name="TargetNode" select="."/>
						  </xsl:call-template>
						  <xsl:if test="position() != last()">,</xsl:if>
						  <span style="width:2mm;"/>
						</xsl:for-each> 
						</td>
					  </tr>     
			  </tbody>
		</table>
	</xsl:if>
  <xsl:if test="($Print = $Separated) and (count($FormData/CorporateDistributions) &gt;11)">
	<br/>
	<span class="styRepeatingDataTitle">Form 5452 - E  Corporate Distributions </span>			
         <!-- Using the same table from top -->
         <!-- Didn't use the class styDepTbl because using that class causes the cells to shrink because of the border-->
          <table cellspacing="0" style="font-size:7pt; font-family:arial; width:187mm;" cellpadding="0" class="">
           <thead style="text-align:center;" class="styTableThead">
              <tr class="styDepTblHdr">
                <td rowspan="2" class="styIRS5452TabCell" style="width:12.5mm; height:16mm;">Date Paid</td>
                <td rowspan="2" colspan="2" class="styIRS5452TabCell" style="width:28mm; height:16mm;">
					Total Amount Paid<br/>(Common (C),<br/>Preferred (P),<br/>Other(O))
				</td>
                <td rowspan="2" class="styIRS5452TabCellThick" style="width:23mm; height:16mm;">Amount<br/>Per<br/> Share</td>
                <td colspan="3" class="styIRS5452TabCell" style="width:69mm;">
					Amount Paid During Calendar Year From Earnings &amp; Profits<br/>Since February 28, 1913
				</td>
                <td rowspan="2" class="styIRS5452TabCellThick" style="width:12mm; height:16mm;">Percentage<br/>Taxable</td>
                <td rowspan="2" class="styIRS5452TabCell" style="width:23mm; height:16mm;">
					Amount Paid During<br/>Calendar Year From<br/>Other Than Earnings<br/>&amp; Profits Since<br/>February 28, 1913
				</td>
                <td rowspan="2" class="styIRS5452TabCell" style="width:12mm; height:16mm; border-right:0;">Percentage<br/>Nontaxable</td>
              </tr>
              <tr class="styDepTblHdr">
                <td class="styIRS5452TabCell" style="width:23mm;">From the<br/>Current Year</td>
                <td class="styIRS5452TabCell" style="width:23mm;">Accumulated</td>
                <td class="styIRS5452TabCell" style="width:23mm;">Total</td>
              </tr>
          </thead>
          <tbody style="text-align:right; vertical-align:bottom;">
            <xsl:for-each select="$FormData/CorporateDistributions">
            <tr>
             <xsl:attribute name="class">
  		           <xsl:choose>
                  <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                  <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
              <td class="styIRS5452TabCell" style="text-align:center;font-size:6.5pt;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="DistributionPaidDt"/>
                </xsl:call-template>
              </td>
              <td class="styIRS5452TabCell" style="width:24mm; border-right:0;font-size:6.5pt;">
                <span style="float:left; padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="TotalDistributionPaidAmt"/>
                  </xsl:call-template>
                </span>
              </td>
              <td class="styIRS5452TabCell" style="width:4mm; text-align:center;font-size:6.5pt;">
                (<xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="TotalDistributionPaidAmt/@distributionShareTypeCd"/>
                </xsl:call-template>)
              </td>
              <td class="styIRS5452TabCellThick" style="font-size:6.5pt;">
                <span style="float:left; padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:choose> 
          		<xsl:when test="DistributionPerShareAmt">
		            <xsl:call-template name="PopulateAmount">
		              <xsl:with-param name="TargetNode" select="DistributionPerShareAmt"/>
		            </xsl:call-template>  
		          </xsl:when> 
		          <xsl:otherwise>
		            <xsl:call-template name="PopulateText">
		              <xsl:with-param name="TargetNode" select="DistributionPerShareRt"/>
		            </xsl:call-template>  
		          </xsl:otherwise>
		        </xsl:choose> 
                </span>
              </td>
              <td class="styIRS5452TabCell" style="font-size:6.5pt;">
                <span style="float:left; padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="EarnAndPrftPaidCYAmt"/>
                  </xsl:call-template>
                </span>
              </td>
              <td class="styIRS5452TabCell" style="font-size:6.5pt;">
                <span style="float:left; padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="AccumEarnAndPrftPaidAmt"/>
                  </xsl:call-template>
                </span>
              </td>
              <td class="styIRS5452TabCell" style="font-size:6.5pt;">
                <span style="float:left; padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="TotalEarnAndPrftPaidAmt"/>
                  </xsl:call-template>
                </span>
              </td>
              <td class="styIRS5452TabCellThick" style="font-size:6.5pt;">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="TaxableDistributionPct"/>
                </xsl:call-template>
              </td>
              <td class="styIRS5452TabCell" style="font-size:6.5pt;">
                <span style="float:left; padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="OthThanEarnAndPrftPaidAmt"/>
                  </xsl:call-template>
                </span>
              </td>            
              <td class="styIRS5452TabCell" style="border-right:0;font-size:6.5pt;">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="NontaxableDistributionPct"/>
                </xsl:call-template>
              </td>            
            </tr>
            </xsl:for-each>
          </tbody>
          <tfoot style="height:8mm; text-align:right; vertical-align:bottom;">
            <tr class="styDepTblHdr">
              <td class="styIRS5452TabCell" style="height:8mm; text-align:center; font-weight:bold; font-size:8pt;">Totals</td>
              <td class="styIRS5452TabCell" style="height:8mm; border-right:1px solid black;" colspan="2">
                <span style="float:left; padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TotalOfTotalDistriPaidAmt"/>
                    <xsl:with-param name="WhiteFont">true</xsl:with-param>                  
                  </xsl:call-template>
                </span>
              </td>
              <!--td class="styIRS5452TabCell" style="height:12mm;">&nbsp;</td-->
              <td class="styIRS5452TabCellThick" style="height:8mm; background-color:lightgrey;">&#160;</td>
              <td class="styIRS5452TabCell" style="height:8mm;">
                <span style="float:left; padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TotalEarnAndPrftPaidCYAmt"/>
                    <xsl:with-param name="WhiteFont">true</xsl:with-param>                  
                  </xsl:call-template>
                </span>
              </td>
              <td class="styIRS5452TabCell" style="height:8mm;">
                <span style="float:left; padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TotAccumEarnAndPrftPaidAmt"/>
                     <xsl:with-param name="WhiteFont">true</xsl:with-param>                  
                 </xsl:call-template>
                </span>
              </td>
              <td class="styIRS5452TabCell" style="height:8mm;">
                <span style="float:left; padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TotalOfTotalEarnAndPrftPaidAmt"/>
                    <xsl:with-param name="WhiteFont">true</xsl:with-param>                  
                  </xsl:call-template>
                </span>
              </td>
              <td class="styIRS5452TabCellThick" style="height:8mm; background-color:lightgrey;">&#160;</td>
              <td class="styIRS5452TabCell" style="height:8mm;">
                <span style="float:left;padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TotalOthThanEarnAndPrftPaidAmt"/>
                    <xsl:with-param name="WhiteFont">true</xsl:with-param>                  
                  </xsl:call-template>
                </span>
              </td>            
              <td class="styIRS5452TabCell" style="height:8mm; border-right:0; background-color:lightgrey;">&#160;</td>      
            </tr>
          </tfoot>
          </table>
       </xsl:if>        
    </form>
  </body>          
</html>            
</xsl:template>
</xsl:stylesheet>