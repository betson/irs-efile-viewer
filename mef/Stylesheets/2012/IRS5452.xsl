<?xml version="1.0" ?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:import href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS5452Style.xsl"/>

<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>

<xsl:strip-space elements="*" />
<xsl:param name="FormData" select="$RtnDoc/IRS5452" />
            
<xsl:template match="/">
<html>
  <head>
    <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($FormData)"></xsl:with-param></xsl:call-template></title>    
    <!-- No Browser Caching -->
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <!-- No Proxy Caching -->
    <meta http-equiv="Cache-Control" content="private"/>    
    <meta name="Description" content="Form 5452"/>
    <meta name="GENERATOR" content="IBM WebSphere Studio"/>
    <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
    <xsl:call-template name="InitJS"></xsl:call-template>
    
    <style type="text/css">    
      <xsl:if test="not($Print) or $Print=''">
        <xsl:call-template name="IRS5452Style"></xsl:call-template>    
        <xsl:call-template name="AddOnStyle"></xsl:call-template>    
      </xsl:if>    
    </style>    
    
    <xsl:call-template name="GlobalStylesForm"/>
  </head>
  
  <body class="styBodyClass">          
    <form style="font-family:arial; font-size:8pt" name="Form5452">      
      <xsl:call-template name="DocumentHeader"></xsl:call-template>    
      
      <div class="styTBB" style="width:187mm; clear:both">
        <div class="styFNBox" style="height:20mm; width:30mm; font-size:7pt">
          <div>
            Form &nbsp; <span class="styFormNumber">5452</span>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$FormData"/>
              </xsl:call-template>
            <br/>(Rev. December 2006)
            <div style="font-size:6pt;padding-top:3mm;">
              Department of the Treasury<br />Internal Revenue Service
            </div>
          </div>          
        </div>
        <div class="styFTBox" style="width:126mm">
            <div class="styMainTitle" style="height:8mm;">
              Corporate Report of Nondividend Distributions
            </div>
             <div class="styFST" style="font-size:8pt;font-weight:bold;padding-top:1mm;">
              <img src="{$ImagePath}/5452_Bullet.gif" alt="bullet image"/>
              For calendar year ending December 31,
              <span style="text-decoration: underline;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$FormData/CalenderYear"/>
                </xsl:call-template>
              </span>
              <br /><br />
              <img src="{$ImagePath}/5452_Bullet.gif" alt="bullet image"/>
              Attach to the corporation’s income tax return.            
            </div>    
        </div>
        <div class="styTYBox" style="font-size:7pt; height:20mm; width:30mm; padding-top:3mm">
          <br /><br />OMB No. 1545-0205  
        </div>
      </div>
      <!-- name and ein -->
      <div class="styIRS5452BB">
        <div class="styFNBox" style="width:135mm; height:10mm">
          Name          
            <div style="line-height:100%;">
      <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param></xsl:call-template><br/>
      <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param></xsl:call-template>
            </div>        
        </div>
        <div style="float:left">
            <span style="width:2mm;"></span><b>Employer identification number</b>
            <div style="text-align:left;width:100%;padding-top:0.5mm;padding-left:2mm;">
      <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">EIN</xsl:with-param></xsl:call-template>          
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
        <div style="float:right; margin-right:1mm">          
          <span class="styDotLn">  
            ................      
          </span>
          <img src="{$ImagePath}/5452_Bullet.gif" alt="bullet image"/>
          <span style="width:3mm;"></span>    

          <span>          
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$FormData/HasCorpFiledForm5452ForPriorYr" />
            </xsl:call-template>
            <input type="Checkbox" class="styCkbox" style="height: 3.5mm">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/HasCorpFiledForm5452ForPriorYr"/>
                <xsl:with-param name="BackupName">IRS5452HasCorpFiledForm5452ForPriorYr</xsl:with-param>
              </xsl:call-template>
            </input>
            </span>            
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$FormData/HasCorpFiledForm5452ForPriorYr"/>
                <xsl:with-param name="BackupName">IRS5452HasCorpFiledForm5452ForPriorYr</xsl:with-param>
              </xsl:call-template>
              Yes
            </label>
            <span style="width:7mm"></span>
             <span>          
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$FormData/HasCorpFiledForm5452ForPriorYr" />
            </xsl:call-template>
            <input type="Checkbox" class="styCkbox" style="height: 3.5mm">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/HasCorpFiledForm5452ForPriorYr"/>
                <xsl:with-param name="BackupName">IRS5452HasCorpFiledForm5452ForPriorYr</xsl:with-param>
              </xsl:call-template>
            </input>  
            </span>             
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$FormData/HasCorpFiledForm5452ForPriorYr"/>
                <xsl:with-param name="BackupName">IRS5452HasCorpFiledForm5452ForPriorYr</xsl:with-param>
              </xsl:call-template>
              No
            </label>            

        </div>            
      </div>
      <!-- line A -->
      <div style="height:4mm;"/>
      <div style="width:187mm; padding-top:1mm">
        <div class="styIRS5452Idx"></div>        
        <div style="float:left;">
          If “Yes,” enter the applicable year(s)<span style="width:2mm;"/>
        </div>
        <div style="float:left;width:105mm;border-bottom:1 solid black;">
        <xsl:choose>
          <xsl:when test="($Print != $Separated) or (($Print = $Separated) and (count($FormData/PriorYearCorpFiledForm5452) &lt;13))">
          <xsl:for-each select="$FormData/PriorYearCorpFiledForm5452">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="."/>
            </xsl:call-template>
            <span style="width:2mm;"/>
          </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
              <xsl:call-template name="PopulateAdditionalDataTableMessage">
                  <xsl:with-param name="TargetNode" select="$FormData/PriorYearCorpFiledForm5452"/>
              </xsl:call-template>
        </xsl:otherwise>
        </xsl:choose>
        </div>  
      </div>
      <!-- line B -->
      <div style="height:4mm;"/>
      <div style="width:187mm; padding-top:1mm">
        <div class="styIRS5452Idx">B</div>        
        <div style="float:left;">
          Are any of the distributions part of a partial or complete liquidation?
        </div>    
        <div style="float:right; margin-right:1mm">          
          <span class="styDotLn">  
            ...............      
          </span>
          <img src="{$ImagePath}/5452_Bullet.gif" alt="bullet image"/>
          <span style="width:3mm;"></span> 
          <span>          
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$FormData/DistriPartlOrCompLiquidation" />
            </xsl:call-template>
            <input type="Checkbox" class="styCkbox" style="height: 3.5mm">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/DistriPartlOrCompLiquidation"/>
                <xsl:with-param name="BackupName">IRS5452DistriPartlOrCompLiquidation</xsl:with-param>
              </xsl:call-template>
            </input>
            </span>
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$FormData/DistriPartlOrCompLiquidation"/>
                <xsl:with-param name="BackupName">IRS5452DistriPartlOrCompLiquidation</xsl:with-param>
              </xsl:call-template>
              Yes
            </label>
            <span style="width:7mm"></span>
            <span>          
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$FormData/DistriPartlOrCompLiquidation" />
            </xsl:call-template>
            <input type="Checkbox" class="styCkbox" style="height: 3.5mm">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/DistriPartlOrCompLiquidation"/>
                <xsl:with-param name="BackupName">IRS5452DistriPartlOrCompLiquidation</xsl:with-param>
              </xsl:call-template>
            </input> 
            </span>              
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$FormData/DistriPartlOrCompLiquidation"/>
                <xsl:with-param name="BackupName">IRS5452DistriPartlOrCompLiquidation</xsl:with-param>
              </xsl:call-template>
              No
            </label>          
        </div>            
      </div>
      <!-- line B -->
      <div style="height:4mm;"/>
      <div style="width:187mm; padding-top:1mm;border-bottom:1 solid black;">
        <div class="styIRS5452Idx"></div>        
        <div style="float:left;">
          If “Yes,” attach explanation.
        </div>
          <xsl:call-template name="SetFormLinkInline">
            <xsl:with-param name="TargetNode" select="$FormData/DistriPartlOrCompLiquidation"/>
          </xsl:call-template>
      </div>
      <!-- line C -->
      <div style="width:187mm; border-bottom:1 solid black;">
        <div style="width:93mm;height:40mm;border-right:1 solid black;float:left;">
          <div style="height:2mm;font-size:1pt;"/>
          <div style="width:93mm;">
            <div class="styIRS5452Idx" style="height:8mm;">C</div>
            <div style="float:left;">
              <span style="font-weight:bold;">  Earnings and Profits </span>(See <span style="font-weight:bold;">Supporting<br/>
              Information </span>in instructions.)
            </div>
          </div>
          
          <div style="height:1mm;font-size:1pt;"/>
          <div style="width:93mm;">
            <div class="styIRS5452Idx" style="height:8mm;"></div>
            <div style="float:left;">
              <img src="{$ImagePath}/5452_Bullet_Round.gif" alt="Round Bullet"/> Accumulated earnings and profits<br/>
              (since February 28, 1913) at the
            </div>
          </div>          
          <div style="width:93mm;">
            <div class="styIRS5452Idx" style="height:4mm;"></div>
            <div style="float:left;">beginning of the tax year</div>
            <div style="float:right;"><span class="styDotLn">....</span><img src="{$ImagePath}/5452_Bullet.gif" alt="Right arrow"/>
              <span style="width:2mm;"/>$<span style="width:2mm;"/>
              <span class="styIRS5452Num">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/AccumEarningsAndProfitsAtBOY"/>
                </xsl:call-template>
              </span>
              <span style="width:2mm;"/>
            </div>
          </div>

          <div style="height:2mm;font-size:1pt;"/>
          <div style="width:93mm;">
            <div class="styIRS5452Idx" style="height:4mm;"></div>
            <div style="float:left;">
              <img src="{$ImagePath}/5452_Bullet_Round.gif" alt="Round Bullet"/> Actual earnings and profits for the                  </div>
          </div>          
          <div style="width:93mm;">
            <div class="styIRS5452Idx" style="height:4mm;"></div>
            <div style="float:left;">current tax year</div>
            <div style="float:right;"><span class="styDotLn">.......</span><img src="{$ImagePath}/5452_Bullet.gif" alt="Right arrow"/>
              <span style="width:2mm;"/>$<span style="width:2mm;"/>
              <span class="styIRS5452Num">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/ActlEarningsAndProfitsCurrTxYr"/>
                </xsl:call-template>
              </span>
              <span style="width:2mm;"/>
            </div>
          </div>
        </div>
        <!-- line D -->
        <div style="float:left;width:93mm;">
          <div style="height:2mm;font-size:1pt;"/>
          <div style="width:93mm;">
            <div class="styIRS5452Idx" style="height:8mm;">D</div>
            <div style="float:left;">
              <span style="font-weight:bold;">  Shareholders at Date of Last Dividend <br/>Payment</span>
            </div>
          </div>
          <div style="width:93mm;">
            <div class="styIRS5452Idx" style="height:4mm;"></div>
            <div style="float:left;">
              <img src="{$ImagePath}/5452_Bullet_Round.gif" alt="Round Bullet"/> Number of individuals
            </div>
            <div style="float:right;"><span class="styDotLn">....</span><span style="width:2mm;"/>
              <span class="styIRS5452Num">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="MaxSize" select="20" />
                  <xsl:with-param name="TargetNode" select="$FormData/NumberOfIndividuals"/>
                </xsl:call-template>
              </span>
            </div>
          </div>          
          <div style="width:93mm;">
            <div class="styIRS5452Idx" style="height:4mm;"></div>
            <div style="float:left;">
              <img src="{$ImagePath}/5452_Bullet_Round.gif" alt="Round Bullet"/> Number of partnerships
            </div>
            <div style="float:right;"><span class="styDotLn">...</span><span style="width:2mm;"/>
              <span class="styIRS5452Num">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="MaxSize" select="20" />
                  <xsl:with-param name="TargetNode" select="$FormData/NumberOfPartnerships"/>
                </xsl:call-template>
              </span>
            </div>
          </div>          
          <div style="width:93mm;">
            <div class="styIRS5452Idx" style="height:4mm;"></div>
            <div style="float:left;">
              <img src="{$ImagePath}/5452_Bullet_Round.gif" alt="Round Bullet"/> Number of corporations and other                  </div>
          </div>          
          <div style="width:93mm;">
            <div class="styIRS5452Idx" style="height:4mm;"></div>
            <div style="float:left;padding-left:2mm;">shareholders</div>
            <div style="float:right;"><span class="styDotLn">.......</span><span style="width:2mm;"/>
              <span class="styIRS5452Num">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="MaxSize" select="20" />
                  <xsl:with-param name="TargetNode" select="$FormData/NumberOfCorpAndOtherShr"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
        </div>
      </div>
      <!-- table E -->
      <div style="width:187mm; height:8mm; border-bottom:1 solid black;padding-top:2mm;">
        <div class="styIRS5452Idx">E</div>        
        <div style="float:left;">
          <span style="font-weight:bold;">Corporate Distributions </span>(see instructions) 
        </div>
        <div style="float:right; vertical-align:middle;">              
          <!-- button display logic -->          
          <xsl:call-template name="SetTableToggleButton">
            <xsl:with-param name="TargetNode" select="$FormData/CorporateDistributions" />
            <xsl:with-param name="containerHeight" select="11" />
            <xsl:with-param name="containerID" select=" 'LineETable' " />
          </xsl:call-template>               
           <!-- end button display logic -->  
        </div>      
      </div>
      <div style="width:187mm;height:117mm;overflow-y:auto;" name="LineETable" id="LineETable">
      <!-- print logic -->
        <xsl:call-template name="SetInitialState"/>
      <!-- end -->
         <table cellspacing="0" style="font-size:7pt;" cellpadding="0">
           <thead style="text-align:center;">
              <tr>
                <td rowspan="2" class="styIRS5452TabCell" style="width:12.5mm;height:16mm;">Date Paid</td>
                <td rowspan="2" colspan="2" class="styIRS5452TabCell" style="width:28mm;height:16mm;">Total Amount Paid<br/>(Common (C),<br/>Preferred (P),<br/>Other(O))</td>
                <td rowspan="2" class="styIRS5452TabCellThick" style="width:23mm;height:16mm;">Amount<br/>Per<br/> Share</td>
                <td colspan="3" class="styIRS5452TabCell" style="width:69mm;">Amount Paid During Calendar Year From Earnings &amp; Profits<br/>Since February 28, 1913</td>
                <td rowspan="2" class="styIRS5452TabCellThick" style="width:12mm;height:16mm;">Percent<br/>Taxable</td>
                <td rowspan="2" class="styIRS5452TabCell" style="width:23mm;height:16mm;">Amount Paid During<br/>Calendar Year From<br/>Other Than Earnings<br/>&amp; Profits Since<br/>February 28, 1913</td>
                <td rowspan="2" class="styIRS5452TabCell" style="width:12mm;height:16mm;border-right:0;">Percent<br/>Nontaxable</td>
              </tr>
              <tr>
                <td class="styIRS5452TabCell" style="width:23mm;">From the<br/>Current Year</td>
                <td class="styIRS5452TabCell" style="width:23mm;">Accumulated</td>
                <td class="styIRS5452TabCell" style="width:23mm;">Total</td>
              </tr>
          </thead>
          <tbody style="text-align:right;vertical-align:bottom;">
          <xsl:choose>
            <xsl:when test="($Print != $Separated) or (count($FormData/CorporateDistributions) &lt;12)">
            <xsl:for-each select="$FormData/CorporateDistributions">
            <tr>
              <td class="styIRS5452TabCell" style="text-align:center;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="DatePaid"/>
                </xsl:call-template>
              </td>
              <td class="styIRS5452TabCell" style="width:24mm;border-right:0;">
                <span style="float:left;padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="TotalAmountPaid"/>
                  </xsl:call-template>
                </span>
              </td>
              <td class="styIRS5452TabCell" style="width:4mm;text-align:center;">
                (<xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="TotalAmountPaid/@type"/>
                </xsl:call-template>)
              </td>
              <td class="styIRS5452TabCellThick">
                <span style="float:left;padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:choose> 
          		<xsl:when test="AmountPerShare">
		            <xsl:call-template name="PopulateAmount">
		              <xsl:with-param name="TargetNode" select="AmountPerShare" />
		            </xsl:call-template>  
		          </xsl:when> 
		          <xsl:otherwise>
		            <xsl:call-template name="PopulateText">
		              <xsl:with-param name="TargetNode" select="AmountPerShareDecimal" />
		            </xsl:call-template>  
		          </xsl:otherwise>
		        </xsl:choose> 
                </span>
              </td>
              <td class="styIRS5452TabCell">
                <span style="float:left;padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="EarningsAndProfitsPaidFromCY"/>
                  </xsl:call-template>
                </span>
              </td>
              <td class="styIRS5452TabCell">
                <span style="float:left;padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="AccumEarningsAndProfitsPaid"/>
                  </xsl:call-template>
                </span>
              </td>
              <td class="styIRS5452TabCell">
                <span style="float:left;padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="TotalEarningsAndProfitsPaid"/>
                  </xsl:call-template>
                </span>
              </td>
              <td class="styIRS5452TabCellThick">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="PercentTaxable"/>
                </xsl:call-template>
              </td>
              <td class="styIRS5452TabCell">
                <span style="float:left;padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="OtherThanEarningsAndProfitsPd"/>
                  </xsl:call-template>
                </span>
              </td>            
              <td class="styIRS5452TabCell" style="border-right:0;">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="PercentNontaxable"/>
                </xsl:call-template>
              </td>            
            </tr>
            </xsl:for-each>
            </xsl:when>
          </xsl:choose>
            <!-- filler rows -->
              <xsl:if test="((count ($FormData/CorporateDistributions)&gt;11) and ($Print=$Separated)) or (count($FormData/CorporateDistributions) &lt;1)">
                <tr>
                  <td class="styIRS5452TabCell" style="text-align:center;">&nbsp;</td>
                  <td class="styIRS5452TabCell" style="border-right:0;text-align:left;padding-left:.4mm;">$
                  <xsl:if test="(count ($FormData/CorporateDistributions)&gt;11) and ($Print=$Separated)">
                      <xsl:call-template name="PopulateAdditionalDataTableMessage">
                      <xsl:with-param name="TargetNode" select="$FormData/CorporateDistributions/TotalAmountPaid"/>
                        </xsl:call-template>
                  </xsl:if></td>
                  <td class="styIRS5452TabCell" style="width:4mm;text-align:center;"><span style="width:4px;"></span></td>
                  <td class="styIRS5452TabCellThick" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCellThick" style="text-align:right;padding-right:.4mm;">%</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>            
                  <td class="styIRS5452TabCell" style="text-align:right;padding-right:.4mm;border-right:0;">%</td>            
                </tr>  
              </xsl:if>
              <xsl:if test="((count ($FormData/CorporateDistributions)&gt;11) and ($Print=$Separated)) or (count($FormData/CorporateDistributions) &lt;2)">
                <tr>
                  <td class="styIRS5452TabCell" style="text-align:center;">&nbsp;</td>
                  <td class="styIRS5452TabCell" style="border-right:0;text-align:left;padding-left:.4mm;">$
                  </td>
                  <td class="styIRS5452TabCell" style="width:4mm;text-align:center;"><span style="width:4px;"></span></td>
                  <td class="styIRS5452TabCellThick" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCellThick" style="text-align:right;padding-right:.4mm;">%</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>            
                  <td class="styIRS5452TabCell" style="text-align:right;padding-right:.4mm;border-right:0;">%</td>            
                </tr>  
              </xsl:if>
              <xsl:if test="((count ($FormData/CorporateDistributions)&gt;11) and ($Print=$Separated)) or (count($FormData/CorporateDistributions) &lt;3)">
                <tr>
                  <td class="styIRS5452TabCell" style="text-align:center;">&nbsp;</td>
                  <td class="styIRS5452TabCell" style="border-right:0;text-align:left;padding-left:.4mm;">$
                  </td>
                  <td class="styIRS5452TabCell" style="width:4mm;text-align:center;"><span style="width:4px;"></span></td>
                  <td class="styIRS5452TabCellThick" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCellThick" style="text-align:right;padding-right:.4mm;">%</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>            
                  <td class="styIRS5452TabCell" style="text-align:right;padding-right:.4mm;border-right:0;">%</td>            
                </tr>  
              </xsl:if>
              <xsl:if test="((count ($FormData/CorporateDistributions)&gt;11) and ($Print=$Separated)) or (count($FormData/CorporateDistributions) &lt;4)">
                <tr>
                  <td class="styIRS5452TabCell" style="text-align:center;">&nbsp;</td>
                  <td class="styIRS5452TabCell" style="border-right:0;text-align:left;padding-left:.4mm;">$
                  </td>
                  <td class="styIRS5452TabCell" style="width:4mm;text-align:center;"><span style="width:4px;"></span></td>
                  <td class="styIRS5452TabCellThick" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCellThick" style="text-align:right;padding-right:.4mm;">%</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>            
                  <td class="styIRS5452TabCell" style="text-align:right;padding-right:.4mm;border-right:0;">%</td>            
                </tr>  
              </xsl:if>
              <xsl:if test="((count ($FormData/CorporateDistributions)&gt;11) and ($Print=$Separated)) or (count($FormData/CorporateDistributions) &lt;5)">
                <tr>
                  <td class="styIRS5452TabCell" style="text-align:center;">&nbsp;</td>
                  <td class="styIRS5452TabCell" style="border-right:0;text-align:left;padding-left:.4mm;">$
                  </td>
                  <td class="styIRS5452TabCell" style="width:4mm;text-align:center;"><span style="width:4px;"></span></td>
                  <td class="styIRS5452TabCellThick" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCellThick" style="text-align:right;padding-right:.4mm;">%</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>            
                  <td class="styIRS5452TabCell" style="text-align:right;padding-right:.4mm;border-right:0;">%</td>            
                </tr>  
              </xsl:if>
              <xsl:if test="((count ($FormData/CorporateDistributions)&gt;11) and ($Print=$Separated)) or (count($FormData/CorporateDistributions) &lt;6)">
                <tr>
                  <td class="styIRS5452TabCell" style="text-align:center;">&nbsp;</td>
                  <td class="styIRS5452TabCell" style="border-right:0;text-align:left;padding-left:.4mm;">$
                  </td>
                  <td class="styIRS5452TabCell" style="width:4mm;text-align:center;"><span style="width:4px;"></span></td>
                  <td class="styIRS5452TabCellThick" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCellThick" style="text-align:right;padding-right:.4mm;">%</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>            
                  <td class="styIRS5452TabCell" style="text-align:right;padding-right:.4mm;border-right:0;">%</td>            
                </tr>  
              </xsl:if>
              <xsl:if test="((count ($FormData/CorporateDistributions)&gt;11) and ($Print=$Separated)) or (count($FormData/CorporateDistributions) &lt;7)">
                <tr>
                  <td class="styIRS5452TabCell" style="text-align:center;">&nbsp;</td>
                  <td class="styIRS5452TabCell" style="border-right:0;text-align:left;padding-left:.4mm;">$
                  </td>
                  <td class="styIRS5452TabCell" style="width:4mm;text-align:center;"><span style="width:4px;"></span></td>
                  <td class="styIRS5452TabCellThick" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCellThick" style="text-align:right;padding-right:.4mm;">%</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>            
                  <td class="styIRS5452TabCell" style="text-align:right;padding-right:.4mm;border-right:0;">%</td>            
                </tr>  
              </xsl:if>
              <xsl:if test="((count ($FormData/CorporateDistributions)&gt;11) and ($Print=$Separated)) or (count($FormData/CorporateDistributions) &lt;8)">
                <tr>
                  <td class="styIRS5452TabCell" style="text-align:center;">&nbsp;</td>
                  <td class="styIRS5452TabCell" style="border-right:0;text-align:left;padding-left:.4mm;">$
                  </td>
                  <td class="styIRS5452TabCell" style="width:4mm;text-align:center;"><span style="width:4px;"></span></td>
                  <td class="styIRS5452TabCellThick" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCellThick" style="text-align:right;padding-right:.4mm;">%</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>            
                  <td class="styIRS5452TabCell" style="text-align:right;padding-right:.4mm;border-right:0;">%</td>            
                </tr>  
              </xsl:if>
              <xsl:if test="((count ($FormData/CorporateDistributions)&gt;11) and ($Print=$Separated)) or (count($FormData/CorporateDistributions) &lt;9)">
                <tr>
                  <td class="styIRS5452TabCell" style="text-align:center;">&nbsp;</td>
                  <td class="styIRS5452TabCell" style="border-right:0;text-align:left;padding-left:.4mm;">$
                  </td>
                  <td class="styIRS5452TabCell" style="width:4mm;text-align:center;"><span style="width:4px;"></span></td>
                  <td class="styIRS5452TabCellThick" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCellThick" style="text-align:right;padding-right:.4mm;">%</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>            
                  <td class="styIRS5452TabCell" style="text-align:right;padding-right:.4mm;border-right:0;">%</td>            
                </tr>  
              </xsl:if>
              <xsl:if test="((count ($FormData/CorporateDistributions)&gt;11) and ($Print=$Separated)) or (count($FormData/CorporateDistributions) &lt;10)">
                <tr>
                  <td class="styIRS5452TabCell" style="text-align:center;">&nbsp;</td>
                  <td class="styIRS5452TabCell" style="border-right:0;text-align:left;padding-left:.4mm;">$
                  </td>
                  <td class="styIRS5452TabCell" style="width:4mm;text-align:center;"><span style="width:4px;"></span></td>
                  <td class="styIRS5452TabCellThick" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCellThick" style="text-align:right;padding-right:.4mm;">%</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>            
                  <td class="styIRS5452TabCell" style="text-align:right;padding-right:.4mm;border-right:0;">%</td>            
                </tr>  
              </xsl:if>
              <xsl:if test="((count ($FormData/CorporateDistributions)&gt;11) and ($Print=$Separated)) or (count($FormData/CorporateDistributions) &lt;11)">
                <tr>
                  <td class="styIRS5452TabCell" style="text-align:center;">&nbsp;</td>
                  <td class="styIRS5452TabCell" style="border-right:0;text-align:left;padding-left:.4mm;">$
                  </td>
                  <td class="styIRS5452TabCell" style="width:4mm;text-align:center;"><span style="width:4px;"></span></td>
                  <td class="styIRS5452TabCellThick" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>
                  <td class="styIRS5452TabCellThick" style="text-align:right;padding-right:.4mm;">%</td>
                  <td class="styIRS5452TabCell" style="text-align:left;padding-left:.4mm;">$</td>            
                  <td class="styIRS5452TabCell" style="text-align:right;padding-right:.4mm;border-right:0;">%</td>            
                </tr>  
              </xsl:if>

          </tbody>
          <tfoot style="height:12mm;text-align:right;vertical-align:bottom;">
            <tr>
              <td class="styIRS5452TabCell" style="height:12mm;text-align:center;font-weight:bold;font-size:8pt;">Totals</td>
              <td class="styIRS5452TabCell" style="height:12mm;border-right:1 solid black;" colspan="2">
                <span style="float:left;padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TotalOfTotalAmountPaid"/>
                  </xsl:call-template>
                </span>
              </td>
              <!--td class="styIRS5452TabCell" style="height:12mm;">&nbsp;</td-->
              <td class="styIRS5452TabCellThick" style="height:12mm;background-color:lightgrey;">&nbsp;</td>
              <td class="styIRS5452TabCell" style="height:12mm;">
                <span style="float:left;padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TotalEarningsAndProfitsPaidCY"/>
                  </xsl:call-template>
                </span>
              </td>
              <td class="styIRS5452TabCell" style="height:12mm;">
                <span style="float:left;padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TotAccumEarningsAndProfitsPaid"/>
                  </xsl:call-template>
                </span>
              </td>
              <td class="styIRS5452TabCell" style="height:12mm;">
                <span style="float:left;padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TotTotalEarningsAndProfitsPaid"/>
                  </xsl:call-template>
                </span>
              </td>
              <td class="styIRS5452TabCellThick" style="height:12mm;background-color:lightgrey;">&nbsp;</td>
              <td class="styIRS5452TabCell" style="height:12mm;">
                <span style="float:left;padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TotOtherThanEarningsProfitsPd"/>
                  </xsl:call-template>
                </span>
              </td>            
              <td class="styIRS5452TabCell" style="height:12mm;border-right:0;background-color:lightgrey;">&nbsp;</td>      
            </tr>
          </tfoot>
         </table>
      </div>
      <!-- footer line -->
      <div style="width:187mm;">
      <span class="styBoldText" style="font-size:8pt;">For Paperwork Reduction Act Notice, see the instructions.</span> 
        <span style="width:90px;"></span>  
        Cat. No. 11881T
        <span style="width:86px;"></span>  
        Form <span class="styBoldText">5452</span>(Rev. 12-2006)
             </div><br class="pageEnd" />
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
          <xsl:with-param name="TargetNode" select="$FormData" />        
        </xsl:call-template>
      </table>
      
    <xsl:if test="($Print = $Separated) and (count($FormData/PriorYearCorpFiledForm5452) &gt;12)">
<br/>
<span class="styRepeatingDataTitle">Form 5452 Line A - Has the corporation filed a Form 5452 for a prior calendar year? </span>
<table class="styDepTbl"  style="font-size: 7pt">
	<thead class="styTableThead" />
	<tbody>
		<tr class="styDepTblRow1">
                <td class="styDepTblCell" style="text-align: left; width:50mm">If “Yes,” enter the applicable year(s):</td>
                <td class="styDepTblCell" style="text-align: left; width: 134mm">   
                  <xsl:for-each select="$FormData/PriorYearCorpFiledForm5452">
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
         
          <table cellspacing="0" style="font-size:7pt;font-family:arial;width:187mm;" cellpadding="0" class="">
           <thead style="text-align:center;" class="styTableThead">
              <tr class="styDepTblHdr">
                <td rowspan="2" class="styIRS5452TabCell" style="width:12.5mm;height:16mm;">Date Paid</td>
                <td rowspan="2" colspan="2" class="styIRS5452TabCell" style="width:28mm;height:16mm;">Total Amount Paid<br/>(Common (C),<br/>Preferred (P),<br/>Other(O))</td>
                <td rowspan="2" class="styIRS5452TabCellThick" style="width:23mm;height:16mm;">Amount<br/>Per<br/> Share</td>
                <td colspan="3" class="styIRS5452TabCell" style="width:69mm;">Amount Paid During Calendar Year From Earnings &amp; Profits<br/>Since February 28, 1913</td>
                <td rowspan="2" class="styIRS5452TabCellThick" style="width:12mm;height:16mm;">Percent<br/>Taxable</td>
                <td rowspan="2" class="styIRS5452TabCell" style="width:23mm;height:16mm;">Amount Paid During<br/>Calendar Year From<br/>Other Than Earnings<br/>&amp; Profits Since<br/>February 28, 1913</td>
                <td rowspan="2" class="styIRS5452TabCell" style="width:12mm;height:16mm;border-right:0;">Percent<br/>Nontaxable</td>
              </tr>
              <tr class="styDepTblHdr">
                <td class="styIRS5452TabCell" style="width:23mm;">From the<br/>Current Year</td>
                <td class="styIRS5452TabCell" style="width:23mm;">Accumulated</td>
                <td class="styIRS5452TabCell" style="width:23mm;">Total</td>
              </tr>
          </thead>
          <tbody style="text-align:right;vertical-align:bottom;">
            <xsl:for-each select="$FormData/CorporateDistributions">
            <tr>
             <xsl:attribute name="class">
  		           <xsl:choose>
                  <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                  <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
              <td class="styIRS5452TabCell" style="text-align:center;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="DatePaid"/>
                </xsl:call-template>
              </td>
              <td class="styIRS5452TabCell" style="width:24mm;border-right:0;">
                <span style="float:left;padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="TotalAmountPaid"/>
                  </xsl:call-template>
                </span>
              </td>
              <td class="styIRS5452TabCell" style="width:4mm;text-align:center;">
                (<xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="TotalAmountPaid/@type"/>
                </xsl:call-template>)
              </td>
              <td class="styIRS5452TabCellThick">
                <span style="float:left;padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:choose> 
          		<xsl:when test="AmountPerShare">
		            <xsl:call-template name="PopulateAmount">
		              <xsl:with-param name="TargetNode" select="AmountPerShare" />
		            </xsl:call-template>  
		          </xsl:when> 
		          <xsl:otherwise>
		            <xsl:call-template name="PopulateText">
		              <xsl:with-param name="TargetNode" select="AmountPerShareDecimal" />
		            </xsl:call-template>  
		          </xsl:otherwise>
		        </xsl:choose> 
                </span>
              </td>
              <td class="styIRS5452TabCell">
                <span style="float:left;padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="EarningsAndProfitsPaidFromCY"/>
                  </xsl:call-template>
                </span>
              </td>
              <td class="styIRS5452TabCell">
                <span style="float:left;padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="AccumEarningsAndProfitsPaid"/>
                  </xsl:call-template>
                </span>
              </td>
              <td class="styIRS5452TabCell">
                <span style="float:left;padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="TotalEarningsAndProfitsPaid"/>
                  </xsl:call-template>
                </span>
              </td>
              <td class="styIRS5452TabCellThick">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="PercentTaxable"/>
                </xsl:call-template>
              </td>
              <td class="styIRS5452TabCell">
                <span style="float:left;padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="OtherThanEarningsAndProfitsPd"/>
                  </xsl:call-template>
                </span>
              </td>            
              <td class="styIRS5452TabCell" style="border-right:0;">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="PercentNontaxable"/>
                </xsl:call-template>
              </td>            
            </tr>
            </xsl:for-each>
          </tbody>
          <tfoot style="height:8mm;text-align:right;vertical-align:bottom;">
            <tr class="styDepTblHdr">
              <td class="styIRS5452TabCell" style="height:8mm;text-align:center;font-weight:bold;font-size:8pt;">Totals</td>
              <td class="styIRS5452TabCell" style="height:8mm;border-right:1 solid black;" colspan="2">
                <span style="float:left;padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TotalOfTotalAmountPaid"/>
                    <xsl:with-param name="WhiteFont">true</xsl:with-param>                  
                  </xsl:call-template>
                </span>
              </td>
              <!--td class="styIRS5452TabCell" style="height:12mm;">&nbsp;</td-->
              <td class="styIRS5452TabCellThick" style="height:8mm;background-color:lightgrey;">&nbsp;</td>
              <td class="styIRS5452TabCell" style="height:8mm;">
                <span style="float:left;padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TotalEarningsAndProfitsPaidCY"/>
                    <xsl:with-param name="WhiteFont">true</xsl:with-param>                  
                  </xsl:call-template>
                </span>
              </td>
              <td class="styIRS5452TabCell" style="height:8mm;">
                <span style="float:left;padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TotAccumEarningsAndProfitsPaid"/>
                     <xsl:with-param name="WhiteFont">true</xsl:with-param>                  
                 </xsl:call-template>
                </span>
              </td>
              <td class="styIRS5452TabCell" style="height:8mm;">
                <span style="float:left;padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TotTotalEarningsAndProfitsPaid"/>
                    <xsl:with-param name="WhiteFont">true</xsl:with-param>                  
                  </xsl:call-template>
                </span>
              </td>
              <td class="styIRS5452TabCellThick" style="height:8mm;background-color:lightgrey;">&nbsp;</td>
              <td class="styIRS5452TabCell" style="height:8mm;">
                <span style="float:left;padding-left:.4mm;">$</span>
                <span style="float:right;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TotOtherThanEarningsProfitsPd"/>
                    <xsl:with-param name="WhiteFont">true</xsl:with-param>                  
                  </xsl:call-template>
                </span>
              </td>            
              <td class="styIRS5452TabCell" style="height:8mm;border-right:0;background-color:lightgrey;">&nbsp;</td>      
            </tr>
          </tfoot>
          </table>
         
         
         
         
         
       </xsl:if>        
    </form>
  </body>          
</html>            
              
</xsl:template>



</xsl:stylesheet>