<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS8911Style.xsl"/>


<xsl:output method="html" indent="yes" />
<xsl:strip-space elements="*" />

<xsl:param name="Form8911" select="$RtnDoc/IRS8911" />

<xsl:template match="/">

<html>
  <head>
  <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($Form8911)"></xsl:with-param></xsl:call-template></title>
  <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache" />
  <meta http-equiv="Cache-Control" content="no-cache" />
  <meta http-equiv="Expires" content="0" />
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private" />
  <!-- Define Character Set -->
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
  <meta name="Description" content="IRS Form 8911" />
  
 
  
  <xsl:call-template name="InitJS"></xsl:call-template>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
  
  <style type="text/css">
   <xsl:if test="not($Print) or $Print=''">
      
      <xsl:call-template name="IRS8911Style"></xsl:call-template>  
      <xsl:call-template name="AddOnStyle"></xsl:call-template>
    </xsl:if>
  </style>
  <xsl:call-template name="GlobalStylesForm"/>
</head>
  <body class="styBodyClass">
    <form name="Form8911">
      <xsl:call-template name="DocumentHeader"></xsl:call-template>

    <div class="styBB" style="width:187mm;">
    <div class="styFNBox" style="width:31mm;height:22.5mm;">
      Form <span class="styFormNumber">8911</span>      
      <br />      
     
      <div class="styAgency" style="padding-top:5mm"> Department of the Treasury<br/>Internal Revenue Service</div>
    </div>
    <div class="styFTBox" style="width:125mm;height:20mm;">
      <div class="styMainTitle" style="height:8mm;">Alternative Fuel Vehicle Refueling Property Credit</div>
      <div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
               <span style="text-align:center;">
          <img src="{$ImagePath}/8911_Bullet_Md.gif" alt="MediumBullet"/> 
          Attach to your tax return.
        </span>

      </div>
    </div>
    <div class="styTYBox" style="width:30mm;height:20mm;">
      <div class="styOMB" style="height:5mm;">OMB No. 1545-1981</div>
      <div class="styTY" style="height:11mm;padding-bottom:0">20<span class="styTYColor">06</span></div>
      Attachment<br/>
	      Sequence No. <span class="styBoldText">151</span>
      </div>
    </div>
 
      
      <div class="styNameAddr" style="width:150mm;height:13mm;border-left-width:1px;padding-left:1px;border-left-width:0;border-bottom-width:0">
        Name(s) shown on return<br/>
         <div style="padding-left:2mm;font-size:7pt">
          <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
          </xsl:call-template><br/>
          <xsl:call-template name="PopulateReturnHeaderFiler">
              <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
          </xsl:call-template><br />
         <xsl:call-template name="PopulateReturnHeaderFiler">
             <xsl:with-param name="TargetNode">InCareOfName</xsl:with-param>
        </xsl:call-template>
        </div>
     
      </div>
       <div class="styNameAddr" style=";font-size:7pt;height:13mm;border-left-width:1px;padding-left:1px;border-bottom-width:0">
			<span style="width:8px"></span><span class="styBoldText">Identifying number</span>
			
			<div style="padding-top:5mm;padding-left:3mm">
      	<xsl:call-template name="PopulateReturnHeaderFiler">
        	<xsl:with-param name="EINChanged">true</xsl:with-param>
        	<xsl:with-param name="TargetNode">EIN</xsl:with-param>
</xsl:call-template> </div>
      </div>
      
   <div class="styBB" style="width:187mm;height:3.75mm;border-top-width:1;padding-top:1.5mm;padding-bottom:1.5mm">
        <div class="styPartName" style="height:3.75mm">Part I</div>
	<div class="styPartDesc" style="float:left;width:167mm;">
		Total Cost of Refueling Property
	</div>
   </div>
   <div style="width:187mm;">
      <div class="styLNLeftNumBox" style="height:4.5mm;">1</div>
      <div class="styLNDesc" style="width:137mm;height:4.5mm;">Total cost of qualified alternative fuel vehicle refueling property placed in service during the tax year

      </div>
      <div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0">1</div>
      <div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0">
          <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8911/TotalQualifiedPropertyCost"></xsl:with-param></xsl:call-template>
     

      </div>

    </div>
    
	<div class="styBB" style="width:187mm;height:3.75mm;border-top-width:1;padding-top:1.5mm;padding-bottom:1.5mm;">
		<div class="styPartName" style="height:3.75mm">Part II</div>
		<div class="styPartDesc" style="float:left;width:167mm;">
			Credit for Business/Investment Use Part of Refueling Property
		</div>
	</div>
    
    
    
    <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4.5mm;">2</div>
          <div class="styLNDesc" style="width:137mm;height:4.5mm;">Business/investment use part (see instructions)
          <span style="width:2px;"></span>
           
            <!--Dotted Line-->
            <span class="styBoldText">
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
                  <span style="width:16px"></span>.
                  <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
             
            </span>
          </div>
          <div class="styLNRightNumBox" style="height:4.5mm;">2</div>
          <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8911/BusInvstUsePart"></xsl:with-param></xsl:call-template>
         
    
          </div>
    
    </div>
    <div style="width:187mm;">
              <div class="styLNLeftNumBox" style="height:4.5mm;">3</div>
              <div class="styLNDesc" style="width:137mm;height:4.5mm;">Section 179 expense deduction (see instructions)
              <span style="width:2px;"></span>
               
                <!--Dotted Line-->
                <span class="styBoldText">
                  <span style="width:16px"></span>.
                  <span style="width:16px"></span>.
                  <span style="width:16px"></span>.
                  <span style="width:16px"></span>.
                  <span style="width:16px"></span>.
                  <span style="width:16px"></span>.
                  <span style="width:16px"></span>.
                  <span style="width:16px"></span>.
                  <span style="width:16px"></span>.
              	  <span style="width:16px"></span>.
              	  <span style="width:16px"></span>.
              	  <span style="width:16px"></span>.
                 
                </span>
              </div>
              <div class="styLNRightNumBox" style="height:4.5mm;">3</div>
              <div class="styLNAmountBox" style="height:4.5mm;">
                  <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8911/Section179ExpenseDeduction"></xsl:with-param></xsl:call-template>
             
        
              </div>
        
    </div>
    <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4.5mm;">4</div>
          <div class="styLNDesc" style="width:137mm;height:4.5mm;">Subtract line 3 from line 2
          <span style="width:2px;"></span>
           
            <!--Dotted Line-->
            <span class="styBoldText">
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
                  <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
            </span>
          </div>
          <div class="styLNRightNumBox" style="height:4.5mm;">4</div>
          <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8911/NetBusUsePart"></xsl:with-param></xsl:call-template>
         
    
          </div>
    
    </div>

    <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4.5mm;">5</div>
          <div class="styLNDesc" style="width:137mm;height:4.5mm;">Multiply line 4 by 30% (.30)
          <span style="width:2px;"></span>
           
            <!--Dotted Line-->
            <span class="styBoldText">
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
                  <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
             
            </span>
          </div>
          <div class="styLNRightNumBox" style="height:4.5mm;">5</div>
          <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8911/AdjBusUsePrt"></xsl:with-param></xsl:call-template>
         
    
          </div>
    
    </div>


    <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4.5mm;">6</div>
          <div class="styLNDesc" style="width:137mm;height:4.5mm;">Maximum business/investment use part of credit (see instructions)
          <span style="width:2px;"></span>
           
            <!--Dotted Line-->
            <span class="styBoldText">
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
                  <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
               <span style="width:16px"></span>.
              <span style="width:16px"></span>.
             
            </span>
          </div>
          <div class="styLNRightNumBox" style="height:4.5mm;">6</div>
          <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8911/MxBusUsePrt"></xsl:with-param></xsl:call-template>
         
    
          </div>
    
    </div>





    <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4.5mm;">7</div>
	  <div class="styLNDesc" style="width:137mm;height:4.5mm;">Enter the <span class="styBoldText">smaller</span> of line 5 or line 6
          <span style="width:2px;"></span>
           
            <!--Dotted Line-->
            <span class="styBoldText">
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
                  <span style="width:16px"></span>.
              <span style="width:16px"></span>.
             
            </span>
          </div>
          <div class="styLNRightNumBox" style="height:4.5mm;">7</div>
          <div class="styLNAmountBox" style="height:4.5mm;">
              <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8911/AdjBusUsePrtOrMxBusUsePrt"></xsl:with-param></xsl:call-template>
         
    
          </div>
    
    </div>

    <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4.5mm;">8</div>
	  <div class="styLNDesc" style="width:137mm;height:4.5mm;">
		  Alternative fuel vehicle refueling property credit from partnerships and S corporations
          <span style="width:2px;"></span>
           
            <!--Dotted Line-->
            <span class="styBoldText">
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
             
                  <span style="width:16px"></span>.
            </span>
          </div>
	  <div class="styLNRightNumBox" style="height:4.5mm;">
		  8
	  </div>
          <div class="styLNAmountBox" style="height:4.5mm;">
		  <xsl:call-template name="PopulateAmount">
			  <xsl:with-param name="TargetNode" select="$Form8911/FinalGulfBondCredit">
		  	  </xsl:with-param>
		  </xsl:call-template>
          </div>
    </div>

    <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4.5mm;">9</div>
	  <div class="styLNDesc" style="width:137mm;height:4.5mm;">
		  <span class="styBoldText">
			  Business/investment use part of credit.
		  </span>
		  Add lines 7 and 8. Partnerships and S corporations, report this amount on Schedule K; all others, report this amount on Form 3800, line 1w
          <span style="width:2px;"></span>
           
            <!--Dotted Line-->
            <span class="styBoldText">
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
            </span>
          </div>
          <div class="styLNRightNumBox" style="background:gray;border-bottom-width:0"></div>
	  <div class="styLNAmountBox" style=";border-bottom-width:0"></div>
          <div class="styLNRightNumBox" style="border-bottom-width:0">9</div>
          <div class="styLNAmountBox" style="border-bottom-width:0">
              <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$Form8911/BusInvstUsePartOfCredit"></xsl:with-param></xsl:call-template>
         
    
          </div>
    
    </div>

	<div class="styBB" style="width:187mm;height:3.75mm;padding-top:1.5mm;padding-bottom:1.5mm;border-top-width:1">
		<div class="styPartName" style="height:3.75mm">Part III</div>
		<div class="styPartDesc" style="float:left;width:167mm;">
			Credit for Personal Use Part of Refueling Property
		</div>
	</div>


    <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4.5mm;">10</div>
	  <div class="styLNDesc" style="width:137mm;height:4.5mm;">
		Subtract line 2 from line 1. If zero, stop here; <span class="styBoldText">do not</span> file this form unless you are claiming a
credit on line 9
          <span style="width:2px;"></span>
           
            <!--Dotted Line-->
            <span class="styBoldText">
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
             
            </span>
          </div>
	  <div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">
		  10
	  </div>
          <div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
		  <xsl:call-template name="PopulateAmount">
			  <xsl:with-param name="TargetNode" select="$Form8911/PersnlUsePartOfCredit">
		  	  </xsl:with-param>
		  </xsl:call-template>
          </div>
    </div>

    <div style="width:187mm;">
          <div class="styLNLeftNumBox" style="height:4.5mm;">11</div>
	  <div class="styLNDesc" style="width:137mm;height:4.5mm;">
		Multiply line 10 by 30% (.30)
          <span style="width:2px;"></span>
           
            <!--Dotted Line-->
            <span class="styBoldText">
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
             
            </span>
          </div>
	  <div class="styLNRightNumBox" style="height:4.5mm;">
		  11	  </div>
          <div class="styLNAmountBox" style="height:4.5mm;">
		  <xsl:call-template name="PopulateAmount">
			  <xsl:with-param name="TargetNode" select="$Form8911/AdjPersnlUsePrt">
		  	  </xsl:with-param>
		  </xsl:call-template>
	  </div>
	</div>
	<div style="width:187mm;">
		<div class="styLNLeftNumBox" style="height:4.5mm;">12</div>
		<div class="styLNDesc" style="width:137mm;height:4.5mm;">
			Maximum personal use part of credit (see instructions)
			<span style="width:2px;"></span>
           
				<!--Dotted Line-->
				<span class="styBoldText">
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
              			<span style="width:16px"></span>.
	       	                <span style="width:16px"></span>.
		                <span style="width:16px"></span>.
  		                <span style="width:16px"></span>.
		                <span style="width:16px"></span>.
		                <span style="width:16px"></span>.
  		                <span style="width:16px"></span>.
		                <span style="width:16px"></span>.
            
			</span>
		</div>
		<div class="styLNRightNumBox" style="height:4.5mm;">
			12
		</div>
		<div class="styLNAmountBox" style="height:4.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$Form8911/MxPersnlUsePrt">
				</xsl:with-param>
			</xsl:call-template>
		</div>
	</div>

	<div style="width:187mm;">
		<div class="styLNLeftNumBox" style="height:4.5mm;">13</div>
		<div class="styLNDesc" style="width:137mm;height:4.5mm;">
			Enter the 
			<span class="styBoldText">
				smaller
			</span>
			of line 11 or line 12
			<span style="width:2px;"></span>
           
				<!--Dotted Line-->
				<span class="styBoldText">
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
              			<span style="width:16px"></span>.
              			<span style="width:16px"></span>.
              			<span style="width:16px"></span>.
              			<span style="width:16px"></span>.
              			<span style="width:16px"></span>.
             			<span style="width:16px"></span>.
          			<span style="width:16px"></span>.
         			<span style="width:16px"></span>.
				<span style="width:16px"></span>.
              			<span style="width:16px"></span>.
		                <span style="width:16px"></span>.
              			<span style="width:16px"></span>.
            
			</span>
		</div>
		<div class="styLNRightNumBox" style="height:4.5mm;">
			13
		</div>
		<div class="styLNAmountBox" style="height:4.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$Form8911/AdjPersnlUsePrt-MxPersnlUsePrt">
				</xsl:with-param>
			</xsl:call-template>
		</div>
	</div>
	<div style="width:187mm;">
		<div class="styLNLeftNumBox" style="height:4.5mm;">14</div>
		<div class="styLNDesc" style="width:137mm;height:4.5mm;">
			Regular tax before credits:
		</div>
		<div class="styLNRightNumBox" style="height:4.5mm;background:gray;border-bottom-width:0">
			
		</div>
		<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0">
		</div>
	</div>








<div style="width:187mm;">
    <div class="styLNLeftNumBox" style="padding-left: 2mm; height:4mm;"></div>
    <div class="styLNDesc" style="width:137mm; height:4mm;">
      <table border="0" cellspacing="0" cellpadding="0" style="padding:0mm">
         <tr>
            
            <td style="font-size:7pt;font-family:verdana;font-style: normal;font-weight:normal;border:none; width: 111mm">
              <img src="{$ImagePath}/8911_Bullet_Round.gif" alt="dot"/>
		Individuals. Enter the amount from Form 1040, line 44 (or Form 1040NR, line 41)
              <br/>
              <img src="{$ImagePath}/8911_Bullet_Round.gif" alt="dot"/>
              Other filers. Enter the regular tax before credits from your return
              <span class="styBoldText" style="font-size: 7pt"> 
                <span style="width:16px;"></span>.
                <span style="width:16px;"></span>.                                                      
                <span style="width:16px;"></span>.                                                      
		</span>
	</td>
          <td style="width:21mm">
            <div class="styLNDesc" style="width:4mm">
              <img src="{$ImagePath}/8826_Bracket_Tiny.gif" alt="Curly Bracket Image"/>                                    
            </div>
            <div class="styLNDesc" style="width:16mm;padding-top:2mm;">                  
              <span class="styBoldText" style="font-size: 7pt"> 
                <span style="width:16px;"></span>.
                <span style="width:16px;"></span>.                                                      
              </span>                  
            </div>
          </td>
         </tr>            
      </table>          
    </div>
   
     <div class="styLNRightNumBox" style="">
          14          
    </div>        
    <div class="styLNAmountBox">
	<xsl:call-template name="PopulateAmount">
		<xsl:with-param name="TargetNode" select="$Form8911/RegularTaxBeforeCredits">
		</xsl:with-param>
	</xsl:call-template>
    </div>
    <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:4mm;background-color:gray;border-right-width:1px;padding-top:0;padding-bottom:0;"></div>
  
  </div>





          



	<div style="width:187mm;">
		<div class="styLNLeftNumBox" style="height:4.5mm;">15</div>
		<div class="styLNDesc" style="width:137mm;height:4.5mm;">
			Credits that reduce regular tax before the alternative fuel vehicle refueling property credit:
			<xsl:call-template name="LinkToLeftoverDataTableInline">
				<xsl:with-param name="TargetNode" select="$Form8911/OtherSpecifiedCredits"></xsl:with-param>
			</xsl:call-template>
			<span style="width:2px;"></span>
           
				<!--Dotted Line-->
		</div>
		<div class="styLNRightNumBox" style="height:4.5mm;background:gray;border-bottom-width:0">
			
		</div>
		<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0">
			
		</div>
	</div>
	<div style="width:187mm;">
		<div class="styLNLeftNumBox" style="height:4.5mm;">
			<span style="width:6px"></span>
			a
		</div>
		<div class="styLNDesc" style="width:97mm;height:4.5mm;">
			Foreign tax credit
			<span style="width:2px;"></span>
       
			<!--Dotted Line-->
			<span class="styBoldText">
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
			</span>
		</div>
		<div class="styLNRightNumBox" style="height:4.5mm;">15a</div>
		<div class="styLNAmountBox" style="height:4.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$Form8911/ForeignTaxCredit"></xsl:with-param>
			</xsl:call-template>
      
		</div>
		<div class="styLNRightNumBox" style="height:4.5mm;background:gray;border-bottom-width:0"></div>
		<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0">
		</div>

	</div>



	<div style="width:187mm;">
		<div class="styLNLeftNumBox" style="height:4.5mm;">
			<span style="width:6px"></span>
			b
		</div>
		<div class="styLNDesc" style="width:97mm;height:4.5mm;">
			Credits from Form 1040, lines 48 through 54 (or Form 1040NR, lines 45 through 49)
			
			<span style="width:2px;"></span>
       
			<!--Dotted Line-->
			<span class="styBoldText">
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
			</span>
		</div>
		<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">15b</div>
		<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$Form8911/F1040Credit"></xsl:with-param>
			</xsl:call-template>
      
		</div>
		<div class="styLNRightNumBox" style="height:8mm;background:gray;border-bottom-width:0"></div>
		<div class="styLNAmountBox" style="height:8mm;border-bottom-width:0">
		</div>
	</div>

	<div style="width:187mm;">
		<div class="styLNLeftNumBox" style="height:4.5mm;">
			<span style="width:6px"></span>
			c
		</div>
		<div class="styLNDesc" style="width:97mm;height:4.5mm;">
			Qualified electric vehicle credit (Form 8834, line 20)
			
			<span style="width:2px;"></span>
       
			<!--Dotted Line-->
			<span class="styBoldText">
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
			</span>
		</div>
		<div class="styLNRightNumBox" style="height:4.5mm;">15c</div>
		<div class="styLNAmountBox" style="height:4.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$Form8911/ElectricVehicleTaxCredit"></xsl:with-param>
			</xsl:call-template>
      
		</div>
		<div class="styLNRightNumBox" style="height:4.5mm;background:gray;border-bottom-width:0"></div>
		<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0">
		</div>
	</div>
	<div style="width:187mm;">
		<div class="styLNLeftNumBox" style="height:4.5mm;">
			<span style="width:6px"></span>
			d
		</div>
		<div class="styLNDesc" style="width:97mm;height:4.5mm;">
			Alternative motor vehicle credit (Form 8910, line 18)
			
			<span style="width:2px;"></span>
       
			<!--Dotted Line-->
			<span class="styBoldText">
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
			</span>
		</div>
		<div class="styLNRightNumBox" style="height:4.5mm;">15d</div>
		<div class="styLNAmountBox" style="height:4.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$Form8911/MotorVehicleTaxCredit"></xsl:with-param>
			</xsl:call-template>
      
		</div>
		<div class="styLNRightNumBox" style="height:4.5mm;background:gray;border-bottom-width:0"></div>
		<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0">
		</div>
	</div>


	<div style="width:187mm;">
		<div class="styLNLeftNumBox" style="height:4.5mm;">
			<span style="width:6px"></span>e
		</div>
		<div class="styLNDesc" style="width:137mm;height:4.5mm;">
			Add lines 15a through 15d
			
			<span style="width:2px;"></span>
           
				<!--Dotted Line-->
				<span class="styBoldText">
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
            
			</span>
		</div>
		<div class="styLNRightNumBox" style="height:4.5mm;">
			15e
		</div>
		<div class="styLNAmountBox" style="height:4.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$Form8911/TotalTaxCredits">
				</xsl:with-param>
			</xsl:call-template>	
		</div>
	</div>




	<div style="width:187mm;">
		<div class="styLNLeftNumBox" style="height:4.5mm;">16</div>
		<div class="styLNDesc" style="width:137mm;height:4.5mm;">
			Net regular tax. Subtract line 15e from line 14. If zero or less, stop here; <span class="styBoldText">do not</span> file this form unless
you are claiming a credit on line 9
			
			<span style="width:2px;"></span>
           
				<!--Dotted Line-->
				<span class="styBoldText">
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
            
			</span>
		</div>
		<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm">
			16
		</div>
		<div class="styLNAmountBox" style="height:8mm;padding-top:4mm">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$Form8911/NetRegularTax">
				</xsl:with-param>
			</xsl:call-template>	
		</div>
	</div>







	<div style="width:187mm;">
		<div class="styLNLeftNumBox" style="height:4.5mm;">17</div>
		<div class="styLNDesc" style="width:137mm;height:4.5mm;">
		Tentative minimum tax (see instructions):	
		</div>
		<div class="styLNRightNumBox" style="height:4.5mm;background:gray;border-bottom-width:0">
		</div>
		<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0">
		</div>
	</div>
	<div style="width:187mm;">
	    <div class="styLNLeftNumBox" style="padding-left: 2mm; height:4mm;"></div>
	    <div class="styLNDesc" style="width:137mm; height:4mm;">
	      <table border="0" cellspacing="0" cellpadding="0" style="padding:0mm">
	         <tr>
            
	            <td style="font-size:7pt;font-family:verdana;font-style: normal;font-weight:normal;border:none; width: 111mm">
	              <img src="{$ImagePath}/8911_Bullet_Round.gif" alt="dot"/>
			Individuals. Enter the amount from Form 6251, line 33
			<span class="styBoldText">
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
			</span>
	              <br/>
	              <img src="{$ImagePath}/8911_Bullet_Round.gif" alt="dot"/>
			Other filers. Enter the tentative minimum tax from your alternative minimum tax form or schedule
			<span class="styBoldText">
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
			</span>
	              
	            </td>
	          <td style="width:21mm">
	            <div class="styLNDesc" style="width:4mm">
	              <img src="{$ImagePath}/8911_Bracket_Sm.gif" alt="Curly Bracket Image"/>                                    
	            </div>
	            <div class="styLNDesc" style="width:16mm;padding-top:2mm;">                  
	              <span class="styBoldText" style="font-size: 7pt"> 
	                <span style="width:16px;"></span>.
	                <span style="width:16px;"></span>.                                                      
	              </span>                  
	            </div>
	          </td>
	         </tr>            
	      </table>          
	    </div>
	   
	     <div class="styLNRightNumBox" style="">
	          17
	    </div>        
	    <div class="styLNAmountBox">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$Form8911/TentativeMinimumTax">
			</xsl:with-param>
		</xsl:call-template>
	    </div>
	    <div class="styLNRightNumBoxNBB" style="width:8.25mm;height:10mm;background-color:gray;border-right-width:1px;padding-top:0;padding-bottom:0;"></div>
	  
	  </div>
	










	<div style="width:187mm;">
		<div class="styLNLeftNumBox" style="height:4.5mm;">18</div>
		<div class="styLNDesc" style="width:137mm;height:4.5mm;">
			Subtract line 17 from line 16. If zero or less, stop here; <span class="styBoldText">do not</span> file this form unless you are claiming
a credit on line 9
			
			<span style="width:2px;"></span>
           
				<!--Dotted Line-->
				<span class="styBoldText">
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
            
			</span>
		</div>
		<div class="styLNRightNumBox" style="height:4.5mm;background:gray;border-bottom-width:0">
			
		</div>
		<div class="styLNAmountBox" style="height:4.5mm;border-bottom-width:0">
		</div>
		<div class="styLNRightNumBox" style="height:4.5mm;">
			18
		</div>
		<div class="styLNAmountBox" style="height:4.5mm;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$Form8911/AdjustedRegularTax">
				</xsl:with-param>
			</xsl:call-template>	
		</div>
	</div>

	<div class="styBB" style="width:187mm;">
		<div class="styLNLeftNumBox" style="height:4.5mm;">19</div>
		<div class="styLNDesc" style="width:137mm;height:4.5mm;">
			<span class="styBoldText">
				Personal use part of credit.
			</span>
			Enter the 
			<span class="styBoldText">
				smaller
			</span>
			of line 13 or 18 here and on Form 1040, line 55; Form 1040NR, line 50; or the appropriate line of your return. If line 18 is smaller than line 13, see instructions

			
			<span style="width:2px;"></span>
           
				<!--Dotted Line-->
				<span class="styBoldText">
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
				<span style="width:16px"></span>.
            
			</span>
		</div>
		<div class="styLNRightNumBox" style="height:6mm;background:gray;border-bottom-width:0">
			
		</div>
		<div class="styLNAmountBox" style="height:6mm;border-bottom-width:0">
		</div>
		<div class="styLNRightNumBox" style="height:4.5mm;border-bottom-width:0">
			19
		</div>
		<div class="styLNAmountBox" style="height:4.5;border-bottom-width:0">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" select="$Form8911/TotalPersnlUsePartOfCredit">
				</xsl:with-param>
			</xsl:call-template>	
		</div>
	</div>

	<div style="width:187mm">
		<span class="styBoldText">
			For Paperwork Reduction Act Notice, see instructions.
		</span>
		<span style="width:79mm; text-align:center;">
			Cat. No. 37721Q
		</span>
		<span style="width:32mm; text-align:right;">
			Form 
			<span class="styBoldText">
				8911
			</span>
			(2006)

		</span>
	</div>

      <!-- BEGIN Left Over Table -->  
        <!-- Additonal Data Title Bar and Button -->
        <div class="styLeftOverTitleLine" id="LeftoverData">
          <div class="styLeftOverTitle">
            Additional Data        
          </div>
          <div class="styLeftOverButtonContainer">
            <input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
          </div>      
        </div>
        <!-- Additional Data Table -->
       
      <!-- END Left Over Table -->  

      <!-- Optional Print Solution for repeating data table Part I, Line 2 -->
     

    
     

    
     
    </form>
  </body>
</html>

</xsl:template>



</xsl:stylesheet>
