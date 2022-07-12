<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<!-- Updated 7/21/2011 per UWR 40502 by Robert L Jones -->
<!-- Updated 1/21/2012 per UWR 40502 by Robert L Jones -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS990ScheduleBStyle.xsl"/>

<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
<xsl:strip-space elements="*" />
<xsl:param name="Form990ScheduleBData" select="$RtnDoc/IRS990ScheduleB" />


<xsl:template match="/">
<html>
  <head>
    <title>Schedule B (Form 990, 990-EZ, or 990-PF) (2011)</title>      
    <!-- No Browser Caching -->
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>
    <!-- No Proxy Caching -->
    <meta http-equiv="Cache-Control" content="private"/>    
    <meta name="Description" content="Schedule B (Form 990, 990-EZ, or 990-PF)"/>
    <meta name="GENERATOR" content="IBM WebSphere Studio"/>
    <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
    <xsl:call-template name="InitJS"></xsl:call-template>
       <style type="text/css">   
        <xsl:if test="not($Print) or $Print=''">
      
	<xsl:call-template name="IRS990ScheduleBStyle"></xsl:call-template>
	<xsl:call-template name="AddOnStyle"></xsl:call-template>
     </xsl:if> 
    </style>              
    <xsl:call-template name="GlobalStylesForm"/>
  </head>
  
  <body class="styBodyClass">    
    <form style="font-family:arial; font-size:8.5pt" name="Form990ScheduleB">
      <xsl:call-template name="DocumentHeader"></xsl:call-template>

      <div class="styTBB" style="width:187mm">
        <div class="styFNBox" style="height:18mm; width:31mm">        
          <b style="font-size:12pt">
            Schedule B
            <div style="line-height:100%; font-size:7.5pt">
            (Form 990, 990-EZ,<br />or 990-PF)
            </div>
          </b>
          <div style="font-size:6pt; padding-top:1mm">
            Department of the Treasury<br/>Internal Revenue Service
          </div>              
        </div>
        <div class="styFTBox" style="width:125mm">
          <div class="styMainTitle" style="padding-top:1mm; font-size:12pt">Schedule of Contributors</div>
          <div style="font-weight:bold; font-size:7.5pt; padding-top:2mm">
          <img src="{$ImagePath}/990SchB_Bullet.gif" alt="Arrow Bullet"/> 
            Attach to Form 990, 990-EZ, or 990-PF.<br />
           <!-- <img src="{$ImagePath}/990SchB_Bullet.gif" alt="Arrow Bullet"/> See separate instructions.-->
          </div>
        </div>
        <div class="styTYBox" style="font-size:7pt; width:31mm; height:18mm">
          <div class="styOMB" style="height:2mm;">OMB No. 1545-0047</div>
          <div class="styFN" style="padding-top:3mm">
            20<span class="styTYColor">11</span>
          </div>              
        </div>
      </div>      
      
      <!-- Begin Name and Identifying Number Section-->      
      <div class="styBB" style="width:187mm;clear:both;font-family:verdana;font-size:7pt;">
        <div class="styFNBox" style="width:139mm;height:8mm;">
          <span class="styBoldText">Name of organization</span><br/>
           <div style="font-family:verdana;font-size:6pt;">
            <xsl:call-template name="PopulateReturnHeaderFiler">
            <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
           </xsl:call-template>
          <br />
           <xsl:call-template name="PopulateReturnHeaderFiler">
            <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
           </xsl:call-template>
         </div>          
        </div>
        <div class="styGenericDiv" style="width:47mm;height:4mm;padding-left:1mm;">
          <span class="styBoldText">Employer identification number</span>
          <br/><br/>
          <xsl:call-template name="PopulateReturnHeaderFiler">
            <xsl:with-param name="TargetNode">EIN</xsl:with-param>
          </xsl:call-template>
        </div>
      </div>
      <!-- End Name and Identifying Number Section-->      
      
      <div class="styBB" style="padding-bottom:6mm; width:187mm; height:8mm; clear:both; padding-top:1mm">
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
        <div style="margin-left:40mm">
          <input type="Checkbox" class="styIRS990ScheduleBCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/Organization501c"/>
            </xsl:call-template>
          </input>          
          <label>
            <xsl:call-template name="PopulateLabel">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/Organization501c" />
            </xsl:call-template>
            501(c)(
            <xsl:choose>
              <xsl:when test="$Form990ScheduleBData/Organization501c/@typeOf501cOrganization">
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/Organization501c/@typeOf501cOrganization" /></xsl:call-template>          
              </xsl:when> 
              <xsl:otherwise>
                &nbsp;&nbsp;&nbsp;&nbsp;
              </xsl:otherwise>  
            </xsl:choose>
            ) (enter number) organization
          </label>          
          <br/><br/>          
          <input type="Checkbox" class="styIRS990ScheduleBCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/Organization4947a1NotPF"/>
            </xsl:call-template>
          </input> 
                   <!--Is it a 4947a1NotPF  Checkbox-->
          <label>
            <xsl:call-template name="PopulateLabel">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/Organization4947a1NotPF" />
            </xsl:call-template>
            4947(a)(1) nonexempt charitable trust <b>not</b> treated as a private foundation
          </label>          
          <br/><br/>    
                <!--Is it a 527 Organization Checkbox-->
          <input type="Checkbox" class="styIRS990ScheduleBCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/Organization527"/>
            </xsl:call-template>
          </input>          
          <label>
            <xsl:call-template name="PopulateLabel">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/Organization527" />
            </xsl:call-template>
            527 political organization
          </label>          
        </div>        
        <br/>        
        <div class="styGenericDiv" style="clear:left; height:15mm; width:40mm">Form 990-PF</div>
        <div style="margin-left:40mm">
        
        <!--Organization 501(c)(3) Exempt PF Checkbox-->
          <input type="Checkbox" class="styIRS990ScheduleBCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/Organization501c3ExemptPF"/>
            </xsl:call-template>
          </input>          
          <label>
            <xsl:call-template name="PopulateLabel">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/Organization501c3ExemptPF" />
            </xsl:call-template>
            501(c)(3) exempt private foundation
          </label>          
          <br/><br/>     
          <!--Organization 4947a(1) Treated as PF Checkbox-->     
          <input type="Checkbox" class="styIRS990ScheduleBCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/Organization4947a1TreatedAsPF"/>
            </xsl:call-template>
          </input>    
             <label>
            <xsl:call-template name="PopulateLabel">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/Organization4947a1TreatedAsPF" />
            </xsl:call-template>
            4947(a)(1) nonexempt charitable trust treated as a private foundation
          </label>
          <br/><br/>      
          <!--Is it a 501(c)(3) Taxable Private Foundation Checkbox-->    
          <input type="Checkbox" class="styIRS990ScheduleBCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/Organization501c3TaxablePF"/>
            </xsl:call-template>
          </input>          
          <label>
            <xsl:call-template name="PopulateLabel">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/Organization501c3TaxablePF"/>
            </xsl:call-template>
            501(c)(3) taxable private foundation
          </label>
        </div>
      </div>
      
      <div style="width:187mm; padding-top:1mm">
        Check if your organization is covered by the <b>General Rule</b> or a <b>Special Rule.</b> &nbsp;<br/><b>Note.</b>&nbsp;Only a section 501(c)(7), (8), or (10) organization can check boxes for both the General Rule and a Special Rule. See instructions.      
      </div>
      
      <div style="width:187mm; margin-top:5mm; margin-bottom:5mm">
        <b>General Rule<!--&#151;--></b>
      </div>
        
      <div style="padding-left:5mm; width:187mm">
        <div style="float:left">
          <input type="Checkbox" class="styIRS990ScheduleBCkbox"><xsl:call-template name="PopulateCheckbox"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/GeneralRule"/></xsl:call-template></input>
        </div>
        <div style="float:right; width:177mm">
          <label><xsl:call-template name="PopulateLabel"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/GeneralRule" /></xsl:call-template>
            For an organization filing Form 990, 990-EZ, or 990-PF that received, during the year, $5,000 or more (in money or<br />property) from any one contributor. Complete Parts I and II.
          </label>
        </div>
      </div>
        
      <div style="width:187mm; margin-top:5mm; margin-bottom:5mm">
        <b>Special Rules<!--&#151;--></b>
      </div>  
        
      <div style="padding-left:5mm; width:187mm">
        <div style="float:left;width:4mm;padding-top:.7mm;">
          <input type="Checkbox" class="styCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/SpclRuleMetOneThirdSuprtTest"/>
            </xsl:call-template>
          </input>
        </div>
        <div style="float:right;width:177mm;">
          <label><xsl:call-template name="PopulateLabel"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/SpclRuleMetOneThirdSuprtTest" /></xsl:call-template>
            For a section 501(c)(3) organization filing Form 990 or 990-EZ that met the 
            33<font style="font-family: 'Arial Narrow'; font-size: smaller;"><sup>1</sup>/3</font>% 
            support test of the regulations <br/>under sections 509(a)(1) and 170(b)(1)(A)(vi), and received from any one contributor, during the year, a contribution of the <br/>greater of <b>(1)</b> $5,000 or <b>(2)</b> 2% of the amount on (i) Form 990, Part VIII, line 1h, or (ii) Form 990-EZ, line 1. Complete Parts I and II. 
         </label>
        </div>
      </div>
      
      <div style="padding-left:5mm; margin-top:5mm; width:187mm">
        <div style="float:left">
          <input type="Checkbox" class="styCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/SpclRuleRcvdTotContriMore1000"/>
            </xsl:call-template>
          </input>
        </div>
        <div style="float:right; width:177mm">
          <label><xsl:call-template name="PopulateLabel"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/SpclRuleRcvdTotContriMore1000" /></xsl:call-template>
            For a section 501(c)(7), (8), or (10) organization filing Form 990, or 990-EZ that received from any one contributor,<br />during the year, total contributions of more than $1,000 for use <i>exclusively</i> for religious, charitable,<br />scientific, literary, or educational purposes, or the prevention of cruelty to children or animals. Complete Parts I, II, and<br />III.
          </label>
        </div>
      </div>
        
      <div style="padding-left:5mm; margin-top:5mm; width:187mm">
        <div style="float:left">
          <input type="Checkbox" class="styCkbox">
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/SpclRuleRcvdTotContriUpTo1000"/>
            </xsl:call-template>
          </input>
        </div>
        <div style="float:right; width:177mm">
          <label><xsl:call-template name="PopulateLabel"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/SpclRuleRcvdTotContriUpTo1000" /></xsl:call-template>
            For a section 501(c)(7), (8), or (10) organization filing Form 990, or 990-EZ that received from any one contributor,<br />during the year, contributions for use <i>exclusively</i> for religious, charitable, etc., purposes, but these contributions did<br />not total to more than $1,000. If this box is checked, enter here the total contributions that were received during<br />the year for an <i>exclusively</i> religious, charitable, etc., purpose. Do not complete any of the parts unless the <b>General Rule</b><br />applies to this organization because it received nonexclusively religious, charitable, etc., contributions of $5,000 or more<br />during the year.
          </label>        
          <span class="styIRS990ScheduleBDotLn">      
            .........................
          </span>          
          <img src="{$ImagePath}/990SchB_Bullet.gif" alt="Arrow Bullet"/> &nbsp; $ &nbsp;
          <span style="border-bottom:1 solid black; width:32mm; text-align:center; color:blue">
            <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/SpclRuleRcvdTotContriUpTo1000/@totalContributions" /></xsl:call-template>
          </span>    
        </div>
      </div>
      
      <div style="border-bottom:1 solid black; width:187mm; margin-top:5mm; padding-bottom:3mm">      
        <b>Caution.</b>&#160;An Organization that is not covered by the General Rule and/or the Special Rules does not file Schedule B (Form 990,<br />990-EZ, or 990-PF), but it <b>must</b> answer “No” on Part IV, line 2, of its Form 990; or check the box on line H of its<br />Form 990-EZ or on Part I, line 2, of its Form 990-PF, to certify that it does not meet the filing requirements of Schedule B (Form 990,<br/>990-EZ, or 990-PF).
      </div>      
      
      <div style="width:187mm; font-size:7pt; border-top:1 solid black">
        <xsl:call-template name="IRS990BFooter">
          <xsl:with-param name="showAll" select="0"/>
        </xsl:call-template>
      </div>
      <br class="pageEnd"/>
      <div style="width:187mm;padding-top:2mm;">
						
						<div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt; padding-top:5mm;">2</span>
						</div>
					</div>

    <!-- BEGIN Part I -->
      <xsl:variable name="totalRowCount1" select="count($Form990ScheduleBData/ContributorInfo)" />    
      <xsl:variable name="containerHeight" select="6" />    
      
        <table class="styIRS990ScheduleBTable" cellspacing="0" cellpadding="0" border="0" style="width:187mm;">  
     <xsl:choose>
        <xsl:when test="($Print = $Separated) and (count($Form990ScheduleBData/ContributorInfo) &gt; 6)">
         <xsl:call-template name="p1TemplateEmpty">               
         <xsl:with-param name="max">
           <xsl:choose>
                     <xsl:when test="$totalRowCount1 &gt; $containerHeight">     
                    <xsl:value-of select="ceiling($totalRowCount1 div 6)*6" />
                     </xsl:when>
                          <xsl:otherwise>
                        <xsl:value-of select="$containerHeight" />
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
                    <xsl:value-of select="ceiling($totalRowCount1 div 6)*6" />
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:value-of select="$containerHeight" />
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:with-param>
            </xsl:call-template>
         </xsl:otherwise>
       </xsl:choose>
       </table>
        
               
    <!-- END Part I -->    
    
    <!-- BEGIN Part II -->  
      <xsl:variable name="totalRowCount2" select="count($Form990ScheduleBData/NoncashProperty)" />                  
      
      <br class="pageEnd"/>
      <div style="width:187mm;padding-top:3mm;">
						
						<div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt; ">3</span>
						</div>
					</div>
      
      <table class="styIRS990ScheduleBTable" cellspacing="0" cellpadding="0" border="0" style="width:187mm;">  
              
        <xsl:choose>
          <xsl:when test="($Print = $Separated) and (count($Form990ScheduleBData/NoncashProperty) &gt; 6)">
            <xsl:call-template name="p2TemplateEmpty">                        
              <xsl:with-param name="max">
                <xsl:choose>
                     <xsl:when test="$totalRowCount1 &gt; $containerHeight">     
                    <xsl:value-of select="ceiling($totalRowCount1 div 6)*6" />
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:value-of select="$containerHeight" />
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
                  <xsl:value-of select="ceiling($totalRowCount2 div 6)*6" />
                   </xsl:when>
                   <xsl:otherwise>
                      <xsl:value-of select="$containerHeight" />
                </xsl:otherwise>
              </xsl:choose>
            </xsl:with-param>
          </xsl:call-template>            
       </xsl:otherwise>
        </xsl:choose>
        </table>                          
    <!-- END Part II -->      
      
    <!-- BEGIN Part III -->  
    
    <br class="pageEnd"/>
    <div style="width:187mm;padding-top:3mm;">
						
						<div style="float:right">
    Page <span class="styBoldText" style="font-size: 8pt; ">4</span>
						</div>
					</div>
    
      <xsl:variable name="totalRowCount3" select="count($Form990ScheduleBData/CharitableContributions)" />                
      <xsl:variable name="containerHeight3" select="4" />    
      
        <table class="styIRS990ScheduleBTable" cellspacing="0" cellpadding="0" border="0" style="width:187mm;">   
             
        <xsl:choose>
          <xsl:when test="($Print = $Separated) and (count($Form990ScheduleBData/CharitableContributions) &gt; 4)">
            <xsl:call-template name="p3TemplateEmpty">                        
              <xsl:with-param name="max">
                <xsl:choose>
                     <xsl:when test="$totalRowCount1 &gt; $containerHeight">     
                    <xsl:value-of select="ceiling($totalRowCount1 div 6)*6" />
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:value-of select="$containerHeight" />
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
                  <xsl:value-of select="ceiling($totalRowCount3 div 4)*4" />
                   </xsl:when>
                   <xsl:otherwise>
                      <xsl:value-of select="$containerHeight3" />
                </xsl:otherwise>
              </xsl:choose>
            </xsl:with-param>
          </xsl:call-template>              
       </xsl:otherwise>
      </xsl:choose>
        </table>                          
              
    <!-- END Part III -->              
      
      <p style="page-break-before:always" />
      
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
          <xsl:with-param name="TargetNode" select="$Form990ScheduleBData" />        
        </xsl:call-template>
      </table>    

     <xsl:if test="($Print = $Separated) and (count($Form990ScheduleBData/ContributorInfo) &gt; 6)">
        <span class="styRepeatingDataTitle">Form 990 Schedule B, Part I - Contributors (see Instructions). Use duplicate copies of Part I if additional space is needed</span>
        <table class="styDepTbl" cellspacing="0" cellpadding="0" border="0" style="width:187mm;font-size:7pt;">  
          <xsl:call-template name="p1SRDTemplate" />
        </table>
    </xsl:if>

  <xsl:if test="($Print = $Separated) and (count($Form990ScheduleBData/NoncashProperty) &gt; 6)"> <br/>
        <span class="styRepeatingDataTitle">Form 990 Schedule B, Part II - Noncash Property (see Instructions). Use duplicate copies of Part II if additional space is needed</span>
        <table class="styDepTbl" cellspacing="0" cellpadding="0" border="0" style="width:187mm;font-size:7pt;">  
          <xsl:call-template name="p2SRDTemplate" />
        </table>
     </xsl:if>
      
   <xsl:if test="($Print = $Separated) and (count($Form990ScheduleBData/CharitableContributions) &gt; 4)"> <br/>
        <span class="styRepeatingDataTitle">Form 990 Schedule B, Part III - Exclusively religious, charitable, etc., individual contributions to section 501(c)(7), (8), or (10) organizations
aggregating more than $1,000 for the year. (Complete columns (a) through (e) and the following line entry.):</span>
        <table class="styDepTbl" cellspacing="0" cellpadding="0" border="0" style="width:187mm;font-size:7pt;">  
          <xsl:call-template name="p3SRDTemplate" />
        </table>
  </xsl:if>
      
    </form>    
  </body>
</html>
</xsl:template>  

<xsl:template name="p1Template">  
  <xsl:param name="index" select="1"/>    
  <xsl:param name="max" />  
  <xsl:if test="$index &lt;= $max">
    <xsl:if test="$index mod 6 = 1">
      <xsl:call-template name="IRS990BHeader">
        <xsl:with-param name="colSpan" select="5"/>
        <xsl:with-param name="thisPage" select="ceiling($index div 6)"/>
        <xsl:with-param name="pageTotal" select="$max div 6"/>
        <xsl:with-param name="thisPart" select="'I'"/>
      </xsl:call-template>
      <tr style="font-size:7.5pt; height:9mm" valign="top">
        <th class="styFNBox" style="border-top:2 solid black; border-bottom:2 solid black;font-family:verdana;font-size:7pt;" nowrap="nowrap" colspan="3">
          <span class="styBoldText">Name of organization</span>
          <br/>
          <span style="font-weight:normal;font-family:verdana;font-size:6pt">
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
            </xsl:call-template>
            <br />
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
            </xsl:call-template>        
           </span>
        </th>
        <th class="styIRS990ScheduleBTblCell" style="border-top:2 solid black; border-bottom:2 solid black;font-family:verdana;font-size:7pt;" nowrap="nowrap" colspan="2">
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
        <th style="width:10mm; border-bottom:1 solid black">
          <div class="styPartName" style="width:12mm">Part I</div>    
        </th>  
        <th style="width:130mm; border-bottom:1 solid black">            
          <div class="styPartDesc" style="width:130mm">Contributors <span style="font-weight:normal">(see Instructions). Use duplicate copies of Part I if additional space is needed.</span></div>              
        </th>  
        <td style="width:34mm; border-bottom:1 solid black"> &nbsp; </td>              
        <td style="width:8mm; border-bottom:1 solid black"> &nbsp; </td>
        <td style="border-bottom:1 solid black"> &nbsp; </td>                
      </tr>    
    </xsl:if>    
    <tr align="center">                            
      <th class="styIRS990ScheduleBTblRB2" nowrap="nowrap">(a)<br />No.</th>
      <th class="styIRS990ScheduleBTblRB2"  nowrap="nowrap">(b)<br />Name, address, and ZIP + 4</th>  
      <th class="styIRS990ScheduleBTblRB2" nowrap="nowrap" colspan="2">(c)<br />Total contributions</th>
      <th class="styTblCell2" nowrap="nowrap" style="border-bottom:1 solid black; height:8mm">(d)<br />Type of contribution</th>                  
    </tr>            
    <tr>          
      <td valign="top" class="styIRS990ScheduleBTblRB">                        
        <div style="margin-top:4mm; border-bottom:1 solid black; width:7mm; text-align:center">          
      <xsl:call-template name="PopulateText">
       <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/ContributorNumber"/>
          </xsl:call-template>
        </div>
      </td>  
      <td class="styIRS990ScheduleBTblRB">        
        <div class="styIRS990ScheduleBDotBB"> 
          <div style="font-family:verdana;font-size:6pt;">               
          <xsl:call-template name="PopulateText">
           <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/ContributorNameBusiness/BusinessNameLine1"/>
           </xsl:call-template><br />
           <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/ContributorNameBusiness/BusinessNameLine2"/></xsl:call-template>
       </div>
      <br />
          <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/ContributorNameIndividual"/></xsl:call-template> &nbsp;
          <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/Pd527j1"/></xsl:call-template>
        </div>  
        <div class="styIRS990ScheduleBDotBB">  
          <xsl:choose>
            <xsl:when test="$Form990ScheduleBData/ContributorInfo[$index]/ContributorAddressUS">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/ContributorAddressUS/AddressLine1"/></xsl:call-template><br />
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/ContributorAddressUS/AddressLine2"/></xsl:call-template> &nbsp;                                                                 
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/ContributorAddressForeign/AddressLine1"/></xsl:call-template><br />
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/ContributorAddressForeign/AddressLine2"/></xsl:call-template> &nbsp;                                                                       
            </xsl:otherwise>
          </xsl:choose>  
        </div>     
        <div class="styIRS990ScheduleBDotBB">  
          <xsl:choose>
            <xsl:when test="$Form990ScheduleBData/ContributorInfo[$index]/ContributorAddressUS">
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/ContributorAddressUS/City"/></xsl:call-template>, 
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/ContributorAddressUS/State"/></xsl:call-template> &nbsp;
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/ContributorAddressUS/ZIPCode"/></xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:if test="$Form990ScheduleBData/ContributorInfo[$index]/ContributorAddressForeign">
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/ContributorAddressForeign/City"/></xsl:call-template>,
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/ContributorAddressForeign/ProvinceOrState"/></xsl:call-template> &nbsp;
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/ContributorAddressForeign/PostalCode"/></xsl:call-template> &nbsp;
                <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/ContributorAddressForeign/Country"/></xsl:call-template>
              </xsl:if>    
            </xsl:otherwise>
          </xsl:choose>                  
        </div>
        <br/>      
      </td>    
      <td class="styIRS990ScheduleBTblRB" colspan="2">                          
        <span style="float:left; padding-right:1mm; padding-left:2mm">$</span>
        <span style="border-bottom:1 solid black; float:left; width:30mm; text-align:right; font-size:8pt">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/AggregateContributions"/>
          </xsl:call-template>          
        </span>  
      </td>    
      <td class="styIRS990ScheduleBTblCell">                        
        <div style="float:left; padding-left:10mm; font-weight:bold">
          <label>
            <xsl:call-template name="PopulateLabel"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/PersonContributionType" /></xsl:call-template>
            Person
          </label><br/>
          <label>
            <xsl:call-template name="PopulateLabel"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/PayrollContributionType" /></xsl:call-template>
            Payroll
          </label><br/>
          <label>
            <xsl:call-template name="PopulateLabel"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/NoncashContributionType" /></xsl:call-template>
            Noncash
          </label>
        </div>                  
        <div style="padding-top:0.5mm; float:left; padding-left:2mm">
          <input type="Checkbox" class="styIRS990ScheduleBCkbox">                      
            <xsl:call-template name="PopulateCheckbox"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/PersonContributionType"/></xsl:call-template>
          </input><br/>
          <input type="Checkbox" class="styIRS990ScheduleBCkbox">                      
            <xsl:call-template name="PopulateCheckbox"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/PayrollContributionType"/></xsl:call-template>
          </input><br/>
          <input type="Checkbox" class="styIRS990ScheduleBCkbox">                      
            <xsl:call-template name="PopulateCheckbox"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/NoncashContributionType"/></xsl:call-template>
          </input>
        </div>                          
        <div style="font-size:7pt; clear:both; padding-top:2mm; padding-left:4mm">(Complete Part II if there is a noncash contribution.)</div>
      </td>                  
    </tr>  
    <xsl:if test="$index mod 6 = 0">
      <tr style="page-break-after:always">
        <td colspan="5" style="font-size:7pt; border-top:1 solid black">
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
  <xsl:param name="max" />  
  <xsl:if test="$index &lt;= 6">
    <xsl:if test="$index mod 6 = 1">
      <xsl:call-template name="IRS990BHeader">
        <xsl:with-param name="colSpan" select="5"/>
        <xsl:with-param name="thisPage" select="ceiling($index div 6)"/>
        <xsl:with-param name="pageTotal" select="$max div 6"/>
        <xsl:with-param name="thisPart" select="'I'"/>
      </xsl:call-template>
      
      <tr style="font-size:7.5pt; height:9mm" valign="top">
        <th class="styFNBox" style="border-top:2 solid black; border-bottom:2 solid black;font-family:verdana;font-size:7pt;" nowrap="nowrap" colspan="3">
          <span class="styBoldText">Name of organization</span>
          <br/>
          <span style="font-weight:normal;font-family:verdana;font-size:6pt">
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
            </xsl:call-template>
            <br />
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
            </xsl:call-template>        
           </span>
        </th>
        <th class="styIRS990ScheduleBTblCell" style="border-top:2 solid black; border-bottom:2 solid black;font-family:verdana;font-size:7pt;" nowrap="nowrap" colspan="2">
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
        <th style="width:10mm; border-bottom:1 solid black">
          <div class="styPartName" style="width:12mm">Part I</div>    
        </th>  
        <th style="width:90mm; border-bottom:1 solid black">            
          <div class="styPartDesc" style="width:90mm">Contributors <span style="font-weight:normal">(see Instructions) Use duplicate copies of Part I if additional space is needed</span></div>              
        </th>  
        <td style="width:34mm; border-bottom:1 solid black"> &nbsp; </td>              
        <td style="width:8mm; border-bottom:1 solid black"> &nbsp; </td>
        <td style="border-bottom:1 solid black"> &nbsp; </td>                
      </tr>    
    </xsl:if>    
    <tr align="center">                            
      <th class="styIRS990ScheduleBTblRB2" nowrap="nowrap">(a)<br />No.</th>
      <th class="styIRS990ScheduleBTblRB2"  nowrap="nowrap">(b)<br />Name, address, and ZIP + 4</th>  
      <th class="styIRS990ScheduleBTblRB2" nowrap="nowrap" colspan="2">(c)<br />Aggregate contributions</th>
      <th class="styTblCell2" nowrap="nowrap" style="border-bottom:1 solid black; height:8mm">(d)<br />Type of contribution</th>                  
    </tr>            
    <tr>          
      <td valign="top" class="styIRS990ScheduleBTblRB">                        
        <div style="margin-top:4mm; border-bottom:1 solid black; width:7mm; text-align:center">          
        </div>
      </td>  
      <td class="styIRS990ScheduleBTblRB">        
        <div class="styIRS990ScheduleBDotBB">
        <!-- Depending on the number of data rows, insert blank rows to fill the container height -->
                <!-- For separated print where there are more data elements than the container height, -->
                <!-- display a message in the first row directing the user to the additional data table -->
          <xsl:if test="$index = 1">
            <xsl:call-template name="PopulateAdditionalDataTableMessage">
              <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo"/>                      
            </xsl:call-template>
          </xsl:if>  
        </div>  
        <div class="styIRS990ScheduleBDotBB">  </div>     
        <div class="styIRS990ScheduleBDotBB">  </div>
        <br/>      
      </td>    
      <td class="styIRS990ScheduleBTblRB" colspan="2">                          
        <span style="float:left; padding-right:1mm; padding-left:2mm">$</span>
        <span style="border-bottom:1 solid black; float:left; width:30mm; text-align:right; font-size:8pt"></span>  
      </td>    
      <td class="styIRS990ScheduleBTblCell">                        
        <div style="float:left; padding-left:10mm; font-weight:bold">
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
        <div style="padding-top:0.5mm; float:left; padding-left:2mm">
          <input type="Checkbox" class="styIRS990ScheduleBCkbox"> </input><br/>
          <input type="Checkbox" class="styIRS990ScheduleBCkbox"> </input><br/>
          <input type="Checkbox" class="styIRS990ScheduleBCkbox"> </input>
        </div>                          
        <div style="font-size:7pt; clear:both; padding-top:2mm; padding-left:4mm">(Complete Part II if there is<br />a noncash contribution.)</div>
      </td>                  
    </tr>  
    <xsl:if test="$index mod 6 = 0">
      <tr style="page-break-after:always">
        <td colspan="5" style="font-size:7pt; border-top:1 solid black">
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

  
<!-- PART II -->
<xsl:template name="p2Template">    
  <xsl:param name="index" select="1"/>      
  <xsl:param name="max" />  
  <xsl:if test="$index &lt;= $max">  
    <xsl:if test="$index mod 6 = 1">
      <xsl:call-template name="IRS990BHeader">
        <xsl:with-param name="colSpan" select="5"/>
        <xsl:with-param name="thisPage" select="ceiling($index div 6)"/>
        <xsl:with-param name="pageTotal" select="$max div 6"/>
        <xsl:with-param name="thisPart" select="'II'"/>
      </xsl:call-template>  
      <tr style="font-size:7.5pt; height:9mm" valign="top">
        <th class="styFNBox" style="border-top:2 solid black; border-bottom:2 solid black;font-family:verdana;font-size:7pt;" nowrap="nowrap" colspan="3">
          <span class="styBoldText">Name of organization</span>
          <br/>
          <span style="font-weight:normal;font-size:6pt;font-family:verdana;">
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
            </xsl:call-template>
            <br />
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
            </xsl:call-template>        
           </span>
        </th>
        <th class="styIRS990ScheduleBTblCell" style="border-top:2 solid black; border-bottom:2 solid black;font-family:verdana;font-size:7pt;" nowrap="nowrap" colspan="2">
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
        <th style="width:10mm; border-bottom:1 solid black">
          <div class="styPartName" style="width:12mm">Part II</div>    
        </th>  
        <th style="width:130mm; border-bottom:1 solid black">            
          <div class="styPartDesc" style="width:130mm">Noncash Property <span style="font-weight:normal">(see Instructions). Use duplicate copies of Part II if additional space is needed.</span></div>                
        </th>  
        <td style="width:30mm; border-bottom:1 solid black"> &nbsp; </td>              
        <td style="width:8mm; border-bottom:1 solid black"> &nbsp; </td>
        <td style="border-bottom:1 solid black"> &nbsp; </td>                
      </tr>      
    </xsl:if>              
    <tr align="center" style="height:15mm">      
      <th class="styIRS990ScheduleBTblRB2" nowrap="nowrap">(a) No.<br />from<br />Part I</th>
      <th class="styIRS990ScheduleBTblRB2" nowrap="nowrap">(b)<br />Description of noncash property given</th>  
      <th class="styIRS990ScheduleBTblRB2" nowrap="nowrap" colspan="2">(c)<br />FMV (or estimate)<br /><span style="font-size:7pt">(see instructions).</span></th>
      <th class="styTblCell2" nowrap="nowrap" style="border-bottom:1 solid black; height:8mm">(d)<br />Date received</th>                  
    </tr>            
    <tr style="height:21mm">                                    
      <td class="styIRS990ScheduleBTblRB" valign="top">                    
        <div style="margin-top:4mm; border-bottom:1 solid black; width:7mm; text-align:center">
          <!--xsl:value-of select="$index"/-->
          <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/NoncashProperty[$index]/ContributorNumberFromPartI"/></xsl:call-template>
        </div>
      </td>  
      <td class="styIRS990ScheduleBTblRB" style="font-size:7pt;font-family:verdana;">
       <xsl:choose>       
        <xsl:when test="normalize-space($Form990ScheduleBData/NoncashProperty[$index]/NoncashPropertyDescription) = ''">
          <div class="styIRS990ScheduleBDotBB" style="height: 3mm; width:94mm" />
          <div class="styIRS990ScheduleBDotBB" style="height: 3mm; width:94mm" />
          <div class="styIRS990ScheduleBDotBB" style="height: 3mm; width:94mm" />
          <div class="styIRS990ScheduleBDotBB" style="height: 3mm; width:94mm" />
        </xsl:when>
        <xsl:otherwise>                                         
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/NoncashProperty[$index]/NoncashPropertyDescription"/>
        </xsl:call-template> &nbsp;  
        </xsl:otherwise>     
        </xsl:choose>               
      </td>    
      <td class="styIRS990ScheduleBTblRB" colspan="2" style="padding-top:8mm; font-size:8pt">                            
        <span style="float:left; padding-right:1mm; padding-left:1mm">$</span>
        <span style="border-bottom:1 solid black; float:left; width:28mm; text-align:right">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/NoncashProperty[$index]/FairMarketValue"/>
          </xsl:call-template>          
        </span>  
      </td>    
      <td class="styIRS990ScheduleBTblCell" style="padding-top:8mm; padding-left:4mm">                          
        <span style="border-bottom:1 solid black; float:left; width:33mm; text-align:center; margin-right:1mm">
          <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/NoncashProperty[$index]/DateReceived"/></xsl:call-template>
        </span>  
      </td>                  
    </tr>  
    <xsl:if test="$index mod 6 = 0">
      <tr style="page-break-after:always">
        <td colspan="5" style="font-size:7pt; border-top:1 solid black">
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
  <xsl:param name="max" />  
  <xsl:if test="$index &lt;= 6">  
    <xsl:if test="$index mod 6 = 1">
      <xsl:call-template name="IRS990BHeader">
        <xsl:with-param name="colSpan" select="5"/>
        <xsl:with-param name="thisPage" select="ceiling($index div 6)"/>
        <xsl:with-param name="pageTotal" select="$max div 6"/>
        <xsl:with-param name="thisPart" select="'II'"/>
      </xsl:call-template>  
      <tr style="font-size:7.5pt; height:9mm" valign="top">
        <th class="styFNBox" style="border-top:2 solid black; border-bottom:2 solid black;font-family:verdana;font-size:7pt;" nowrap="nowrap" colspan="3">
          <span class="styBoldText">Name of organization</span>
          <br/>
          <span style="font-weight:normal;font-family:verdana;font-size:6pt;">
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
            </xsl:call-template>
            <br />
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
            </xsl:call-template>        
           </span>
        </th>
        <th class="styIRS990ScheduleBTblCell" style="border-top:2 solid black; border-bottom:2 solid black;font-family:verdana;font-size:7pt;" nowrap="nowrap" colspan="2">
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
        <th style="width:10mm; border-bottom:1 solid black">
          <div class="styPartName" style="width:12mm">Part II</div>    
        </th>  
        <th style="width:95mm; border-bottom:1 solid black">            
          <div class="styPartDesc" style="width:95mm">Noncash Property <span style="font-weight:normal">(see Instructions) Use duplicate copies of Part II if additional space is needed</span></div>                
        </th>  
        <td style="width:30mm; border-bottom:1 solid black"> &nbsp; </td>              
        <td style="width:8mm; border-bottom:1 solid black"> &nbsp; </td>
        <td style="border-bottom:1 solid black"> &nbsp; </td>                
      </tr>      
    </xsl:if>              
    <tr align="center" style="height:15mm">      
      <th class="styIRS990ScheduleBTblRB2" nowrap="nowrap">(a) No.<br />from<br />Part I</th>
      <th class="styIRS990ScheduleBTblRB2" nowrap="nowrap">(b)<br />Description of noncash property given</th>  
      <th class="styIRS990ScheduleBTblRB2" nowrap="nowrap" colspan="2">(c)<br />FMV (or estimate)<br /><span style="font-size:7pt">(see instructions)</span></th>
      <th class="styTblCell2" nowrap="nowrap" style="border-bottom:1 solid black; height:8mm">(d)<br />Date received</th>                  
    </tr>            
    <tr style="height:21mm">                                    
      <td class="styIRS990ScheduleBTblRB" valign="top">                    
        <div style="margin-top:4mm; border-bottom:1 solid black; width:7mm; text-align:center"></div>
      </td>  
      <td class="styIRS990ScheduleBTblRB" style="font-size:7pt;font-family:verdana;">            
        <xsl:if test="$index =1">
        <!-- Depending on the number of data rows, insert blank rows to fill the container height -->
                <!-- For separated print where there are more data elements than the container height, -->
                <!-- display a message in the first row directing the user to the additional data table -->
          <xsl:call-template name="PopulateAdditionalDataTableMessage">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/NoncashProperty"/>                      
          </xsl:call-template>
        </xsl:if>                              
        &nbsp;                        
      </td>    
      <td class="styIRS990ScheduleBTblRB" colspan="2" style="padding-top:8mm; font-size:8pt">                            
        <span style="float:left; padding-right:1mm; padding-left:1mm">$</span>
        <span style="border-bottom:1 solid black; float:left; width:28mm; text-align:right"></span>  
      </td>    
      <td class="styIRS990ScheduleBTblCell" style="padding-top:8mm; padding-left:4mm">                          
        <span style="border-bottom:1 solid black; float:left; width:33mm; text-align:center; margin-right:1mm"></span>  
      </td>                  
    </tr>  
    <xsl:if test="$index mod 6 = 0">
      <tr style="page-break-after:always">
        <td colspan="5" style="font-size:7pt; border-top:1 solid black">
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

<!-- PART III -->
<xsl:template name="p3Template">  
  <xsl:param name="index" select="1"/>    
  <xsl:param name="max" />  
  <xsl:if test="$index &lt;= $max">    
    <xsl:if test="$index mod 4 = 1">      
      <xsl:call-template name="IRS990BHeader">
        <xsl:with-param name="colSpan" select="4"/>
        <xsl:with-param name="thisPage" select="ceiling($index div 4)"/>
        <xsl:with-param name="pageTotal" select="$max div 4"/>
        <xsl:with-param name="thisPart" select="'III'"/>
      </xsl:call-template>
      <tr style="font-size:7.5pt; height:9mm" valign="top">
        <th class="styFNBox" style="border-top:2 solid black; border-bottom:2 solid black;font-family:verdana;font-size:7pt;" nowrap="nowrap" colspan="3">
          <span class="styBoldText">Name of organization</span>
          <br/>
          <span style="font-weight:normal;font-family:verdana;font-size:6pt;">
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
            </xsl:call-template>
            <br />
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
            </xsl:call-template>        
           </span>
        </th>
        <th class="styIRS990ScheduleBTblCell" style="border-top:2 solid black; border-bottom:2 solid black;font-family:verdana;font-size:7pt;" nowrap="nowrap" colspan="2">
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
        <th style="border-bottom:1 solid black" nowrap="nowrap" colspan="4">
          <div class="styPartName" style="width:12mm">Part III</div>                
          <div class="styPartDesc" style="padding-top:0.5mm; padding-bottom:0.5mm">
            <i>Exclusively</i> religious, charitable, etc., individual contributions to section 501(c)(7), (8), or (10) organizations<br />that total more than $1,000 for the year.
            <span style="font-weight:normal">Complete columns <b>(a)</b> through <b>(e) and</b> the following line entry.<br />For organizations completing Part III, enter the total of <i>exclusively</i> religious, charitable, etc.,<br />contributions of <b>$1,000 or less</b> for the year. (Enter this information once. See instructions.) <img src="{$ImagePath}/990SchB_Bullet.gif" alt="Arrow Bullet" /> $ 
                           <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/TotalUnder1000Contributions"/></xsl:call-template>
            </span>  <br></br>
            <span style="font-weight:normal">Use duplicate copies of Part III if additional space is needed</span>
          </div>                  
        </th>                
      </tr>  
    </xsl:if>      
    <tr align="center">      
      <th class="styIRS990ScheduleBTblRB" nowrap="nowrap" width="7%" style="line-height:100%;">(a) No.<br />from<br />Part I</th>
      <th class="styIRS990ScheduleBTblRB" nowrap="nowrap" width="31%">(b)<br />Purpose of gift</th>  
      <th class="styIRS990ScheduleBTblRB" width="31%">(c)<br />Use of gift</th>  
      <th class="styIRS990ScheduleBTblCell">(d)<br />Description of how gift is held</th>                            
    </tr>            
    <tr style="height:16mm">                  
      <td class="styIRS990ScheduleBTblRB" valign="top" rowspan="2">                                                    
        <div style="margin-top:4mm; border-bottom:1 solid black; width:7mm; text-align:center">
          <!--xsl:value-of select="$index"/-->
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/ContributorNumberFromPartI"/>
          </xsl:call-template>
        </div>
      </td>  
      <td class="styIRS990ScheduleBTblRB" style="font-size:7pt;font-family:verdana;">    
      <xsl:choose>       
        <xsl:when test="normalize-space($Form990ScheduleBData/CharitableContributions[$index]/PurposeOfGift) = ''">
          <div class="styIRS990ScheduleBDotBB" style="height: 3mm; width:52mm" />
          <div class="styIRS990ScheduleBDotBB" style="height: 3mm; width:52mm" />
          <div class="styIRS990ScheduleBDotBB" style="height: 3mm; width:52mm" />
        </xsl:when>
        <xsl:otherwise>                 
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/PurposeOfGift"/>
        </xsl:call-template>
        </xsl:otherwise>
        </xsl:choose>
      </td>    
      <td class="styIRS990ScheduleBTblRB" style="font-size:7pt;font-family:verdana;">         
      <xsl:choose>       
        <xsl:when test="normalize-space($Form990ScheduleBData/CharitableContributions[$index]/UseOfGift) = ''">
          <div class="styIRS990ScheduleBDotBB" style="height: 3mm; width:52mm" />
          <div class="styIRS990ScheduleBDotBB" style="height: 3mm; width:52mm" />
          <div class="styIRS990ScheduleBDotBB" style="height: 3mm; width:52mm" />
        </xsl:when>
        <xsl:otherwise>            
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/UseOfGift"/>
        </xsl:call-template>
        </xsl:otherwise>
        </xsl:choose>
      </td>    
      <td class="styIRS990ScheduleBTblCell" style="font-size:7pt;font-family:verdana;"> 
      <xsl:choose>       
        <xsl:when test="normalize-space($Form990ScheduleBData/CharitableContributions[$index]/DescriptionOfHowGiftIsHeld) = ''">
          <div class="styIRS990ScheduleBDotBB" style="height: 3mm; width:52mm" />
          <div class="styIRS990ScheduleBDotBB" style="height: 3mm; width:52mm" />
          <div class="styIRS990ScheduleBDotBB" style="height: 3mm; width:52mm" />
        </xsl:when>
        <xsl:otherwise>                    
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/DescriptionOfHowGiftIsHeld"/>
        </xsl:call-template>
        </xsl:otherwise>
        </xsl:choose>
      </td>                  
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
            <th width="45%" style="border-bottom:1 solid black">Transferee's name, address, and ZIP  4</th>
            <th style="border-bottom:1 solid black">Relationship of transferor to transferee</th>
          </tr>
        
          <tr style="height:16mm">
            <td class="styIRS990ScheduleBTblRB" style="font-size:7pt;font-family:verdana;">                            
              <div class="styIRS990ScheduleBDotBB1" style="height:3mm">    
                <xsl:if test="normalize-space($Form990ScheduleBData/CharitableContributions[$index]/TransfereeNameIndividual)!=''">
                  <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/TransfereeNameIndividual"/></xsl:call-template>  
                </xsl:if>
                                
                <div style="font-family:verdana;font-size:6pt;">                 
                 <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/TransfereeNameBusiness/BusinessNameLine1"/></xsl:call-template>
                <xsl:if test="normalize-space($Form990ScheduleBData/CharitableContributions[$index]/TransfereeNameBusiness/BusinessNameLine2)!=''">
                  <br/><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/TransfereeNameBusiness/BusinessNameLine2"/></xsl:call-template>                          
                 </xsl:if> 
                </div>         
                 
              </div> 
                 
              <xsl:choose>
                <xsl:when test="$Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressUS">                  
                  <div class="styIRS990ScheduleBDotBB1" style="height:4mm">  
                    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressUS/AddressLine1"/></xsl:call-template>  
                    <xsl:if test="normalize-space($Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressUS/AddressLine2)!=''">
                      <br/><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressUS/AddressLine2"/></xsl:call-template><br/>
                    </xsl:if>                          
                  </div>     
                  <div class="styIRS990ScheduleBDotBB1" style="height:4mm;border-bottom:0;">                              
                    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressUS/City"/></xsl:call-template>, 
                    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressUS/State"/></xsl:call-template> &nbsp;
                    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressUS/ZIPCode"/></xsl:call-template>                                            
                  </div>                                  
                </xsl:when>
                <xsl:otherwise>                  
                  <div class="styIRS990ScheduleBDotBB1" style="height:4mm">  
                    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressForeign/AddressLine1"/></xsl:call-template>  
                    <xsl:if test="normalize-space($Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressForeign/AddressLine2)!=''"><br/>
                      <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressForeign/AddressLine2"/></xsl:call-template>                            
                    </xsl:if>
                  </div>     
                  <div class="styIRS990ScheduleBDotBB1" style="height:4mm;border-bottom:0;">                          
                    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressForeign/City"/></xsl:call-template>
                    <xsl:if test="normalize-space($Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressForeign/ProvinceOrState)!='' or normalize-space($Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressForeign/PostalCode)!=''">, </xsl:if>
                    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressForeign/ProvinceOrState"/></xsl:call-template> &nbsp;
                    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressForeign/PostalCode"/></xsl:call-template>                                                              
                  </div>
                  <div>
                    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressForeign/Country"/></xsl:call-template>
                  </div>
                </xsl:otherwise>
              </xsl:choose>                            
            </td>
            <td class="styIRS990ScheduleBTblCell">    
            <xsl:choose>       
        <xsl:when test="normalize-space($Form990ScheduleBData/CharitableContributions[$index]/RlnOfTransferorToTransferee) = ''">
          <div class="styIRS990ScheduleBDotBB" style="height: .25mm; width:90mm" />
          <div class="styIRS990ScheduleBDotBB" style="height: 3mm; width:90mm" />
          <div class="styIRS990ScheduleBDotBB" style="height: 3mm; width:90mm" />
        </xsl:when>
        <xsl:otherwise>          
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/RlnOfTransferorToTransferee"/></xsl:call-template>
        </xsl:otherwise>
          </xsl:choose>
            </td>
          </tr>              
        </table>
      </td>
    </tr>
    <xsl:if test="$index mod 4 = 0">
      <tr style="page-break-after:always">
        <td colspan="4" style="font-size:7pt; border-top:1 solid black">
          <xsl:call-template name="IRS990BFooter">
            <xsl:with-param name="showAll" select="1"/>
          </xsl:call-template>        
        </td>
      </tr>
    </xsl:if>    
    <xsl:call-template name="p3Template">      
      <xsl:with-param name="index" select="$index + 1"/>
      <xsl:with-param name="max" select="$max"/>
    </xsl:call-template>  
  </xsl:if>    
</xsl:template>

<xsl:template name="p3TemplateEmpty">  
  <xsl:param name="index" select="1"/>    
  <xsl:param name="max" />  
  <xsl:if test="$index &lt;= 4">    
    <xsl:if test="$index mod 4 = 1">      
      <xsl:call-template name="IRS990BHeader">
        <xsl:with-param name="colSpan" select="4"/>
        <xsl:with-param name="thisPage" select="ceiling($index div 4)"/>
        <xsl:with-param name="pageTotal" select="$max div 4"/>
        <xsl:with-param name="thisPart" select="'III'"/>
      </xsl:call-template>
      <tr style="font-size:7.5pt; height:9mm" valign="top">
        <th class="styFNBox" style="border-top:2 solid black; border-bottom:2 solid black;font-family:verdana;font-size:7pt;" nowrap="nowrap" colspan="3">
          <span class="styBoldText">Name of organization</span>
          <br/>
          <span style="font-weight:normal;font-family:verdana;font-size:6pt;">
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
            </xsl:call-template>
            <br />
            <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
            </xsl:call-template>        
           </span>
        </th>
        <th class="styIRS990ScheduleBTblCell" style="border-top:2 solid black; border-bottom:2 solid black;font-family:verdana;font-size:7pt;" nowrap="nowrap" colspan="2">
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
        <th style="border-bottom:1 solid black" nowrap="nowrap" colspan="4">
          <div class="styPartName" style="width:12mm">Part III</div>                
          <div class="styPartDesc" style="padding-top:0.5mm; padding-bottom:0.5mm">
            <i>Exclusively</i> religious, charitable, etc., individual contributions to section 501(c)(7), (8), or (10) organizations<br />aggregating more than $1,000 for the year.
            <span style="font-weight:normal">(Complete columns <b>(a)</b> through <b>(e) and</b> the following line entry.)<br />For organizations completing Part III, enter the total of <i>exclusively</i> religious, charitable, etc.,<br />contributions of <b>$1,000 or less</b> for the year. (Enter this information once&#151;see instructions.) <img src="{$ImagePath}/990SchB_Bullet.gif" alt="Arrow Bullet" /> $ 
            <br></br>Use duplicate copies of Part III if additional space is needed
              <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/TotalUnder1000Contributions"/></xsl:call-template>
            </span>  
            <br></br>
            <span style="font-weight:normal">Use duplicate copies of Part III if additional space is needed</span>
          </div>                  
        </th>                
      </tr>  
    </xsl:if>      
    <tr align="center">      
      <th class="styIRS990ScheduleBTblRB" nowrap="nowrap" width="7%" style="line-height:100%;">(a) No.<br />from<br />Part I</th>
      <th class="styIRS990ScheduleBTblRB" nowrap="nowrap" width="31%">(b)<br />Purpose of gift</th>  
      <th class="styIRS990ScheduleBTblRB" width="31%">(c)<br />Use of gift</th>  
      <th class="styIRS990ScheduleBTblCell">(d)<br />Description of how gift is held</th>                            
    </tr>            
    <tr style="height:16mm">                  
      <td class="styIRS990ScheduleBTblRB" valign="top" rowspan="2">                                                    
        <div style="margin-top:4mm; border-bottom:1 solid black; width:7mm; text-align:center"></div>
      </td>  
      <td class="styIRS990ScheduleBTblRB" style="font-size:7pt;font-family:verdana;">
        <xsl:if test="$index = 1">
        <!-- Depending on the number of data rows, insert blank rows to fill the container height -->
                <!-- For separated print where there are more data elements than the container height, -->
                <!-- display a message in the first row directing the user to the additional data table -->
          <xsl:call-template name="PopulateAdditionalDataTableMessage">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions"/>                      
          </xsl:call-template>
        </xsl:if>
          <span style="width:1px"></span></td>    
      <td class="styIRS990ScheduleBTblRB" style="font-size:7pt;font-family:verdana;"><span style="width:1px"></span></td>    
      <td class="styIRS990ScheduleBTblCell" style="font-size:7pt;font-family:verdana;"><span style="width:1px"></span></td>                  
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
            <th width="45%" style="border-bottom:1 solid black">Transferee's name, address, and ZIP <span style="font-weight:normal">+</span> 4</th>
            <th style="border-bottom:1 solid black">Relationship of transferor to transferee</th>
          </tr>
        
          <tr style="height:16mm">
            <td class="styIRS990ScheduleBTblRB" style="font-size:7pt;font-family:verdana;">                            
              <div class="styIRS990ScheduleBDotBB1" style="height:3mm">    </div>    
                  <div class="styIRS990ScheduleBDotBB1" style="height:4mm">  </div>     
                  <div class="styIRS990ScheduleBDotBB1" style="height:4mm;border-bottom:0;">                          </div>
                  <div></div>
            </td>
            <td class="styIRS990ScheduleBTblCell"><span style="width:1px"></span>             </td>
          </tr>              
        </table>
      </td>
    </tr>
    <xsl:if test="$index mod 4 = 0">
      <tr style="page-break-after:always">
        <td colspan="4" style="font-size:7pt; border-top:1 solid black">
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
  <xsl:param name="showAll" />    
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
      <b>Schedule B (Form 990, 990-EZ, or 990-PF) (2011)</b>
    </div>
  <!--/div-->    
</xsl:template>
<!-- This sets up page counter, Part increment- Disabled but keep for future reference-RLJ-->
<xsl:template name="IRS990BHeader">  
  <xsl:param name="colSpan" />    
  <xsl:param name="thisPage" />  
  <xsl:param name="pageTotal" />    
  <xsl:param name="thisPart" />
  <tr style="font-size:7pt">
   <td style="padding-bottom:0.5mm; padding-right:0.5mm">
      <xsl:attribute name="colspan">
        <xsl:value-of select="$colSpan"/>
      </xsl:attribute>      
      <div style="float:left">      
        Schedule B (Form 990, 990-EZ, or 990-PF) (2011)
      </div>  
     <!-- <div style="float:right">  -->    
       <!-- Page-->
       <!-- <span style="width:5mm; border-bottom:1 solid black; text-align:center">-->
          <!--<xsl:value-of select="$thisPage"/>-->
       <!-- </span>-->
        <!--of-->
        <!--<span style="width:5mm; border-bottom:1 solid black; text-align:center">-->
          <!--<xsl:value-of select="$pageTotal"/>-->
        <!--</span>-->
        <!--of-->
        <!--<b>Part <xsl:value-of select="$thisPart"/></b>-->
     <!-- </div>  -->
    </td>
  </tr>    
</xsl:template>  

<!-- Template for Separated Repeating Data for Part I -->
<xsl:template name="p1SRDTemplate">  
  <xsl:param name="index" select="1"/>    
  <xsl:if test="$index &lt;= count($Form990ScheduleBData/ContributorInfo)">
    <xsl:if test="$index = 1">
      <thead class="styTableThead">  
        <tr class="styDepTblHdr" align="center">                            
          <th class="styDepTblCell" nowrap="nowrap">(a)<br />No.</th>
          <th class="styDepTblCell" nowrap="nowrap">(b)<br />Name, address, and ZIP + 4</th>  
          <th class="styDepTblCell" nowrap="nowrap" colspan="2">(c)<br />Total contributions</th>
          <th class="styDepTblCell" nowrap="nowrap" style="border-bottom:1 solid black; height:8mm">(d)<br />Type of contribution</th>                  
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
        <div style="margin-top:4mm; border-bottom:1 solid black; width:7mm; text-align:center">          
      <!-- <xsl:call-template name="PopulateText">
       <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/ContributorNumber"/>
          </xsl:call-template>-->
        </div>
      </td>  
      <td class="styIRS990ScheduleBTblRB">        
        <div class="styIRS990ScheduleBDotBB" style="text-align:left;"> 
         <div style="font-family:verdana;font-size:6pt;">                     
           <!--<xsl:call-template name="PopulateText">
           <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/ContributorNameBusiness/BusinessNameLine1"/>
           </xsl:call-template><br />-->
          <!-- <xsl:call-template name="PopulateText">
           <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/ContributorNameBusiness/BusinessNameLine2"/>
           </xsl:call-template>-->
        </div>
       <br />
         <!-- <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/ContributorNameIndividual"/></xsl:call-template> &nbsp;
          <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/Pd527j1"/></xsl:call-template>-->
        </div>  
        <div class="styIRS990ScheduleBDotBB" style="text-align:left;">  
          <xsl:choose>
            <xsl:when test="$Form990ScheduleBData/ContributorInfo[$index]/ContributorAddressUS">
              <!--<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/ContributorAddressUS/AddressLine1"/></xsl:call-template><br />
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/ContributorAddressUS/AddressLine2"/></xsl:call-template>--> &nbsp;                                                                 
            </xsl:when>
            <xsl:otherwise>
             <!-- <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/ContributorAddressForeign/AddressLine1"/></xsl:call-template><br />
              <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/ContributorAddressForeign/AddressLine2"/>
</xsl:call-template>--> &nbsp;                                                                       
            </xsl:otherwise>
          </xsl:choose>  
        </div>     
        <div class="styIRS990ScheduleBDotBB" style="text-align:left;">  
          <xsl:choose>
            <xsl:when test="$Form990ScheduleBData/ContributorInfo[$index]/ContributorAddressUS">
              <!--<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/ContributorAddressUS/City"/></xsl:call-template>, -->
              <!--<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/ContributorAddressUS/State"/></xsl:call-template>--> &nbsp;
             <!-- <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/ContributorAddressUS/ZIPCode"/></xsl:call-template>-->
            </xsl:when>
            <xsl:otherwise>
              <xsl:if test="$Form990ScheduleBData/ContributorInfo[$index]/ContributorAddressForeign">
               <!-- <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/ContributorAddressForeign/City"/></xsl:call-template>,-->
               <!-- <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/ContributorAddressForeign/ProvinceOrState"/></xsl:call-template> -->&nbsp;
               <!-- <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/ContributorAddressForeign/PostalCode"/></xsl:call-template>--> &nbsp;
                <!--<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/ContributorAddressForeign/Country"/></xsl:call-template>-->
              </xsl:if>    
            </xsl:otherwise>
          </xsl:choose>                  
        </div>
        <br/>      
      </td>    
      <td class="styIRS990ScheduleBTblRB" colspan="2">                          
        <span style="float:left; padding-right:1mm; padding-left:2mm">$</span>
        <span style="border-bottom:1 solid black; float:left; width:30mm; text-align:right; font-size:8pt">
          <!--<xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/AggregateContributions"/>
          </xsl:call-template>-->          
        </span>  
      </td>    
      <td class="styIRS990ScheduleBTblCell">                        
        <div style="float:left; padding-left:11mm; ">
         <table>
          <td >

          <label>
            <!--<xsl:call-template name="PopulateLabel"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/PersonContributionType" /></xsl:call-template>-->
            <span style="height:3mm;font-weight:bold;font-family:verdana; font-size:8pt;padding-top:0.5mm; padding-bottom:1mm;">Person</span>
          </label><br/>
          <label>
            <!--<xsl:call-template name="PopulateLabel"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/PayrollContributionType" /></xsl:call-template>-->
           <span style="height:3mm;font-weight:bold;font-family:verdana; font-size:8pt;padding-top:0.5mm;padding-bottom:1mm; "> Payroll </span>
          </label><br/>
          <label>
            <!--<xsl:call-template name="PopulateLabel"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/NoncashContributionType" /></xsl:call-template>-->
            <span style="height:3mm;font-weight:bold;font-family:verdana;font-size:8pt;padding-top:0.5mm; padding-bottom:1mm; ">Noncash</span>
          </label>
          </td>
          </table>
          
        </div>   
                       
        <div style="padding-top:0.75mm;float:left;">
        
        <table>
          <td >
          <input type="Checkbox" class="styIRS990ScheduleBCkbox" >                      
            <!--<xsl:call-template name="PopulateCheckbox"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/PersonContributionType"/></xsl:call-template>-->
          </input>
            
          <br/>
            
          <input type="Checkbox" class="styIRS990ScheduleBCkbox" >                      
            <!--<xsl:call-template name="PopulateCheckbox"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/PayrollContributionType"/></xsl:call-template>-->
          </input>  
                 
          <br/>
            
          <input type="Checkbox" class="styIRS990ScheduleBCkbox" >                      
          <!--  <xsl:call-template name="PopulateCheckbox"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/ContributorInfo[$index]/NoncashContributionType"/></xsl:call-template>-->
          </input>
            </td>
            </table>
        </div>                          
        <div style="font-size:7pt; clear:both; padding-top:2mm; padding-left:4mm">(Complete Part II if there is<br />a noncash contribution.)</div>
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
  <xsl:if test="$index &lt;= count($Form990ScheduleBData/ContributorInfo)">  
    <xsl:if test="$index = 1">
      <thead class="styTableThead">  
        <tr class="styDepTblHdr"  align="center" style="height:15mm">      
          <th class="styDepTblCell" nowrap="nowrap">(a) No.<br />from<br />Part I</th>
          <th class="styIRS990ScheduleBTblRB2" nowrap="nowrap">(b)<br />Description of noncash property given</th>  
          <th class="styIRS990ScheduleBTblRB2" nowrap="nowrap" colspan="2">(c)<br />FMV (or estimate)<br /><span style="font-size:7pt">(see instructions).</span></th>
          <th class="styTblCell2" nowrap="nowrap" style="border-bottom:1 solid black; height:8mm">(d)<br />Date received</th>                  
        </tr>            
      </thead>
    </xsl:if>              
    <tr style="height:21mm">                                    
      <!-- Define background colors to the rows -->
      <xsl:attribute name="class">
        <xsl:choose>
          <xsl:when test="$index mod 2 = 1">styDepTblRow1</xsl:when>
          <xsl:otherwise>styDepTblRow2</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>

      <td class="styIRS990ScheduleBTblRB" valign="top">                    
        <div style="margin-top:4mm; border-bottom:1 solid black; width:7mm; text-align:center">
          <!--xsl:value-of select="$index"/-->
          <!--<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/NoncashProperty[$index]/ContributorNumberFromPartI"/></xsl:call-template>-->
        </div>
      </td>  
      <td class="styIRS990ScheduleBTblRB" style="font-size:7pt;font-family:verdana;text-align:left;">                                                
      <!--  <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/NoncashProperty[$index]/NoncashPropertyDescription"/>
        </xsl:call-template> -->&nbsp;                        
      </td>    
      <td class="styIRS990ScheduleBTblRB" colspan="2" style="padding-top:8mm; font-size:8pt">                            
        <span style="float:left; padding-right:1mm; padding-left:1mm">$</span>
        <span style="border-bottom:1 solid black; float:left; width:28mm; text-align:right">
          <!--<xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/NoncashProperty[$index]/FairMarketValue"/>
          </xsl:call-template>-->          
        </span>  
      </td>    
      <td class="styIRS990ScheduleBTblCell" style="padding-top:8mm; padding-left:4mm">                          
        <span style="border-bottom:1 solid black; float:left; width:33mm; text-align:center; margin-right:1mm">
          <!--<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/NoncashProperty[$index]/DateReceived"/></xsl:call-template>-->
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

  <xsl:if test="$index &lt;= count($Form990ScheduleBData/CharitableContributions)">    
      <thead class="styTableThead">
      <tr class="styDepTblHdr"  align="center">      
        <th class="styDepTblCell" nowrap="nowrap" width="7%" style="line-height:100%;">(a) No.<br />from<br />Part I</th>
        <th class="styDepTblCell" nowrap="nowrap" width="31%">(b)<br />Purpose of gift</th>  
        <th class="styDepTblCell" width="31%">(c)<br />Use of gift</th>  
        <th class="styDepTblCell">(d)<br />Description of how gift is held</th>                            
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
        <div style="margin-top:4mm; border-bottom:1 solid black; width:7mm; text-align:center">
          <!--xsl:value-of select="$index"/-->
          <!--<xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/ContributorNumberFromPartI"/>
          </xsl:call-template>-->
        </div>
      </td>  
      <td class="styIRS990ScheduleBTblRB" style="font-size:7pt;font-family:verdana;text-align:left;">                    
        <!--<xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/PurposeOfGift"/>
        </xsl:call-template>-->
      </td>    
      <td class="styIRS990ScheduleBTblRB" style="font-size:7pt;font-family:verdana;text-align:left;">                    
        <!--<xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/UseOfGift"/>
        </xsl:call-template>-->
      </td>    
      <td class="styIRS990ScheduleBTblCell" style="font-size:7pt;font-family:verdana;text-align:left;">                    
        <!--<xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/DescriptionOfHowGiftIsHeld"/>
        </xsl:call-template>-->
      </td>                  
    </tr>  
    <tr>                      
      <td colspan="3">
        <table style="font-size:7pt;" cellpadding="0" cellspacing="0" border="0">      
      <thead class="styTableThead">
          <tr class="styDepTblHdr" align="center">
            <th class="styTableThead" colspan="2">                
              (e)<br/>Transfer of gift
            </th>
          </tr>      
          <tr class="styDepTblHdr" align="center">
            <th class="styTableThead" width="45%" style="border-bottom:1 solid black">Transferee's name, address, and ZIP  4</th>
            <th class="styTableThead" style="border-bottom:1 solid black">Relationship of transferor to transferee</th>
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

            <td class="styIRS990ScheduleBTblRB" style="font-size:7pt;font-family:verdana;">                            
              <div class="styIRS990ScheduleBDotBB1" style="height:3mm">    
                <xsl:if test="normalize-space($Form990ScheduleBData/CharitableContributions[$index]/TransfereeNameIndividual)!=''">
                 <!-- <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/TransfereeNameIndividual"/></xsl:call-template>-->  
                </xsl:if> 
                <div style="font-family:verdana;font-size:6pt;">     
                <!-- <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/TransfereeNameBusiness/BusinessNameLine1"/></xsl:call-template>-->
                 <xsl:if test="normalize-space($Form990ScheduleBData/CharitableContributions[$index]/TransfereeNameBusiness/BusinessNameLine2)!=''">
                  <br/><!--<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/TransfereeNameBusiness/BusinessNameLine2"/></xsl:call-template>-->                          
                </xsl:if> 
               </div>                 
              </div>    
              <xsl:choose>
                <xsl:when test="$Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressUS">                  
                  <div class="styIRS990ScheduleBDotBB1" style="height:4mm">  
                    <!--<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressUS/AddressLine1"/></xsl:call-template>-->  
                    <xsl:if test="normalize-space($Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressUS/AddressLine2)!=''">
                      <!--<br/><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressUS/AddressLine2"/></xsl:call-template>--><br/>
                    </xsl:if>                          
                  </div>     
                  <div class="styIRS990ScheduleBDotBB1" style="height:4mm;border-bottom:0;">                              
                   <!-- <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressUS/City"/></xsl:call-template>, -->
                    <!--<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressUS/State"/></xsl:call-template>--> &nbsp;
                   <!-- <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressUS/ZIPCode"/></xsl:call-template>-->                                            
                  </div>                                  
                </xsl:when>
                <xsl:otherwise>                  
                  <div class="styIRS990ScheduleBDotBB1" style="height:4mm">  
                    <!--<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressForeign/AddressLine1"/></xsl:call-template>  -->
                    <xsl:if test="normalize-space($Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressForeign/AddressLine2)!=''"><br/>
                      <!--<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressForeign/AddressLine2"/></xsl:call-template>   -->                         
                    </xsl:if>
                  </div>     
                  <div class="styIRS990ScheduleBDotBB1" style="height:4mm;border-bottom:0;">                          
                    <!--<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressForeign/City"/></xsl:call-template>-->
                    <xsl:if test="normalize-space($Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressForeign/ProvinceOrState)!='' or normalize-space($Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressForeign/PostalCode)!=''">, </xsl:if>
                    <!--<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressForeign/ProvinceOrState"/></xsl:call-template> -->&nbsp;
                    <!--<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressForeign/PostalCode"/></xsl:call-template>  -->                                                            
                  </div>
                  <div>
                   <!-- <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/TransfereeAddressForeign/Country"/></xsl:call-template>-->
                  </div>
                </xsl:otherwise>
              </xsl:choose>                            
            </td>
            <td class="styIRS990ScheduleBTblCell">              
              <!--<xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$Form990ScheduleBData/CharitableContributions[$index]/RlnOfTransferorToTransferee"/></xsl:call-template>-->
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