<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8586Style.xsl"/>
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form8586Data" select="$RtnDoc/IRS8586"/>
  <xsl:variable name="containerHeight" select="5"/>
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form8586Data)"/>
          </xsl:call-template>
        </title>
        <!-- No Browser Caching -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <meta name="Description" content="Form 8586"/>
        <META name="GENERATOR" content="IBM WebSphere Studio"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <!--********************************************************************************************
                HINTS: Line 2 (i) and 9 (i) to adjust these go to the Additional Data Section.
                           As of TY2008 there is no separated print for line 2(i)-(iv) and line 9(i)-(iv)
                           because the limit is 4 for (i) - (iv).
          ************************************************************************************************ -->
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS8586Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form id="Form8586">
          <xsl:call-template name="DocumentHeader"/>
          <div class="styTBB" style="width:187mm;">
            <div class="styFNBox" style="width:33mm;height:24mm;">
              <div style="height:11mm;">Form<span class="styFormNumber"> 8586</span>
                <br/>
				<xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$Form8586Data"/>
					<xsl:with-param name="TabOrder" select="2"/>
				</xsl:call-template>
              </div>
              <span class="styAgency">(Rev. December 2016)</span><br/>
              <div style="line-height:1">             
                <span class="styAgency">Department of the Treasury</span><br/>
                <span class="styAgency">Internal Revenue Service<br/> (99)</span>
              </div>
            </div>
        <div class="styFTBox" style="width:115mm;height:24mm;"><br/><br/>
          <div class="styMainTitle" >Low-Income Housing Credit</div>
          <br/>
        <div class="styFBT" style="font-size: 8pt; font-weight: normal; margin-top: 0px; ">
  
          <img src="{$ImagePath}/8586_Bullet_Title.gif"  alt="Arrow Bullet" />
	       <b>Attach to your tax return.</b>
				 <div class="styFST" >
					<img src="{$ImagePath}/8586_Bullet_Title.gif" alt="Arrow Bullet"/>
          Information about Form 8586 and its instructions is at <a href="http://www.irs.gov/form8586" title="Link to IRS.gov"><i>www.irs.gov/form8586</i></a>.
				</div>  
        </div>
       </div>
            <div class="styTYBox" style="width:38mm;height:24mm;">
              <div class="styOMB" style="height:5mm;font-size:9pt;">OMB No.1545-0984</div>
              <div class="styTaxYear" style="height:10.1mm;font-size:24pt;padding-top:0mm;padding-bottom:0mm;"></div>
              <div style="height:5mm;padding-left:5mm;text-align:left;border-bottom-width:25px; font-size:8pt;">
                 Attachment Sequence No. <span class="styBoldText">36a</span>
              </div>
            </div>
          </div>
          <!-- End Form title -->
          <!--Start Name and EIN Line-->
          <div class="styBB" style="width:187mm; height:10mm">
            <div class="styNameBox" style="font-size:7pt; width:151mm; height:10mm">
              Name(s) shown on return<br/>
  		  <xsl:choose>
  		    <xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
  		      <br/>
  		      <xsl:call-template name="PopulateReturnHeaderFiler">
  		            <xsl:with-param name="TargetNode">Name</xsl:with-param>
  		              </xsl:call-template>
  		            </xsl:when>
                    <xsl:otherwise>
  		      <xsl:call-template name="PopulateReturnHeaderFiler">
  		            <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
  		              </xsl:call-template>
  		              <br/> 
  		              <xsl:call-template name="PopulateReturnHeaderFiler">
  		            <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
  		              </xsl:call-template>		
                    </xsl:otherwise>
                    </xsl:choose>
            </div>
            <div style="height:8mm;padding-left:2mm;font-size:7pt;font-family:verdana;" class="styEINBox">
          Identifying number<br/>
              <br/>
              <span style="font-weight:normal;">
		<xsl:choose>
		  <xsl:when test="$RtnHdrData/ReturnTypeCd='1040'">
		<xsl:call-template name="PopulateReturnHeaderFiler">
		      <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
		</xsl:call-template>
		  </xsl:when>
		  <xsl:otherwise>
		<xsl:call-template name="PopulateReturnHeaderFiler">
		  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
		</xsl:call-template>
		  </xsl:otherwise>
		</xsl:choose>
              </span>
            </div>
          </div>
          <!-- BEGIN Part I Line Items -->
          <!-- Start Part I - Header -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartName" style="height:5mm;padding-top:1mm">Part I</div>
            <div class="styPartDesc" style="width:170mm; padding-left:3mm;padding-top:1mm; font-size:8pt">
              Buildings Placed in Service Before 2008
            </div>
          </div>
          <!-- end Part I - Header -->
          <!-- Start Line 1 row 1-->
          <div style="width:187mm">
            <div class="styLNLeftNumBoxSD">1</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left">Number of Forms 8609-A attached for buildings placed in service before</span>           
            </div>
            <div class="styLNRightNumBoxNBB" style="background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style="width:20mm"/>
          </div>
          <!-- End Line 1row 1 -->
          <!-- Start Line 1 row 2-->
          <div style="width:187mm">
            <div class="styLNLeftNumBoxSD"/>
            <div class="styLNDesc" style="width:139mm;">
            <span style="float:left">2008</span>
              <!--Dotted Line--> 
              <div class="styDotLn" style="float:left;padding-right:1mm;">........................
				<span style="float:right; margin-right:2mm;">
					<img src="{$ImagePath}/8586_Bullet_L1.gif" alt="Arrow Bullet"/>
				</span>
             </div>  
            
            <div class="styFixedUnderline" style="width:27mm; margin-right:3mm;text-align:right;"><!--styIRS8586DotBB-->
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form8586Data/Forms8609AAttachedBfr2008Cnt"/>
              </xsl:call-template>
            </div>
            </div>
            <div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style="height:7mm; width:20mm" />
          </div>
          <!-- End Line 1 row 2-->
          <!-- Start Line 2 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD">2</div>
            <div class="styLNDesc" style="width:139mm; height:auto;">
              Has there been a decrease in the qualified basis of any buildings accounted for on line 1 since the close of the preceding tax year?
              <span style="width:2mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/DecrInQlfyBssOfBldgsBF2008Ind"/>
                </xsl:call-template>
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form8586Data/DecrInQlfyBssOfBldgsBF2008Ind"/>
                  </xsl:call-template>
                </input>
              </span>
              <span style="width:1mm;"/>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/DecrInQlfyBssOfBldgsBF2008Ind"/>
                </xsl:call-template>
                <b> Yes </b>
              </label>
              <span style="width:2mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/DecrInQlfyBssOfBldgsBF2008Ind"/>
                </xsl:call-template>
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form8586Data/DecrInQlfyBssOfBldgsBF2008Ind"/>
                  </xsl:call-template>
                </input>
              </span>
              <span style="width:1mm;"/>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/DecrInQlfyBssOfBldgsBF2008Ind"/>
                </xsl:call-template>
                <b>No </b>
              </label>
              <span style="width:2mm;"/>  
                If "Yes," enter the building identification numbers (BINs) of the buildings that had a decreased basis. If you need more space, attach a schedule.
                <span style="width:1mm;"/>
              <!--Push Pin Image -->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form8586Data/BldgIdOfBldgWithDecreasedBasis"/>
              </xsl:call-template>
           </div>
          <div class="styGenericDiv">
              <div class="styLNRightNumBoxNBB" style="width:8mm;height:12mm;padding-top:0px; background-color:lightgrey"/>
              <div class="styLNAmountBoxNBB" style="width:20mm;height:12mm;padding-top:0px;"/>
            </div>
			<div class="styLNLeftNumBoxSD"/>
          <xsl:variable name="ESCount" select="count($Form8586Data/BldgIdOfBldgWithDecreasedBasis/BIN)"/>
          <xsl:variable name="preMax">
            <xsl:choose>
              <xsl:when test="$ESCount mod 4 = 0">
                <xsl:value-of select="$ESCount div 4"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="ceiling($ESCount div 4)"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <div class="styIRS8586TableContainer" id="part1TPctn" style="">
            <xsl:attribute name="style">
				<xsl:if test="$ESCount &gt; $containerHeight">height:4mm;</xsl:if>
			</xsl:attribute>
            <table class="styIRS8586Table" cellpadding="0" cellspacing="0" border="0" style="">
              <xsl:choose>
              <xsl:when test="($Print!=$Separated) or (($Print = $Separated) and (count($Form8586Data/BldgIdOfBldgWithDecreasedBasis/BIN) &lt;5))">
                  <xsl:call-template name="partI3bLoop">
                    <xsl:with-param name="ESCount" select="$ESCount"/>
                    <xsl:with-param name="max">
                      <xsl:choose>
                        <xsl:when test="$preMax = 0">
                          <xsl:value-of select="1"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="$preMax"/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
			<xsl:if test="($Print = $Separated) and (count($Form8586Data/BldgIdOfBldgWithDecreasedBasis/BIN) &gt;4)">
			<xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="TargetNode" select="$Form8586Data/BldgIdOfBldgWithDecreasedBasis"/>
            </xsl:call-template>
            <div class="styGenericDiv" style="width:139mm">
             <span style="width:6mm;font-weight:bold;">
				 (i)
             </span>
			<span style="width:25mm;border-bottom:1px black solid"/>
			<span style="width:1mm"/>
            <span style="width:6mm;font-weight:bold">
				(ii)
			</span>
			<span style="width:25mm;border-bottom:1px black solid"/>
			<span style="width:2mm"/>
			<span style="width:6mm;font-weight:bold">
			  (iii)
			</span>
			<span style="width:25mm;border-bottom:1px black solid"/>
			<span style="width:2mm"/>
            <span style="width:6mm;font-weight:bold">
			  (iv)
			</span>
			<span style="width:25mm;border-bottom:1px black solid"/>
			<span style="width:9.8mm;"/>
			<span style="width:8.5mm;height:5mm;background-color:lightgrey;border-left:1px solid black; border-right:1px solid black"/>
         </div>
         <br/>
      </xsl:if>
      </xsl:otherwise>
      </xsl:choose>
     
    </table> 
    </div>
    </div>
          <!-- End Line 2 -->
          <!-- Start Line 3 -->
          <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD">3</div>
              <div class="styLNDesc" style="width:139mm;">
              Current year credit from attached Form(s) 8609-A for buildings placed in service before 2008 
              <!--<span style="float:left">-->(see instructions)
              <!--Push Pin image -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form8586Data/CurrentYearCreditBfr2008Amt"/>
                  </xsl:call-template>
                <!--</span>-->
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">.................................</div>
            </div>
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">3</div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;width:28mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/CurrentYearCreditBfr2008Amt"/>
                </xsl:call-template>
              </div>
          </div>
          <!-- End Line 3 -->
          <!-- Start Line 4 -->
          <div style="width:187mm">
              <div class="styLNLeftNumBoxSD">4</div>
              <div class="styLNDesc" style="width:139mm;">
                Low-income housing credit for buildings placed in service before 2008 from partnerships, S corporations, 
                estates, and trusts 
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">...........................</div>        
              </div>
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">4</div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;width:28mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/LowIncomeHousingCrBF2008Amt"/>
                </xsl:call-template>
              </div>     
          </div>
          <!-- End Line 4 -->
          <!-- Start Line 5 -->
          <div style="width:187mm">
              <div class="styLNLeftNumBoxSD">5</div>
              <div class="styLNDesc" style="width:139mm;">
                Add lines 3 and 4. Estates and trusts, go to line 6. Partnerships and S corporations, stop here 
                and report this amount on Schedule K. All others, stop here and report this amount on Form 3800, 
				Part III, line 1d, column (c)
				  <div class="styDotLn" style="float:right;padding-right:1mm;">...............................</div>  
			 </div>
              <div class="styLNRightNumBox" style="height:9mm;padding-top:4mm;">5</div>
              <div class="styLNAmountBox" style="height:9mm;padding-top:4mm;width:28mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/LowIncmHsnCrPlusCurYrCrBF08Amt"/>
                </xsl:call-template>
              </div>
          </div>
          <!-- End Line 5 -->
          <!-- Start Line 6 -->
          <div style="width:187mm">
              <div class="styLNLeftNumBoxSD" style="padding-top:4mm;">6</div>
              <div class="styLNDesc" style="width:139mm;padding-top:4mm;">
                <span style="float:left;">Amount allocated to beneficiaries of the estate or trust (see instructions) </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
              </div>
              <div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">6</div>
              <div class="styLNAmountBox" style="height:6mm;padding-top:2mm;width:28mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/AllocatedtoBeneficiariesAmt"/>
                </xsl:call-template>
              </div>
          </div>
          <!-- End Line 6 -->
          <!-- Start Line 7 -->
          <div class="styBB" style="width:187mm">
              <div class="styLNLeftNumBoxSD" style="padding-top:2mm;">7</div>
              <div class="styLNDesc" style="width:139mm;padding-top:2mm;">
                <span style="float:left;">Estates and trusts, subtract line 6 from line 5. Report this amount on Form 3800,
                Part III, line 1d, column (c)</span>
              </div>
              <div class="styLNRightNumBox" style="height:6mm;padding-top:2mm;">7</div>
              <div class="styLNAmountBox" style="height:6mm;padding-top:2mm;width:28mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/PassiveActyOrTotCurrYrCrAmt"/>
                </xsl:call-template>
              </div>
         
          </div>
          <!-- End Line 7 -->
          <!-- Start Part II - Header -->
          <div class="styBB" style="width:187mm;">
            <span class="styPartName" style="height:5mm; padding-top:1mm">Part II</span>
            <span class="styPartDesc" style="width:170mm;padding-left:2mm; padding-top:1mm; font-size:8pt">
              Buildings Placed in Service After 2007
            </span>
          </div>
          <!-- end Part II - Header -->
          <!-- Start Line 8 row 1-->
          <div style="width:187mm">
            <div class="styLNLeftNumBoxSD">8</div>
            <div class="styLNDesc" style="width:139mm;">
              <span style="float:left">Number of Forms 8609-A attached for buildings placed in service after </span>
            </div>
            <div class="styLNRightNumBoxNBB" style="background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style=" width:28mm"/>
          </div>
          <!-- End Line 8 row 1 -->
          <!-- Start Line 8 row 2-->
          <div style="width:187mm">
            <div class="styLNLeftNumBoxSD"/>
            <div class="styLNDesc" style="width:139mm;">
				<span style="float:left">2007</span>
				  <!--Dotted Line--> 
				  <div class="styDotLn" style="float:left;padding-right:1mm;">........................
					<span style="float:right; margin-right:2mm;">
						<img src="{$ImagePath}/8586_Bullet_L1.gif" alt="Arrow Bullet"/>
					</span>
				  </div>        
				 <div class="styFixedUnderline" style="width:27mm; margin-right:3mm;text-align:right;">
					  <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$Form8586Data/Forms8609AAttachedAftr2007Cnt"/>
					  </xsl:call-template>
				 </div>
            </div>
            <div class="styLNRightNumBoxNBB" style="height:6mm;background-color:lightgrey"/>
            <div class="styLNAmountBoxNBB" style="height:6mm; width:20mm"/>
          </div>
          <!-- End Line 8 row 2-->
          <!-- Start Line 9 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD">9</div>
            <div class="styLNDesc" style="width:139mm;height:auto;">
              Has there been a decrease in the qualified basis of any buildings accounted for on line 8 since the close of the preceding tax year?
              <span style="width:2mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/DecrQlfyBssOfBldgsAF2007Ind"/>
                </xsl:call-template>
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form8586Data/DecrQlfyBssOfBldgsAF2007Ind"/>
                  </xsl:call-template>
                </input>
              </span>
              <span style="width:1mm;"/>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/DecrQlfyBssOfBldgsAF2007Ind"/>
                </xsl:call-template>
                <b> Yes </b>
              </label>
              <span style="width:2mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/DecrQlfyBssOfBldgsAF2007Ind"/>
                </xsl:call-template>
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form8586Data/DecrQlfyBssOfBldgsAF2007Ind"/>
                  </xsl:call-template>
                </input>
              </span>
              <span style="width:1mm;"/>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/DecrQlfyBssOfBldgsAF2007Ind"/>
                </xsl:call-template>
                <b>No </b>
              </label>
              <span style="width:2mm;"/>  
                If "Yes," enter the building identification numbers (BINs) of the buildings that had a decreased basis. If you need more space, attach a schedule.
                <span style="width:1mm;"/>
              <!--Push Pin Image -->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form8586Data/DecrInQlfyBasisOfBldgsAF2007"/>
              </xsl:call-template>
            </div>
            <div class="stygenericDiv">
              <div class="styLNRightNumBoxNBB" style="width:8mm;height:12mm; background-color:lightgrey"/>
              <div class="styLNAmountBoxNBB" style="width:28mm;height:12mm"/>
            </div>
            
          <!--Start (i) row -->
          <xsl:variable name="ES9Count" select="count($Form8586Data/DecrInQlfyBasisOfBldgsAF2007/BIN)"/>
          <xsl:variable name="preMax9">
            <xsl:choose>
              <xsl:when test="$ES9Count mod 4 = 0">
                <xsl:value-of select="$ES9Count div 4"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="ceiling($ES9Count div 4)"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <div class="styIRS8586TableContainer" id="part1TPctn" style="">
            <xsl:attribute name="style"><xsl:if test="$ES9Count &gt; $containerHeight">
            height:4mm;  
          </xsl:if></xsl:attribute>
            <!-- print logic -->
            <!--      <xsl:call-template name="SetInitialState"/>-->
            <!-- end -->
            <table class="styIRS8586Table" cellpadding="0" cellspacing="0" border="0" style="">
              <xsl:choose>
                <xsl:when test="($Print!=$Separated) or (($Print = $Separated) and (count($Form8586Data/DecrInQlfyBasisOfBldgsAF2007/BIN) &lt;5))">
                  <xsl:call-template name="partII9bLoop">
                    <xsl:with-param name="ES9Count" select="$ES9Count"/>
                    <xsl:with-param name="max">
                      <xsl:choose>
                        <xsl:when test="$preMax9 = 0">
                          <xsl:value-of select="1"/>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="$preMax9"/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                 <xsl:otherwise>
			<xsl:if test="($Print = $Separated) and (count($Form8586Data/BldgIdOfBldgWithDecreasedBasis/BIN) &gt;4)">
			<xsl:call-template name="PopulateAdditionalDataTableMessage">
                <xsl:with-param name="TargetNode" select="$Form8586Data/DecrInQlfyBasisOfBldgsAF2007/BIN"/>
            </xsl:call-template>
            <div class="styGenericDiv">
             <span style="width:6mm;font-weight:bold;">
          (i)
			  </span>
                    <span style="width:25mm;border-bottom:1px black solid"/>
                    <span style="width:2mm"/>
                    <span style="width:6mm;font-weight:bold">
          (ii)
      </span>

                    <span style="width:25mm;border-bottom:1px black solid"/>
                    <span style="width:2mm"/>
                    <span style="width:6mm;font-weight:bold">
          (iii)
      </span>
 
                    <span style="width:25mm;border-bottom:1px black solid"/>
                    <span style="width:2mm"/>
                    <span style="width:6mm;font-weight:bold">
          (iv)
      </span>

                    <span style="width:25mm;border-bottom:1px black solid"/>
                    <span style="width:10mm;"/>
                    <span style="width:8mm;height:5mm;background-color:lightgrey;border-left:1px solid black; border-right:1px solid black"/>

                    </div>
                  <br/>
                  </xsl:if>
                </xsl:otherwise>
              </xsl:choose>
            </table>
          </div>
          </div>
          <!-- End Line 9 -->
          <!-- Start Line 10 -->
          <div style="width:187mm">
              <div class="styLNLeftNumBoxSD">10</div>
              <div class="styLNDesc" style="width:139mm;">
              Current year credit from attached Form(s) 8609-A for buildings placed in service after 2007 (see instructions)
              
              <!--Push Pin image -->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form8586Data/CurrentYearCreditAftr2007Amt"/>
                  </xsl:call-template>
                
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">..............................</div>
            </div>
              <div class="styLNRightNumBox" style="width:8mm; height:8mm;padding-top:4mm;">10</div>
              <div class="styLNAmountBox" style="width:28mm; height:8mm;padding-top:4mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/CurrentYearCreditAftr2007Amt"/>
                </xsl:call-template>
              </div>
          </div>
          <!-- End Line 10 -->
          <!-- Start Line 11 -->
          <div style="width:187mm">
              <div class="styLNLeftNumBoxSD">11</div>
              <div class="styLNDesc" style="width:139mm;">
                Low-income housing credit for buildings placed in service after 2007 from partnerships, S corporations, 
                <span style="float:left;">estates, and trusts </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">.......................</div>                
            </div>
              <div class="styLNRightNumBox" style="width:8mm; height:8mm;padding-top:4mm;">11</div>
              <div class="styLNAmountBox" style="width:28mm; height:8mm;padding-top:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/LowIncomeHousingCrAF2007Amt"/>
                </xsl:call-template>
              </div>
          </div>
          <!-- End Line 11 -->
          <!-- Start Line 12 -->
          <div style="width:187mm">
              <div class="styLNLeftNumBoxSD">12</div>
              <div class="styLNDesc" style="width:139mm;">
                Add lines 10 and 11. Estates and trusts, go to line 13. Partnerships and S corporations, stop here and
                report this amount on Schedule K. All others, stop here and report this amount on Form 3800,
                Part III, line 4d, column (c)
                    <!--Dotted Line-->
                    <span style="letter-spacing:4mm;font-weight:bold;float:right;padding-right:1mm;skiplink:display:none;">.......................</span> 
            </div>
              <div class="styLNRightNumBox" style="width:8mm; height:9mm;padding-top:5mm;">12</div>
              <div class="styLNAmountBox" style="width:28mm; height:9mm;padding-top:5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/LowIncmHsnCrPlusCurYrCrAF07Amt"/>
                </xsl:call-template>
              </div>
          </div>
          <!-- End Line 12 -->
          <!-- Start Line 13 -->
          <div style="width:187mm">
              <div class="styLNLeftNumBoxSD" style="padding-top:2mm;">13</div>
              <div class="styLNDesc" style="width:139mm;padding-top:2mm;">
                <span style="float:left;">Amount allocated to beneficiaries of the estate or trust (see instructions) </span>
                <!--Dotted Line-->
                <div class="styDotLn" style="float:right;padding-right:1mm;">...........</div>                
              </div>
              <div class="styLNRightNumBox" style="width:8mm; height:5mm;padding-top:2mm;">13</div>
              <div class="styLNAmountBox" style="width:28mm; height:5mm;padding-top:2mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/AllocToBeneficiariesAmt"/>
                </xsl:call-template>
              </div>
          </div>
          <!-- End Line 13 -->
          <!-- Start Line 14 -->
          <div style="width:187mm">
              <div class="styLNLeftNumBoxSD" style="height:6mm;padding-top:2mm;">14</div>
              <div class="styLNDesc" style="height:6mm; width:139mm;padding-top:2mm;">
                <span style="float:left;">Estates and trusts, subtract line 13 from line 12. Report this amount on Form 3800, 
                Part III, line 4d,column (c)
                </span>
              </div>
              <div class="styLNRightNumBox" style="width:8mm; height:6mm;padding-top:2mm;">14</div>
              <div class="styLNAmountBox" style="width:28mm; height:6mm;padding-top:2mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form8586Data/EstatesAndTrustsResultAmt"/>
                </xsl:call-template>
              </div>
          </div>
          <!-- End Line 14 -->
          <!-- Start Page footer -->
          <div style="border-style: solid; border-width:1px ; border-left-width:0px;border-right-width:0px; border-bottom-width:0px; font-size:7pt; width:187mm">
            <div style="font-weight:bold; float:left;">
              <span class="styBoldText" style="font-size: 7pt">For Paperwork Reduction Act Notice, see General Instructions.</span>
            </div>
            <div style="float:right">
              Cat. No. 63987I
              <span style="width:30mm"/>
                Form <b style="font-size:8pt">8586</b> Rev. (12-2016)
            </div>
          </div>
          <div class="pageEnd"/>
          <p style="page-break-before:always"/>
          <!-- end Page footer -->
          <!--Start ADDITIONAL DATA PAGE -->
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
              <xsl:with-param name="TargetNode" select="$Form8586Data"/>
            </xsl:call-template>
          </table>
          <!-- end ADDITIONAL DATA PAGE -->
          <!--start Separated Print for Part I, Line 2: HINTS:as of TY2008 there is no separated print for Part 1, Line 2(i) - (iv) -->
          <xsl:if test="($Print = $Separated) and (count($Form8586Data/BldgIdOfBldgWithDecreasedBasis/BIN) &gt;4)">
            <br/>
            <span class="styRepeatingDataTitle">Form 8586, Part I, Line 2 - Building Identification Numbers</span>
            <table class="styDepTbl" style="font-size: 7pt">
              <thead class="styTableThead"/>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$Form8586Data/BldgIdOfBldgWithDecreasedBasis">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <th style="width:12mm; text-align: left">
          (<xsl:number value="position()" format="i"/>)
      </th>
                    <td style="text-align:left;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="."/>
                      </xsl:call-template>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
          <!--start Separated Print for Part II, Line 9 HINTS:as of TY2008 there is no separated print for Part 2, Line 9(i) - (iv)-->
          <xsl:if test="($Print = $Separated) and (count($Form8586Data/DecrInQlfyBasisOfBldgsAF2007) &gt;4)">
            <br/>
            <span class="styRepeatingDataTitle">Form 8586, Part II, Line 9 - Building Identification Numbers</span>
            <table class="styDepTbl" style="font-size: 7pt">
              <thead class="styTableThead"/>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$Form8586Data/DecrInQlfyBasisOfBldgsAF2007">
                  <tr>
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <th style="width:12mm; text-align: left">
          (<xsl:number value="position()" format="i"/>)
      </th>
                    <td style="text-align:left;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="."/>
                      </xsl:call-template>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
        </form>
      </body>
    </html>
  </xsl:template>
  <!--*******************
       Part I line 2(i)-(iv)
       *******************-->
  <xsl:template name="partI3bLoop">
    <xsl:param name="index" select="1"/>
    <xsl:param name="max"/>
    <xsl:if test="$index &lt;= $max">
	<div class="styGenericDiv" style="width:140mm;height:auto;">
        <div class="styGenericDiv" style="width:6mm;font-weight:bold;">
          <xsl:if test="(($Form8586Data/BldgIdOfBldgWithDecreasedBasis/BIN[$index*4-3]) or ($index*4-3 &lt; 5)) and (($index*4-3) &lt; 5)">
          (<xsl:number value="$index*4-3" format="i"/>)
        </xsl:if>
        </div>
        <div class="styGenericDiv" style="text-align:left;width:20mm;">
          <xsl:if test="($Form8586Data/BldgIdOfBldgWithDecreasedBasis/BIN[$index*4-3]) or ($index*4-3 &lt; 5)">
            
          
          <div style="width:20mm; border-bottom:1px solid black">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form8586Data/BldgIdOfBldgWithDecreasedBasis/BIN[$index*4-3]"/>
          </xsl:call-template>
          </div>
          </xsl:if>
        </div>
        <div class="styGenericDiv" style="width:2mm"/>
        <div class="styGenericDiv" style="width:6mm;font-weight:bold">
          <xsl:if test="(($Form8586Data/BldgIdOfBldgWithDecreasedBasis/BIN[$index*4-2]) or ($index*4-3 &lt; 5)) and (($index*4-3) &lt; 5)">
          (<xsl:number value="$index*4-2" format="i"/>)
			</xsl:if>
        </div>
        <div class="styGenericDiv" style="text-align:left;width:20mm;">
          <xsl:if test="($Form8586Data/BldgIdOfBldgWithDecreasedBasis/BIN[$index*4-2]) or ($index*4-3 &lt; 5)">
          
          <div style="width:20mm; border-bottom:1px solid black">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form8586Data/BldgIdOfBldgWithDecreasedBasis/BIN[$index*4-2]"/>
          </xsl:call-template>
          </div>
          </xsl:if>
        </div>  
        <div class="styGenericDiv" style="width:2mm"/>
        <div class="styGenericDiv" style="width:6mm;font-weight:bold;">
          <xsl:if test="(($Form8586Data/BldgIdOfBldgWithDecreasedBasis/BIN[$index*4-1]) or ($index*4-3 &lt; 5)) and (($index*4-3) &lt; 5)">
          (<xsl:number value="$index*4-1" format="i"/>)
        </xsl:if>
        </div>
        <div class="styGenericDiv" style="text-align:left;width:22mm">
			<xsl:if test="($Form8586Data/BldgIdOfBldgWithDecreasedBasis/BIN[$index*4-1]) or ($index*4-3 &lt; 5)">
          
          <div style="width:20mm; border-bottom:1px solid black">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form8586Data/BldgIdOfBldgWithDecreasedBasis/BIN[$index*4-1]"/>
          </xsl:call-template>
          </div>
          </xsl:if>
        </div>
        <div class="styGenericDiv" style="width:2mm"/>
        <div class="styGenericDiv" style="width:6mm;font-weight:bold">
          <xsl:if test="(($Form8586Data/BldgIdOfBldgWithDecreasedBasis/BIN[$index*4]) or ($index*4-3 &lt; 5)) and (($index*4-3) &lt; 5)">
          (<xsl:number value="$index*4" format="i"/>)
        </xsl:if>
        </div>
        <div class="styGenericDiv" style="text-align:left;width:23mm;">
          <xsl:if test="($Form8586Data/BldgIdOfBldgWithDecreasedBasis/BIN[$index*4]) or ($index*4-3 &lt; 5)">
          <div style="width:20mm; border-bottom:1px solid black">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form8586Data/BldgIdOfBldgWithDecreasedBasis/BIN[$index*4]"/>
          </xsl:call-template>
          </div>
          </xsl:if>
        </div>
        </div>
        <div class="styGenericDiv" style="width:35mm;height:6mm">
			        <div class="styLNRightNumBoxNBB" style="border-left:1px solid black;border-right:1px; width:8mm; background-color:lightgrey;height:6mm"/>
			<div class="styLNAmountBoxNBB" style="height:6mm;width:25mm"/>
		</div>
      <xsl:call-template name="partI3bLoop">
        <xsl:with-param name="index" select="$index+1"/>
        <xsl:with-param name="max" select="$max"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  <!-- **********************
        Part II,Line 9(i)-(iv)
        ********************** -->
  <xsl:template name="partII9bLoop">
     <xsl:param name="index" select="1"/>
    <xsl:param name="max"/>
    <xsl:if test="$index &lt;= $max">
	<div class="styGenericDiv" style="width:140mm;height:auto;">
        <div class="styGenericDiv" style="width:6mm;font-weight:bold;">
          <xsl:if test="(($Form8586Data/DecrInQlfyBasisOfBldgsAF2007/BIN[$index*4-3]) or ($index*4-3 &lt; 5)) and (($index*4-3) &lt; 5)">
          (<xsl:number value="$index*4-3" format="i"/>)
        </xsl:if>
        </div>
        <div class="styGenericDiv" style="text-align:left;width:20mm;"> 
          <xsl:if test="($Form8586Data/DecrInQlfyBasisOfBldgsAF2007/BIN[$index*4-3]) or ($index*4-3 &lt; 5)">
          
          <div style="width:20mm;border-bottom:1px solid black">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form8586Data/DecrInQlfyBasisOfBldgsAF2007/BIN[$index*4-3]"/>
          </xsl:call-template>
          </div>
          </xsl:if>
        </div>
        <div class="styGenericDiv" style="width:2mm"/>
        <div class="styGenericDiv" style="width:6mm;font-weight:bold">
          <xsl:if test="(($Form8586Data/DecrInQlfyBasisOfBldgsAF2007/BIN[$index*4-2]) or ($index*4-3 &lt; 5)) and (($index*4-3) &lt; 5)">
          (<xsl:number value="$index*4-2" format="i"/>)
			</xsl:if>
        </div>
        <div class="styGenericDiv" style="text-align:left;width:20mm;">
          <xsl:if test="($Form8586Data/DecrInQlfyBasisOfBldgsAF2007/BIN[$index*4-2]) or ($index*4-3 &lt; 5)">
           
          
          <div style="width:20mm; border-bottom:1px solid black">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form8586Data/DecrInQlfyBasisOfBldgsAF2007/BIN[$index*4-2]"/>
          </xsl:call-template>
          </div>
          </xsl:if>
        </div>
        
        <div class="styGenericDiv" style="width:2mm"/>
        <div class="styGenericDiv" style="width:6mm;font-weight:bold;">
          <xsl:if test="(($Form8586Data/DecrInQlfyBasisOfBldgsAF2007/BIN[$index*4-1]) or ($index*4-3 &lt; 5)) and (($index*4-3) &lt; 5)">
          (<xsl:number value="$index*4-1" format="i"/>)
        </xsl:if>
        </div>
        <div class="styGenericDiv" style="text-align:left;width:20mm">
			<xsl:if test="($Form8586Data/DecrInQlfyBasisOfBldgsAF2007/BIN[$index*4-1]) or ($index*4-3 &lt; 5)">
          
          <div style="width:20mm; border-bottom:1px solid black">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form8586Data/DecrInQlfyBasisOfBldgsAF2007/BIN[$index*4-1]"/>
          </xsl:call-template>
          </div>
          </xsl:if>
        </div>
        <div class="styGenericDiv" style="width:2mm"/>
        <div class="styGenericDiv" style="width:6mm;font-weight:bold">
          <xsl:if test="(($Form8586Data/DecrInQlfyBasisOfBldgsAF2007/BIN[$index*4]) or ($index*4-3 &lt; 5)) and (($index*4-3) &lt; 5)">
          (<xsl:number value="$index*4" format="i"/>)
        </xsl:if>
        </div>
        <div class="styGenericDiv" style="text-align:left;width:23mm;">
          <xsl:if test="($Form8586Data/DecrInQlfyBasisOfBldgsAF2007/BIN[$index*4]) or ($index*4-3 &lt; 5)">
          <div style="width:20mm; border-bottom:1px solid black">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form8586Data/DecrInQlfyBasisOfBldgsAF2007/BIN[$index*4]"/>
          </xsl:call-template>
          </div>
          </xsl:if>
        </div>
        </div>
        <div class="styGenericDiv" style="width:35mm;height:6mm">
        <div class="styLNRightNumBoxNBB" style="border-left:1px solid black;border-right:1px; width:8mm; background-color:lightgrey;height:6mm"/>
        <div class="styLNAmountBoxNBB" style="height:6mm;width:25mm"/>
	</div>
      <xsl:call-template name="partII9bLoop">
        <xsl:with-param name="index" select="$index+1"/>
        <xsl:with-param name="max" select="$max"/>
      </xsl:call-template>
    </xsl:if>
   
  </xsl:template>
</xsl:stylesheet>