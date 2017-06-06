<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<!-- Last modified on 09/26/2014 by Harold Nadel for UWR 117755 -->
<!-- Last modified on 09/30/2014 by Harold Nadel for IBM Defect 40414 Data Display 1040 Tax Type -->
<!-- Last modified on 12/18/2014 by Harold Nadel for KISAM # IM01936973  Corrected Additional Data Table-->
<!-- Last modified on 05/28/2015 by Harold Nadel for WR # 123023 changes for IE11-->
<!-- Last modified on 11/10/2015 by Harold Nadel for defect #43707, 43708, 43927 -->
<!-- Last modified on 12/08/2015 by Harold Nadel per PDF Review package 3 defect #  -->
<!-- Last modified on -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8820Style.xsl"/>
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="FormData" select="$RtnDoc/IRS8820"/>
  <xsl:param name="FormData2" select="$RtnDoc/IRS8820/OrphanDrugInfoGrp"/>  
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
        <meta name="Description" content="Form IRS 8820"/>
        <meta name="GENERATOR" content="IBM WebSphere Studio"/>
        <xsl:call-template name="GlobalStylesForm"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS8820Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
      </head>
      <body class="styBodyClass">
        <form name="Form8820">
          <xsl:call-template name="DocumentHeader"/>
          <!--Title of Form -->
          <div class="styBB" style="width:187mm;">
            <div class="styFNBox" style="width:31mm;height: 22mm">
            Form <span class="styFormNumber">8820</span>
              <br/>
              <div style="padding-top:2.85mm;">
              <span class="styAgency">(Rev. December 2012)</span> <br/>
                <span class="styAgency">Department of the Treasury</span>
                <br/>
                <span class="styAgency">Internal Revenue Service</span>
              </div>
            </div>
            <div class="styFTBox" style="width:125mm">
            
<div class="styMainTitle" style="height:8mm;padding-top: 1mm">
          Orphan Drug Information          
        </div>
              <br/><br/>
               
              <div class="styFST" style="height:5mm;font-size:6.5pt;padding-top:.5mm;">
                <img src="{$ImagePath}/8820_Bullet.gif" width="4" height="7" alt="Bullet Image"/>
          Information about Form 8820 and its instructions is available at <a href="http://www.irs.gov/form8820" title="Link to IRS.gov"><i>www.irs.gov/form8820</i></a>.
        </div><br/>
        <img src="{$ImagePath}/8820_Bullet.gif" width="4" height="7" alt="Bullet Image"/>
	       <b>Attach to your tax return.</b>
              <br/>
            </div>
            <div class="styTYBox" style="width:30mm;height:22mm;padding-right:.7mm; border-left-width: 1px">
              <div class="styOMB" style="height:8mm;padding-right:.7mm;padding-top:2mm">OMB No. 1545-1505</div>
              <div class="stySequence" style="padding-top:2mm;padding-right:.7mm">Attachment<br/>Sequence No. <b>103</b>
              </div>
            </div>
          </div>
          <!--  End title of Form  -->
          <!--  Name and Employer identification number  -->
          <div class="styBB" style="width:187mm">
            <div class="styNameBox" style="width:156.3mm;font-weight:normal;font-size:7pt;height:auto;padding-left:.5mm;">
              Name(s) shown on return
              <br/>
                 <xsl:choose>
         <xsl:when test="$RtnHdrData/ReturnTypeCd='1040' ">
              <div style="font-family:verdana;font-size:6pt;">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">NameLine2Txt</xsl:with-param>
                </xsl:call-template>
              </div>
              </xsl:when>
							<xsl:otherwise>
							<div style="font-family:verdana;font-size:6pt;">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine2TxT</xsl:with-param>
                </xsl:call-template>
              </div>
              </xsl:otherwise>
              </xsl:choose>
            </div>
            <!-- Close The Name line -->
            
            <div class="styEINBox" style="width:30mm;height:4mm;padding-left:2mm;font-size:7pt;">
              <span class="BoldText">Identifying number</span>
              <xsl:choose>
			  <xsl:when test="$RtnHdrData/ReturnTypeCd='1040' ">
              <div class="styNormalText" style="text-align:left; padding-top:2mm;">
                        <xsl:call-template name="PopulateReturnHeaderFiler">
                               <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
                         </xsl:call-template>
              </div>
              </xsl:when>
			  <xsl:otherwise>	
			  <div class="styNormalText" style="text-align:left; padding-top:2mm;">
                        <xsl:call-template name="PopulateReturnHeaderFiler">
                               <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                         </xsl:call-template>
              </div>
            </xsl:otherwise>
			 </xsl:choose>
            </div>
          </div>
          <!--  End Name and Employer indentification number  -->
          

<!-- BEGIN Part I Title -->
      <div class="styIRS8820BB" style="height:auto; border-top:1 solid black;border-bottom:.3mm solid black; width:187mm">
        <div class="styTitleName" style="width:12mm; font-size:10pt;">Part I</div>
        <div class="styTitleDesc" style="font-size:10pt;">Current Year Credit</div>        
      </div>
 <!-- END Part I Title -->          
          
          
          <!--  L1 -->
          <div style="width: 187mm">

            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">1</div>
              <div class="styIRS8820MedLNDesc" style="width:139mm;">
                <span style="float:left;">Qualified clinical testing expenses paid or incurred during the tax year (see instructions)</span>
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b>   
                <span class="styNBSP"/><b>.</b>               
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox">1</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/QlfyClinicalTestExpnssPdAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--  L1 -->
          <!--  L2a -->
          <div style="width: 187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD" style="height:auto;padding-top: 1.5mm">2a</div>
              <div class="styIRS8820MedLNDesc" style="width:139mm;height:auto;padding-top: 1.5mm">
                <span style="float:left;">Current year credit. Multiply line 1 by 50% (.50) (see instructions)
              <!-- Form to Form Link (Push Pin)-->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$FormData/CurrentYearCreditAmt"/>
                  </xsl:call-template>
                </span>
              
               <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b>  
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b>
                
              </div>
            </div>
            <div style="float:right;clear:none;">
<div class="styLNRightNumBox" style="height:auto; padding-top: 1.5mm;">2a</div>
              <div class="styLNAmountBox" style="height:auto; padding-top: 1.5mm;">            
            
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/CurrentYearCreditAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--  L2a -->
          <!--  L2b -->  
          <div style="width: 187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD" style="height:auto; padding-top: .5mm;">&nbsp;&nbsp;b</div>
              <div class="styIRS8820MedLNDesc" style="width:139mm;height: auto; padding-top: .5mm;">
              Enter the portion of the credit from Form 8932, line 2, that is attributable to wages <br/>
              that were also used to figure the credit on line 2a above
                <span class="styNBSP"/><b>.</b>
                <span class="styNBSP"/><b>.</b>
                <span class="styNBSP"/><b>.</b>
                <span class="styNBSP"/><b>.</b>
                <span class="styNBSP"/><b>.</b>
                <span class="styNBSP"/><b>.</b>
                <span class="styNBSP"/><b>.</b>
                <span class="styNBSP"/><b>.</b>
                <span class="styNBSP"/><b>.</b>
                <span class="styNBSP"/><b>.</b>
                <span class="styNBSP"/><b>.</b>
                <span class="styNBSP"/><b>.</b>
                <span class="styNBSP"/><b>.</b>
              </div>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNRightNumBox" style="height:auto; padding-top: 3.5mm;">2b</div>
              <div class="styLNAmountBox" style="height:auto; padding-top: 3.5mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/EmployerDifferentialWageCrAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--  L2b -->
          <!--  L2c -->
          <div style="width: 187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">&nbsp;&nbsp;c</div>
              <div class="styIRS8820MedLNDesc" style="width:139mm">
                <span style="float:left;">Subtract line 2b from 2a. If zero or less, enter -0-
              <!-- Form to Form Link (Push Pin)-->
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$FormData/CYCLessEmployerDiffWageCrAmt"/>
                  </xsl:call-template>
                </span>
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b>  
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b>  
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b> 
              </div>
            </div>
            <div style="float:right;clear;none;">
              <div class="styLNRightNumBox">2c</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/CYCLessEmployerDiffWageCrAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--  L2c -->
          <!--  L3 -->
          <div style="width: 187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">3</div>
              <div class="styIRS8820MedLNDesc" style="width:139mm">
                <span style="float:left;">Orphan drug credit from partnerships, S corporations, estates, or trusts</span>
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b>  
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b>
                <span class="styNBSP"/><b>.</b>
              </div>
            </div>
            <div style="float:right;clear;none;">
              <div class="styLNRightNumBox">3</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/OrphanDrugCreditAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--  L3 -->
          <!--  L4 -->
          <div style="width: 187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD" style="height: auto; padding-top: .5mm">4</div>
             <div class="styIRS8820MedLNDesc" style="width:139mm;height: auto; padding-top: .5mm;">Add lines 2c and 3. Estates and trusts go
              to line 5. Partnerships and S corporations, report this amount on <br/> Schedule K. All others, report this amount on 
              Form 3800, line 1h 
               <span style="width:2mm;"/>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Line 4 - 1041 Portion Indicator</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$FormData/SumCurrYrCrandOrphnDrugCrAmt/@form1041PortionCd"/>
                  </xsl:call-template>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Line 4 - 1041 Portion Amount</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$FormData/SumCurrYrCrandOrphnDrugCrAmt/@form1041PortionAmt"/>
                    <xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
                  </xsl:call-template>
                 <span class="styNBSP"/><b>.</b>
                 <span class="styNBSP"/><b>.</b>
                 <span class="styNBSP"/><b>.</b>
                 <span class="styNBSP"/><b>.</b>
                 <span class="styNBSP"/><b>.</b>
                 <span class="styNBSP"/><b>.</b>
                 <span class="styNBSP"/><b>.</b>
                 <span class="styNBSP"/><b>.</b>                 
                 <span class="styNBSP"/><b>.</b>                 
               </div>
            </div>
            <div style="float:right;clear;none;">
              <div class="styLNRightNumBox" style="height:auto; padding-top: 3.5mm; border-bottom-width:1px">4</div>
              <div class="styLNAmountBox" style="height:auto; padding-top: 3.5mm; border-bottom-width:1px">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/SumCurrYrCrandOrphnDrugCrAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--  L4 -->
          <!--  L5 -->
          <div style="width: 187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">5</div>
              <div class="styIRS8820MedLNDesc" style="width:139mm">
                <span style="float:left;">Amount allocated to the beneficiaries of the estate or trust (see instructions) </span>
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b>
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b>
                <span class="styNBSP"/><b>.</b> 
              </div>
            </div>
            <div style="float:right;clear;none;">
              <div class="styLNRightNumBox">5</div>
              <div class="styLNAmountBox">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/AllocatedtoBeneficiariesAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--  L5 -->
          <!--  L6 -->
          <div class="styBB" style="width: 187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBoxSD">6</div>
              <div class="styIRS8820MedLNDesc" style="width:139mm;">
              <span style="float:left;">Estates and trusts. Subtract line 5 from line 4. Report this amount on Form 3800, line 1h </span>
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b> 
                <span class="styNBSP"/><b>.</b>  
                <span class="styNBSP"/><b>.</b>
            </div>
            </div>
            <div style="float:right;clear;none;">
              <div class="styLNRightNumBox" style="border-bottom-width:0px">6</div>
              <div class="styLNAmountBox" style="border-bottom-width:0px">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$FormData/EstatesAndTrustsCreditAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--  L6 -->
          <div style="width:187mm;">
            <span class="styBoldText">For Paperwork Reduction Act Notice, see instructions. </span>
            <span style="width:100px;"/>                      
              Cat. No. 11208S 
            <span style="width:100px;"/>  
              Form <span class="styBoldText">8820</span> (Rev. 12-2012)
          </div>
          <br/>
          <br class="pageEnd"/>
          
          <p style="page-break-after:always;"></p>
          
            <div style="width:187mm; font-size:7pt">    
      <div style="float:left; font-size:8pt">
        Form 8820 (Rev. 12-2012)
      </div>    
      <div style="float:right">        
        Page <b style="font-size:9pt">2</b>
      </div>      
    </div>    
          
  <!-- BEGIN Part II Title -->  
    <!--  <div class="styIRS8621BB" style="height:4mm; border-top:2 solid black">-->
      <div class="styIRS8820BB" style="height:auto; border-top:.5mm solid black; border-bottom:.5mm solid black; width:187mm">
        <div class="styTitleName" style="width:18mm; font-size:10pt">Part II</div>
        <div class="styTitleDesc" style="font-size:9pt">Orphan Drug Information  <span class="styNormalText" style="font-style: italic;">    (see instructions)</span></div>        
      </div>
    <!-- END Part II Title -->       

    <!-- Start Part II Header -->
 
           <div class="styTable" style="border-top-width: 1px; width:187mm;border-bottom-width:1px;height:100%; ">
             <table class="styTable" style="border-color:black;" cellspacing="0">
               <thead>
                 <tr>

                  <th class="styNormalText" scope="col" style="width:30mm;padding-right:.5mm;text-align:center;font-size:7.5pt;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
                    <br>&nbsp;</br> <b>(a)</b> <br>&nbsp;</br>
                   </th>           
                   
                   <th class="styNormalText" style="width:60mm;font-size:7.5pt;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;" scope="col">
                     <br>&nbsp;</br> <b>(b)</b> <br> Name of orphan drug</br> 
                   </th>
                   <th class="styNormalText" style="width:60mm;font-size:7.5pt;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;" scope="col">
                     <br>&nbsp;</br> <b>(c)</b> <br>  Designation application number</br> 
                   </th>
                   <th class="styNormalText" style="width:37mm;font-size:7.5pt;border-style: solid; border-top-width: 0px; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 0px;" scope="col">
                     <br>&nbsp;</br> <b>(d)</b> <br>  Date drug designated</br> <br>(mm/dd/yyyy)</br> 
                   </th>

                 </tr>
               </thead>
               <tfoot/>
    <!-- End Part II Header -->
      
          <!--  Start Part II Data -->
          
              <tbody valign="top">
                <xsl:for-each select="$FormData2">
                <xsl:variable name="pos" select="position()"/>  
              
                <tr>
                  <td class="styIRS8820Cell" style="vertical-align:top;border-left-width:0px;">
 		    <xsl:choose>
		     <xsl:when test="($pos = 1)">		
	              <span class="styNormalText" style="width: 30mm; ">7a
	              </span>
		     </xsl:when>		
	              <xsl:otherwise>
	              <span class="styNormalText" style="width: 30mm; "> <xsl:number value="($pos)" format="a"/>
	              </span>
	              </xsl:otherwise>
	             </xsl:choose>
                  </td>
          
                  <td class="styIRS8820Cell" style="vertical-align:top;text-align:left;width: 60mm; ">
	                <xsl:call-template name="PopulateText">
	                  <xsl:with-param name="TargetNode" select="OrphanDrugNm"/>
	                </xsl:call-template>
                  </td>
          
                  <td class="styIRS8820Cell" style="vertical-align:top;text-align:left;width: 60mm; ">
	                <xsl:call-template name="PopulateText">
	                  <xsl:with-param name="TargetNode" select="OrphanDrugDesignationNum"/>
	                </xsl:call-template>
                  </td>

                  <td class="styIRS8820Cell" style="vertical-align:top;width: 37mm; ">
	                <xsl:call-template name="PopulateMonthDayYear">
	                  <xsl:with-param name="TargetNode" select="OrphanDrugDesignationDt"/>
	                </xsl:call-template>
                  </td>
                </tr>
		</xsl:for-each>
              </tbody>
            </table>
          </div>

          <!--  End Part II Data -->

          <div style="width:187mm;text-align:right">
              Form <span class="styBoldText">8820</span> (Rev. 12-2012)
          </div>
          <br/>
          <br class="pageEnd"/>
          
          <p style="page-break-after:always;"></p>

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
            <xsl:call-template name="PopulateLeftoverRowAmount">
              <xsl:with-param name="Desc">Line 4 - 1041 Portion Indicator </xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/SumCurrYrCrandOrphnDrugCrAmt/@form1041PortionCd"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRowAmount">
              <xsl:with-param name="Desc">Line 4 - 1041 Portion Amount </xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/SumCurrYrCrandOrphnDrugCrAmt/@form1041PortionAmt"/>
              <xsl:with-param name="Style">padding-left:4mm;</xsl:with-param>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>