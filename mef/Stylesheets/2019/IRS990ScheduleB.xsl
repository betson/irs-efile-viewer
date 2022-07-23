<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<!-- Updated 7/21/2011 per UWR 40502 by Robert L Jones -->

<!-- Updated 06/05/2012 Defect 32176 and 32714 508 Accverify Compliance, Checkboxes needed BackupName by Robert L Jones -->
<!-- Lisa Lane provided fix to allow 508 Compliance/Accverify, JAWS test passage -->
<!-- Code submitted for Defect 32714 508 Compliance - RLJ-->
<!-- Last modified on 06/28/2012 by Robert Jones for UWR 58215 -->
<!-- Last modified on 09/06/2012 by Robert Jones for UWR 58215 after getting the 2012 PDF's-->
<!-- Last modified on 10/19/2012 by Robert Jones forIBM Defect 33480 Part II col C wrapping- NPF-RLJ-->
<!-- Last modified on 10/19/2012 by Robert Jones for IBM Defect 33481 Part II col C wrapping- NPF-RLJ-->
<!-- Last modified on 11/14/2012 by Robert Jones for IBM Defect 34323 Part II col C wrapping- NPF-RLJ-->
<!-- Last modified on 12/19/2012 by Robert Jones for IBM Defect 34811 Part II col C wrapping- NPF- Made Font 7pt instead of 8pt-RLJ-->
<!-- Last modified on 01/22/2012 by Robert Jones for TEGE PDF REVIEW - RLJ-->
<!-- Last modified on 01/24/2012 by Robert Jones for Defect 33481 - RLJ-->
<!--Changes made per UWR107551 and pdf dated 4/8/2014-->
<!-- Last modified on 06/25/2014 by Robert Jones for Defect 40558 - RLJ-->
<!-- Last modified on 06/25/2014 by Robert Jones for Defect 40559- RLJ-->
<!-- Last modified on 10/08/2014 by Robert Jones for Kisams 1859772 - RLJ-->
<!-- Last modified on 2/12/2015 by Robert Jones for Kisams 02024195 Boxes out of alignment Part I in additional data section when invoked - RLJ-->
<!-- Update per UWR 177702 4/22/2016 Tax Year by Robert L Jones -->
<!-- Update per UWR 177702 4/27/2016 Tax Year by Robert L Jones -->
<!-- Update per TEGE PDF Review 10/05/2016 Various by Robert L Jones -->
<!-- Updated per UWR 195015 5/19/17 by Robert L Jones -->
<!-- Last modified on 06/30/2017 by Robert Jones for Defect 48172 -j RLJ-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS990ScheduleBStyle.xsl"/>

<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
<xsl:strip-space elements="*"/>
<xsl:param name="Form990ScheduleBData" select="$RtnDoc/IRS990ScheduleB"/>


<xsl:template match="/">
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
  <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>Schedule B (Form 990, 990-EZ, or 990-PF) (2019)</title>      
    <!-- No Browser Caching -->
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <!-- No Proxy Caching -->
    <meta http-equiv="Cache-Control" content="private"/>    
    <meta name="Description" content="Schedule B (Form 990, 990-EZ, or 990-PF)"/>
    <meta name="GENERATOR" content="IBM WebSphere Studio"/>
    <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
    <xsl:call-template name="InitJS"/>
       <style type="text/css">   
   <xsl:if test="not($Print) or $Print=''">
      
	<xsl:call-template name="IRS990ScheduleBStyle"/>
	<xsl:call-template name="AddOnStyle"/>
	 </xsl:if>
    </style>              
    <xsl:call-template name="GlobalStylesForm"/>
  </head>
  
  <body class="styBodyClass">    
    <form style="font-family:arial; font-size:8.5pt" name="Form990ScheduleB">
      <xsl:call-template name="DocumentHeader"/>

      <div class="styTBB" style="width:187mm">
        <div class="styFNBox" style="height:18mm; width:31mm">        
          <b style="font-size:12pt">
            Schedule B
            <div style="line-height:100%; font-size:7.5pt">
            (Form 990, 990-EZ,<br/>or 990-PF)
            </div>
          </b>
          <div style="font-size:6pt; padding-top:1mm">
            Department of the Treasury<br/>Internal Revenue Service
          </div>              
        </div>
        <div class="styFTBox" style="width:125mm">
          <div class="styMainTitle" style="padding-top:1mm; font-size:12pt">Schedule of Contributors</div><br/>
          <div style="font-weight:bold; font-size:7.5pt; padding-top:2mm;">
          <img src="{$ImagePath}/990SchB_Bullet.gif" alt="Arrow Bullet"/> 
            Attach to Form 990, 990-EZ, or 990-PF.<br/>
          <div style="text-align:center;"><img src="{$ImagePath}/990SchB_Bullet.gif" alt="Arrow Bullet"/> Go to <!--www.irs.gov/form990.--><a href="http://www.irs.gov/form990" title="Link to IRS.gov">
                <i>www.irs.gov/Form990</i></a> for the latest information. 
            
          </div>
          </div>
        </div>
        <div class="styTYBox" style="font-size:7pt; width:31mm; height:18mm">
          <div class="styOMB" style="">OMB No. 1545-0047</div>
          <div class="styFN" style="padding-top:3mm">
            20<span class="styTYColor">19</span>
          </div>              
        </div>
      </div>      
      
      <!-- Begin Name and Identifying Number Section-->      
      <div class="styBB" style="width:187mm;clear:both;font-family:verdana;font-size:7pt;">
        <div class="styFNBox" style="width:139mm;height:auto;">
          <span>Name of the organization</span><br/>
           <div style="font-family:verdana;font-size:7pt;">
            <xsl:call-template name="PopulateReturnHeaderFiler">
            <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
           </xsl:call-template>
          <br/>
           <xsl:call-template name="PopulateReturnHeaderFiler">
            <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
           </xsl:call-template>
         </div>          
        </div>
        <div class="styGenericDiv" style="width:47mm;height:auto;padding-left:1mm;">
          <span class="styBoldText">Employer identification number</span>
          <br/><br/>
          <xsl:call-template name="PopulateReturnHeaderFiler">
            <xsl:with-param name="TargetNode">EIN</xsl:with-param>
          </xsl:call-template>
        </div>
      </div>
      <!-- End Name and Identifying Number Section-->      
      
      <div class="styBB" style="padding-bottom:6mm; width:187mm; height:auto; clear:both; padding-top:1mm">
        <div style="width:187mm">
          <b>Organization type</b> (check one):
        </div>
        <div style="width:187mm; font-weight:bold; margin-top:5mm; margin-bottom:5mm">
          <div style="width:40mm; float:left">
            Filers of:
          </div>
          <div style="float:left">
            Section:
          </div>
        </div>
        <div class="styGenericDiv" style="height:15mm; width:40mm">Form 990 or 990-EZ</div>
                            <!-- Is it a 501(c)(      ) checkbox -->
        <div style="">
          <input type="Checkbox" class="styIRS990ScheduleBCkbox" alt="Organization501c">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/Organization501cInd"/>
             <!-- <xsl:with-param name="BackupName" select="IRS990ScheduleBOrganization501c"/>This will not pass 508-->
              <xsl:with-param name="BackupName">IRS990SchBOrganization501c</xsl:with-param>
            </xsl:call-template>
          </input>          
          <label>
            <xsl:call-template name="PopulateLabel">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/Organization501cInd"/>
              <!--<xsl:with-param name="BackupName" select="IRS990ScheduleBOrganization501c"/>This will not pass 508-->
              <xsl:with-param name="BackupName">IRS990SchBOrganization501c</xsl:with-param>
            </xsl:call-template>
            501(c)(
            <xsl:choose>
              <xsl:when test="$Form990ScheduleBData/Organization501cInd/@organization501cTypeTxt">
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/Organization501cInd/@organization501cTypeTxt"/></xsl:call-template>          
              </xsl:when> 
              <xsl:otherwise>
                <span style="width:4px;" />
              </xsl:otherwise>  
            </xsl:choose>
            ) (enter number) organization
          </label>          
          <br/><br/>          
          <input type="Checkbox" class="styIRS990ScheduleBCkbox" alt="Organization4947a1NotPrivateFoundation">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/Organization4947a1NotPFInd"/>
              <xsl:with-param name="BackupName">IRS990SchBOrganization4947a1NotPF</xsl:with-param>
            </xsl:call-template>
          </input> 
                   <!--Is it a 4947a1NotPF  Checkbox-->
          <label>
            <xsl:call-template name="PopulateLabel">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/Organization4947a1NotPFInd"/>
              <xsl:with-param name="BackupName">IRS990SchBOrganization4947a1NotPF</xsl:with-param>
            </xsl:call-template>
            4947(a)(1) nonexempt charitable trust <b>not</b> treated as a private foundation
          </label>          
          <br/><br/>    
                <!--Is it a 527 Organization Checkbox-->
          <input type="Checkbox" class="styIRS990ScheduleBCkbox" alt="Organization527">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/Organization527Ind"/>
              <xsl:with-param name="BackupName">IRS990SchBOrganization527</xsl:with-param>
            </xsl:call-template>
          </input>          
          <label>
            <xsl:call-template name="PopulateLabel">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/Organization527Ind"/>
              <xsl:with-param name="BackupName">IRS990SchBOrganization527</xsl:with-param>
            </xsl:call-template>
            527 political organization
          </label>          
        </div>        
        <br/>      
         <br/>   
        <div class="styGenericDiv" style="clear:left; height:15mm; width:40mm;padding-top:2mm;">Form 990-PF</div>
        <div style="">
        
        <!--Organization 501(c)(3) Exempt PF Checkbox-->
          <input type="Checkbox" class="styIRS990ScheduleBCkbox" alt="Organization501c3ExemptPrivateFoundation">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/Organization501c3ExemptPFInd"/>
              <xsl:with-param name="BackupName">IRS990SchBOrganization501c3ExemptPF</xsl:with-param>
            </xsl:call-template>
          </input>          
          <label>
            <xsl:call-template name="PopulateLabel">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/Organization501c3ExemptPFInd"/>
              <xsl:with-param name="BackupName">IRS990SchBOrganization501c3ExemptPF</xsl:with-param>
            </xsl:call-template>
            501(c)(3) exempt private foundation
          </label>          
          <br/><br/>     
          <!--Organization 4947a(1) Treated as PF Checkbox-->     
          <input type="Checkbox" class="styIRS990ScheduleBCkbox" alt="Organization4947a1TreatedAsPrivateFoundation">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/Organization4947a1TrtdPFInd"/>
              <xsl:with-param name="BackupName">IRS990SchBOrganization4947a1TreatedAsPF</xsl:with-param>
            </xsl:call-template>
          </input>    
             <label>
            <xsl:call-template name="PopulateLabel">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/Organization4947a1TrtdPFInd"/>
              <xsl:with-param name="BackupName">IRS990SchBOrganization4947a1TreatedAsPF</xsl:with-param>
            </xsl:call-template>
            4947(a)(1) nonexempt charitable trust treated as a private foundation
          </label>
          <br/><br/>      
          <!--Is it a 501(c)(3) Taxable Private Foundation Checkbox-->    
          <input type="Checkbox" class="styIRS990ScheduleBCkbox" alt="Organization501c3TaxablePrivateFoundation">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/Organization501c3TaxablePFInd"/>
              <xsl:with-param name="BackupName">IRS990SchBOrganization501c3TaxablePF</xsl:with-param>
            </xsl:call-template>
          </input>          
          <label>
            <xsl:call-template name="PopulateLabel">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/Organization501c3TaxablePFInd"/>
              <xsl:with-param name="BackupName">IRS990SchBOrganization501c3TaxablePF</xsl:with-param>
            </xsl:call-template>
            501(c)(3) taxable private foundation
          </label>
        </div>
      </div>
      
      <div style="width:187mm; padding-top:1mm">
        Check if your organization is covered by the <b>General Rule</b> or a <b>Special Rule.</b> &nbsp;<br/><b>Note:</b>&nbsp;Only a section 501(c)(7), (8), or (10) organization can check boxes for both the General Rule and a Special Rule. See instructions.       
      </div>
      
      <div style="width:187mm; margin-top:5mm; margin-bottom:5mm">
        <b>General Rule<!--&#151;--></b>
      </div>
        
      <div style="padding-left:5mm; width:187mm">
        <div style="float:left">
          <input type="Checkbox" class="styIRS990ScheduleBCkbox" alt="GeneralRuleInd">
          <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/GeneralRuleInd"/>
          <xsl:with-param name="BackupName">IRS990SchBGeneralRule</xsl:with-param>
          </xsl:call-template>
          </input>
        </div>
        <div style="float:right; width:175mm">
          <label>
          <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/GeneralRuleInd"/>
          <xsl:with-param name="BackupName">IRS990SchBGeneralRule</xsl:with-param>
          </xsl:call-template>
           For an organization filing Form 990, 990-EZ, or 990-PF that received, during the year, contributions totaling $5,000 or more (in money or other property) from any one contributor. Complete Parts I and II. See instructions for determining a contributor's total contributions.
          </label>
        </div>
      </div>
        
      <div style="width:187mm; margin-top:5mm; margin-bottom:5mm">
        <b>Special Rules<!--&#151;--></b>
      </div>  
        
      <div style="padding-left:5mm; width:187mm">
        <div style="float:left;width:4mm;padding-top:.7mm;">
          <input type="Checkbox" class="styCkbox" alt="SpclRuleMetOne3rdSuprtTestInd">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/SpclRuleMetOne3rdSuprtTestInd"/>
              <xsl:with-param name="BackupName">IRS990SchBSpclRuleMetOneThirdSuprtTest</xsl:with-param>
            </xsl:call-template>
          </input>
        </div>
        <div style="float:right;width:177mm;">
          <label>
          <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/SpclRuleMetOne3rdSuprtTestInd"/>
          <xsl:with-param name="BackupName">IRS990SchBSpclRuleMetOneThirdSuprtTest</xsl:with-param>
          </xsl:call-template>
            For an organization described in section 501(c)(3) filing Form 990 or 990-EZ that met the 
            33<font style="font-family: 'Arial Narrow'; font-size: smaller;"><sup>1</sup>/3</font>% 
            support test of the regulations <br/>under sections 509(a)(1) and 170(b)(1)(A)(vi), that checked Schedule A (Form 990 or 990-EZ),
Part II, line 13, 16a, or 16b, and that received from any one contributor, during the year, total contributions of the greater of <b>(1)</b> $5,000 or <b>(2)</b> 2% of the amount on (i) Form 990, Part VIII, line 1h, or (ii) Form 990-EZ, line 1. Complete Parts I and II. 
         </label>
        </div>
      </div>
      
      <div style="padding-left:5mm; margin-top:5mm; width:187mm">
        <div style="float:left">
          <input type="Checkbox" class="styCkbox" alt="TotContriRcvdMore1000Ind">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/TotContriRcvdMore1000Ind"/>
              <xsl:with-param name="BackupName">IRS990SchBSpclRuleRcvdTotContriMore1000</xsl:with-param>
            </xsl:call-template>
          </input>
        </div>
        <div style="float:right; width:177mm">
          <label>
          <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/TotContriRcvdMore1000Ind"/>
          <xsl:with-param name="BackupName">IRS990SchBSpclRuleRcvdTotContriMore1000</xsl:with-param>
          </xsl:call-template>
           For an organization described in section 501(c)(7), (8), or (10) filing Form 990 or 990-EZ that received from any one contributor,<br />during the year, total contributions of more than $1,000 <i>exclusively</i> for religious, charitable, scientific, literary, or educational purposes, or for the prevention of cruelty to children or animals. Complete Parts I, II, and III.
          </label>
        </div>
      </div>
        
      <div style="padding-left:5mm; margin-top:5mm; width:187mm">
        <div style="float:left">
          <input type="Checkbox" class="styCkbox" alt="TotContriRcvdUpTo1000Ind">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/TotContriRcvdUpTo1000Ind"/>
              <xsl:with-param name="BackupName">IRS990SchBSpclRuleRcvdTotContriUpTo1000</xsl:with-param>
            </xsl:call-template>
          </input>
        </div>
        <div style="float:right; width:177mm">
          <label>
          <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/TotContriRcvdUpTo1000Ind"/>
          <xsl:with-param name="BackupName">IRS990SchBSpclRuleRcvdTotContriUpTo1000</xsl:with-param>
          </xsl:call-template>
            For an organization described in section 501(c)(7), (8), or (10) filing Form 990 or 990-EZ that received from any one contributor,<br />during the year, contributions <i>exclusively</i> for religious, charitable, etc., purposes, but no such contributions totaled more than $1,000. If this box is checked, enter here the total contributions that were received during the year for an <i>exclusively</i> religious, charitable, etc., purpose. Don't complete any of the parts unless the <b>General Rule</b> applies to this organization because it received <i>nonexclusively</i> religious, charitable, etc., contributions totaling $5,000 or more during the year
          </label>        
          <span class="styIRS990ScheduleBDotLn">      
            .........
          </span>          
          <img src="{$ImagePath}/990SchB_Bullet.gif" alt="Arrow Bullet"/> <span style="width:1px;" /> $ <span style="width:1px;" />
          <span style="border-bottom:1px solid black; width:30mm; text-align:center; color:blue">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/TotContriRcvdUpTo1000Ind/@totalContributionsAmt"/></xsl:call-template>
          </span>    
        </div>
      </div>
      
      <div style="border-bottom:1px solid black; width:187mm; margin-top:5mm; padding-bottom:3mm">      
        <b>Caution:</b>&#160;An organization that isn't covered by the General Rule and/or the Special Rules doesn't file Schedule B (Form 990,<br />990-EZ, or 990-PF), but it <b>must</b> answer “No” on Part IV, line 2, of its Form 990; or check the box on line H of its Form 990-EZ <br />or on its Form 990PF, Part I, line 2, to certify that it doesn't meet the filing requirements of Schedule B (Form 990,<br/>990-EZ, or 990-PF).
      </div>      
      
      <div style="width:187mm; font-size:7pt; border-top:1px solid black">
        <xsl:call-template name="IRS990BFooter">
          <xsl:with-param name="showAll" select="0"/>
        </xsl:call-template>
      </div>
      <div class="pageEnd"/>
      <div style="width:187mm;padding-top:2mm;border-bottom:0px ">
						<span style="float:none">      
        Schedule B (Form 990, 990-EZ, or 990-PF) (2019)
      </span>  
						<span style="float:none; padding-left:100mm">
    Page <span class="styBoldText" style="font-size: 8pt; padding-top:5mm;">2</span>
						</span>
					</div>

    <!-- BEGIN Part I -->
      <xsl:variable name="totalRowCount1" select="count($Form990ScheduleBData/ContributorInformationGrp)"/>    
      <xsl:variable name="containerHeight" select="6"/>    
      
        <table class="styIRS990ScheduleBTable" cellspacing="0" cellpadding="0" border="0" style="width:187mm;">  
   <xsl:choose>
        <xsl:when test="($Print = $Separated) and (count($Form990ScheduleBData/ContributorInformationGrp) &gt; 6)">
         <xsl:call-template name="p1TemplateEmpty">               
         <xsl:with-param name="max">
           <xsl:choose>
                     <xsl:when test="$totalRowCount1 &gt; $containerHeight">     
                    <xsl:value-of select="ceiling($totalRowCount1 div 6)*6"/>
                     </xsl:when>
                          <xsl:otherwise>
                        <xsl:value-of select="$containerHeight"/>
                  </xsl:otherwise>
            </xsl:choose>
              </xsl:with-param>
            </xsl:call-template>
       </xsl:when>
          
          <xsl:otherwise>
            <xsl:call-template name="p1Template">                        
              <xsl:with-param name="max">
               <xsl:choose>
                     <xsl:when test="$totalRowCount1 &gt; $containerHeight">     
                    <xsl:value-of select="ceiling($totalRowCount1 div 6)*6"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:value-of select="$containerHeight"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:with-param>
            </xsl:call-template>
         </xsl:otherwise>
        </xsl:choose>
       </table>
        
               
    <!-- END Part I -->    
    
    <!-- BEGIN Part II -->  
      <xsl:variable name="totalRowCount2" select="count($Form990ScheduleBData/NonCashPropertyContributionGrp)"/>                  
      
      <div class="pageEnd"/>
      <!-- Begin Page 3 -->
      <div style="width:187mm;padding-top:3mm;">
						<div style="float:left">      
        Schedule B (Form 990, 990-EZ, or 990-PF) (2019)
      </div>  
						<div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt; ">3</span>
						</div>
					</div>
      
      <table class="styIRS990ScheduleBTable" cellspacing="0" cellpadding="0" border="0" style="width:187mm;">  
          
        <xsl:choose>
          <xsl:when test="($Print = $Separated) and (count($Form990ScheduleBData/NonCashPropertyContributionGrp) &gt; 6)">
            <xsl:call-template name="p2TemplateEmpty">                        
              <xsl:with-param name="max">
                <xsl:choose>
                     <xsl:when test="$totalRowCount2 &gt; $containerHeight">     
                    <xsl:value-of select="ceiling($totalRowCount1 div 6)*6"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:value-of select="$containerHeight"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:with-param>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>

          <xsl:call-template name="p2Template">                      
            <xsl:with-param name="max">
              <xsl:choose>
                   <xsl:when test="$totalRowCount2 &gt; $containerHeight">     
                  <xsl:value-of select="ceiling($totalRowCount2 div 6)*6"/>
                   </xsl:when>
                   <xsl:otherwise>
                      <xsl:value-of select="$containerHeight"/>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:with-param>
          </xsl:call-template>            
      </xsl:otherwise>
       </xsl:choose>
        </table>                          
    <!-- END Part II -->      
      
    <!-- BEGIN Part III -->  
<xsl:variable name="totalRowCount3" select="count($Form990ScheduleBData/CharitableContributionsDetail)"/>                
      <xsl:variable name="containerHeight3" select="4"/>    
          
    <div class="pageEnd"/>
     <div style="width:187mm;padding-top:3mm;">
			<div style="float:left">      
				Schedule B (Form 990, 990-EZ, or 990-PF) (2019)
			</div>  
			<div style="float:right">
				Page <span class="styBoldText" style="font-size: 8pt; ">4</span>
			</div>
	</div>
					
    
      
        <table class="styIRS990ScheduleBTable" cellspacing="0" cellpadding="0" border="0" style="width:187mm;">   
             
        <xsl:choose>
          <xsl:when test="($Print = $Separated) and (count($Form990ScheduleBData/CharitableContributionsDetail) &gt; 4)">
            <xsl:call-template name="p3TemplateEmpty">                        
              <xsl:with-param name="max">
                <xsl:choose>
                     <xsl:when test="$totalRowCount3 &gt; $containerHeight3">     
                    <xsl:value-of select="ceiling($totalRowCount3 div 6)*6"/>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:value-of select="$containerHeight"/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:with-param>
            </xsl:call-template>
          </xsl:when>
 
			<xsl:otherwise>	
			  <xsl:call-template name="p3Template">                        
				<xsl:with-param name="max">
				  <xsl:choose>
					   <xsl:when test="$totalRowCount3 &gt; $containerHeight3">     
					  <xsl:value-of select="ceiling($totalRowCount3 div 4)*4"/>
					   </xsl:when>
					   <xsl:otherwise>
						  <xsl:value-of select="$containerHeight3"/>
						</xsl:otherwise>
				  </xsl:choose>
				</xsl:with-param>
			  </xsl:call-template>              
			</xsl:otherwise>
		</xsl:choose>
        </table>                          
              
    <!-- END Part III -->              
      
      <div class="pageEnd" />
      <p style="page-break-before:always"/>
      
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
          <xsl:with-param name="TargetNode" select="$Form990ScheduleBData"/>        
        </xsl:call-template>
      </table>    

      <xsl:if test="($Print = $Separated) and (count($Form990ScheduleBData/ContributorInformationGrp) &gt; 6)">
        <span class="styRepeatingDataTitle">Form 990 Schedule B, Part I - Contributors (See Instructions) Use duplicate copies of Part I if additional space is needed.</span>
        <table class="styDepTbl" cellspacing="0" cellpadding="0" border="0" style="width:187mm;font-size:6pt;">  
          <xsl:call-template name="p1SRDTemplate"/>
        </table>
      </xsl:if>

      <xsl:if test="($Print = $Separated) and (count($Form990ScheduleBData/NonCashPropertyContributionGrp) &gt; 6)"> <br/>
        <span class="styRepeatingDataTitle">Form 990 Schedule B, Part II - Noncash Property (See Instructions) Use duplicate copies of Part II if additional space is needed</span>
        <table class="styDepTbl" cellspacing="0" cellpadding="0" border="0" style="width:187mm;font-size:7pt;">  
          <xsl:call-template name="p2SRDTemplate"/>
        </table>
      </xsl:if>
      
     <xsl:if test="($Print = $Separated) and (count($Form990ScheduleBData/CharitableContributionsDetail) &gt; 4)"> 
     <br/>
        <span class="styRepeatingDataTitle"><b>Form 990 Schedule B, Part III - <i>Exclusively</i> religious, charitable, etc., contributions to organizations described in section 501(c)(7), (8), or (10) that total more than $1,000 for the year from any one contributor.</b> Complete columns <b>(a)</b> through <b>(e)</b> and the following line entry. For organizations completing Part III, enter the total of <i>exclusively</i> religious, charitable, etc., contributions of <b>$1,000 or less</b> for the year. (Enter this information once. See instructions.) 
        <img src="{$ImagePath}/990SchB_Bullet.gif" alt="Arrow Bullet"/> $
        <xsl:call-template name="PopulateAmount">
        <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/TotalUnder1000ContributionsAmt"/>
        </xsl:call-template>
 <br></br>Use duplicate copies of Part III if additional space is needed.</span>
        <table class="styDepTbl" cellspacing="0" cellpadding="0" border="0" style="width:187mm;font-size:7pt;">  
          <xsl:call-template name="p3SRDTemplate"/>
        </table>
     </xsl:if>
     
    </form>    
  </body>
</html>
</xsl:template>  

<xsl:template name="p1Template">  
  <xsl:param name="index" select="1"/>    
  <xsl:param name="max"/>  
  <xsl:if test="$index &lt;= $max">
    <xsl:if test="$index mod 6 = 1">
      <xsl:call-template name="IRS990BHeader">
        <xsl:with-param name="colSpan" select="5"/>
        <xsl:with-param name="thisPage" select="ceiling($index div 6)"/>
        <xsl:with-param name="pageTotal" select="$max div 6"/>
        <xsl:with-param name="thisPart" select="'I'"/>
      </xsl:call-template>
      <tr style="font-size:7.5pt; height:9mm; width:187mm" valign="top">
        <!--<th class="styFNBox" style="border-top:2 solid black; border-bottom:2 solid black;font-family:verdana;font-size:7pt;" nowrap="nowrap" colspan="3">-->
        <th style="width:100mm;border-top:2px solid black; border-bottom:2px solid black;border-right:1px solid black; font-family:verdana;font-size:7pt;text-align:left" colspan="3"  ><!--class="styFNBox"scope="col"-->
          <span style="font-weight:normal;">Name of organization</span>
          <br/>
          <span style="font-weight:normal;font-family:verdana;font-size:7pt">
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
            </xsl:call-template>
            <br/>
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
            </xsl:call-template>        
           </span>
        </th>
        <th  style="width:70mm; text-align:left; border-top:2px solid black; border-bottom:2px solid black;font-family:verdana;font-size:7pt; padding-left:1mm;" scope="col" colspan="2"><!--class="styIRS990ScheduleBTblCell"-->
          <span class="styBoldText">Employer identification number</span>
          <br/>
          <span style="font-weight:normal">
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">EIN</xsl:with-param>
            </xsl:call-template>
          </span>
        </th>
      </tr>  
      <tr style="width:187mm">
        <th style="width:10mm; border-bottom:1px solid black;" colspan="1">
          <div class="styPartName" style="width:13mm;">Part I</div> 
          <div class="styPartName" style="width:17mm; background-color:white; color:black;font-size:8pt; padding-top:.5mm; padding-left:0.5;"> Contributors</div>   
        </th>  
        <th colspan="4" style="width:83mm; border-bottom:1px solid black; text-align:left; padding-left:5mm">            
      <div  style="width:98mm">Contributors <span style="font-size:6pt;">(see instructions).  Use duplicate copies of Part I if additional space is needed.</span></div> <!--class="styPartDesc"-->             
        </th>  
<!--        <td style="width:34mm; border-bottom:0px solid black"> <span style="width:1px;" /> </td>              
        <td style="width:8mm; border-bottom:0px solid black"> <span style="width:1px;" /> </td>
        <td style="border-bottom:0px solid black"> <span style="width:1px;" /> </td>       -->       
      </tr>    
    </xsl:if>    
    <tr align="center" style="width:187mm">                            
      <th class="styIRS990ScheduleBTblRB2" scope="col" style="width:25mm">(a)<br/>No.</th>
      <th class="styIRS990ScheduleBTblRB2" scope="col" style="width:70mm">(b)<br/>Name, address, and ZIP + 4</th>  
      <th class="styIRS990ScheduleBTblRB2" scope="col" style="width:30mm" colspan="2">(c)<br/>Total contributions</th>
      <th class="styTblCell2" scope="col" style="width:40mm;border-bottom:1px solid black; height:8mm">(d)<br/>Type of contribution</th>                  
    </tr>            
    <tr>          
      <td valign="top" class="styIRS990ScheduleBTblRB">                        
        <div style="margin-top:4mm; border-bottom:1px solid black; width:auto; text-align:center;font-size:6pt;">          
          <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorNum"/>
          </xsl:call-template>
        </div>
      </td>  
      
      
      
      <td class="styIRS990ScheduleBTblRB" style="height:auto">        
        <div class="styIRS990ScheduleBDotBB" style="height:auto"> 
          <div style="font-family:verdana;font-size:7pt; height:auto"> 
          <xsl:choose>
            <xsl:when test="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorBusinessName">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorBusinessName/BusinessNameLine1Txt"/></xsl:call-template><br/>
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorBusinessName/BusinessNameLine2Txt"/></xsl:call-template> <span style="width:1mm;" />
             </xsl:when>
     
              <xsl:when test="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorPersonNm">
				<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorPersonNm"/> </xsl:call-template> <span style="width:1mm;" />
			  </xsl:when>
			  
			  <xsl:when test="$Form990ScheduleBData/ContributorInformationGrp[$index]/Paid527j1Ind">
				 <input type="Checkbox" class="styIRS990ScheduleBCkbox" alt="Paid527j1Ind">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/Paid527j1Ind"/>
              <xsl:with-param name="BackupName">IRS990SchBPaid527j1Ind</xsl:with-param>
            </xsl:call-template>
          </input>          
          <label>
            <xsl:call-template name="PopulateLabel">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/Paid527j1Ind"/>
              <xsl:with-param name="BackupName">IRS990SchBPaid527j1Ind</xsl:with-param>
            </xsl:call-template>
            Pd. 527(j)(1)
          </label>          
			  </xsl:when>
			  
              <xsl:otherwise>
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/NameNotApplicableCd"/></xsl:call-template><br/>
               <span style="width:1px;" />     
              </xsl:otherwise>  
          </xsl:choose>        
		   </div>
       </div>
  
        <div class="styIRS990ScheduleBDotBB">  
          <xsl:choose>
            <xsl:when test="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorUSAddress">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorUSAddress/AddressLine1Txt"/></xsl:call-template><br/>
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorUSAddress/AddressLine2Txt"/></xsl:call-template> <span style="width:1mm;" />                                                                 
            </xsl:when>
            <xsl:when test="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorForeignAddress">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorForeignAddress/AddressLine1Txt"/></xsl:call-template><br/>
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorForeignAddress/AddressLine2Txt"/></xsl:call-template> <span style="width:1mm;" />                                                                       
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/AddressNotApplicableCd"/></xsl:call-template><br/>
               <span style="width:1px;" />     
          </xsl:otherwise>  
          </xsl:choose>  
        </div>  
   
        <div class="styIRS990ScheduleBDotBB" style="border-bottom:0px">  
          <xsl:choose>
            <xsl:when test="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorUSAddress">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorUSAddress/CityNm"/></xsl:call-template>, 
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorUSAddress/StateAbbreviationCd"/></xsl:call-template> <span style="width:1mm;border-bottom:0px"/>
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorUSAddress/ZIPCd"/></xsl:call-template>
            </xsl:when>
            <xsl:when test="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorForeignAddress">
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorForeignAddress/CityNm"/></xsl:call-template>,
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorForeignAddress/ProvinceOrStateNm"/></xsl:call-template> <span style="width:1mm;" />
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorForeignAddress/ForeignPostalCd"/></xsl:call-template> <span style="width:1mm;" />
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorForeignAddress/CountryCd"/></xsl:call-template>   
            </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/AddressNotApplicableCd"/></xsl:call-template><br/> <span style="width:1mm;" />     
              </xsl:otherwise> 
          </xsl:choose>                  
        </div>
        <br/>      
      </td>   
      
       
      <td class="styIRS990ScheduleBTblRB" colspan="2">                          
        
        <span style="border-bottom:1px solid black; float:left; width:30mm; ; font-size:7pt; height:auto;text-align:right;">$ 
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/TotalContributionsAmt"/>
          </xsl:call-template>          
        </span>  
      </td>    
      <!-- Person, Payroll and Noncash Section fixed for 508 Compliance -->
      <td class="styIRS990ScheduleBTblCell">                        
        <div style="width: 26mm; font-weight: bold; float: right;padding-top:1mm;">
      <label>
        <xsl:call-template name="PopulateLabel">
        <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/PersonContributionInd"/>
        <xsl:with-param name="BackupName">IRS990SchBContributorInformationGrpType<xsl:number value="$index"/> 
        </xsl:with-param>
            </xsl:call-template>
            Person
          </label>  
          <span style="width: 8mm"/>    
      </div>      
      <div style="padding-top:0.5mm;  padding-right:1mm;">
          <input alt="PersonContributionInd" type="Checkbox" class="styIRS990ScheduleBCkbox">                      
         <xsl:call-template name="PopulateCheckbox">
        <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/PersonContributionInd"/>
        <xsl:with-param name="BackupName">IRS990SchBContributorInformationGrpType<xsl:number value="$index"/> 
        </xsl:with-param>
            </xsl:call-template>
          </input>
      </div>
      <br/>
      <div style="width: 26mm; font-weight: bold; float: right;padding-top:1mm;">
      <label>
      <xsl:call-template name="PopulateLabel">
      <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/PayrollContributionInd"/>
      <xsl:with-param name="BackupName">IRS990SchBContributorInfoPayrollContributionType<xsl:number value="$index"/></xsl:with-param>
            </xsl:call-template>
            Payroll
          </label>
          <span style="width:9mm"/>
      </div>
      <div style="padding-top:0.5mm; padding-right:1mm;">
          <input type="Checkbox" class="styIRS990ScheduleBCkbox" alt="PayrollContributionInd">                      
          <xsl:call-template name="PopulateCheckbox">
         <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/PayrollContributionInd"/>
         <xsl:with-param name="BackupName">IRS990SchBContributorInfoPayrollContributionType<xsl:number value="$index"/> </xsl:with-param>
            </xsl:call-template>
          </input>
      </div>
      <br/>
      <div style="width: 26mm; font-weight: bold; float: right;padding-top:1mm;">
      <label>
            <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/NoncashContributionInd"/>
            <xsl:with-param name="BackupName">IRS990SchBContributorInfoNoncashContributionType<xsl:number value="$index"/></xsl:with-param>
            </xsl:call-template>
            Noncash
          </label>
          <span style="width:6mm"/>
      </div>
     
      <div style="padding-top:0.5mm;padding-right:1mm ">
      <input type="Checkbox" class="styIRS990ScheduleBCkbox" alt="NoncashContributionInd">                      
            <xsl:call-template name="PopulateCheckbox">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/NoncashContributionInd"/>
            <xsl:with-param name="BackupName">IRS990SchBContributorInfoNoncashContributionType<xsl:number value="$index"/> </xsl:with-param>
            </xsl:call-template>
          </input>
      </div>
      <div style="font-size:7pt; clear:both; padding-top:2mm; padding-left:0mm">(Complete Part II for noncash contributions.)</div>
      </td>
      
           
    </tr>  
    <xsl:if test="$index mod 6 = 0">
      <tr style="page-break-after:always">
        <td colspan="5" style="font-size:7pt; border-top:1px solid black">
          <xsl:call-template name="IRS990BFooter">
            <xsl:with-param name="showAll" select="1"/>
          </xsl:call-template>        
        </td>
      </tr>
    </xsl:if>
    <xsl:call-template name="p1Template">      
      <xsl:with-param name="index" select="$index + 1"/>
      <xsl:with-param name="max" select="$max"/>
    </xsl:call-template>  
  </xsl:if>    
</xsl:template>  

<xsl:template name="p1TemplateEmpty">  
  <xsl:param name="index" select="1"/>    
  <xsl:param name="max"/>  
  <xsl:if test="$index &lt;= 6">
    <xsl:if test="$index mod 6 = 1">
      <xsl:call-template name="IRS990BHeader">
        <xsl:with-param name="colSpan" select="5"/>
        <xsl:with-param name="thisPage" select="ceiling($index div 6)"/>
        <xsl:with-param name="pageTotal" select="$max div 6"/>
        <xsl:with-param name="thisPart" select="'I'"/>
      </xsl:call-template>
      
      <tr style="font-size:7.5pt; height:9mm; width:187mm" valign="top">
        <th  style="width:100mm; border-top:2px solid black; border-bottom:2px solid black;border-right:1px solid black; font-family:verdana;font-size:7pt;text-align:left" colspan="3"><!--class="styFNBox" scope="col" -->
          <span style="font-weight:normal;">Name of organization</span>
          <br/>
          <span style="font-weight:normal;font-family:verdana;font-size:7pt">
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
            </xsl:call-template>
            <br/>
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
            </xsl:call-template>        
           </span>
        </th>
        <th class="styIRS990ScheduleBTblCell" style="width:70mm; border-top:2px solid black; border-bottom:2px solid black;font-family:verdana;font-size:7pt;"  colspan="2"><!--scope="col"-->
          <span class="styBoldText">Employer identification number</span>
          <br/><br/>
          <span style="font-weight:normal">
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">EIN</xsl:with-param>
            </xsl:call-template>
          </span>
        </th>
      </tr>  
      <tr>
        <th style="width:15mm; border-bottom:1px solid black">
          <div class="styPartName" style="width:10mm;">Part I</div>    
        </th>  
        <th colspan="2" style="width:83mm; border-bottom:1px solid black; float:none;">            
          <div  style="width:98mm; float:none;border-bottom:0px ">Contributors <span style="font-size:6pt;">(see instructions). Use duplicate copies of Part I if additional space is needed.</span></div><!--class="styPartDesc"-->              
        </th>  
        <td style="width:34mm; border-bottom:1px solid black"> <span style="width:1px;" /> </td>              
        <td style="width:8mm; border-bottom:1px solid black"> <span style="width:1px;" /> </td>
        <!--<td style="width:20mm; border-bottom:1 solid black"> <span style="width:1px;" /> </td>-->                
      </tr>    
    </xsl:if>    
    <tr align="center">                            
      <th class="styIRS990ScheduleBTblRB2" scope="col">(a)<br/>No.</th>
      <th class="styIRS990ScheduleBTblRB2" scope="col" style="width:70mm">(b)<br/>Name, address, and ZIP + 4</th>  
      <th class="styIRS990ScheduleBTblRB2" scope="col" colspan="2" >(c)<br/>Total contributions</th>
      <th class="styTblCell2" scope="col" style="border-bottom:1px solid black; height:8mm">(d)<br/>Type of contribution</th>                  
    </tr>            
    <tr>          
      <td valign="top" class="styIRS990ScheduleBTblRB">                        
        <div style="margin-top:1mm; border-bottom:1px solid black; width:7mm; text-align:center">          
        </div>
      </td>  
      <td class="styIRS990ScheduleBTblRB">        
        <div class="styIRS990ScheduleBDotBB">
          <xsl:if test="$index = 1">
            <xsl:call-template name="PopulateAdditionalDataTableMessage">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp"/>                      
            </xsl:call-template>
          </xsl:if>  
        </div>  
        <div class="styIRS990ScheduleBDotBB">  </div>     
        <div class="styIRS990ScheduleBDotBB" style="border-bottom:0px">  </div>
        <br/>      
      </td>    
      <td class="styIRS990ScheduleBTblRB" colspan="2">                          
        <span style="float:left; padding-right:1mm; padding-left:2mm">$</span>
        <span style="border-bottom:1px solid black; float:left; width:30mm; text-align:right; font-size:6pt"/>  
      </td>    
      <td class="styIRS990ScheduleBTblCell">                        
        <div style="float:left;  font-size:10pt;font-weight:bold"><!--padding-left:10mm;-->
          <label>
            Person
          </label><br/>
          <label>
            Payroll
          </label><br/>
          <label>
            Noncash
          </label>
        </div>                  
        <div style="padding-top:0.5mm; float:right; padding-left:2mm">
          <input type="Checkbox" class="styIRSCkbox"> </input><br/>
          <input type="Checkbox" class="styIRSCkbox"> </input><br/>
          <input type="Checkbox" class="styIRSCkbox"> </input>
        </div>                          
        <div style="font-size:7pt; clear:both; padding-top:2mm; padding-left:1mm">(Complete Part II for noncash contribution.)</div>
      </td>                  
    </tr>  
    <xsl:if test="$index mod 6 = 0">
      <tr style="page-break-after:always">
        <td colspan="5" style="font-size:7pt; border-top:1px solid black">
          <xsl:call-template name="IRS990BFooter">
            <xsl:with-param name="showAll" select="1"/>
          </xsl:call-template>        
        </td>
      </tr>
    </xsl:if>
    <xsl:call-template name="p1TemplateEmpty">      
      <xsl:with-param name="index" select="$index + 1"/>
      <xsl:with-param name="max" select="$max"/>
    </xsl:call-template>  
  </xsl:if>    
</xsl:template>  

  

<xsl:template name="p2Template">    
  <xsl:param name="index" select="1"/>      
  <xsl:param name="max"/>  
  <xsl:if test="$index &lt;= $max">  
    <xsl:if test="$index mod 6 = 1">
      <xsl:call-template name="IRS990BHeader">
        <xsl:with-param name="colSpan" select="5"/>
        <xsl:with-param name="thisPage" select="ceiling($index div 6)"/>
        <xsl:with-param name="pageTotal" select="$max div 6"/>
        <xsl:with-param name="thisPart" select="'II'"/>
      </xsl:call-template>  
      <tr style="font-size:7.5pt; height:9mm; width:187mm" valign="top">
        <th style="width:100mm;border-top:2px solid black; border-bottom:2px solid black;font-family:verdana;font-size:7pt;border-right:1px solid black; text-align:left" colspan="2"><!--scope="col"class="styFNBox"  -->
          <span style="font-weight:normal;">Name of organization</span>
          <br/>
          <span style="font-weight:normal;font-size:7pt;font-family:verdana;">
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
            </xsl:call-template>
            <br/>
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
            </xsl:call-template>        
           </span>
        </th>
        <th class="styIRS990ScheduleBTblCell" style="width:80mm;border-top:2px solid black; border-bottom:2px solid black;font-family:verdana;font-size:7pt; text-align:left;" scope="col" colspan="3">
          <span class="styBoldText">Employer identification number</span>
          <br/><br/>
          <span style="font-weight:normal">
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">EIN</xsl:with-param>
            </xsl:call-template>
          </span>
        </th>
      </tr>                    
      <tr>
        <th style="width:10mm; border-bottom:1px solid black">
          <div class="styPartName" style="width:10mm">Part II</div>    
        </th>  
        <th style="width:83mm; border-bottom:1px solid black">            
          <div class="styPartDesc" style="width:102mm">Noncash Property <span style="font-size:5pt;">(see instructions). Use duplicate copies of Part II if additional space is needed.</span></div>                
        </th>  
        <td style="width:30mm; border-bottom:1px solid black"> <span style="width:1px;" /> </td>              
        <td style="width:8mm; border-bottom:1px solid black"> <span style="width:1px;" /> </td>
        <td style="border-bottom:1px solid black"> <span style="width:1px;" /> </td>                
      </tr>      
    </xsl:if>              
    <tr align="center" style="width:187mm; height:auto">      
      <th class="styIRS990ScheduleBTblRB2" scope="col" style="width:40mm">(a)<br/> No. from Part I</th>
      <th class="styIRS990ScheduleBTblRB2" scope="col" style="width:70mm">(b)<br/>Description of noncash property given</th>  
      <th class="styIRS990ScheduleBTblRB2" scope="col" colspan="2">(c)<br/>FMV (or estimate)<br/><span style="font-size:7pt">(See instructions)</span></th>
      <th class="styTblCell2" scope="col" style="border-bottom:1px solid black; height:8mm">(d)<br/>Date received</th>                  
    </tr>            
    <tr style="height:auto">                                    
      <td class="styIRS990ScheduleBTblRB" valign="top">                    
        <div style="margin-top:4mm; border-bottom:1px solid black; width:auto; font-size:6pt;">
          <!--xsl:value-of select="$index"/-->
          <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/NonCashPropertyContributionGrp[$index]/ContributorNum"/>
          </xsl:call-template>
        </div>
      </td>  
      <td class="styIRS990ScheduleBTblRB" style="font-size:7pt;font-family:verdana;text-decoration: underline">
       <xsl:choose>       
        <xsl:when test="normalize-space($Form990ScheduleBData/NonCashPropertyContributionGrp[$index]/NoncashPropertyDesc) = ''">
          <div class="styIRS990ScheduleBDotBB" style="height: 3mm; width:94mm"/>
          <div class="styIRS990ScheduleBDotBB" style="height: 3mm; width:94mm"/>
          <div class="styIRS990ScheduleBDotBB" style="height: 3mm; width:94mm"/>
          <div class="styIRS990ScheduleBDotBB" style="height: 3mm; width:94mm"/>
        </xsl:when>
        <xsl:otherwise>                                         
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/NonCashPropertyContributionGrp[$index]/NoncashPropertyDesc"/>
        </xsl:call-template> <span style="width:1px;" />  
        </xsl:otherwise>     
        </xsl:choose>               
      </td>    
      <td class="styIRS990ScheduleBTblRB" colspan="2">                            
          <span style="border-bottom:1px solid black; float:left; width:30mm; text-align:right; font-size:6pt"><span style=" text-align:left;"/>$
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/NonCashPropertyContributionGrp[$index]/FairMarketValueAmt"/>
          </xsl:call-template>          
        </span>  
      </td>    
      <td class="styIRS990ScheduleBTblCell" style=" padding-left:4mm">                          
        <span style="border-bottom:1px solid black; float:left; width:33mm; text-align:center; margin-right:1mm">
          <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/NonCashPropertyContributionGrp[$index]/ReceivedDt"/></xsl:call-template>
        </span>  
      </td>                  
    </tr>  
    <xsl:if test="$index mod 6 = 0">
      <tr  style="page-break-after:always">
        <td colspan="5" style="font-size:7pt; border-top:1px solid black">
          <xsl:call-template name="IRS990BFooter">
            <xsl:with-param name="showAll" select="1"/>
          </xsl:call-template>        
        </td>
      </tr>
    </xsl:if>
    <xsl:call-template name="p2Template">      
      <xsl:with-param name="index" select="$index + 1"/>
      <xsl:with-param name="max" select="$max"/>
    </xsl:call-template>  
  </xsl:if>    
</xsl:template>


<xsl:template name="p2TemplateEmpty">    
  <xsl:param name="index" select="1"/>      
  <xsl:param name="max"/>  
  <xsl:if test="$index &lt;= 6">  
    <xsl:if test="$index mod 6 = 1">
      <xsl:call-template name="IRS990BHeader">
        <xsl:with-param name="colSpan" select="5"/>
        <xsl:with-param name="thisPage" select="ceiling($index div 6)"/>
        <xsl:with-param name="pageTotal" select="$max div 6"/>
        <xsl:with-param name="thisPart" select="'II'"/>
      </xsl:call-template>  
      <tr style="font-size:7.5pt; height:9mm; width:187mm;" valign="top">
        <th  style="width:100mm; border-top:2px solid black; border-bottom:2px solid black;border-right:1px solid black; font-family:verdana;font-size:7pt;text-align:left" scope="col" colspan="3"><!--class="styFNBox"-->
          <span style="font-weight:normal;">Name of organization</span>
          <br/>
          <span style="font-weight:normal;font-family:verdana;font-size:7pt;">
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
            </xsl:call-template>
            <br/>
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
            </xsl:call-template>        
           </span>
        </th>
        <th class="styIRS990ScheduleBTblCell" style="border-top:2px solid black; border-bottom:2px solid black;font-family:verdana;font-size:7pt;" scope="col" colspan="2">
          <span class="styBoldText">Employer identification number</span>
          <br/><br/>
          <span style="font-weight:normal">
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">EIN</xsl:with-param>
            </xsl:call-template>
          </span>
        </th>
      </tr>                    
      <tr>
        <th style="width:10mm; border-bottom:1px solid black">
          <div class="styPartName" style="width:10mm">Part II</div>    
        </th>  
        <th style="width:83mm; border-bottom:1px solid black">            
          <div class="styPartDesc" style="width:98mm">Noncash Property <span style="font-size:5pt">(see Instructions).  Use duplicate copies of Part II if additional space is needed.</span></div>                
        </th>  
        <td style="width:30mm; border-bottom:1px solid black"> <span style="width:1px;" /> </td>              
        <td style="width:8mm; border-bottom:1px solid black"> <span style="width:1px;" /> </td>
        <td style="border-bottom:1px solid black"> <span style="width:1px;" /> </td>                
      </tr>      
    </xsl:if>              
    <tr align="center" style="height:15mm">      
      <th class="styIRS990ScheduleBTblRB2" scope="col" style="width:25mm">(a)<br/> No. from Part I</th>
      <th class="styIRS990ScheduleBTblRB2" scope="col" style="width:70mm">(b)<br/>Description of noncash property given</th>  
      <th class="styIRS990ScheduleBTblRB2" scope="col" colspan="2" style="width:30mm">(c)<br/>FMV (or estimate)<br/><span style="font-size:7pt">(See instructions)</span></th>
      <th class="styTblCell2" scope="col" style="border-bottom:1px solid black; height:8mm">(d)<br/>Date received</th>                  
    </tr>            
    <tr style="height:21mm">                                    
      <td class="styIRS990ScheduleBTblRB" valign="top">                    
        <div style="margin-top:4mm; border-bottom:1px solid black; width:7mm; text-align:center"/>
      </td>  
      <td class="styIRS990ScheduleBTblRB" style="font-size:7pt;font-family:verdana;">            
        <xsl:if test="$index =1">
          <xsl:call-template name="PopulateAdditionalDataTableMessage">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/NonCashPropertyContributionGrp"/>                      
          </xsl:call-template>
        </xsl:if>                              
        <span style="width:1px;" />                        
      </td>    
      <td class="styIRS990ScheduleBTblRB" colspan="2" style="padding-top:8mm; font-size:7pt">                            
        <span style="float:left; padding-right:1mm; padding-left:2mm">$</span>
        <span style="border-bottom:1px solid black; float:left; width:30mm; text-align:right; font-size:7pt"/>  
      </td>    
      <!--<td class="styIRS990ScheduleBTblRB" colspan="2">                          
        <span style="float:left; padding-right:1mm; padding-left:2mm">$</span>
        <span style="border-bottom:1 solid black; float:left; width:30mm; text-align:right; font-size:7pt">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/TotalContributionsAmt"/>
          </xsl:call-template>          
        </span>  
      </td>     -->
      <td class="styIRS990ScheduleBTblCell" style="padding-top:8mm; padding-left:4mm">                          
        <span style="border-bottom:1px solid black; float:left; width:33mm; text-align:center; margin-right:1mm"/>  
      </td>                  
    </tr>  
    <xsl:if test="$index mod 6 = 0">
      <tr style="page-break-after:always">
        <td colspan="5" style="font-size:7pt; border-top:1px solid black">
          <xsl:call-template name="IRS990BFooter">
            <xsl:with-param name="showAll" select="1"/>
          </xsl:call-template>        
        </td>
      </tr>
    </xsl:if>
    <xsl:call-template name="p2TemplateEmpty">      
      <xsl:with-param name="index" select="$index + 1"/>
      <xsl:with-param name="max" select="$max"/>
    </xsl:call-template>  
  </xsl:if>    
</xsl:template>

<xsl:template name="p3Template">  
  <xsl:param name="index" select="1"/>    
  <xsl:param name="max"/> 
  <xsl:if test="$index &lt;= $max">  

<xsl:if test="$index mod 4 = 1">   
  <table class="styIRS990ScheduleBTable" cellspacing="0" cellpadding="0" border="0" style="width:187mm;">  
      <xsl:call-template name="IRS990BHeader">
        <xsl:with-param name="colSpan" select="4"/>
        <xsl:with-param name="thisPage" select="ceiling($index div 4)"/>
        <xsl:with-param name="pageTotal" select="$max div 4"/>
        <xsl:with-param name="thisPart" select="'III'"/> 
      </xsl:call-template>           
      <tr style="font-size:7.5pt; height:9mm; width:187mm;" valign="top">
        <td  style="width:100mm; border-top:2px solid black; border-bottom:2px solid black;border-right:1px solid black; font-family:verdana;font-size:7pt;text-align:left" scope="col" colspan="3"><!--class="styFNBox"-->
          <span style="font-weight:normal;">Name of organization</span>
          <br/>
          <span style="font-weight:normal;font-family:verdana;font-size:7pt;">
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
            </xsl:call-template>
            <br/>
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
            </xsl:call-template>        
           </span>
        </td>
        <td  class="styIRS990ScheduleBTblCell" style="border-top:2px solid black; border-bottom:2px solid black;font-family:verdana;font-size:7pt;" scope="col" colspan="2"><!---->
          <span class="styBoldText">Employer identification number</span>
          <br/><br/>
          <span style="font-weight:normal">
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">EIN</xsl:with-param>
            </xsl:call-template>
          </span>
        </td>                                      
      </tr>  
      <tr>
        <td style="width:187mm; border-bottom:2px solid black" scope="col" colspan="4"><!--height:auto-->
          <div class="styPartName" style="border-bottom:1px solid black;width:12mm">Part III</div>                
          <div class="styPartDesc" style="border-bottom:1px solid blackwidth:170mm; height:20mm;padding-top:0.5mm; "><!-- padding-bottom:0.5mm-->
				<i>Exclusively</i> religious, charitable, etc., contributions to organizations described in section 501(c)(7), (8), or (10) that total more than $1,000 for the year from any one contributor.
            Complete columns <b>(a)</b> through <b>(e) and</b> the following line entry. For organizations completing Part III, enter the total of <i>exclusively</i> religious, charitable, etc., contributions of <b>$1,000 or less</b> for the year. (Enter this information once. See instructions.) 
                <img src="{$ImagePath}/990SchB_Bullet.gif" alt="Arrow Bullet" /><span style="width:3mm"/>$ 
                 <span style="border-bottom:1px solid black; width:32mm; text-align:center; color:blue">
                           <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/TotalUnder1000ContributionsAmt"/></xsl:call-template></span>
            <!--</span>-->  <br/>
            <span style=" font-weight:normal; float:left">Use duplicate copies of Part III if additional space is needed.</span>
          </div>                  
        </td>  
      </tr> 
      </table>
    </xsl:if>  
  <table class="styIRS990ScheduleBTable" cellspacing="0" cellpadding="0" border="0" style="width:187mm;">       
    <tr align="center" > <!--style="width:187mm"-->     
      <th class="styIRS990ScheduleBTblRB2" scope="col" width="7%" style="line-height:100%;">(a)<br/> No. from Part I</th>
      <th class="styIRS990ScheduleBTblRB2" scope="col" width="31%">(b) Purpose of gift</th>  
      <th class="styIRS990ScheduleBTblRB2" scope="col" width="31%">(c) Use of gift</th>  
      <th class="styIRS990ScheduleBTblCell" scope="col">(d) Description of how gift is held</th>                            
    </tr>   
             
    <tr style="height:auto; text-decoration: underline">                  
      <td class="styIRS990ScheduleBTblRB2" valign="top" rowspan="2">                                                    
        <div style="margin-top:4mm;  width:auto; text-align:center;font-size:6pt;text-decoration: underline"><!--border-bottom:1px solid black;-->
        <!--<xsl:value-of select="$index"/>-->
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/ContributorNum"/>
          </xsl:call-template>
        </div>
      </td>  
      <td class="styIRS990ScheduleBTblRB" style="border-bottom:1px solid black; font-size:7pt;font-family:verdana;">    
      <xsl:choose>       
        <xsl:when test="normalize-space($Form990ScheduleBData/CharitableContributionsDetail[$index]/GiftPurposeTxt) = ''">
          <div class="styIRS990ScheduleBDotBB" style="height: 3mm; width:52mm"/>
          <div class="styIRS990ScheduleBDotBB" style="height: 3mm; width:52mm"/>
          <div class="styIRS990ScheduleBDotBB" style="height: 3mm; width:52mm"/>
        </xsl:when>
        <xsl:otherwise>                 
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/GiftPurposeTxt"/>
        </xsl:call-template>
        </xsl:otherwise>
        </xsl:choose>
      </td>    
      <td class="styIRS990ScheduleBTblRB" style="font-size:7pt;font-family:verdana;">         
      <xsl:choose>       
        <xsl:when test="normalize-space($Form990ScheduleBData/CharitableContributionsDetail[$index]/GiftUseTxt) = ''">
          <div class="styIRS990ScheduleBDotBB" style="height: 3mm; width:52mm"/>
          <div class="styIRS990ScheduleBDotBB" style="height: 3mm; width:52mm"/>
          <div class="styIRS990ScheduleBDotBB" style="height: 3mm; width:52mm"/>
        </xsl:when>
        <xsl:otherwise>            
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/GiftUseTxt"/>
        </xsl:call-template>
        </xsl:otherwise>
        </xsl:choose>
      </td>    
      <td class="styIRS990ScheduleBTblCell" style="font-size:7pt;font-family:verdana;"> 
      <xsl:choose>       
        <xsl:when test="normalize-space($Form990ScheduleBData/CharitableContributionsDetail[$index]/HowGiftIsHeldDesc) = ''">
          <div class="styIRS990ScheduleBDotBB" style="height: 3mm; width:52mm"/>
          <div class="styIRS990ScheduleBDotBB" style="height: 3mm; width:52mm"/>
          <div class="styIRS990ScheduleBDotBB" style="height: 3mm; width:52mm"/>
        </xsl:when>
        <xsl:otherwise>                    
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/HowGiftIsHeldDesc"/>
        </xsl:call-template>
        </xsl:otherwise>
        </xsl:choose>
      </td>                  
    </tr>  
    <tr>                      
      <td colspan="3">
        <table class="styIRS990ScheduleBTable" cellpadding="0" cellspacing="0" border="0">      
          <tr align="center">
            <td colspan="2">(e) Transfer of gift </td>               
          </tr>      
          <tr align="center">
            <td width="45%" style="border-bottom:1px solid black">Transferee's name, address, and ZIP  4</td>
            <td style="border-bottom:1px solid black">Relationship of transferor to transferee</td>
          </tr>
        
          <tr style="height:auto; text-decoration: underline">
            <td class="styIRS990ScheduleBTblRB" style="font-size:7pt;font-family:verdana;">                            
              <div class="styIRS990ScheduleBDotBB1" style="height:auto">    
                <xsl:if test="normalize-space($Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeNameIndividual)!=''">
                  <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeNameIndividual"/></xsl:call-template>  
                </xsl:if>
                                
                <div style="font-family:verdana;font-size:6pt;">                 
                 <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeNameBusiness/BusinessNameLine1Txt"/></xsl:call-template>
                <xsl:if test="normalize-space($Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeNameBusiness/BusinessNameLine2Txt)!=''">
                  <br/><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeNameBusiness/BusinessNameLine2Txt"/></xsl:call-template>                          
                 </xsl:if> 
                </div>         
                 
              </div> 
                 
              <xsl:choose>
                <xsl:when test="$Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeUSAddress">                  
                  <div class="styIRS990ScheduleBDotBB1" style="height:auto">  
                    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeUSAddress/AddressLine1Txt"/></xsl:call-template>  
                    <xsl:if test="normalize-space($Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeUSAddress/AddressLine2Txt)!=''">
                      <br/><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeUSAddress/AddressLine2Txt"/></xsl:call-template><br/>
                    </xsl:if>                          
                  </div>     
                  <div class="styIRS990ScheduleBDotBB1" style="height:auto;border-bottom:0;">                              
                    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeUSAddress/CityNm"/></xsl:call-template>, 
                    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeUSAddress/StateAbbreviationCd"/></xsl:call-template> <span style="width:1mm;" />
                    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeUSAddress/ZIPCd"/></xsl:call-template>                                            
                  </div>                                  
                </xsl:when>
                <xsl:otherwise>                  
                  <div class="styIRS990ScheduleBDotBB1" style="height:auto">  
                    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeForeignAddress/AddressLine1Txt"/></xsl:call-template>  
                    <xsl:if test="normalize-space($Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeForeignAddress/AddressLine2Txt)!=''"><br/>
                      <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeForeignAddress/AddressLine2Txt"/></xsl:call-template>                            
                    </xsl:if>
                  </div>     
                  <div class="styIRS990ScheduleBDotBB1" style="height:auto;border-bottom:0;">                          
                    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeForeignAddress/CityNm"/></xsl:call-template>
                    <xsl:if test="normalize-space($Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeForeignAddress/ProvinceOrStateNm)!='' or normalize-space($Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeForeignAddress/ForeignPostalCd)!=''">, </xsl:if>
                    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeForeignAddress/ProvinceOrStateNm"/></xsl:call-template> <span style="width:1mm;" />
                    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeForeignAddress/ForeignPostalCd"/></xsl:call-template>                                                              
                  </div>
                  <div>
                    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeForeignAddress/CountryCd"/></xsl:call-template>
                  </div>
                </xsl:otherwise>
              </xsl:choose>                            
            </td>
            <td class="styIRS990ScheduleBTblCell">    
            <xsl:choose>       
        <xsl:when test="normalize-space($Form990ScheduleBData/CharitableContributionsDetail[$index]/RlnOfTransferorToTransfereeTxt) = ''">
          <div class="styIRS990ScheduleBDotBB" style="height: .25mm; width:90mm"/>
          <div class="styIRS990ScheduleBDotBB" style="height: auto; width:90mm"/>
          <div class="styIRS990ScheduleBDotBB" style="height: 3mm; width:90mm"/>
        </xsl:when>
        <xsl:otherwise>          
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/RlnOfTransferorToTransfereeTxt"/></xsl:call-template>
        </xsl:otherwise>
          </xsl:choose>
            </td>
          </tr>              
        </table>
      </td>
    </tr></table>
    <xsl:if test="$index mod 4 = 0">
      <tr style="page-break-after : always">
        <td colspan="4" style="font-size:7pt; border-top:1px solid black">
          <xsl:call-template name="IRS990BFooter">
            <xsl:with-param name="showAll" select="1"/>
          </xsl:call-template>        
        </td>

      </tr>
    </xsl:if>    
    <xsl:call-template name="p3Template">      
      <xsl:with-param name="index" select="$index +1"/>
      <xsl:with-param name="max" select="$max"/>
    </xsl:call-template>  
  </xsl:if>    
</xsl:template>

<xsl:template name="p3TemplateEmpty">  
  <xsl:param name="index" select="1"/>    
  <xsl:param name="max"/>  
  <xsl:if test="$index &lt;= 4">    
    <xsl:if test="$index mod 4 = 1">      
      <xsl:call-template name="IRS990BHeader">
        <xsl:with-param name="colSpan" select="4"/>
        <xsl:with-param name="thisPage" select="ceiling($index div 4)"/>
        <xsl:with-param name="pageTotal" select="$max div 4"/>
        <xsl:with-param name="thisPart" select="'III'"/>
      </xsl:call-template>
      <tr style="font-size:7.5pt; height:9mm; width:187mm; text-align:left" valign="top">
        <th  style="width:90mm;border-top:2px solid black; border-bottom:2px solid black;border-right:1px solid black; font-family:verdana;font-size:7pt;text-align:left" scope="col" colspan="3"><!--class="styFNBox"-->
          <span style="font-weight:normal;">Name of organization</span>
          <br/>
          <span style="font-weight:normal;font-family:verdana;font-size:7pt;">
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
            </xsl:call-template>
            <br/>
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
            </xsl:call-template>        
           </span>
        </th>
        <th class="styIRS990ScheduleBTblCell" style="border-top:2px solid black; border-bottom:2px solid black;font-family:verdana;font-size:7pt;" scope="col" colspan="2">
          <span class="styBoldText">Employer identification number</span>
          <br/><br/>
          <span style="font-weight:normal">
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">EIN</xsl:with-param>
            </xsl:call-template>
          </span>
        </th>                                      
      </tr>  
      
      <tr style="height:8mm">
        <th style="border-bottom:1px solid black" scope="col" colspan="4">
          <div class="styPartName" style="width:12mm">Part III</div>                
          <div class="styPartDesc" style="width:170mm; height:20mm; padding-top:0.5mm; padding-bottom:0.5mm; float:left">
            <b><i>Exclusively</i> religious, charitable, etc., contributions to organizations described in section 501(c)(7), (8), or (10) that total more than $1,000 for the year from any one contributor.</b>
            <!--<span style="font-weight:normal; float:none">--> Complete columns <b>(a)</b> through <b>(e) and</b> the following line entry. For organizations completing Part III, enter the total of <i>exclusively</i> religious, charitable, etc.,contributions of <b>$1,000 or less</b> for the year. (Enter this information once.<!--&#151;--> See instructions.) 
            <img src="{$ImagePath}/990SchB_Bullet.gif" alt="Arrow Bullet"/><span style="width:3mm" />$
            <xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$Form990ScheduleBData/TotalUnder1000ContributionsAmt"/>
            </xsl:call-template>
           <!-- </span> --> 
            <br/>
            <span style="font-weight:normal; float:left">Use duplicate copies of Part III if additional space is needed.</span>
          </div>                  
        </th>                
      </tr>  
    </xsl:if>      
    <tr align="center">      
      <th class="styIRS990ScheduleBTblRB" scope="col" width="7%" style="line-height:100%;">(a) No.<br/>from<br/>Part I</th>
      <th class="styIRS990ScheduleBTblRB" scope="col" width="31%">(b)<br/>Purpose of gift</th>  
      <th class="styIRS990ScheduleBTblRB" scope="col" width="31%">(c)<br/>Use of gift</th>  
      <th class="styIRS990ScheduleBTblCell" scope="col">(d)<br/>Description of how gift is held</th>                            
    </tr>            
    <tr style="height:16mm; text-decoration: underline">                  
      <td class="styIRS990ScheduleBTblRB" valign="top" rowspan="2">                                                    
        <div style="margin-top:4mm; border-bottom:1px solid black; width:7mm; text-align:center"/>
      </td>  
      <td class="styIRS990ScheduleBTblRB" style="font-size:7pt;font-family:verdana;">
        <xsl:if test="$index = 1">
          <xsl:call-template name="PopulateAdditionalDataTableMessage">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail"/>                      
          </xsl:call-template>
        </xsl:if>
          <span style="width:1px"/></td>    
      <td class="styIRS990ScheduleBTblRB" style="font-size:7pt;font-family:verdana;"><span style="width:1px"/></td>    
      <td class="styIRS990ScheduleBTblCell" style="font-size:7pt;font-family:verdana;"><span style="width:1px"/></td>                  
    </tr>  
    <tr>                      
      <td colspan="3">
        <table class="styIRS990ScheduleBTable" cellpadding="0" cellspacing="0" border="0">      
          <tr align="center">
            <th colspan="2">                
              (e)<br/>Transfer of gift
            </th>
          </tr>      
          <tr align="center">
            <th width="45%" style="border-bottom:1px solid black">Transferee's name, address, and ZIP <span style="font-weight:normal">+</span> 4</th>
            <th style="border-bottom:1px solid black">Relationship of transferor to transferee</th>
          </tr>
        
          <tr style="height:16mm; text-decoration: underline">
            <td class="styIRS990ScheduleBTblRB" style="font-size:7pt;font-family:verdana;">                            
              <div class="styIRS990ScheduleBDotBB1" style="height:3mm">    </div>    
                  <div class="styIRS990ScheduleBDotBB1" style="height:4mm">  </div>     
                  <div class="styIRS990ScheduleBDotBB1" style="height:4mm;border-bottom:0;">                          </div>
                  <div/>
            </td>
            <td class="styIRS990ScheduleBTblCell"><span style="width:1px"/>             </td>
          </tr>              
        </table>
      </td>
    </tr>
  
    <xsl:if test="$index mod 4 = 0">
      <tr style="page-break-after:always">
        <td colspan="4" style="font-size:7pt; border-top:1px solid black">
          <xsl:call-template name="IRS990BFooter">
            <xsl:with-param name="showAll" select="1"/>
          </xsl:call-template>        
        </td>
      </tr>
    </xsl:if>    
    <xsl:call-template name="p3TemplateEmpty">      
      <xsl:with-param name="index" select="$index + 1"/>
      <xsl:with-param name="max" select="$max"/>
    </xsl:call-template>  
  </xsl:if>    
</xsl:template>


<xsl:template name="IRS990BFooter">  
  <xsl:param name="showAll"/>    
  <!--div style="width:187mm; font-size:7pt; border-top:1 solid black; page-break-after:always"-->   
    <xsl:if test="$showAll = 0">
      <div style="float:left; font-size:7pt; padding-top:0.5mm">
        <b>For Paperwork Reduction Act Notice, see the Instructions<br/>for Form 990, 990-EZ, or 990-PF. </b>
      </div>    
    </xsl:if>       
    <div style="float:right; padding-top:0.5mm; padding-right:0.5mm">      
      <xsl:if test="$showAll = 0">
        <span style="margin-right:20mm">Cat. No. 30613X</span>
      </xsl:if>         
      <b>Schedule B (Form 990, 990-EZ, or 990-PF) (2019)</b>
    </div>
   <!-- <div class="pageEnd"/>-->
  <!--/div-->    
</xsl:template>
<!-- This sets up page counter, and Part increment-RLJ -->
<xsl:template name="IRS990BHeader">  
  <xsl:param name="colSpan"/>    
  <xsl:param name="thisPage"/>  
  <xsl:param name="pageTotal"/>    
  <xsl:param name="thisPart"/>
  <tr style="font-size:7pt">
    <td style="padding-bottom:0.5mm; padding-right:0.5mm">
      <xsl:attribute name="colspan">
        <xsl:value-of select="$colSpan"/>
      </xsl:attribute>  
      <!--   KEEP FOR FUTURE USE ON HOW TO INCREMENT PAGES AUTOMATICALLY
      <div style="float:left">      
        Schedule B (Form 990, 990-EZ, or 990-PF) (2012)
      </div>  
      <div style="float:right">   
       Page
      <span style="width:5mm; border-bottom:1 solid black; text-align:center">
          <xsl:value-of select="$thisPage"/>
       </span>-->
        <!--of-->
      <!--  <span style="width:5mm; border-bottom:1 solid black; text-align:center">-->
          <!--<xsl:value-of select="$pageTotal"/>-->
       <!-- </span>-->
        <!--of-->
        <!--<b>Part <xsl:value-of select="$thisPart"/></b>-->
     <!--</div> -->
    </td>
  </tr>    
</xsl:template>  

<!-- Template for Separated Repeating Data for Part I -->
<xsl:template name="p1SRDTemplate">  
  <xsl:param name="index" select="1"/>    
  <xsl:if test="$index &lt;= count($Form990ScheduleBData/ContributorInformationGrp)">
    <xsl:if test="$index = 1">
      <thead class="styTableThead">  
        <tr class="styDepTblHdr" align="center">                            
          <th class="styDepTblCell" scope="col" style="width:25mm">(a)<br/>No.</th>
          <th class="styDepTblCell" scope="col" style="width:50mm">(b)<br/>Name, address, and ZIP + 4</th>  
          <th class="styDepTblCell" scope="col" colspan="2" width="50mm">(c)<br/>Total contributions</th>
          <th class="styDepTblCell" scope="col" style="border-bottom:1px solid black; height:8mm">(d)<br/>Type of contribution</th>                  
        </tr>  
      </thead>
    </xsl:if>          
    <tr>          
      <!-- Define background colors to the rows -->
      <xsl:attribute name="class">
        <xsl:choose>
          <xsl:when test="$index mod 2 = 1">styDepTblRow1</xsl:when>
          <xsl:otherwise>styDepTblRow2</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>

     <td valign="top" class="styIRS990ScheduleBTblRB">                        
        <div style="margin-top:4mm; border-bottom:1px solid black; width:auto; text-align:left; font-size:6pt;">          
          <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" 
				select="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorNum"/>
		  </xsl:call-template>
        </div>
     </td>
      
      
      
      <td class="styIRS990ScheduleBTblRB" style="height:auto; width:auto; text-align: left;">        
        <div class="styIRS990ScheduleBDotBB" style="height:auto"> 
          <div style="font-family:verdana;font-size:7pt; height:auto"> 
 
          <xsl:choose>
            <xsl:when test="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorBusinessName">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorBusinessName/BusinessNameLine1Txt"/></xsl:call-template><br/>
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorBusinessName/BusinessNameLine2Txt"/></xsl:call-template> <span style="width:1px;" />
             </xsl:when>
     
              <xsl:when test="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorPersonNm">
				<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorPersonNm"/> </xsl:call-template> <span style="width:1px;" />
			  </xsl:when>
			  
			  <xsl:when test="$Form990ScheduleBData/ContributorInformationGrp[$index]/Paid527j1Ind">
				<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/Paid527j1Ind"/> </xsl:call-template>
			  </xsl:when>
			  
              <xsl:otherwise>
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/NameNotApplicableCd"/></xsl:call-template><br/>
               <span style="width:1px;" />     
              </xsl:otherwise>  
          </xsl:choose>                    
           
		   </div>
       </div>
  
        <div class="styIRS990ScheduleBDotBB">  
          <xsl:choose>
            <xsl:when test="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorUSAddress">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorUSAddress/AddressLine1Txt"/></xsl:call-template><br/>
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorUSAddress/AddressLine2Txt"/></xsl:call-template> <span style="width:1px;" />                                                                 
            </xsl:when>
            <xsl:when test="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorForeignAddress">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorForeignAddress/AddressLine1Txt"/></xsl:call-template><br/>
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorForeignAddress/AddressLine2Txt"/></xsl:call-template> <span style="width:1px;" />                                                                       
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/AddressNotApplicableCd"/></xsl:call-template><br/>
               <span style="width:1px;" />     
          </xsl:otherwise>  
          </xsl:choose>  
        </div>  
   
        <div class="styIRS990ScheduleBDotBB" style="border-bottom:0px">  
         <xsl:choose>
            <xsl:when test="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorUSAddress">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorUSAddress/CityNm"/></xsl:call-template>, 
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorUSAddress/StateAbbreviationCd"/></xsl:call-template> <span style="width:3px;border-bottom:0px"/>
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorUSAddress/ZIPCd"/></xsl:call-template>
            </xsl:when>
            <xsl:when test="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorForeignAddress">
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorForeignAddress/CityNm"/></xsl:call-template>,
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorForeignAddress/ProvinceOrStateNm"/></xsl:call-template> <span style="width:1px;" />
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorForeignAddress/ForeignPostalCd"/></xsl:call-template> <span style="width:3px;" />
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/ContributorForeignAddress/CountryCd"/></xsl:call-template>   
            </xsl:when>
              <xsl:otherwise>
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/AddressNotApplicableCd"/></xsl:call-template><br/> <span style="width:1px;" />     
              </xsl:otherwise> 
          </xsl:choose>            
        </div>
        <br/>      
      </td>
      <td class="styIRS990ScheduleBTblRB" colspan="2">                          
        <!--<span>--><!--style="float:left;  "padding-right:1mm;padding-left:2mm;-->
        <span style="border-bottom:1px solid black;  width:25mm;; font-size:6pt; ">$
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/TotalContributionsAmt"/>
          </xsl:call-template>          
        </span><!--</span> --> 
      </td>    
      <td class="styIRS990ScheduleBTblCell">                        
        <div style="float:left; padding-left:10mm; font-weight:bold;vertical-align:center;">
        <!-- Person Label-->
          <label>
          <xsl:call-template name="PopulateLabel"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/PersonContributionInd"/>
            <xsl:with-param name="BackupName">IRS990SchBContributorInfoPersonContributionType</xsl:with-param>
            </xsl:call-template>
            <span style=";height:3mm;font-weight:bold;font-family:verdana; font-size:8pt;padding-top:0.5mm; padding-bottom:1mm;">Person</span>
          </label>
          <br/>
          
<!-- Payroll Label-->
          <label>
           <xsl:call-template name="PopulateLabel"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/PayrollContributionInd"/>
            <xsl:with-param name="BackupName">IRS990SchBContributorInfoPayrollContributionType</xsl:with-param>
            </xsl:call-template>
           <span style="height:3mm;font-weight:bold;font-family:verdana; font-size:8pt;padding-top:2mm; "> Payroll </span>
          </label>
          <br/>
          <br/>
          <!-- Noncash Label-->
          <label>
            <xsl:call-template name="PopulateLabel"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/NoncashContributionInd"/>
            <xsl:with-param name="BackupName">IRS990SchBContributorInfoNoncashContributionType</xsl:with-param>
            </xsl:call-template>
            <span style="height:3mm;font-weight:bold;font-family:verdana;font-size:8pt;padding-bottom:3.5mm; ">Noncash</span>
          </label>
          
         
                  </div>   
                       
       <div style="padding-top:0.5mm; float:left; padding-left:2mm">
        <!-- Person Checkbox-->
       
        
          <input type="Checkbox" class="styIRS990ScheduleBCkbox">                      
            <xsl:call-template name="PopulateCheckbox">
         <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/PersonContributionInd"/>
         <xsl:with-param name="BackupName">IRS990SchBContributorInfoPersonContributionType</xsl:with-param>
            </xsl:call-template>
          </input>
              <br/>
              
            <!-- Payroll Checkbox-->
          <input type="Checkbox" class="styIRS990ScheduleBCkbox">                      
            <xsl:call-template name="PopulateCheckbox">
         <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/PayrollContributionInd"/>
         <xsl:with-param name="BackupName">IRS990SchBContributorInfoPayrollContributionType</xsl:with-param>
            </xsl:call-template>
          </input>  
              <br/>
              
            <!-- Noncash Checkbox-->
          <input type="Checkbox" class="styIRS990ScheduleBCkbox">                      
            <xsl:call-template name="PopulateCheckbox">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInformationGrp[$index]/NoncashContributionInd"/>
            <xsl:with-param name="BackupName">IRS990SchBContributorInfoNoncashContributionType</xsl:with-param>
            </xsl:call-template>
            
          </input>
              </div>     
                      
        <div style="font-size:7pt; clear:both; padding-top:2mm; padding-left:1mm;">(Complete Part II for noncash contribution.)</div>
      </td>                  
    </tr>  
    <xsl:call-template name="p1SRDTemplate">      
      <xsl:with-param name="index" select="$index + 1"/>
    </xsl:call-template>  
  </xsl:if>    
</xsl:template>  

<!-- Template for Separated Repeated Data for Part II -->
<xsl:template name="p2SRDTemplate">    
  <xsl:param name="index" select="1"/>      
  <xsl:if test="$index &lt;= count($Form990ScheduleBData/ContributorInformationGrp)">  
    <xsl:if test="$index = 1">
      <thead class="styTableThead">  
        <tr class="styDepTblHdr" align="center" style="height:15mm">      
          <th class="styDepTblCell" scope="col" style="width:25mm; padding-top:4mm">(a)<br/> No. from Part I</th>
          <th class="styIRS990ScheduleBTblRB2" scope="col" style="width:70mm">(b)<br/>Description of noncash property given</th>  
          <th class="styIRS990ScheduleBTblRB2" scope="col" colspan="2" style="width:25mm">(c)<br/>FMV (or estimate)<br/><span style="font-size:7pt">(See instructions)</span></th>
          <th class="styTblCell2" scope="col" style="border-bottom:1px solid black; height:8mm">(d)<br/>Date received</th>                  
        </tr>            
      </thead>
    </xsl:if>              
    <tr style="height:auto; padding-top:2mm">                                    
      <!-- Define background colors to the rows -->
      <xsl:attribute name="class">
        <xsl:choose>
          <xsl:when test="$index mod 2 = 1">styDepTblRow1</xsl:when>
          <xsl:otherwise>styDepTblRow2</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>

      <td class="styIRS990ScheduleBTblRB" valign="top">                    
        <div style=" border-bottom:1px solid black; width:auto; text-align:center;font-size:6pt;"><!--margin-top:6mm;-->
          <!--xsl:value-of select="$index"/-->
          <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/NonCashPropertyContributionGrp[$index]/ContributorNum"/>
          </xsl:call-template>
        </div>
      </td>  
      <td class="styIRS990ScheduleBTblRB" style="font-size:7pt;font-family:verdana;text-align:left;">                                                
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/NonCashPropertyContributionGrp[$index]/NoncashPropertyDesc"/>
        </xsl:call-template> <span style="width:1px;" />                        
      </td>    
      <td class="styIRS990ScheduleBTblRB" colspan="2">                            
          <span style="border-bottom:1px solid black; float:left; width:30mm; text-align:right; font-size:6pt"><span style=" text-align:left;"/>$
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/NonCashPropertyContributionGrp[$index]/FairMarketValueAmt"/>
          </xsl:call-template>          
        </span>  
      </td>    
      <td class="styIRS990ScheduleBTblCell" style="; padding-left:4mm">                          
        <span style="border-bottom:1px solid black; float:left; width:33mm; text-align:center; margin-right:1mm">
          <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/NonCashPropertyContributionGrp[$index]/ReceivedDt"/>
          </xsl:call-template>
        </span>  
      </td>                  
    </tr>  
    <xsl:call-template name="p2SRDTemplate">      
      <xsl:with-param name="index" select="$index + 1"/>
    </xsl:call-template>  
  </xsl:if>
</xsl:template>

<!-- Template for Separated Repeated Data for Part III -->
<xsl:template name="p3SRDTemplate">  
  <xsl:param name="index" select="1"/>    

  <xsl:if test="$index &lt;= count($Form990ScheduleBData/CharitableContributionsDetail)">    
      <thead class="styTableThead">
      <tr class="styDepTblHdr" align="center">      
        <th class="styDepTblCell" scope="col" width="7%" style="line-height:100%;width:25mm">(a)<br/> No. from Part I</th>
        <th class="styDepTblCell" scope="col" width="31%" >(b)<br/>Purpose of gift</th>  
        <th class="styDepTblCell" scope="col" width="31%">(c)<br/>Use of gift</th>  
        <th class="styDepTblCell" scope="col">(d)<br/>Description of how gift is held</th>                            
      </tr>
      </thead>            
    <tr style="height:16mm">                  
      <!-- Define background colors to the rows -->
      <xsl:attribute name="class">
        <xsl:choose>
          <xsl:when test="$index mod 2 = 1">styDepTblRow1</xsl:when>
          <xsl:otherwise>styDepTblRow2</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>

      <td class="styIRS990ScheduleBTblRB" valign="top" rowspan="2">                                                    
        <div style="margin-top:4mm; border-bottom:1px solid black; width:auto; text-align:left; font-size:6pt;">
          <!--xsl:value-of select="$index"/-->
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/ContributorNum"/>
          </xsl:call-template>
        </div>
      </td>  
      <td class="styIRS990ScheduleBTblRB" style="font-size:7pt;font-family:verdana;text-align:left;">                    
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/GiftPurposeTxt"/>
        </xsl:call-template>
      </td>    
      <td class="styIRS990ScheduleBTblRB" style="font-size:7pt;font-family:verdana;text-align:left;">                    
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/GiftUseTxt"/>
        </xsl:call-template>
      </td>    
      <td class="styIRS990ScheduleBTblCell" style="font-size:7pt;font-family:verdana;text-align:left;">                    
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/HowGiftIsHeldDesc"/>
        </xsl:call-template>
      </td>                  
    </tr>  
    <tr>     
             
      <td colspan="3">
        <table style="font-size:7pt;" cellpadding="0" cellspacing="0" border="0">      
      <thead class="styTableThead">
          <tr class="styDepTblHdr" align="center" >
            <th  scope="col" colspan="2">             
              (e)<br/>Transfer of gift
            </th>
          </tr>      
          <tr class="styDepTblHdr" align="center">
            <th  scope="col"  width="45%" style="width:70mm;border-bottom:1px solid black">Transferee's name, address, and ZIP  4</th>
            <th  scope="col"  style="width;70mm;float:none; border-bottom:1px solid black">Relationship of transferor to transferee</th> 
          </tr>
</thead>        
          <tr style="height:auto">
      <!-- Define background colors to the rows -->
      <xsl:attribute name="class">
        <xsl:choose>
          <xsl:when test="$index mod 2 = 1">styDepTblRow1</xsl:when>
          <xsl:otherwise>styDepTblRow2</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>

            <td class="styIRS990ScheduleBTblRB" style="font-size:7pt;font-family:verdana;">                            
              <div class="styIRS990ScheduleBDotBB1" style="height:auto; text-align:left;">    
                <xsl:if test="normalize-space($Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeNameIndividual)!=''">
                  <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeNameIndividual"/></xsl:call-template>  
                </xsl:if> 
                <div style="font-family:verdana;font-size:6pt;text-align:left;">     
                 <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeNameBusiness/BusinessNameLine1Txt"/></xsl:call-template>
                 <xsl:if test="normalize-space($Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeNameBusiness/BusinessNameLine2Txt)!=''">
                  <br/><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeNameBusiness/BusinessNameLine2Txt"/></xsl:call-template>                          
                </xsl:if> 
               </div>                 
              </div>    
              <xsl:choose>
                <xsl:when test="$Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeUSAddress">                  
                  <div class="styIRS990ScheduleBDotBB1" style="height:auto; text-align:left;">  
                    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeUSAddress/AddressLine1Txt"/></xsl:call-template>  
                    <xsl:if test="normalize-space($Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeUSAddress/AddressLine2Txt)!=''">
                      <br/><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeUSAddress/AddressLine2Txt"/></xsl:call-template><br/>
                    </xsl:if>                          
                  </div>     
                  <div class="styIRS990ScheduleBDotBB1" style="height:auto;border-bottom:0; text-align:left;">                              
                    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeUSAddress/CityNm"/></xsl:call-template>, 
                    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeUSAddress/StateAbbreviationCd"/></xsl:call-template> <span style="width:1mm;" />
                    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeUSAddress/ZIPCd"/></xsl:call-template>                                            
                  </div>                                  
                </xsl:when>
                <xsl:otherwise>                  
                  <div class="styIRS990ScheduleBDotBB1" style="height:auto; text-align:left;">  
                    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeForeignAddress/AddressLine1Txt"/></xsl:call-template>  
                    <xsl:if test="normalize-space($Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeForeignAddress/AddressLine2Txt)!=''"><br/>
                      <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeForeignAddress/AddressLine2Txt"/></xsl:call-template>                            
                    </xsl:if>
                  </div>     
                  <div class="styIRS990ScheduleBDotBB1" style="height:auto;border-bottom:0; text-align:left;">                          
                    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeForeignAddress/CityNm"/></xsl:call-template>
                    <xsl:if test="normalize-space($Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeForeignAddress/ProvinceOrStateNm)!='' or normalize-space($Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeForeignAddress/ForeignPostalCd)!=''">, </xsl:if>
                    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeForeignAddress/ProvinceOrStateNm"/></xsl:call-template> <span style="width:1mm;" />
                    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeForeignAddress/ForeignPostalCd"/></xsl:call-template>                                                              
                  </div>
                  <div class="styIRS990ScheduleBDotBB1" style="height:auto;border-bottom:0; text-align:left;">
                    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/TransfereeForeignAddress/CountryCd"/></xsl:call-template>
                  </div>
                </xsl:otherwise>
              </xsl:choose>                            
            </td>
            <td class="styIRS990ScheduleBTblCell"  style="height:auto;border-bottom:0; text-align:left;">              
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributionsDetail[$index]/RlnOfTransferorToTransfereeTxt"/></xsl:call-template>
            </td>
          </tr>              
        </table>
      </td>
    </tr>
     <xsl:call-template name="p3SRDTemplate">      
      <xsl:with-param name="index" select="$index + 1"/>
    </xsl:call-template>  
  </xsl:if>    
</xsl:template>
  

</xsl:stylesheet>