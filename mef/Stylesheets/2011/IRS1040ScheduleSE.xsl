<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Andrew Werner on 8/18/2011 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS1040ScheduleSEStyle.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form1040ScheduleSEData" select="$RtnDoc/IRS1040ScheduleSE"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form1040ScheduleSEData)"/>
          </xsl:call-template>
        </title>
        <!-- No Browser Caching -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching  -->
        <meta http-equiv="Cache-Control" content="private"/>
        <!-- Define Character Set -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Description" content="IRS Form 1040 Schedule SE"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS1040ScheduleSEStyle"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form1040 Schedule SE" style="font-size:7pt;">
          <!-- BEGIN WARNING LINE -->
          <xsl:call-template name="DocumentHeader"/>
          <!-- END WARNING LINE -->
          <!-- Begin Form Number and Name -->
          <div class="styTBB" style="width:187mm;height:21mm;">
             <div class="styFNBox" style="width:34mm;height:21mm;">
                <div style="height:13mm;font-size:12px">
                   <b>
                      SCHEDULE SE<br/>
                   <span style="width:1mm"/>
                   <xsl:call-template name="SetFormLinkInline">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData"/>
                   </xsl:call-template><br/>
                      (Form 1040)</b>
                </div>
                <div style="height:8mm;padding-top:.75mm;">
                   <span class="styAgency">Department of the Treasury</span>
                   <br/>
                   <span class="styAgency">Internal Revenue Service (99)</span>
                </div>
             </div>
             <div class="styFTBox" style="width:120.7mm;height:21mm;">
                <div class="styMainTitle" style="height:11mm;padding-top:5mm">
                  Self-Employment Tax
                </div>
                <div class="styFST" style="height:4mm;font-size:6.5pt;padding-top:5mm;">
                   <img src="{$ImagePath}/1040SchSE_Bullet_Md.gif" alt="MediumBullet"/>
                    Attach to Form 1040 or Form 1040NR. 
                    <span style="width:1mm"/>
                   <img src="{$ImagePath}/1040SchSE_Bullet_Md.gif" alt="MediumBullet"/>
                    See separate instructions.
               </div>
             </div>
             <div class="styTYBox" style="width:32mm;height:21mm">
                <div class="styOMB" style="height:2mm;">
                  OMB No. 1545-0074
                </div>
                <!--<div class="styTaxYear" style="height:9mm;padding-top:0;">2009</div>-->
                <div class="styTY" style="height:6mm;font-size:21pt;padding-top:0mm;padding-bottom:0mm;line-height:100%;">
                   20<span class="stytycolor">11</span>
                </div>
                <div style="text-align:left;padding-left:7mm;">Attachment<br/> Sequence No.
                   <span class="styBoldText" style="font-size:8pt">17</span>
                </div>
             </div>
          </div>
          <!-- End Form Number and Name section -->
          <!-- Begin Names and Identifying number section -->
          <div class="styBB" style="width:187mm;">
             <div class="styBB" style="width:102mm;height:8mm;border-bottom-width:0px">
                <div class="styNameBox" style="width:102mm;height:6mm;font-size:7pt;font-weight:normal;">
                  Name of person with <b>self-employment</b> income (as shown on Form 1040)<br/></div>
                <div class="styNameBox" style="width:102mm;height:1.9mm;padding-bottom:.7mm;font-size:7pt">                 
                   <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/Name"/>
                   </xsl:call-template></div>
             </div>
             <div class="styEINBox" style="width:50mm;height:7.9mm;padding-left:2mm;font-size:7pt;
               border-right-width:1px;padding-top:1mm;font-weight:normal;border-bottom-width:0px">
               Social security number of person with <b>self-employment </b>income
                <img src="{$ImagePath}/1040SchSE_Bullet_Md.gif" alt="MediumBullet"/></div>
             <div class="styLNAmountBox" style="height:10mm;width:35mm;border-bottom-width:0px;
               text-align:center;padding-top:5mm">
                <xsl:call-template name="PopulateSSN">
                   <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SSN"/>
                </xsl:call-template></div>
          </div>
          <!-- Comments-->
          <div class="styBB" style="width:187mm;">
             <div class="styLNDesc" style="width:187mm;">
             <span style="font-size:9pt;padding-bottom:1mm;">
                <b><i>Before you begin:</i></b><span style="width:1mm"/>
                To determine if you must file Schedule SE, see the instructions.</span><br/>
             </div>
          </div>
     <!--May I use Short ScheduleSE Comments-->
     <div class="styBB" style="width:187mm;">
        <div class="styLNDesc" style="width:187mm;">
           <b> <span style="font-size:9pt;padding-bottom:1mm;">
             May l Use Short Schedule SE or Must l Use Long Schedule SE?</span></b><br/><br/>
           <b>Note. </b> Use this flowchart <b>only if</b> you must file Schedule SE. If unsure, see 
           <i>Who Must File Schedule SE</i> in the instructions.</div>
        <!--Top Comment-->
        <div class="styBB" style="width:187mm;border-bottom-width: 0px; padding-top:2mm;">
           <div class="styLNLeftNumBox" style="width:30mm;"></div>
           <div class="styIRS1040ScheduleSEBorder2" style="padding-top:3mm;width:10mm;height:8mm;
             border-left-width:0px;border-bottom-width:0px;border-right-width:0px;">
              <div class="styIRS1040ScheduleSEBorder2" style="height:6mm;width:10mm;border-left-width:1px;
                border-top-width:1px;"></div>
    </div>
        <div class="styIRS1040ScheduleSEBox2" style="width:75mm;height:6mm;text-align:center;padding-top:1mm;">
          <b>Did you receive wages or tips in 2011?</b></div>
      <div class="styIRS1040ScheduleSEBorder2" style="padding-top:3mm;width:12mm;height:6mm;
        border-left-width:0px;border-bottom-width:0px;border-right-width:0px;">
           <div class="styIRS1040ScheduleSEBorder2" style="width:12mm;height:6mm;border-right-width:1px;
             border-top-width:1px;"></div>
    </div>
   </div>
     <!--First No Arrow-->
     <div class="styBB" style="width:187mm;height:5mm;border-bottom-width: 0px;border-top-width:0px">
      <span style="width:30mm;float:left;clear:none"/>
    <div class="styIRS1040ScheduleSEBorder2" style="width:1mm;height:5mm; border-left-width:1px;border-bottom-width:0px;
      border-right-width:0px;">
       <span style="width:5mm;text-align:left;padding-left:1mm;"><b> No</b></span></div>
    <div class="styLNLeftNumBox" style="width:37mm;"></div>
    <div class="styIRS1040ScheduleSEBox2" style="width:22mm;height:5mm;border-left-width:1px;border-bottom-width:0px;
         border-right-width:1px;border-top-width:1px;"></div>
         <div class="styLNLeftNumBox" style="width:32.3mm;"></div>
    <div class="styIRS1040ScheduleSEBorder2" style="width:1mm;height:5mm; border-left-width: 1px;
      border-bottom-width: 0px;border-right-width:0px;">
       <span style="width:5mm;text-align:left;padding-left:1mm;"><b> Yes</b></span></div>
   </div> 
   <div class="styBB" style="width:187mm;border-bottom-width: 0px;border-top-width:0px;">
      <div class="styLNLeftNumBox" style="width:27.5mm;height:1mm;padding-bottom:0mm;padding-top:0mm"></div>
      <div class="styIRS1040ScheduleSEBorder2" style="width:1mm;border-left-width:0px;
      border-bottom-width:0px;border-right-width:0px;border-top-width:0px;padding-top:0mm;padding-left:1mm;">
       <img src="{$ImagePath}/1040SchSE_Bullet_Dn.gif" alt="MediumBulletDown" align="abstop"/></div>
    <span style="width:39.5mm;"/>
    <img src="{$ImagePath}/1040SchSE_Bullet_Dn.gif" alt="MediumBulletDown" align="abstop"/>
    <span style="width:20.5mm;"/>
    <span class="styIRS1040ScheduleSEBorder" style="width:1mm;border-left-width:1px;border-bottom-width:0px;
      border-right-width:0px;border-top-width:0px;"></span>
    <span style="width:30.5mm;"/>
    <img src="{$ImagePath}/1040SchSE_Bullet_Dn.gif" alt="MediumBulletDown" align="abstop"/>
   </div>
   <!--1st No Comment-->
   <div class="styBB" style="width:187mm;border-bottom-width: 0px;">
      <div class="styIRS1040ScheduleSEBox2" style="width:82mm;height:8mm;padding-top:1mm;padding-left:2mm;
        padding-bottom:1mm;padding-right:2mm">
        Are you a minister, member of a religious order, or Christian Science practitioner who received IRS approval
         <b>not</b> to be taxed on earnings from these sources, <b>but</b>
             you owe self-employment tax on other earnings?</div>
        <div class="styIRS1040ScheduleSEBorder2" style="width:10mm;height:8mm; padding-top:4mm;">
         <span style="font-size:10px; width:7mm;height:2mm;padding-top:0mm;padding-left:0mm;">
          <u><b>Yes</b>_</u></span>
       <img src="{$ImagePath}/1040SchSE_Bullet.gif" alt="MediumBullet" align="absbottom"/></div>
    <div class="styIRS1040ScheduleSEBorder2" style="width:.1mm;height:15mm; border-left-width:0px;
          border-bottom-width:0px;border-right-width:0px;border-top-width:0px;padding-top:5mm;padding-left:0mm;">
       <div class="styIRS1040ScheduleSEBorder2" style="width:.5mm;height:10.3mm; border-left-width:1px;
             border-bottom-width:0px;border-right-width:0px;border-top-width:0px;padding-top:0mm;"></div>
    </div>  
    <div class="styIRS1040ScheduleSEBox2" style="width:1.5mm;height:15.4mm; border-left-width:0px;
          border-bottom-width:0px;border-right-width:1px;border-top-width:0px;padding-top:0mm;"></div>  
        <div class="styLNLeftNumBox" style="width:8mm;padding-top:0mm;padding-bottom:0mm"></div>
      <div class="styIRS1040ScheduleSEBox2" style="width:70mm;height:15mm;padding-left:2mm;padding-top:1mm;
        padding-bottom:1mm;padding-right:2mm">
        Was the total of your wages and tips subject to social security, or railroad retirement (tier 1) tax <b>plus</b>
        your net earnings from self-employment more than $106,800?</div>
        <div class="styIRS1040ScheduleSEBorder2" style="width:10mm;height:8mm; padding-top:4mm;">
           <span style="font-size:10px; width:7mm;height:2mm;padding-top:0mm;padding-left:0mm;">
          <u><b>Yes</b>_</u></span>
       <img src="{$ImagePath}/1040SchSE_Bullet.gif" alt="MediumBullet" align="absbottom"/>
      </div>
    <div class="styIRS1040ScheduleSEBorder2" style="width:.1mm;height:15mm; border-left-width:0px;
          border-bottom-width:0px;border-right-width:0px;border-top-width:0px;padding-top:5mm;padding-left:0mm;">
       <div class="styIRS1040ScheduleSEBorder2" style="width:.1mm;height:10.3mm; border-left-width:1px;
             border-bottom-width:0px;border-right-width:0px;border-top-width:0px;padding-top:0mm;padding-left:0mm;"></div>
        </div>  
   </div>
     <!--lst No Comment-->
   <div class="styBB" style="width:187mm;border-bottom-width: 0px; ">
     <div class="styLNLeftNumBox" style="width:30mm;padding-top:0mm;padding-bottom:0mm"></div>
     <div class="styIRS1040ScheduleSEBorder2" style="width:15mm;height:4mm; padding-left:1mm;padding-top:0mm;
       border-left-width:1px;">
        <b> No</b></div>
     <div class="styLNLeftNumBox" style="width:47mm;padding-top:0mm;padding-bottom:0mm"></div>
     <div class="styIRS1040ScheduleSEBorder2" style="width:1.5mm;height:4mm; border-left-width:1px;
         border-bottom-width:0px;border-right-width:0px;border-top-width:0px;padding-top:0mm;"></div> 
       <div class="styIRS1040ScheduleSEBorder2" style="width:.5mm;height:4mm; border-left-width:0px;
         border-bottom-width:0px;border-right-width:1px;border-top-width:0px;padding-top:0mm;"></div> 
     <div class="styLNLeftNumBox" style="width:33mm;padding-top:0mm;padding-bottom:0mm"></div>
     <div class="styIRS1040ScheduleSEBorder2" style="width:15mm;height:4mm; padding-left:1mm;padding-top:0mm;
       border-left-width:1px;">
        <b> No</b></div>
        <div class="styLNLeftNumBox" style="width:40mm;padding-top:0mm;padding-bottom:0mm"></div>
      <div class="styIRS1040ScheduleSEBorder2" style="width:1mm;height:4mm; border-left-width:1px;
        border-bottom-width:0px;border-right-width:0px;border-top-width:0px;padding-top:0mm;"></div>  
     </div>
       <!--Bullet Down-->
     <div class="styBB" style="width:187mm;border-bottom-width: 0px; ">
        <div class="styLNLeftNumBox" style="width:28mm;padding-top:0mm;padding-bottom:0mm"></div>
      <div class="styIRS1040ScheduleSEBorder2" style="width:2mm;height:4mm; border-left-width:0px;
        border-bottom-width:0px;border-right-width:0px;border-top-width:0px;padding-top:0mm;padding-left:1mm;">
         <img src="{$ImagePath}/1040SchSE_Bullet_Dn.gif" alt="MediumBulletDown" align="abstop"/></div>  
      <div class="styLNLeftNumBox" style="width:60.2mm;padding-top:0mm;padding-bottom:0mm"></div>
      <div class="styIRS1040ScheduleSEBorder2" style="width:.5mm;height:4mm; border-left-width:0px;
        border-bottom-width:0px;border-right-width:1px;border-top-width:0px;padding-top:0mm;"></div>
      <div class="styIRS1040ScheduleSEBox2" style="width:1.8mm;height:4mm; border-left-width:0px;
      border-bottom-width:0px;border-right-width:1px;border-top-width:0px;padding-top:0mm;"></div>  
      <div class="styLNLeftNumBox" style="width:31mm;padding-top:0mm;padding-bottom:0mm"></div>
          <div class="styIRS1040ScheduleSEBorder2" style="width:2mm;height:4mm; border-left-width:0px;
            border-bottom-width:0px;border-right-width:0px;border-top-width:0px;padding-top:0mm;padding-left:1mm;">
         <img src="{$ImagePath}/1040SchSE_Bullet_Dn.gif" alt="MediumBulletDown" align="abstop"/></div>
      <div class="styLNLeftNumBox" style="width:33mm;padding-top:0mm;padding-bottom:0mm"></div>
      <div class="styIRS1040ScheduleSEBorder2" style="width:21mm;height:4mm; border-left-width:0px;
        border-bottom-width:0px;border-right-width:1px;border-top-width:0px;padding-top:0mm;"></div>  
     </div>
       <!--2nd No Comment-->
     <div class="styBB" style="width:187mm;border-bottom-width: 0px; ">
        <div class="styIRS1040ScheduleSEBox2" style="width:82mm;height:12mm;padding-left:2mm;;padding-top:2mm;
          padding-right:2mm;padding-bottom:2mm">
        Are you using one of the optional methods to figure your net earnings (see instructions)?</div>
          <div class="styIRS1040ScheduleSEBorder2" style="width:10mm;height:8mm; padding-top:4mm;">
           <span style="font-size:10px; width:7mm;height:2mm;padding-top:0mm;padding-left:0mm;">
         <u><b>Yes</b>_</u></span>
         <img src="{$ImagePath}/1040SchSE_Bullet.gif" alt="MediumBullet" align="absbottom"/></div>
      <div class="styIRS1040ScheduleSEBorder2" style="width:.5mm;height:12.3mm; border-left-width:1px;
          border-bottom-width:0px;border-right-width:0px;border-top-width:0px;padding-top:5mm;padding-left:0mm;"></div> 
          <div class="styIRS1040ScheduleSEBox2" style="width:1.5mm;height:12.3mm; border-left-width:0px;
            border-bottom-width:0px;border-right-width:1px;border-top-width:0px;padding-top:0mm;"></div>  
          <div class="styLNLeftNumBox" style="width:8.5mm;padding-top:0mm;padding-bottom:0mm"></div>
        <div class="styIRS1040ScheduleSEBox2" style="width:70mm;height:12mm;padding-left:2mm;padding-top:1mm;
          padding-right:2mm;padding-bottom:1mm">
            Did you receive tips subject to social security or Medicare tax that you <b>did not</b> report to your employer?
     </div> 
     <div class="styIRS1040ScheduleSEBorder2" style="width:9.5mm;height:8mm; padding-top:4mm;">
          <span style="font-size:10px; width:7mm;height:2mm;padding-top:0mm;padding-left:0mm;">
         <u><b>Yes</b>_</u></span>
      <img src="{$ImagePath}/1040SchSE_Bullet.gif" alt="MediumBullet" align="absbottom"/></div>
      <div class="styIRS1040ScheduleSEBorder2" style="width:.1mm;height:12.3mm; border-left-width:1px;
      border-bottom-width:0px;border-right-width:0px;border-top-width:0px;padding-top:0mm;padding-left:0mm;"></div> 
     </div>
       <div class="styBB" style="width:187mm;border-bottom-width: 0px; ">
        <div class="styLNLeftNumBox" style="width:30mm;padding-top:0mm;padding-bottom:0mm"></div>
        <div class="styIRS1040ScheduleSEBorder2" style="width:15mm;height:5mm; padding-left:1mm;padding-top:0mm;
          border-left-width:1px;">
         <b> No</b></div>
        <div class="styLNLeftNumBox" style="width:47mm;padding-top:0mm;padding-bottom:0mm"></div>
      <div class="styIRS1040ScheduleSEBorder2" style="width:.5mm;height:5mm; border-left-width:1px;
        border-bottom-width:0px;border-right-width:0px;border-top-width:0px;padding-top:0mm;padding-left:0mm;"></div> 
          <div class="styIRS1040ScheduleSEBox2" style="width:1.5mm;height:5mm; border-left-width:0px;
            border-bottom-width:0px;border-right-width:1px;border-top-width:0px;padding-top:0mm;padding-bottom:0mm"></div>  
          <div class="styLNLeftNumBox" style="width:33.1mm;padding-top:0mm;padding-bottom:0mm"></div>
        <div class="styIRS1040ScheduleSEBorder2" style="width:15mm;height:5mm; padding-left:1mm;padding-top:0mm;
          border-left-width:1px;">
         <b> No</b></div>
          <div class="styLNLeftNumBox" style="width:40mm;padding-top:0mm;padding-bottom:0mm"></div>
          <div class="styIRS1040ScheduleSEBorder2" style="width:1mm;height:5mm; border-left-width:1px;
            border-bottom-width:0px;border-right-width:0px;border-top-width:0px;padding-top:0mm;"></div>  
     </div>
          
       <!--Bullet No Down-->
       <div class="styBB" style="width:187mm;border-bottom-width: 0px; ">
        <div class="styLNLeftNumBox" style="width:28mm;padding-top:0mm;padding-bottom:0mm"></div>
      <div class="styIRS1040ScheduleSEBorder2" style="width:2mm;height:1mm; border-left-width:0px;
            border-bottom-width:0px;border-right-width:0px;border-top-width:0px;padding-top:0mm;padding-left:1mm;">
         <img src="{$ImagePath}/1040SchSE_Bullet_Dn.gif" alt="MediumBulletDown" align="abstop"/></div>  
        <div class="styLNLeftNumBox" style="width:60.2mm;padding-top:0mm;padding-bottom:0mm"></div>
      <div class="styIRS1040ScheduleSEBorder2" style="width:.5mm;height:4mm; border-left-width:0px;
        border-bottom-width:0px;border-right-width:1px;border-top-width:0px;padding-top:0mm;"></div>  
          <div class="styIRS1040ScheduleSEBox2" style="width:1.8mm;height:4mm; border-left-width:0px;
            border-bottom-width:0px;border-right-width:1px;border-top-width:0px;padding-top:0mm;padding-bottom:0mm"></div>  
      <div class="styLNLeftNumBox" style="width:31mm;padding-top:0mm;padding-bottom:0mm"></div>
          <div class="styIRS1040ScheduleSEBorder2" style="width:2mm;height:4mm; border-left-width:0px;
            border-bottom-width:0px;border-right-width:0px;border-top-width:0px;padding-top:0mm;padding-left:1mm;">
             <img src="{$ImagePath}/1040SchSE_Bullet_Dn.gif" alt="MediumBulletDown" align="abstop"/></div>
      <div class="styLNLeftNumBox" style="width:33mm;padding-top:0mm;padding-bottom:0mm"></div>
      <div class="styIRS1040ScheduleSEBorder2" style="width:21mm;height:4mm; border-left-width:0px;
        border-bottom-width:0px;border-right-width:1px;border-top-width:0px;padding-top:0mm;"></div>  
     </div>
       <!--3rd No Comment-->
       <div class="styBB" style="width:187mm;border-bottom-width: 0px; ">
        <div class="styIRS1040ScheduleSEBox2" style="width:82mm;height:12mm;padding-top:2mm;padding-left:2mm;
          padding-right:2mm">
          Did you receive church employee income (see instructions) reported on Form W-2 of $108.28 or more?</div>
        <div class="styIRS1040ScheduleSEBorder2" style="width:10mm;height:8mm; padding-top:4mm;">
           <span style="font-size:10px; width:7mm;height:2mm;padding-top:0mm;padding-left:0mm;">
          <u><b>Yes</b>_</u></span>
         <img src="{$ImagePath}/1040SchSE_Bullet.gif" alt="MediumBullet" align="absbottom"/></div>
          <div class="styIRS1040ScheduleSEBorder2" style="width:.5mm;height:12mm; border-left-width:1px;
            border-bottom-width:0px;border-right-width:0px;border-top-width:0px;padding-top:5mm;padding-left:0mm;"></div> 
          <div class="styIRS1040ScheduleSEBox2" style="width:1.5mm;height:6mm; border-left-width:0px;
            border-bottom-width:0px;border-right-width:1px;border-top-width:0px;padding-top:0mm;"></div>  
      <div class="styIRS1040ScheduleSEBorder2" style="width:10mm;height:4mm; padding-top:4mm;padding-right:0mm;">
         <img src="{$ImagePath}/1040SchSE_Backward_Bullet.gif" alt="BackwardBullet" align="absbottom"/>
       <span style="font-size:10px; width:5mm;height:2mm;padding-top:0mm;padding-left:0mm;">
          <u><b>No</b>__</u></span></div>
          <div class="styIRS1040ScheduleSEBox2" style="padding-left:0mm;width:68.6mm;height:12mm;padding-top:1mm;
            padding-left:2mm;padding-right:2mm">
            Did you report any wages on Form 8919, Uncollected Social Security and Medicare Tax on Wages?</div> 
          <div class="styIRS1040ScheduleSEBorder2" style="width:9.5mm;height:8mm; padding-top:4mm;">
             <span style="font-size:10px; width:7mm;height:2mm;padding-top:0mm;padding-left:0mm;">
          <u><b>Yes</b>_</u></span>
       <img src="{$ImagePath}/1040SchSE_Bullet.gif" alt="MediumBullet" align="absbottom"/></div>
          <div class="styIRS1040ScheduleSEBorder2" style="width:.5mm;height:12mm; border-left-width:1px;
            border-bottom-width:0px;border-right-width:0px;border-top-width:0px;padding-top:0mm;padding-left:0mm;"></div> 
     </div>
       <!--Last No comment-->
     <div class="styBB" style="width:187mm;border-bottom-width: 0px; ">
        <div class="styLNLeftNumBox" style="width:30mm;padding-top:0mm;padding-bottom:0mm"></div>
      <div class="styIRS1040ScheduleSEBorder2" style="width:15mm;height:5mm; padding-left:1mm;padding-top:1mm;
        border-left-width:1px;">
         <b> No</b></div>
      <div class="styLNLeftNumBox" style="width:47mm;padding-top:0mm;padding-bottom:0mm"></div>
      <div class="styIRS1040ScheduleSEBorder2" style="width:1mm;height:5mm; border-left-width:1px;
        border-bottom-width:0px;border-right-width:0px;border-top-width:0px;padding-top:0mm;"></div>  
          <div class="styIRS1040ScheduleSEBorder2" style="width:.5mm;height:5mm; border-left-width:0px;
            border-bottom-width:0px;border-right-width:0px;border-top-width:0px;padding-top:0mm;"></div>  
          <div class="styLNLeftNumBox" style="width:88.7mm;padding-top:0mm;padding-bottom:0mm"></div>
      <div class="styIRS1040ScheduleSEBorder2" style="width:1mm;height:5mm; border-left-width:1px;
        border-bottom-width:0px;border-right-width:0px;border-top-width:0px;padding-top:0mm;"></div>  
     </div>
     <div class="styBB" style="width:187mm;border-bottom-width: 0px; ">
        <div class="styLNLeftNumBox" style="width:28mm;padding-top:0mm;padding-bottom:0mm"></div>
      <img src="{$ImagePath}/1040SchSE_Bullet_Dn.gif" alt="MediumBulletDown" align="abstop"/>
      <span style="width:39.5mm;padding-top:0mm;"/>
      <span class="styIRS1040ScheduleSEBorder" style="width:21.8mm;height:3.9mm; border-left-width:0px;
        border-bottom-width:0px;border-right-width:1px;border-top-width:0px;padding-top:0mm;"></span> 
          <!--<span class="styIRS1040ScheduleSEBorder" style="width:1.3mm;height:3mm; border-left-width:0px;
            border-bottom-width:0px;border-right-width:0px;border-top-width:0px;padding-top:0mm;"></span> -->
          <span style="width:32.5mm;height:1mm;padding-top:0mm;"/>
      <span style="width:56.3mm;height:1mm;padding-top:0mm;"/>
      <img src="{$ImagePath}/1040SchSE_Bullet_Dn.gif" alt="MediumBulletDown" align="abstop"/></div>
      <div style="width:187mm;">
        <span class="styIRS1040ScheduleSEBox" style="width:82mm;height:6mm;text-align:center;padding-top:1mm;">
             <b>You may use Short Schedule SE below</b></span>
      <span style="width:10mm;"/>
      <span class="styIRS1040ScheduleSEBorder" style="width:7mm;height:6mm; border-left-width:1px;
        border-bottom-width:1px;border-right-width:0px;border-top-width:0px;padding-top:0mm;"></span>
      <img src="{$ImagePath}/1040SchSE_Bullet.gif" alt="MediumBullet" align="absbottom"/>
          <span class="styIRS1040ScheduleSEBox" style="width:84mm;height:6mm;text-align:center;padding-top:1mm;">
      <b>You must use Long Schedule SE on page 2</b></span></div>
     <div style="width:187mm;"></div>
    </div>
         <div class="styBB" style="width:187mm;">
            <!-- BEGIN Section A -->
            <div class="styBB" style="width:187mm;border-top-width:1px;">
               <div class="styMainTitle" style="font-size:8pt;padding-top:1mm;padding-bottom:1mm">
                  Section A—Short Schedule SE. Caution.
                  <span style="font-weight:normal;"> Read above to see if you can use Short Schedule SE.</span>
               </div>
            </div>
            <!-- END Section A -->
            <!-- Line 1a -->
            <div style="width:187mm;">
               <div class="styLNLeftNumBoxSD" style="height:5mm;padding-top:1mm">
                 1a
               <!-- Position makes the 'a' in "1a" line up with the other letters. -->
               </div>
               <div class="styLNDesc" style="width:139mm;height:5mm;padding-top:1mm">
                 Net farm profit or (loss) from Schedule F, line 34, and farm partnerships, 
                 Schedule K-1 (Form 1065),<br/> box 14, code A
                  <!--Dotted Line-->
                  <span style="width:1.8mm"/>
                  <span style=" letter-spacing:3.2mm; font-weight:bold; ">............................</span>
               </div>
               <div class="styLNRightNumBox" style="height:7mm;padding-top:4mm">
                 1a</div>
               <div class="styLNAmountBox" style="text-align:right;height:7mm;padding-top:4mm">
                  <xsl:call-template name="PopulateAmount">
                     <xsl:with-param name="TargetNode" 
                       select="$Form1040ScheduleSEData/SectionA/NetFarmProfitLossAmt"/>
                  </xsl:call-template></div>
            </div>
            <!--End of line 1a -->
            <!-- Line 1b -->
            <div style="width:187mm;">
               <div class="styLNLeftNumBoxSD" style="height:5mm;padding-top:1mm;padding-left:4mm">
                 b
               <!-- Position makes the 'a' in "1a" line up with the other letters. -->
               </div>
               <div class="styLNDesc" style="width:139mm;height:5mm;padding-top:1mm">
                  If you received social security retirement or disability benefits, enter the amount of 
                  Conservation <br/>Reserve Program payments included on Schedule F, line 4b, 
                  or listed on Schedule K-1 (Form 1065),<br/> box 20, code Y
                  <!--Dotted Line-->
                  <span style="width:2mm"/>
                  <span style=" letter-spacing:3.2mm; font-weight:bold; ">............................</span>
               </div>
               <div class="styLNRightNumBox" style="height:7.5mm;padding-top:7.5mm;">
                 1b</div>
               <div class="styLNAmountBox" style="text-align:right;height:7.5mm;padding-top:7.5mm">
                 <span style="font-size:6pt">(</span>
                  <xsl:call-template name="PopulateAmount">
                     <xsl:with-param name="TargetNode" 
                       select="$Form1040ScheduleSEData/SectionA/ConservationReserveProgPymtAmt"/>
                  </xsl:call-template>
                  <span style="font-size:6pt">)</span>
               </div>
            </div>
            <!--End of line 1 -->
            <!-- Line 2 space -->
            <!-- Line 2 -->
            <div style="width:187mm;">
               <div class="styLNLeftNumBoxSD" style="height:10mm;">
                 2</div>
               <div class="styLNDesc" style="width:139mm;height:10mm;">
                 Net profit or (loss) from Schedule C, line 31; Schedule
                 K-1 (Form 1065), box 14, <br/>code A (other than farming); and Schedule K-1 (Form 
                1065-B), box 9, code J1. Ministers and members<br/>of religious orders, see instructions
                 for types of income to report on this line. See instructions for other <br/>income to 
                report
                  <span style="width:1px;"/>
                  <!--Dotted Line-->
                  <span style="width:.3mm"/>
                  <span style=" letter-spacing:3.2mm; font-weight:bold; ">............................</span>
               </div>
               <div class="styLNRightNumBox" style="height:12mm;padding-top:10mm">
                 2</div>
               <div class="styLNAmountBox" style="height:12mm;text-align:right;padding-top:10mm;">
                  <xsl:call-template name="PopulateAmount">
                     <xsl:with-param name="TargetNode" 
                       select="$Form1040ScheduleSEData/SectionA/NetNonFarmProfitLossAmt"/>
                  </xsl:call-template></div>
            </div>
            <!--End of line 2 -->
            <!--Line 3 -->
            <div style="width:187mm;">
               <div class="styLNLeftNumBoxSD" style="height:6mm;;padding-top:1.5mm">
                 3</div>
               <div class="styLNDesc" style="width:139mm;height:6mm;padding-top:1.5mm">
                 Combine lines 1a, 1b and 2. 
                <span style="width:.3mm"/> 
                 <xsl:call-template name="LinkToLeftoverDataTableInline">
                     <xsl:with-param name="Desc">Section A Line 3 Additional Income Or Loss Amt </xsl:with-param>
                     <xsl:with-param name="TargetNode" 
                       select="$Form1040ScheduleSEData/SectionA/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossAmt"/>
                  </xsl:call-template> 
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                     <xsl:with-param name="Desc">Section A Line 3 Self Employment Tax Exempt Cd </xsl:with-param>
                     <xsl:with-param name="TargetNode" 
                       select="$Form1040ScheduleSEData/SectionA/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptCd"/>
                  </xsl:call-template>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                     <xsl:with-param name="Desc">Section A Line 3 Self Employment Tax Exempt Amt </xsl:with-param>
                     <xsl:with-param name="TargetNode" 
                       select="$Form1040ScheduleSEData/SectionA/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptAmt"/>
                  </xsl:call-template>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                     <xsl:with-param name="Desc">Section A Line 3 Additional Income Or Loss Cd</xsl:with-param>
                     <xsl:with-param name="TargetNode"
                       select="$Form1040ScheduleSEData/SectionA/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossCd"/>
                  </xsl:call-template>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                     <xsl:with-param name="Desc">Section A Line 3 Community Income Taxed To Spouse Amt </xsl:with-param>
                     <xsl:with-param name="TargetNode"
                       select="$Form1040ScheduleSEData/SectionA/SETotalNetEarningsOrLossAmt/@communityIncTaxedToSpouseAmt"/>
                  </xsl:call-template>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                     <xsl:with-param name="Desc">Section A Line 3 Chapter 11 Bankruptcy Income Cd </xsl:with-param>
                     <xsl:with-param name="TargetNode"
                       select="$Form1040ScheduleSEData/SectionA/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeCd"/>
                  </xsl:call-template>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                     <xsl:with-param name="Desc">Section A Line 3 Community Income Taxed To Spouse Cd </xsl:with-param>
                     <xsl:with-param name="TargetNode"
                       select="$Form1040ScheduleSEData/SectionA/SETotalNetEarningsOrLossAmt/@communityIncTaxedToSpouseCd"/>
                  </xsl:call-template>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                     <xsl:with-param name="Desc">Section A Line 3 Exempt Community Income Cd </xsl:with-param>
                     <xsl:with-param name="TargetNode"
                       select="$Form1040ScheduleSEData/SectionA/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeCd"/>
                  </xsl:call-template>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                     <xsl:with-param name="Desc">Section A Line 3 Chapter 11 Bankruptcy Income Amt </xsl:with-param>
                     <xsl:with-param name="TargetNode"
                       select="$Form1040ScheduleSEData/SectionA/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeAmt"/>
                  </xsl:call-template>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                     <xsl:with-param name="Desc">Section A Line 3 Exempt Community Income Amt </xsl:with-param>
                     <xsl:with-param name="TargetNode"
                       select="$Form1040ScheduleSEData/SectionA/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeAmt"/>
                  </xsl:call-template>
                  <!--Dotted Line-->
                  <span style="width:3mm"/>
                  <span style=" letter-spacing:3.2mm; font-weight:bold; ">................</span>
               </div>
               <div class="styLNRightNumBox" style="padding-top:2mm;height:6mm;">
                 3</div>
               <div class="styLNAmountBox" style="padding-top:2mm;height:6mm;">
                   <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SectionA/SETotalNetEarningsOrLossAmt"/>
                   </xsl:call-template></div>
            </div>
            <!--End of line 3 -->
            <!-- Line 4 -->
            <div style="width:187mm;">
               <div class="styLNLeftNumBoxSD" style="height:6mm;">
                 4
               <!-- Position makes the 'a' in "1a" line up with the other letters. -->
               </div>
               <div class="styLNDesc" style="width:139mm;height:6mm;">
                  Multiply line 3 by 92.35% (.9235). If less than $400, you do not<br/>
                        owe self-employment tax;<b> do not </b> file this schedule unless you have an amount on line 1b
                  <!--Dotted Line-->
                  <span style="width:.5mm"/>
                  <span style=" letter-spacing:3.2mm; font-weight:bold; ">....</span>
                  <span style="width:8px;"/>
                  <img src="{$ImagePath}/1040SchSE_Bullet_Md.gif" alt="MediumBullet"/><br/>
                    <b>Note.</b><span style="width:.5mm"/>
                     If line 4 is less than $400 due to Conservation Reserve Program payments on line 1b,<br/>
                     see instructions.
               </div>
               <div class="styLNRightNumBox" style="height:6mm;padding-top:3.4mm">
                 4</div>
               <div class="styLNAmountBox" style="text-align:right;height:6mm;padding-top:3.4mm">
                  <xsl:call-template name="PopulateAmount">
                     <xsl:with-param name="TargetNode"
                       select="$Form1040ScheduleSEData/SectionA/MinimumProfitForSETaxAmt"/>
                  </xsl:call-template>
               </div>
               <div class="styLNRightNumBox" style="height:6mm;padding-top:3.4mm;
                 border-bottom:0 solid black"></div>
               <div class="styLNAmountBox" style="text-align:right;height:6mm;padding-top:3.4mm;
                 border-bottom:0 solid black">
               </div>
            </div>
            <!--End of line 4 -->
            <!-- Line 5 -->
            <div style="width:187mm;">
               <div class="styLNLeftNumBoxSD" style="height:14mm;">
                 5</div>
               <div class="styLNDesc" style="width:139mm;height:14mm;">
                  <b>Self-employment tax.</b> If the amount on line 4 is:<br/>
                  <img src="{$ImagePath}/1040SchSE_Bullet_Round.gif" alt="RoundBullet"/>
                  <span style="width:1mm;"></span>
                    $106,800 or less, multiply line 4 by 13.3% (.133). Enter the result here and on
                  <b>Form 1040, line 56,</b><br/> or <b>Form 1040R, line 54.</b><br/>
                  <img src="{$ImagePath}/1040SchSE_Bullet_Round.gif" alt="RoundBullet"/>
                  <span style="width:1mm;"></span>
                    More than $106,800, multiply line 4 by 2.9% (.029). Then, add $11,107.20 to the 
                    result. <br/>Enter the total here and on<b> Form 1040, line 56, </b>or <b>Form 1040NR, line 54</b>
                  <!--Dotted Line-->
                  <span style="width:1.8mm"/>
                  <span style=" letter-spacing:3.2mm; font-weight:bold; ">.........</span>
               </div>
               <div class="styLNRightNumBox" style="height:17mm;padding-top:13mm">
                 5</div>
               <div class="styLNAmountBox" style="height:17mm;text-align:right;padding-top:13mm;">
                  <xsl:call-template name="PopulateAmount">
                     <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SectionA/SelfEmploymentTaxAmt"/>
                  </xsl:call-template></div>
            </div>
            <!--End of line 5 -->
            <!--Line 6 -->
            <div style="width:187mm;">
               <div class="styLNLeftNumBox" style="height:7mm;padding-left:2mm;">6</div>
               <div class="styLNDesc" style="width:99.7mm;height:4mm;">
                  <b>Deduction for employer-equivalent portion of self-employment tax. </b>
                       If the amount on line 5 is:<br/>  
					  <img src="{$ImagePath}/1040SchSE_Bullet_Round.gif" alt="RoundBullet"/>
					  <span style="width:1mm;"></span>
					  $14,204.40 or less, multiply line 5 by 57.51 % (.5751).<br/>
					  <img src="{$ImagePath}/1040SchSE_Bullet_Round.gif" alt="RoundBullet"/>
					  <span style="width:1mm;"></span>
					  More than $14,204.40, multiply line 5 by 50% (.50). Then, add $1,067 to the result. <br/>
                       Enter the result here and on
                  <b> Form 1040, line 27,</b> or <b>Form 1040NR, line 27</b>
                  <!--Dotted Line-->
                  <span style="width:.2mm"/>
                  <span style=" letter-spacing:3.2mm; font-weight:bold; ">..</span>
               </div>
               <div class="styLNRightNumBox" style="height:20.5mm;border-bottom-width:0px;padding-top:16.5mm" >
                 6</div>
               <div class="styLNAmountBox" style="border-bottom-width:0px;height:20.5mm;width:31.3mm;padding-top:16.5mm">
                  <xsl:call-template name="PopulateAmount">
                     <xsl:with-param name="TargetNode" 
                       select="$Form1040ScheduleSEData/SectionA/EmplrEquivalentPrtnSETaxAmt"/>
                  </xsl:call-template></div>
               <div class="styLNRightNumBox" style="height:20.5mm;background-color:lightgrey;border-bottom-width:0px"/>
               <div class="styLNAmountBox" style="height:20.5mm;border-bottom-width:0px;border-bottom-width:0px;
                 background-color:lightgrey;border-left-width:0px;"/>
            </div>
            <!--End of line 6 -->
         </div>
         <!-- capturing the page bottom info -->
         <!--  FOOTER-->
         <div style="width:187mm;">
            <span class="styBoldText" style="width:100mm">
              For Paperwork Reduction Act Notice, see your tax return instructions.</span>
            <span style="width:15px;"/>                      
              Cat. No. 11358Z 
            <span style="width:18mm;"/>
            <span class="styBoldText">Schedule SE (Form 1040) 2011</span>
         </div>
         <!-- Adding page break -->
         <p class="pageend"/>
         <!-- Page Header -->
         <div class="styBB" style="width:187mm;padding-top:.5mm;">
            <div style="float:left;">Schedule SE (Form 1040) 2011<span style="width:70mm;"/>
              Attachment Sequence No. <b>17</b></div>
            <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></div>
         </div>
         <!-- END Page Header -->
         <!-- Begin Names and Identifying number section -->
         <div class="styBB" style="width:187mm;">
            <div class="styBB" style="width:102mm;height:8mm;border-bottom-width:0px;">
               <div class="styNameBox" style="width:102mm;height:6mm;font-size:7pt;font-weight:normal;">
                 Name of person with <b>self-employment</b> income (as shown on Form 1040)<br/></div>
               <div class="styNameBox" style="width:102mm;height:1.9mm;padding-bottom:.9mm;font-size:7pt;">
                  <xsl:call-template name="PopulateText">
                     <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/Name"/></xsl:call-template></div>
            </div>
            <div class="styEINBox" style="width:50mm;height:7.9mm;padding-left:2mm;font-size:7pt;border-right-width:1px;
              padding-top:1mm;font-weight:normal;border-bottom-width:0px">
              Social security number of person with <b>self-employment </b>income
               <img src="{$ImagePath}/1040SchSE_Bullet_Md.gif" alt="MediumBullet"/></div>
            <div class="styLNAmountBox" style="height:10mm;width:35mm;border-bottom-width:0px;text-align:center;
              padding-top:5mm">
               <!--<span style="width:25mm;text-align:left;font-weight:normal;">-->
                   <xsl:call-template name="PopulateSSN">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SSN"/>
                   </xsl:call-template><!--</span>--></div>
         </div>
         <!-- BEGIN Section B -->
         <div class="styBB" style="width:187mm;border-top-width:1px;">
            <div class="styMainTitle" style="font-size:8pt;padding-top:1mm;padding-bottom:1mm">
              Section B—Long Schedule SE
            </div>
         </div>
         <!-- END Section B -->
         <!-- Part I  -->
         <div class="styBB" style="width:187mm;border-top-width:0px;">
            <span class="styPartName" style="width:16mm;">Part I</span>
            <!--Part I-->
            <span style="width:150mm;" class="styPartDesc">Self-Employment Tax</span></div>
         <!-- End Part I  -->
         <div style="width:187mm;">
            <b>Note. </b>If your only income subject to self-employment tax is <b>church employee income,</b>
             see instructions.  Also see instructions for the definition of church employee income.</div>
            <br/>
         <!-- SB-Line A -->
         <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="height:6mm;">
              A
               <!-- Position makes the 'a' in "1a" line up with the other letters. -->
            </div>
            <div class="styLNDesc" style="width:178mm;height:6mm;">
                <label>
                   <xsl:call-template name="PopulateLabel">
                      <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SectionB/ExemptForm4361Ind"/>
                      <xsl:with-param name="BackupName">IRS1040ScheduleSE</xsl:with-param>
                   </xsl:call-template>
                   If you are a minister, member of a religious order, or Christian Science practitioner <b>and</b> you filed
                   Form 4361, but you had $400 or more of <b>other</b> net earnings from self-employment, check here and continue with Part I
                </label>
               <!--Dotted Line-->
               <span style="width:1.8mm"/>
               <span style=" letter-spacing:3.2mm; font-weight:bold; ">...............</span>
               <span style="width:1mm"/>
               <img src="{$ImagePath}/1040SchSE_Bullet_Md.gif" alt="MediumBullet"/>
               <span style="width:4mm"/>
               <input type="checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateCheckbox">
                     <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SectionB/ExemptForm4361Ind"/>
                     <xsl:with-param name="BackupName">IRS1040ScheduleSE</xsl:with-param></xsl:call-template>
                </input>
             </div>
          </div>
          <!--End of line SB-1 -->
          <div style="width:187mm;"/>
          <!-- SB-Line 1a -->
          <div style="width:187mm;">
             <div class="styLNLeftNumBoxSD" style="height:6mm;">
               1a
             <!-- Position makes the 'a' in "1a" line up with the other letters. -->
            </div>
            <div class="styLNDesc" style="width:139mm;height:6mm;">
              Net farm profit or (loss) from Schedule F, line 34, and farm partnerships, Schedule 
              K-1 (Form 1065), <br/>box 14, code A. <b>Note. </b>Skip lines 1a and 1b if you use the farm
              optional method (see instructions)
               <!--Dotted Line-->
               <span style="width:1mm"/>
               <span style=" letter-spacing:3.2mm; font-weight:bold; ">...</span>
            </div>
            <div class="styLNRightNumBox" style="height:6mm;padding-top:4mm;border-top-width:1px">
              1a</div>
            <div class="styLNAmountBox" style="text-align:right;height:6mm;padding-top:4mm;border-top-width:1px">
               <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SectionB/NetFarmProfitLossAmt"/>
               </xsl:call-template></div>
          </div>
          <!--End of line SB-1 -->
          <!-- Line 1b -->
          <div style="width:187mm;">
             <div class="styLNLeftNumBoxSD" style="height:6mm;padding-top:2mm;padding-left:4mm">
               b
             <!-- Position makes the 'a' in "1a" line up with the other letters. -->
             </div>
             <div class="styLNDesc" style="width:139mm;height:6mm;padding-top:2mm">
               If you received social security retirement or disability benefits, enter the amount of 
               Conservation <br/>Reserve Program payments included on Schedule F, line 4b, 
               or listed on Schedule K-1 (Form 1065), <br/>box 20, code Y
                <!--Dotted Line-->
                <span style="width:.3mm"/>
                <span style=" letter-spacing:3.2mm; font-weight:bold; ">.............................</span>
             </div>
             <div class="styLNRightNumBox" style="height:12mm;padding-top:8.5mm;">
               1b</div>
             <div class="styLNAmountBox" style="text-align:right;height:6mm;padding-top:8.5mm;">
                <span style="font-size:6pt">(</span>
                <xsl:call-template name="PopulateAmount">
                   <xsl:with-param name="TargetNode" 
                     select="$Form1040ScheduleSEData/SectionB/ConservationReserveProgPymtAmt"/>
                </xsl:call-template>
                <span style="font-size:6pt">)</span></div>
          </div>
          <!--End of line 1 -->
          <!-- Line SB-2 -->
          <div style="width:187mm;">
             <div class="styLNLeftNumBoxSD" style="height:12mm;">
               2</div>
             <div class="styLNDesc" style="width:139mm;height:12mm;">
               Net profit or (loss) from Schedule C, line 31; Schedule K-1
               (Form 1065), box 14, <br/>code A (other than farming); and Schedule K-1 (Form 
               1065-B), box 9, code J1. Ministers and members <br/>of religious orders, see instructions
                for types of income to report on this line. See instructions for other <br/>income to 
               report. <b>Note. </b>Skip this line if you use the nonfarm optional method (see instructions)
                <span style="width:1px;"/>
                <!--Dotted Line-->
                <span style="width:.5mm"/>
                <span style=" letter-spacing:3.2mm; font-weight:bold; ">....</span>
             </div>
             <div class="styLNRightNumBox" style="height:14mm;padding-top:10mm;border-bottom-width:1px">
               2</div>
             <div class="styLNAmountBox" style="height:14mm;text-align:right;border-bottom-width:1px;padding-top:10mm">
                <xsl:call-template name="PopulateAmount">
                   <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SectionB/NetNonFarmProfitLossAmt"/>
                </xsl:call-template></div>
          </div>
          <!--End of line SB-2 -->
          <!--Line SB-3 -->
          <div style="width:187mm;">
             <div class="styLNLeftNumBoxSD" style="height:4mm;padding-top:2mm">
               3</div>
             <div class="styLNDesc" style="width:139mm;height:4mm;padding-top:2mm">
               Combine lines 1a, 1b and 2. 
               <xsl:call-template name="LinkToLeftoverDataTableInline">
                     <xsl:with-param name="Desc">Section B Line 3 Additional Income Or Loss Amt </xsl:with-param>
                     <xsl:with-param name="TargetNode" 
                       select="$Form1040ScheduleSEData/SectionB/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossAmt"/>
                  </xsl:call-template> 
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                     <xsl:with-param name="Desc">Section B Line 3 Self Employment Tax Exempt Cd </xsl:with-param>
                     <xsl:with-param name="TargetNode" 
                       select="$Form1040ScheduleSEData/SectionB/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptCd"/>
                  </xsl:call-template>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                     <xsl:with-param name="Desc">Section B Line 3 Self Employment Tax Exempt Amt </xsl:with-param>
                     <xsl:with-param name="TargetNode" 
                       select="$Form1040ScheduleSEData/SectionB/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptAmt"/>
                  </xsl:call-template>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                     <xsl:with-param name="Desc">Section B Line 3 Additional Income Or Loss Cd</xsl:with-param>
                     <xsl:with-param name="TargetNode"
                       select="$Form1040ScheduleSEData/SectionB/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossCd"/>
                  </xsl:call-template>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                     <xsl:with-param name="Desc">Section B Line 3 Community Income Taxed To Spouse Amt </xsl:with-param>
                     <xsl:with-param name="TargetNode"
                       select="$Form1040ScheduleSEData/SectionB/SETotalNetEarningsOrLossAmt/@communityIncTaxedToSpouseAmt"/>
                  </xsl:call-template>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                     <xsl:with-param name="Desc">Section B Line 3 Chapter 11 Bankruptcy Income Cd </xsl:with-param>
                     <xsl:with-param name="TargetNode"
                       select="$Form1040ScheduleSEData/SectionB/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeCd"/>
                  </xsl:call-template>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                     <xsl:with-param name="Desc">Section B Line 3 Community Income Taxed To Spouse Cd </xsl:with-param>
                     <xsl:with-param name="TargetNode"
                       select="$Form1040ScheduleSEData/SectionB/SETotalNetEarningsOrLossAmt/@communityIncTaxedToSpouseCd"/>
                  </xsl:call-template>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                     <xsl:with-param name="Desc">Section B Line 3 Exempt Community Income Cd </xsl:with-param>
                     <xsl:with-param name="TargetNode"
                       select="$Form1040ScheduleSEData/SectionB/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeCd"/>
                  </xsl:call-template>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                     <xsl:with-param name="Desc">Section B Line 3 Chapter 11 Bankruptcy Income Amt </xsl:with-param>
                     <xsl:with-param name="TargetNode"
                       select="$Form1040ScheduleSEData/SectionB/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeAmt"/>
                  </xsl:call-template>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                     <xsl:with-param name="Desc">Section B Line 3 Exempt Community Income Amt </xsl:with-param>
                     <xsl:with-param name="TargetNode"
                       select="$Form1040ScheduleSEData/SectionB/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeAmt"/>
                  </xsl:call-template>
                <!--Dotted Line-->
                <span style="width:3mm"/>
                <span style=" letter-spacing:3.2mm; font-weight:bold; ">..............</span>
             </div>
             <div class="styLNRightNumBox" style="padding-top:2mm; height:6mm;">
               3</div>
             <div class="styLNAmountBox" style="padding-top:2mm;height:6mm">
                <xsl:call-template name="PopulateAmount">
                   <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SectionB/SETotalNetEarningsOrLossAmt"/>
                </xsl:call-template></div>
          </div>
          <!--End of lineSB-3 -->
          <!--Line SB-4a -->
          <div style="width:187mm;">
             <div class="styLNLeftNumBoxSD" style="height:4mm;">
               4a</div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">
              If line 3 is more than zero, multiply line 3 by 92.35% (.9235). Otherwise, enter amount from line 3</div>
            <div class="styLNRightNumBox" style="height:4mm;">
              4a</div>
            <div class="styLNAmountBox">
               <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SectionB/MinimumProfitForSETaxAmt"/>
               </xsl:call-template></div>
          </div>
          <!--End of lineSB-4a -->
          <!--Line SB-4b -->
          <div style="width:187mm;">
             <div class="styLNDesc" style="width:146.8mm;height:4mm;padding-left:8.5mm">
                <b>Note.</b> 
                 If line 4a is less than $400 due to Conservation Reserve Program payments on line 1b, <br/>
                 see instructions.</div>
                <div class="styLNRightNumBox" style="height:7.5mm;border-bottom-width:0mm"></div>
                <div class="styLNAmountBox" style="height:7.5mm;border-bottom-width:0mm"></div>
          </div>
          <div style="width:187mm;">
             <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm">
               b</div>
             <div class="styLNDesc" style="width:139mm;height:4mm;padding-left:.5mm">
               If you elect one or both of the optional methods, enter the total of lines 15 and 17 here
                <!--Dotted Line-->
                <span style="width:1mm"/>
                <span style=" letter-spacing:3.2mm; font-weight:bold; ">......</span>
             </div>
             <div class="styLNRightNumBox" style="height:4mm;border-bottom-width:1px;padding-top:.5mm">
               4b</div>
             <div class="styLNAmountBox" style="height:4mm;border-bottom-width:1px;padding-top:.5mm">
                <xsl:call-template name="PopulateAmount">
                   <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SectionB/OptionalMethodAmt"/>
                </xsl:call-template>
             </div>
          </div>
          <!--End of lineSB-4B -->
          <!--Line SB-4c -->
          <div style="width:187mm;">
             <div class="styLNLeftNumBoxSD" style="height:6mm;padding-left:4mm">
               c</div>
             <div class="styLNDesc" style="width:139mm;height:6mm;">
               Combine lines 4a and 4b. If less than $400,<b> stop; </b>you do not owe self-employment tax.
              <b>Exception. </b>If less than $400 and you had <b>church employee income, </b>enter -0- and continue
                <!--Dotted Line-->
                <span style="width:2.6mm"/>
                <span style=" letter-spacing:3.2mm; font-weight:bold; ">........</span>
                <span style="width:1mm"/>
                <img src="{$ImagePath}/1040SchSE_Bullet_Md.gif" alt="MediumBullet"/></div>
             <div class="styLNRightNumBox" style="height:6mm;padding-top:4mm">
               4c</div>
             <div class="styLNAmountBox" style="height:6mm;padding-top:4mm">
                <xsl:call-template name="PopulateAmount">
                   <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SectionB/CombinedSEAmt"/>
                </xsl:call-template></div>
          </div>
          <!--End of lineSB-4C -->
          <!-- Line SB5a -->
          <div style="width:187mm;">
             <div class="styLNLeftNumBox" style="height:4.5mm;padding-left:2mm">5a </div>
             <div class="styLNDesc" style="width:99.7mm;height:4mm;">Enter your <b>
               church employee income</b> from Form W-2. See instructions
               for definition of church employee income
                <span style="width:.1mm"/>
                <span style=" letter-spacing:3.2mm; font-weight:bold; ">............</span>
             </div>
             <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">5a </div>
             <div class="styLNAmountBox" style="border-bottom-width:1px;height:8mm;width:31.3mm;padding-top:4mm">
                <xsl:call-template name="PopulateAmount">
                   <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SectionB/W2WagesFromChurchesAmt"/>
                 </xsl:call-template></div>
             <div class="styLNRightNumBox" style="height:8mm;background-color:lightgrey;border-bottom-width:0px"/>
             <div class="styLNAmountBox" style="height:8mm;border-bottom-width:0px"/>
          </div>
          <!-- End LineSB 5a -->
          <!--Line SB-5b -->
          <div style="width:187mm;">
             <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm">
               b</div>
             <div class="styLNDesc" style="width:139mm;height:4mm;">
               Multiply line 5a by 92.35% (.9235). If less than $100, enter -0-
                <!--Dotted Line-->
                <span style="width:2.5mm"/>
                <span style=" letter-spacing:3.2mm; font-weight:bold; ">............</span>
             </div>
             <div class="styLNRightNumBox" style="height:4mm;border-bottom-width:1px">
               5b</div>
             <div class="styLNAmountBox" style="border-bottom-width:1px">
                <xsl:call-template name="PopulateAmount">
                   <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SectionB/MinAllowableChurchWagesAmt"/>
                </xsl:call-template></div>
          </div>
          <!--End of lineSB-5B -->
          <!--Line SB-6 -->
          <div style="width:187mm;">
             <div class="styLNLeftNumBoxSD" style="height:4mm;">
                6</div>
             <div class="styLNDesc" style="width:139mm;height:4mm;">
                Add lines 4c and 5b
                <!--Dotted Line-->
                <span style="width:1.5mm"/>
                <span style=" letter-spacing:3.2mm; font-weight:bold; ">...........................</span>
             </div>
             <div class="styLNRightNumBox" style="height:4mm;border-bottom-width:1px">
               6</div>
             <div class="styLNAmountBox" style="border-bottom-width:1px">
                <xsl:call-template name="PopulateAmount">
                   <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SectionB/CombinedSEAndChurchWagesAmt"/>
                </xsl:call-template></div>
          </div>
          <!--End of lineSB-6 -->
          <!-- Line SB7 -->
          <div style="width:187mm;">
             <div class="styLNLeftNumBoxSD" style="height:6mm;">
               7
             <!-- Position makes the 'a' in "1a" line up with the other letters. -->
             </div>
             <div class="styLNDesc" style="width:139mm;height:6mm;">
              Maximum amount of combined wages and self-employment earnings subject to social security
              tax or the 4.2% portion of the 5.65% railroad retirement (tier 1) tax for 2011
                <!--Dotted Line-->
                <span style="width:.2mm"/>
                <span style=" letter-spacing:3.2mm; font-weight:bold; ">............</span>
             </div>
             <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">
               7</div>
             <div class="styLNAmountBox" style="text-align:right;height:8mm;padding-top:4mm">
                <i>106,800</i></div>
          </div>
          <!--End of line SB7 -->
          <!-- Line SB8a -->
          <div style="width:187mm;">
             <div class="styLNLeftNumBox" style="height:11mm;padding-left:2mm">8a </div>
             <div class="styLNDesc" style="width:99.7mm;height:11mm;">
               Total social security wages and tips (total of boxes 3 and 7 on Form(s) 
               W-2) and railroad retirement (tier 1) compensation. If $106,800 or more,
               skip lines 8b through 10, and go to line 11
                <span style="width:.1mm"/>
                <span style=" letter-spacing:3.2mm; font-weight:bold; ">............</span>
             </div>
             <div class="styLNRightNumBox" style="height:11mm;padding-top:7mm">8a </div>
             <div class="styLNAmountBox" style="border-bottom-width:1px;height:11mm;width:31.3mm;padding-top:7mm">
                <xsl:call-template name="PopulateAmount">
                   <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SectionB/SSTWagesRRTCompAmt"/>
                </xsl:call-template></div>
             <div class="styLNRightNumBox" style="height:11mm;background-color:lightgrey;border-bottom-width:0px"/>
             <div class="styLNAmountBox" style="height:11mm;border-bottom-width:0px"/>
          </div>
          <!-- End LineSB 8a -->
          <!-- Line SB8b -->
          <div style="width:187mm;">
             <div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">b </div>
             <div class="styLNDesc" style="width:99.7mm;height:4mm;">
               Unreported tips subject to social security tax (from Form 4137, line 10)</div>
             <div class="styLNRightNumBox" style="height:4.5mm;">8b </div>
             <div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.3mm">
                <xsl:call-template name="PopulateAmount">
                   <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SectionB/UnreportedTipsAmt"/>
                </xsl:call-template></div>
             <div class="styLNRightNumBox" style="height:4.5mm;background-color:lightgrey;border-bottom-width:0px"/>
             <div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0px"/>
          </div>
          <!-- End LineSB 8b -->
          <!-- Line SB8c -->
          <div style="width:187mm;">
             <div class="styLNLeftNumBox" style="height:4mm;padding-left:4mm">c </div>
             <div class="styLNDesc" style="width:99.7mm;height:4mm;">
               Wages subject to social security tax (from Form 8919, line 10)
                <span style="width:2.2mm"/>
                <span style=" letter-spacing:3.2mm; font-weight:bold; ">...</span>
             </div>
             <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:1px">8c </div>
             <div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.3mm">
                <xsl:call-template name="PopulateAmount">
                   <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SectionB/WagesSubjectToSSTAmt"/>
                </xsl:call-template></div>
             <div class="styLNRightNumBox" style="height:4.8mm;background-color:lightgrey;border-bottom-width:0px"/>
             <div class="styLNAmountBox" style="height:4.8mm;border-bottom-width:0px"/>
          </div>
          <!-- End LineSB 8c -->
          <!--Line SB-8d -->
          <div style="width:187mm;">
             <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:4mm">
               d</div>
             <div class="styLNDesc" style="width:139mm;height:4mm;">
               Add lines 8a, 8b, and 8c
                <!--Dotted Line-->
                <span style="width:1.8mm"/>
                <span style=" letter-spacing:3.2mm; font-weight:bold; ">.........................</span>
             </div>
             <div class="styLNRightNumBox" style="height:4mm;padding-top:2mm">
               8d</div>
             <div class="styLNAmountBox" style="height:4mm;padding-top:2mm">
                <xsl:call-template name="PopulateAmount">
                   <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SectionB/TotalWagesAndUnreportedTipsAmt"/>
                </xsl:call-template></div>
          </div>
          <!--End of lineSB-8d -->
          <!--Line SB-9 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="height:4mm">
            9
          </div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">
       Subtract line 8d from line 7. If zero or less, enter -0- here and on line 10 and go to line 11
            <!--Dotted Line-->
              <span style="width:3mm"/>
              <span style=" letter-spacing:3.2mm; font-weight:bold; ">...</span>
              <span style="width:1mm"/> 
              <img src="{$ImagePath}/1040SchSE_Bullet_Md.gif" alt="MediumBullet"/>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">
          9
          </div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SectionB/AllowableSEAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!--End of lineSB-9 -->
          <!--Line SB-10 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:0.5mm;">
            10
          </div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">
          Multiply the <b>smaller </b>of line 6 or line 9 by 10.4% (.104)
            <!--Dotted Line-->
              <span style="width:1.8mm"/>
              <span style=" letter-spacing:3.2mm; font-weight:bold; ">................</span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;">
          10
          </div>
            <div class="styLNAmountBox" style="height:4mm;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SectionB/TaxBaseAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!--End of lineSB-10 -->
          <!--Line SB-11 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:0.5mm;">
            11
          </div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">
          Multiply line 6 by 2.9% (.029)
            <!--Dotted Line-->
              <span style="width:2.2mm"/>
              <span style=" letter-spacing:3.2mm; font-weight:bold; ">........................</span>
            </div>
            <div class="styLNRightNumBox" style="height:4mm;border-bottom-width:1px">
          11
          </div>
            <div class="styLNAmountBox" style="height:4mm;border-bottom-width:1px">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SectionB/SEBaseAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!--End of lineSB-11 -->
          <!--Line SB-12 -->
          <div style="width:187mm;">
            <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:0.5mm;">
            12
          </div>
            <div class="styLNDesc" style="width:139mm;height:4mm;">
              <b>Self-employment tax. </b>Add lines 10 and 11. Enter here and on <b>
                    Form 1040, line 56, </b>or <b> Form 1040NR, <br/>line 54</b>
              <!--Dotted Line-->
              <span style="width:2.6mm"/>
              <span style=" letter-spacing:3.2mm; font-weight:bold; ">...............................</span>
            </div>
            <div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm">
          12
          </div>
            <div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SectionB/SelfEmploymentTaxAmt"/>
              </xsl:call-template>
            </div>
          </div>
          <!--End of lineSB-12 -->


          <!--Line SB13 -->
          <div class="styBB" style="width:187mm;">
            <div class="styLNLeftNumBox" style="height:8mm;padding-left:0.5mm;">13</div>
            <div class="styLNDesc" style="width:99.7mm;height:17mm;">
              <b>Deduction for employer-equivalent portion of self-employment tax.</b> Add the two following amounts.<br/>
	       &#8226; 59.6%(.596) of line 10.<br/>
	       &#8226; One-half of line 11.<br/>
	      Enter the result here and on <b>Form 1040,line 27,</b> or <b>Form 1040NR, line 27</b>
            </div>
            <div class="styLNRightNumBox" style="height:17mm;border-bottom-width:0px;padding-top:13mm">13</div>
            <div class="styLNAmountBox" style="border-bottom-width:0px;height:17mm;width:31.3mm;
      padding-top:13mm">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SectionB/EmplrEquivalentPrtnSETaxAmt"/>
              </xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="height:17mm;background-color:lightgrey;
      border-bottom-width:0px"/>
            <div class="styLNAmountBox" style="height:17mm;border-bottom-width:0px;
      border-bottom-width:0px;background-color:lightgrey;border-left-width:0px;"/>
          </div>
          <!--End of lineSB- 13 -->
         
          <!-- Part I I  -->
          <div class="styBB" style="width:187mm;border-top-width:0px;">
            <span class="styPartName" style="width:16mm;">Part II</span>
            <span style="width:2mm;"/>
            <b>Optional Methods To Figure Net Earnings </b>(see instructions)
</div>
          <!-- End Part II  -->
          <!--Line SB-14-1 -->
          <div class="styBB" style="width:187mm;">
            <!-- Line SB7 -->
            <div style="width:187mm;">
              <div class="styLNDesc" style="width:146.8mm;height:6mm;">
                <b>Farm Optional Method. </b>You may use 
            this method <b>only</b> if <b>(a) </b>your gross farm income
            <span style="font-size:5pt;">
                  <sup>1</sup>
                </span>
             was not more than $6,720,
            <b> or (b)</b> your net farm profits<span style="font-size:5pt;">
                  <sup>2</sup>
                </span> were less than $4,851.
            </div>
              <div class="styLNRightNumBox" style="border-bottom-width:0px;height:8mm;padding-top:4mm;
          background-color:lightgrey;"/>
              <div class="styLNAmountBox" style="text-align:center;height:8mm;padding-top:4mm;
              border-bottom-width:0px"/>
            </div>
            <!--End of line SB14-1 -->
            <!--Line SB-14 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:0.5mm;">
            14
          </div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
      Maximum income for optional methods
            <!--Dotted Line-->
                <span style="width:.2mm"/>
                <span style=" letter-spacing:3.2mm; font-weight:bold; ">......................</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">
          14
          </div>
              <div class="styLNAmountBox" style="height:4mm;text-align:right">
                <i>4,480</i>
              </div>
            </div>
            <!--End of lineSB-14 -->
            <!--Line SB-15 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:0.5mm;padding-top:1.3mm">
            15
          </div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
      Enter the <b>smaller </b>of: two-thirds (2⁄3)
      of gross farm income<sup>1</sup> (not less than zero)
      <b>or </b> $4,480. Also
      include this amount on line 4b above
            <!--Dotted Line-->
                <span style="width:1mm"/>
                <span style=" letter-spacing:3.2mm; font-weight:bold; ">.........................</span>
              </div>
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;border-bottom-width:0px">
          15
          </div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm;border-bottom-width:0px">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SectionB/SETaxFarmOptionalMethodAmt"/>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!--End of lineSB-15 -->
          <!--Line SB-16-1 -->
          <div class="styBB" style="width:187mm;">
            <!-- Line SB7 -->
            <div class="styLNDesc" style="width:146.8mm;height:8mm;">
              <b>Nonfarm Optional Method.</b> You may use this method <b>only </b> if <b>(a)
              </b> your net nonfarm profits<span style="font-size:5pt;padding-bottom:1mm">
                <sup>3</sup>
              </span> 
          were less than $4,851 and also less than 72.189% of your gross nonfarm 
          income<span style="font-size:5pt;padding-bottom:1mm">
                <sup>4</sup>, </span>
              <b>
          and (b) </b> you had net earnings from self-employment of at least $400 in 2 of the prior 3 years.<br/>
              <br/>
              <b>Caution.</b> You may use this method no more than five times.
          </div>
            <div class="styLNRightNumBox" style="border-bottom-width:0px;height:18mm;padding-top:0mm;
          background-color:lightgrey;"/>
            <div class="styLNAmountBox" style="text-align:center;height:18mm;padding-top:0mm;
              border-bottom-width:0px"/>
            <!--End of line SB16-1 -->
            <!--Line SB-16 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:0.5mm;">
            16
          </div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
           Subtract line 15 from line 14
            <!--Dotted Line-->
                <span style="width:1mm"/>
                <span style=" letter-spacing:3.2mm; font-weight:bold; ">.........................</span>
              </div>
              <div class="styLNRightNumBox" style="height:4mm;">
          16
          </div>
              <div class="styLNAmountBox" style="height:4mm;">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SectionB/SETaxNonFarmOptionalBaseAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--End of lineSB-16 -->
            <!--Line SB-17 -->
            <div style="width:187mm;">
              <div class="styLNLeftNumBoxSD" style="height:4mm;padding-left:0.5mm;">
            17
          </div>
              <div class="styLNDesc" style="width:139mm;height:4mm;">
      Enter the <b>smaller </b>of: two-thirds (2⁄3) of gross nonfarm income<sup>4</sup> (not less than 
      zero) <b>or</b> the amount on line 16. Also include this amount on line 4b above
            <!--Dotted Line-->
                <span style="width:2.5mm"/>
                <span style=" letter-spacing:3.2mm; font-weight:bold; ">...................</span>
              </div>
              <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">
          17
          </div>
              <div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData/SectionB/SETaxNonFarmOptionalMethodAmt"/>
                </xsl:call-template>
              </div>
            </div>
            <!--End of lineSB-17 -->
            <!--Line 18-->
            <div style="width:187mm;">
              <div class="styLNDesc" style="width:80mm;height:8mm;border-color:black;
      border-right-width:1px;border-left-width:1px">
                <sup>1</sup>From Sch. F, line 9, and Sch. K-1 (Form 1065), box 14,<br/>
                <span style="padding-left:1mm"> code B.</span>
                <br/>
                <sup>2</sup>From Sch. F, line 34, and Sch. K-1
        (Form 1065), box 14,<br/>
                <span style="padding-left:1mm"> code A—minus the amount you 
                would have entered on line 
                <br/>
                  <span style="padding-left:1mm">1b had you not used the optional method.
                </span>
                </span>
              </div>
              <div class="styLNAmountBox" style="width:106mm;height:18mm;
     text-align:left;border-bottom-width:0px;">
                <span style="padding-left:4mm;">
                  <sup>3</sup>From Sch. C, line 31; 
     Sch. K-1 (Form 1065), box 14, <br/>
                  <span style="padding-left:5.5mm">
     code A; and Sch. K-1 (Form 1065-B), box 9, code J1.</span>
                </span>
                <br/>
                <br/>
                <span style="padding-left:4mm;">
                  <sup>4</sup>
 From Sch. C, line 7; Sch. K-1 (Form 1065), box 14,  
 code<br/><span style="padding-left:5.5mm"> C; and Sch. K-1 (Form 1065-B),
 box 9, code J2.</span>
                </span>
              </div>
            </div>
          </div>
          <!--End of line 18 -->
          <!--  FOOTER-->
          <div style="width:187mm;">
            <span class="styBoldText" style="width:83mm;"/>
            <span style="width:55px;"/>
            <span style="width:49mm;"/>
            <span class="styBoldText">Schedule SE (Form 1040) 2011</span>
          </div>
          <p class="pageend"/>
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle">
              Additional Data</div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" 
                onclick="javascript:returnToWriteInImage();"/></div>
          </div>
          <table class="styLeftOverTbl">
                  <xsl:call-template name="PopulateCommonLeftover">
                     <xsl:with-param name="TargetNode" select="$Form1040ScheduleSEData"/>
                     <xsl:with-param name="DescWidth" select="115"/>
                  </xsl:call-template>
                  <xsl:call-template name="PopulateLeftoverRowAmount">
                     <xsl:with-param name="Desc">Section A Line 3 Additional Income Or Loss Amt </xsl:with-param>
                     <xsl:with-param name="TargetNode" 
                    select="$Form1040ScheduleSEData/SectionA/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossAmt"/>
                     <xsl:with-param name="DescWidth" select="110"/>  
                  </xsl:call-template> 
                  <xsl:call-template name="PopulateLeftoverRow">
                     <xsl:with-param name="Desc">Section A Line 3 Self Employment Tax Exempt Cd </xsl:with-param>
                     <xsl:with-param name="TargetNode" 
                       select="$Form1040ScheduleSEData/SectionA/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptCd"/>
                     <xsl:with-param name="DescWidth" select="110"/>  
                  </xsl:call-template>
                  <xsl:call-template name="PopulateLeftoverRowAmount">
                     <xsl:with-param name="Desc">Section A Line 3 Self Employment Tax Exempt Amt </xsl:with-param>
                     <xsl:with-param name="TargetNode" 
                       select="$Form1040ScheduleSEData/SectionA/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptAmt"/>
                     <xsl:with-param name="DescWidth" select="110"/>  
                  </xsl:call-template>
                  <xsl:call-template name="PopulateLeftoverRow">
                     <xsl:with-param name="Desc">Section A Line 3 Additional Income Or Loss Cd</xsl:with-param>
                     <xsl:with-param name="TargetNode"
                       select="$Form1040ScheduleSEData/SectionA/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossCd"/>
                     <xsl:with-param name="DescWidth" select="110"/>  
                  </xsl:call-template>
                  <xsl:call-template name="PopulateLeftoverRowAmount">
                     <xsl:with-param name="Desc">Section A Line 3 Community Income Taxed To Spouse Amt </xsl:with-param>
                     <xsl:with-param name="TargetNode"
                       select="$Form1040ScheduleSEData/SectionA/SETotalNetEarningsOrLossAmt/@communityIncTaxedToSpouseAmt"/>
                     <xsl:with-param name="DescWidth" select="115"/>  
                  </xsl:call-template>
                  <xsl:call-template name="PopulateLeftoverRow">
                     <xsl:with-param name="Desc">Section A Line 3 Chapter 11 Bankruptcy Income Cd </xsl:with-param>
                     <xsl:with-param name="TargetNode"
                       select="$Form1040ScheduleSEData/SectionA/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeCd"/>
                     <xsl:with-param name="DescWidth" select="110"/>
                  </xsl:call-template>
                  <xsl:call-template name="PopulateLeftoverRow">
                     <xsl:with-param name="Desc">Section A Line 3 Community Income Taxed To Spouse Cd </xsl:with-param>
                     <xsl:with-param name="TargetNode"
                       select="$Form1040ScheduleSEData/SectionA/SETotalNetEarningsOrLossAmt/@communityIncTaxedToSpouseCd"/>
                     <xsl:with-param name="DescWidth" select="110"/>  
                  </xsl:call-template>
                  <xsl:call-template name="PopulateLeftoverRow">
                     <xsl:with-param name="Desc">Section A Line 3 Exempt Community Income Cd </xsl:with-param>
                     <xsl:with-param name="TargetNode"
                       select="$Form1040ScheduleSEData/SectionA/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeCd"/>
                     <xsl:with-param name="DescWidth" select="110"/>  
                  </xsl:call-template>
                  <xsl:call-template name="PopulateLeftoverRowAmount">
                     <xsl:with-param name="Desc">Section A Line 3 Chapter 11 Bankruptcy Income Amt </xsl:with-param>
                     <xsl:with-param name="TargetNode"
                       select="$Form1040ScheduleSEData/SectionA/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeAmt"/>
                     <xsl:with-param name="DescWidth" select="110"/>  
                  </xsl:call-template>
                  <xsl:call-template name="PopulateLeftoverRowAmount">
                     <xsl:with-param name="Desc">Section A Line 3 Exempt Community Income Amt </xsl:with-param>
                     <xsl:with-param name="TargetNode"
                       select="$Form1040ScheduleSEData/SectionA/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeAmt"/>
                     <xsl:with-param name="DescWidth" select="110"/>  
                  </xsl:call-template>
                  <xsl:call-template name="PopulateLeftoverRowAmount">
                     <xsl:with-param name="Desc">Section B Line 3 Additional Income Or Loss Amt </xsl:with-param>
                     <xsl:with-param name="TargetNode" 
                       select="$Form1040ScheduleSEData/SectionB/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossAmt"/>
                     <xsl:with-param name="DescWidth" select="110"/>  
                  </xsl:call-template> 
                  <xsl:call-template name="PopulateLeftoverRow">
                     <xsl:with-param name="Desc">Section B Line 3 Self Employment Tax Exempt Cd </xsl:with-param>
                     <xsl:with-param name="TargetNode" 
                       select="$Form1040ScheduleSEData/SectionB/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptCd"/>
                     <xsl:with-param name="DescWidth" select="110"/>  
                  </xsl:call-template>
                  <xsl:call-template name="PopulateLeftoverRowAmount">
                     <xsl:with-param name="Desc">Section B Line 3 Self Employment Tax Exempt Amt </xsl:with-param>
                     <xsl:with-param name="TargetNode" 
                       select="$Form1040ScheduleSEData/SectionB/SETotalNetEarningsOrLossAmt/@selfEmploymentTaxExemptAmt"/>
                     <xsl:with-param name="DescWidth" select="110"/>  
                  </xsl:call-template>
                  <xsl:call-template name="PopulateLeftoverRow">
                     <xsl:with-param name="Desc">Section B Line 3 Additional Income Or Loss Cd</xsl:with-param>
                     <xsl:with-param name="TargetNode"
                       select="$Form1040ScheduleSEData/SectionB/SETotalNetEarningsOrLossAmt/@additionalIncomeOrLossCd"/>
                     <xsl:with-param name="DescWidth" select="110"/>  
                  </xsl:call-template>
                  <xsl:call-template name="PopulateLeftoverRowAmount">
                     <xsl:with-param name="Desc">Section B Line 3 Community Income Taxed To Spouse Amt </xsl:with-param>
                     <xsl:with-param name="TargetNode"
                       select="$Form1040ScheduleSEData/SectionB/SETotalNetEarningsOrLossAmt/@communityIncTaxedToSpouseAmt"/>
                     <xsl:with-param name="DescWidth" select="115"/>  
                  </xsl:call-template>
                  <xsl:call-template name="PopulateLeftoverRow">
                     <xsl:with-param name="Desc">Section B Line 3 Chapter 11 Bankruptcy Income Cd </xsl:with-param>
                     <xsl:with-param name="TargetNode"
                       select="$Form1040ScheduleSEData/SectionB/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeCd"/>
                     <xsl:with-param name="DescWidth" select="110"/>
                  </xsl:call-template>
                  <xsl:call-template name="PopulateLeftoverRow">
                     <xsl:with-param name="Desc">Section B Line 3 Community Income Taxed To Spouse Cd </xsl:with-param>
                     <xsl:with-param name="TargetNode"
                       select="$Form1040ScheduleSEData/SectionB/SETotalNetEarningsOrLossAmt/@communityIncTaxedToSpouseCd"/>
                     <xsl:with-param name="DescWidth" select="110"/>  
                  </xsl:call-template>
                  <xsl:call-template name="PopulateLeftoverRow">
                     <xsl:with-param name="Desc">Section B Line 3 Exempt Community Income Cd </xsl:with-param>
                     <xsl:with-param name="TargetNode"
                       select="$Form1040ScheduleSEData/SectionB/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeCd"/>
                     <xsl:with-param name="DescWidth" select="110"/>  
                  </xsl:call-template>
                  <xsl:call-template name="PopulateLeftoverRowAmount">
                     <xsl:with-param name="Desc">Section B Line 3 Chapter 11 Bankruptcy Income Amt </xsl:with-param>
                     <xsl:with-param name="TargetNode"
                       select="$Form1040ScheduleSEData/SectionB/SETotalNetEarningsOrLossAmt/@chap11BankruptcyIncomeAmt"/>
                     <xsl:with-param name="DescWidth" select="110"/>  
                  </xsl:call-template>
                  <xsl:call-template name="PopulateLeftoverRowAmount">
                     <xsl:with-param name="Desc">Section B Line 3 Exempt Community Income Amt </xsl:with-param>
                     <xsl:with-param name="TargetNode"
                       select="$Form1040ScheduleSEData/SectionB/SETotalNetEarningsOrLossAmt/@exemptCommunityIncomeAmt"/>
                     <xsl:with-param name="DescWidth" select="110"/>  
                  </xsl:call-template>
          </table>
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
