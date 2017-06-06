<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="iso-8859-1"/>
<!--
***************************************************************************************************************************************************************
Populate Template
***************************************************************************************************************************************************************
Description: This stylesheet contains XSL templates that are used in every xsl "IRS Form" stylesheet. 
***************************************************************************************************************************************************************
-->


<!--
***************************************************************************************************************************************************************
Name:           PopulateText
Description:    Extracts the text of a text data element in the XML
Req Param:      TargetNode - The text data element node
Opt Param:      none
Called By:      Stylesheets, PopulateUSAddressTemplate, PopulateForeignAddressTemplate, 
                      PopulateReturnHeaderFiler, PopulateCityStateInfo, PopulateReturnHeaderPreparer, 
                      PopulateCommonLeftover, PopulateLeftoverRow, PopulateCommonLeftoverLandscape, 
                      PopulateLeftoverRowLandscape, PopulateDepCommonLeftover, PopulateDepCommonLeftoverNameEIN
Calls:          PopulateID, PopulateChgHistory
Log:              
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateText">
  <xsl:param name="TargetNode"/>    

  <span>      
    <xsl:attribute name="id">    
      <xsl:call-template name="PopulateID">
        <xsl:with-param name="TargetNode" select="$TargetNode"/>
      </xsl:call-template>    
    </xsl:attribute>        
    <xsl:call-template name="PopulateChgHistory">
      <xsl:with-param name="targetNode" select="$TargetNode"/>                  
    </xsl:call-template>          
  </span>
</xsl:template> 


<!--
***************************************************************************************************************************************************************
Name:           PopulateAmount
Description:    This template formats the amount to display commas between every three digits for up to 12 digits.
                No commas displayed if longer. Formats the number field according to the maxsize passed.
                If no value is passed then 15 will be used.  If a value is a negative number the maxsize will be increased by one.

Req Param:  
Opt Param:   
Called By:      PopulateNegativeNumber, PopulateLeftoverRowAmount
Calls:          PlaceCommas
Log:
***************************************************************************************************************************************************************
-->
  <xsl:template name="PopulateAmount">
    <xsl:param name="TargetNode"/>
    <xsl:param name="MaxSize">15</xsl:param>
    <xsl:param name="MaxSizeWithSign">15</xsl:param>
    <xsl:param name="WhiteFont">false</xsl:param>
    <xsl:choose>
      <!-- Check to see if this font should be white (used for totals on dark backgrounds) or if it should be blue.-->
      <!-- Valid WhiteFont values are only true or false strings, not '1' or '0'-->
      <xsl:when test="$WhiteFont='true' ">
        <span style="color:white;"> 
          <xsl:if test="starts-with($TargetNode,'-')">
              <xsl:call-template name="PlaceCommas">
                <xsl:with-param name="TargetNode" select="$TargetNode"/>
                <xsl:with-param name="MaxSize" select="$MaxSize" />
                <xsl:with-param name="MaxSizeWithSign" select="$MaxSize + 1" />
              </xsl:call-template>
          </xsl:if>
          <xsl:if test="not(starts-with($TargetNode,'-'))">
              <xsl:call-template name="PlaceCommas">
                <xsl:with-param name="TargetNode" select="$TargetNode"/>
                <xsl:with-param name="MaxSize" select="$MaxSize" />
                <xsl:with-param name="MaxSizeWithSign" select="$MaxSize" />
              </xsl:call-template>
          </xsl:if>    
        </span>    
      </xsl:when>
      <xsl:otherwise> <!-- The color of the amount is set to dark blue -->
        <span style="color:darkblue;"> 
          <xsl:if test="starts-with($TargetNode,'-')">
              <xsl:call-template name="PlaceCommas">
                <xsl:with-param name="TargetNode" select="$TargetNode"/>
                <xsl:with-param name="MaxSize" select="$MaxSize" />
                <xsl:with-param name="MaxSizeWithSign" select="$MaxSize + 1" />
              </xsl:call-template>
          </xsl:if>
          <xsl:if test="not(starts-with($TargetNode,'-'))">
              <xsl:call-template name="PlaceCommas">
                <xsl:with-param name="TargetNode" select="$TargetNode"/>
                <xsl:with-param name="MaxSize" select="$MaxSize" />
                <xsl:with-param name="MaxSizeWithSign" select="$MaxSize" />
              </xsl:call-template>
          </xsl:if>    
        </span>    
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
<!--
***************************************************************************************************************************************************************
Name:          PopulateNegativeNumber
Description:   Extracts a negative number from the XML and displays it with parenthesis
Req Param:     TargetNode - The node with the negative data
Opt Param:     MaxSize - The maximum number of characters that can fit into the space
Called By:     Stylesheets
Calls:         PopulateAmount
Log:
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateNegativeNumber">
  <xsl:param name="TargetNode"/>
  <xsl:param name="MaxSize">15</xsl:param>

  (<xsl:call-template name="PopulateAmount">
      <xsl:with-param name="TargetNode" select="$TargetNode"/>
      <xsl:with-param name="MaxSize" select="$MaxSize" />
    </xsl:call-template>)
</xsl:template>  


<!--
***************************************************************************************************************************************************************
Name:         PopulatePercent
Description:  Populates a percentage data element
Req Param:    TargetNode - The data element that contains a percent
Opt Param:    none
Called By:    Stylesheets
Calls:        PopulateID, PopulateChgHistory
Log:
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulatePercent">
  <xsl:param name="TargetNode"/>

  <span>
    <xsl:attribute name="id">
      <xsl:call-template name="PopulateID">
        <xsl:with-param name="TargetNode" select="$TargetNode"/>
      </xsl:call-template>
    </xsl:attribute>
    <xsl:call-template name="PopulateChgHistory">
      <xsl:with-param name="targetNode" select="$TargetNode"/>        
      <xsl:with-param name="usePercent" select="1"/> <!-- Jessica: Flag indicates % process needed -->
    </xsl:call-template>                
  </span>    
</xsl:template>
  

<!--
***************************************************************************************************************************************************************
Name:         FormatPercent
Description:  Fixes a calculation bug in xsl when multiplying by 100. This template is supposed to be called by PopulatePercent only.
Req Param:    s0 - Number that is a percentage
Opt Param:    none
Called By:    getValue
Calls:        none
Log:
***************************************************************************************************************************************************************
-->
<xsl:template name="FormatPercent">  
  <xsl:param name="s0"/>    

  <xsl:choose>
    <xsl:when test="number($s0)=0">  <!-- If the percent value is 0, display 0 -->
      <xsl:value-of select="0"/>          
    </xsl:when>
    <xsl:otherwise>      
      <xsl:choose>
        <xsl:when test="contains($s0,'.')">
          <xsl:variable name="s1">
            <xsl:choose>
              <xsl:when test="number(substring-before($s0,'.'))=0"> <!-- If digits exist at the left of decimal, s1 is set to empty -->
                <xsl:value-of select="''"/>            
              </xsl:when>
              <xsl:otherwise>  <!-- If there is no digit at the left of decimal, set s1 to the data value-->          
                <xsl:value-of select="substring-before($s0,'.')"/>              
              </xsl:otherwise>        
            </xsl:choose>          
          </xsl:variable>  
          <xsl:variable name="s2" select="substring-after($s0,'.')"/> 
          <xsl:variable name="s3" select="substring($s2,1,2)"/> 
          <xsl:variable name="s4" select="substring($s2,3)"/>   
          <xsl:variable name="s5" select="number(concat($s1,$s3))"/> <!-- combine digits at left of decimal with the first two digits at the right of decimal-->
          <xsl:choose>
            <xsl:when test="string-length($s2) &gt; 2">  <!-- If more than 2 digits are at the right of decimal, move decimal 2 places to the right of the data value  -->                
              <xsl:value-of select="concat(string($s5),'.',$s4)"/>          
            </xsl:when>
            <xsl:otherwise> 
              <xsl:choose>
                <xsl:when test="string-length($s2)=1">  <!-- If only 1 digit is at the right of decimal, add 0 to the end -->                  
                  <xsl:value-of select="concat(string($s5),'0')"/>
                </xsl:when>  
                <xsl:otherwise>  <!-- If there are 2 digits at the right of decimal, there is nothing to append-->                   
                  <xsl:value-of select="$s5"/>
                </xsl:otherwise>   
              </xsl:choose>  
            </xsl:otherwise>   
          </xsl:choose>        
        </xsl:when>
        <xsl:otherwise>      
          <xsl:value-of select="concat($s0,'00')"/>  <!-- If there is no decimal in data, add 2 zeros  -->
        </xsl:otherwise>        
      </xsl:choose>
    </xsl:otherwise>    
  </xsl:choose>  
</xsl:template>


<!--
***************************************************************************************************************************************************************
Name:         PopulateEIN
Description:  This templates formats the EIN by putting a '-' after the first two digits of the nine digits.
Req Param:  
Opt Param:   
Called By:    PopulateReturnHeaderFiler, PopulateReturnHeaderPreparerFirm 
Calls:        PopulateID, PopulateChgHistory
Log:
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateEIN">
    <xsl:param name="TargetNode"/>    
    <span>      
      <xsl:attribute name="id">    
        <xsl:call-template name="PopulateID">
          <xsl:with-param name="TargetNode" select="$TargetNode"/>
        </xsl:call-template>    
      </xsl:attribute>       
      <xsl:call-template name="PopulateChgHistory">
        <xsl:with-param name="targetNode" select="$TargetNode"/> 
         <xsl:with-param name="thisTemplate" select=" 'forEIN' "/>                          
      </xsl:call-template>               
    </span>    
  </xsl:template>

<!--
***************************************************************************************************************************************************************
Name:         PopulateSSN
Description:  This templates formats the SSN by putting a '-' after the first three digits of the nine digits and '-' after the first five digits.
Req Param:  
Opt Param:   
Called By:    PopulateReturnHeaderFiler, PopulateReturnHeaderPreparer
Calls:        PopulateID, PopulateChgHistory    
Log:          
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateSSN">
      <xsl:param name="TargetNode"/>    
      <span>      
        <xsl:attribute name="id">    
          <xsl:call-template name="PopulateID">
            <xsl:with-param name="TargetNode" select="$TargetNode"/>
          </xsl:call-template>    
        </xsl:attribute>             
       <xsl:call-template name="PopulateChgHistory">
          <xsl:with-param name="targetNode" select="$TargetNode"/> 
          <xsl:with-param name="thisTemplate" select=" 'forSSN' "/>                                    
        </xsl:call-template>        
      </span>
  </xsl:template> 
  

<!--
***************************************************************************************************************************************************************
Name:        PopulateCheckbox
Description: Populates the check mark in a checkbox from the value of a checkbox data element in the XML
Req Param:   TargetNode - The checkbox data element
Opt Param:   TargetNodeLatestValue - Used for change history, contains the last value of the element
                      TabOrder - Order to tab from box to box
                      CheckboxDisable - Switch to disable the javascript from receiving the user input for populating the box
                      BackupName - Populates the ID if the XPath of the checkbox XML element is blank
                      IDVal - 
Called By:   Stylesheets, PopulateReturnHeaderPreparer
Calls:       PopulateID, PopulateChgHistory
Log:
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateCheckbox">
  <xsl:param name="TargetNode"/>
  <xsl:param name="TargetNodeLatestValue" select="$TargetNode/ancestor::*/child::ChangeHistory/descendant::*[name(.) = name($TargetNode)][count(./ancestor::*) = count($TargetNode/ancestor::*) + 1]"/>    
  <xsl:param name="TabOrder">-1</xsl:param>
  <xsl:param name="CheckboxDisable">return false;</xsl:param>
  <xsl:param name="BackupName"/>
  <xsl:param name="IDVal">
    <xsl:call-template name="PopulateID">
      <xsl:with-param name="TargetNode" select="$TargetNode" />
    </xsl:call-template>
  </xsl:param>
    
  <xsl:attribute name="TabIndex">
    <xsl:value-of select="$TabOrder"/>
  </xsl:attribute>
  <xsl:attribute name="id">
    <xsl:choose>
      <xsl:when test="$IDVal = '/..'"> <!-- If the data element does not exist, set id to BackupName -->
        <xsl:value-of select="$BackupName"/>
      </xsl:when>
      <xsl:otherwise> <!-- If the data element does exist, set id to IDVal -->
        <xsl:value-of select="$IDVal"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
  <xsl:attribute name="onclick"><xsl:value-of select="$CheckboxDisable"/></xsl:attribute>    
  <xsl:call-template name="PopulateChgHistory">
    <xsl:with-param name="targetNode" select="$TargetNode"/>              
    <xsl:with-param name="chxBoxType" select="'notBoolean'"/> <!-- Jessica: Flag indicates Check Box process needed -->
  </xsl:call-template>  
</xsl:template>

<!--
***************************************************************************************************************************************************************
Name:         PopulateEnumeratedCheckbox
Description:  Populates checkboxes that are populated with enumerated data from the schema
Req Param:    TargetNode - The checkbox data element
              DisplayedCheckboxValue - This is the corresponding enumerated value of 
                      the checkbox that is currently being displayed. This value 
                      needs to be compared with the TargetNode value
Opt Param:    TabOrder - Order to tab from box to box
              CheckboxDisable - Switch to disable the javascript from receiving the user input for populating the box
              BackupName - Populates the ID if the XPath of the checkbox XML element is blank
Called By:    Stylesheets
Calls:        PopulateID, PopulateChgHistory
Log:          2009-04-09 - Creation
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateEnumeratedCheckbox">
  <xsl:param name="TargetNode"/>
  <xsl:param name="DisplayedCheckboxValue"/> <!-- This is the checkbox that is currently being displayed, need to compare this value with the TargetNode value-->
  <xsl:param name="TabOrder">-1</xsl:param>
  <xsl:param name="CheckboxDisable">return false;</xsl:param>
  <xsl:param name="BackupName"/>
  <xsl:param name="IDVal">
    <xsl:call-template name="PopulateID">
      <xsl:with-param name="TargetNode" select="$TargetNode" />
    </xsl:call-template>
  </xsl:param>
  <xsl:attribute name="onclick"><xsl:value-of select="$CheckboxDisable"/></xsl:attribute>
  <xsl:attribute name="id">
    <xsl:choose>
      <xsl:when test="$IDVal = '/..'"><xsl:value-of select="$BackupName"/></xsl:when> <!-- If the data element does not exist, set id to BackupName -->
      <xsl:otherwise><xsl:value-of select="$IDVal"/><xsl:value-of select="$DisplayedCheckboxValue"/></xsl:otherwise> <!-- If the data element exists, set id to IDVal concatenated with the DisplayedCheckboxValue value for a unique identifier-->
    </xsl:choose>
  </xsl:attribute>
  <xsl:attribute name="TabIndex">
    <xsl:value-of select="$TabOrder"/>
  </xsl:attribute>  
  
  <xsl:call-template name="PopulateChgHistory">
    <xsl:with-param name="targetNode" select="$TargetNode"/>            
    <xsl:with-param name="chxBoxType" select="'Enumerated'"/> <!-- Flag indicates that checkbox uses schema-supplied enumerated values to determine checkbox status-->    
    <xsl:with-param name="displayedCheckboxValue" select="$DisplayedCheckboxValue"/>
  </xsl:call-template>          
</xsl:template>

<!--
***************************************************************************************************************************************************************
Name:         PopulateYesCheckbox
Description:  Populates the check mark in a boolean valued "Yes" checkbox from the data element in the XML
Req Param:    TargetNode - The checkbox data element
Opt Param:    TabOrder - Order to tab from box to box
                      CheckboxDisable - Switch to disable the javascript from receiving the user input for populating the box
                      BackupName - Populates the ID if the XPath of the checkbox XML element is blank
                      IDVal - 
Called By:    Stylesheets, PopulateReturnHeaderPreparer
Calls:        PopulateID, PopulateChgHistory
Log:          2007-10-19 - Added Checkbox1or2Type for ennumerated checkbox (1 or 2)
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateYesCheckbox">
  <xsl:param name="TargetNode"/>
  <xsl:param name="TabOrder">-1</xsl:param>
  <xsl:param name="CheckboxDisable">return false;</xsl:param>
  <xsl:param name="BackupName"/>
  <xsl:param name="IDVal">
    <xsl:call-template name="PopulateID">
      <xsl:with-param name="TargetNode" select="$TargetNode" />
    </xsl:call-template>
  </xsl:param>
  <xsl:param name="Checkbox1or2Type">no</xsl:param> <!-- If checkbox type is ennumerated w/ a 1 or 2 instead of 0 or 1 -->

  <xsl:attribute name="onclick"><xsl:value-of select="$CheckboxDisable"/></xsl:attribute>
  <xsl:attribute name="id">
    <xsl:choose>
      <xsl:when test="$IDVal = '/..'"><xsl:value-of select="$BackupName"/>Yes</xsl:when> <!-- If the data element does not exist, set id to BackupName -->
      <xsl:otherwise><xsl:value-of select="$IDVal"/>Yes</xsl:otherwise> <!-- If the data element exists, set id to IDVal -->
    </xsl:choose>
  </xsl:attribute>
  <xsl:attribute name="TabIndex">
    <xsl:value-of select="$TabOrder"/>
  </xsl:attribute>  
  <xsl:call-template name="PopulateChgHistory">
    <xsl:with-param name="targetNode" select="$TargetNode"/>            
    <xsl:with-param name="chxBoxType" select="'Yes'"/> <!-- Jessica: Flag indicates Yes Check Box process needed -->            
    <xsl:with-param name="Checkbox1or2Type" select="$Checkbox1or2Type" />
  </xsl:call-template>          
</xsl:template>

  
<!--
***************************************************************************************************************************************************************
Name:         PopulateNoCheckbox
Description:  Populates the check mark in a boolean valued "No" checkbox from the data element in the XML
Req Param:    TargetNode - The checkbox data element
Opt Param:    TabOrder - Order to tab from box to box
                      CheckboxDisable - Switch to disable the javascript from receiving the user input for populating the box
                      BackupName - Populates the ID if the XPath of the checkbox XML element is blank
                      IDVal - 
Called By:    Stylesheets, PopulateReturnHeaderPreparer
Calls:        PopulateID, PopulateChgHistory
Log:          2007-10-19 - Added Checkbox1or2Type for ennumerated checkbox (1 or 2)
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateNoCheckbox">
  <xsl:param name="TargetNode"/>
  <xsl:param name="TabOrder">-1</xsl:param>
  <xsl:param name="CheckboxDisable">return false;</xsl:param>
  <xsl:param name="BackupName"/>
  <xsl:param name="IDVal">
    <xsl:call-template name="PopulateID">
      <xsl:with-param name="TargetNode" select="$TargetNode" />
    </xsl:call-template>
  </xsl:param>
  <xsl:param name="Checkbox1or2Type">no</xsl:param>

  <xsl:attribute name="onclick"><xsl:value-of select="$CheckboxDisable"/></xsl:attribute>
  <xsl:attribute name="id">
    <xsl:choose>
      <xsl:when test="$IDVal = '/..'"><xsl:value-of select="$BackupName"/>No</xsl:when> <!-- If the data element does not exist, set id to BackupName -->
      <xsl:otherwise><xsl:value-of select="$IDVal"/>No</xsl:otherwise> <!-- If the data element exists, set id to IDVal -->
    </xsl:choose>
  </xsl:attribute>
  <xsl:attribute name="TabIndex">
    <xsl:value-of select="$TabOrder"/>
  </xsl:attribute>    
  <xsl:call-template name="PopulateChgHistory">
    <xsl:with-param name="targetNode" select="$TargetNode"/>                
    <xsl:with-param name="chxBoxType" select="'No'"/> <!-- Flag indicates No Check Box process needed -->            
    <xsl:with-param name="Checkbox1or2Type" select="$Checkbox1or2Type" />
  </xsl:call-template>          
</xsl:template>  


<!--
***************************************************************************************************************************************************************
Name:         PopulateYesBox
Description:  Populates a field under the heading of "Yes" with "X"
Req Param:    TargetNode - Location of data
Opt Param:    none
Called By:    Stylesheets
Calls:        PopulateID, PopulateChgHistory
Log:
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateYesBox">
  <xsl:param name="TargetNode"/>

  <span>  
    <xsl:attribute name="id">
      <xsl:call-template name="PopulateID">
        <xsl:with-param name="TargetNode" select="$TargetNode" />
      </xsl:call-template>
    </xsl:attribute>            
    <xsl:call-template name="PopulateChgHistory">
      <xsl:with-param name="targetNode" select="$TargetNode"/>                
      <xsl:with-param name="txtBoxType" select="'Yes'"/> <!-- Flag indicates Yes Box with 'X' mark process needed -->
    </xsl:call-template>            
  </span>
</xsl:template>  
  

<!--
***************************************************************************************************************************************************************
Name:         PopulateNoBox
Description:  Populates a field under the heading of "No" with "X"
Req Param:    TargetNode - Location of data
Opt Param:    none
Called By:    Stylesheets
Calls:        PopulateID, PopulateChgHistory
Log:
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateNoBox">
  <xsl:param name="TargetNode"/>

  <span>
    <xsl:attribute name="id">
      <xsl:call-template name="PopulateID">
        <xsl:with-param name="TargetNode" select="$TargetNode" />
      </xsl:call-template>
    </xsl:attribute>
    <xsl:call-template name="PopulateChgHistory">
      <xsl:with-param name="targetNode" select="$TargetNode"/>        
      <xsl:with-param name="txtBoxType" select="'No'"/> <!-- Flag indicates Yes Box with 'X' mark process needed -->
    </xsl:call-template>          
  </span>
</xsl:template>
  

<!--
***************************************************************************************************************************************************************
Name:         PopulateYesBoxText
Description:  Populates a field under the heading of "Yes" with text "Yes" instead of mark "X" to accommodate Jaws reading.
Req Param:    TargetNode - Location of data
Opt Param:    none
Called By:    Stylesheets
Calls:        PopulateID, PopulateChgHistory
Log:
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateYesBoxText">
  <xsl:param name="TargetNode"/>

  <span>  
    <xsl:attribute name="id">
      <xsl:call-template name="PopulateID">
        <xsl:with-param name="TargetNode" select="$TargetNode" />
      </xsl:call-template>
    </xsl:attribute>
    <xsl:call-template name="PopulateChgHistory">
      <xsl:with-param name="targetNode" select="$TargetNode"/>        
      <xsl:with-param name="txtBoxType" select="'YesTxt'"/> <!-- Flag indicates Yes Box with 'Yes' mark process needed -->
    </xsl:call-template>    
  </span>
</xsl:template>
  

<!--
***************************************************************************************************************************************************************
Name:           PopulateNoBoxText
Description:    Populates a field under the heading of "No" with text "No" instead of mark "X" to accommodate Jaws reading.
Req Param:      TargetNode - Location of data
Opt Param:      none
Called By:      Stylesheets
Calls:          PopulateID, PopulateChgHistory
Log:
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateNoBoxText">
  <xsl:param name="TargetNode"/>

  <span>
    <xsl:attribute name="id">
      <xsl:call-template name="PopulateID">
        <xsl:with-param name="TargetNode" select="$TargetNode" />
      </xsl:call-template>
    </xsl:attribute>
    <xsl:call-template name="PopulateChgHistory">
      <xsl:with-param name="targetNode" select="$TargetNode"/>        
      <xsl:with-param name="txtBoxType" select="'NoTxt'"/> <!-- Flag indicates Yes Box with 'Yes' mark process needed -->
    </xsl:call-template>  
  </span>
</xsl:template>


<!--
***************************************************************************************************************************************************************
Name:         PopulateLabel
Description:  Populates the 'for' attribute of a label for an input.  Required for 508 compliance.
Req Param:    TargetNode - The element which will have the label populated
Opt Param:    BackupName - Populates 'for' attribute if the XPath of Checkbox XML element is blank
              DisplayedCheckboxValue - For use with enumerated checkboxes, populate with enumerated value of checkbox that is calling this function
Called By:    Stylesheets
Calls:        PopulateID
Log:        
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateLabel">  
  <xsl:param name="TargetNode"/>
  <xsl:param name="BackupName"/>
  <xsl:param name="DisplayedCheckboxValue"/>
  <xsl:param name="ForVal">
    <xsl:choose>
      <xsl:when test="$DisplayedCheckboxValue">
        <xsl:call-template name="PopulateID">
          <xsl:with-param name="TargetNode" select="$TargetNode" />
        </xsl:call-template><xsl:value-of select="$DisplayedCheckboxValue"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="PopulateID">
          <xsl:with-param name="TargetNode" select="$TargetNode" />
        </xsl:call-template>
      </xsl:otherwise>        
    </xsl:choose>
  </xsl:param>
  <xsl:attribute name="for">
    <xsl:choose>
      <xsl:when test="$ForVal = '/..'">
        <xsl:value-of select="$BackupName"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$ForVal"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
</xsl:template>

  
<!--
***************************************************************************************************************************************************************
Name:          PopulateLabelYes
Description:   Populates the 'for' attribute of a label for a yes checkbox input.  Required for 508 compliance.
Req Param:     TargetNode - The checkbox element which will have the label populated
Opt Param:     BackupName - Populates 'for' attribute if the XPath of Checkbox XML element is blank
Called By:     Stylesheets
Calls:         PopulateID
Log:
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateLabelYes">
  <xsl:param name="TargetNode"/>
  <xsl:param name="BackupName"/>
  <xsl:param name="ForVal">
    <xsl:call-template name="PopulateID">
      <xsl:with-param name="TargetNode" select="$TargetNode" />
    </xsl:call-template>
  </xsl:param>
  <xsl:attribute name="for">
    <xsl:choose>
      <xsl:when test="$ForVal = '/..'"><xsl:value-of select="$BackupName"/>Yes</xsl:when>
      <xsl:otherwise><xsl:value-of select="$ForVal"/>Yes</xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
</xsl:template>


<!--
***************************************************************************************************************************************************************
Name:          PopulateLabelNo
Description:   Populates the 'for' attribute of a label for a no checkbox input.  Required for 508 compliance.
Req Param:     TargetNode - The checkbox element which will have the label populated
Opt Param:     BackupName - Populates 'for' attribute if the XPath of Checkbox XML element is blank
Called By:     Stylesheets
Calls:         PopulateID
Log:
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateLabelNo">  
  <xsl:param name="TargetNode"/>
  <xsl:param name="BackupName"/>
  <xsl:param name="ForVal">
    <xsl:call-template name="PopulateID">
      <xsl:with-param name="TargetNode" select="$TargetNode" />
    </xsl:call-template>
  </xsl:param>
  <xsl:attribute name="for">
    <xsl:choose>
      <xsl:when test="$ForVal = '/..'"><xsl:value-of select="$BackupName"/>No</xsl:when>
      <xsl:otherwise><xsl:value-of select="$ForVal"/>No</xsl:otherwise>
    </xsl:choose>
  </xsl:attribute>
</xsl:template>


<!--
***************************************************************************************************************************************************************
Name:           PopulateMonth
Description:    Template retrieving the month from an element that is a datetype yyyy-mm-dd
Req Param:  
Opt Param:   
Called By:     
Calls:          PopulateID, PopulateChgHistory 
Log:
***************************************************************************************************************************************************************
-->
  <xsl:template name="PopulateMonth">
    <xsl:param name="TargetNode"/>
    <span>    
      <xsl:attribute name="id">    
        <xsl:call-template name="PopulateID">
          <xsl:with-param name="TargetNode" select="$TargetNode"/>
        </xsl:call-template>    
      </xsl:attribute>  
      <xsl:call-template name="PopulateChgHistory">
        <xsl:with-param name="targetNode" select="$TargetNode"/>        
        <xsl:with-param name="subString" select="'6,2'"/>  <!-- Jessica: 'start,length' as in substring(string,start,length) -->    
      </xsl:call-template>            
    </span>        
  </xsl:template>
  
  
<!--
***************************************************************************************************************************************************************
Name:           PopulateDay
Description:    Template retrieving the day from an element that is a datetype yyyy-mm-dd
Req Param:  
Opt Param:   
Called By:     
Calls:          PopulateID, PopulateChgHistory  
Log:
***************************************************************************************************************************************************************
-->
  <xsl:template name="PopulateDay">
    <xsl:param name="TargetNode"/>
    <span>    
      <xsl:attribute name="id">    
        <xsl:call-template name="PopulateID">
          <xsl:with-param name="TargetNode" select="$TargetNode"/>
        </xsl:call-template>    
      </xsl:attribute>  
      <xsl:call-template name="PopulateChgHistory">
        <xsl:with-param name="targetNode" select="$TargetNode"/>        
        <xsl:with-param name="subString" select="'9,2'"/>  <!-- Jessica: 'start,length' as in substring(string,start,length) -->    
      </xsl:call-template>                  
    </span>          
  </xsl:template>
    

<!--
***************************************************************************************************************************************************************
Name:           PopulateYear
Description:    Template retrieving the year from an element that is a datetype yyyy-mm-dd
Req Param:  
Opt Param:   
Called By:      
Calls:          PopulateID, PopulateChgHistory
Log:
***************************************************************************************************************************************************************
-->
  <xsl:template name="PopulateYear">
    <xsl:param name="TargetNode"/>
    <span>    
      <xsl:attribute name="id">    
        <xsl:call-template name="PopulateID">
          <xsl:with-param name="TargetNode" select="$TargetNode"/>
        </xsl:call-template>    
      </xsl:attribute>      
      <xsl:call-template name="PopulateChgHistory">
        <xsl:with-param name="targetNode" select="$TargetNode"/>        
        <xsl:with-param name="subString" select="'1,4'"/>  <!-- Jessica: 'start,length' as in substring(string,start,length) -->    
      </xsl:call-template>              
    </span>        
  </xsl:template>
  
  
<!--
***************************************************************************************************************************************************************
Name:           PopulateMonthForMonthDayType
Description:    Template retrieving the month from an date element in format mm-dd: see schema define
Req Param:   
Opt Param:   
Called By:      
Calls:          PopulateID, PopulateChgHistory
Log:
***************************************************************************************************************************************************************
-->
  <xsl:template name="PopulateMonthForMonthDayType">
    <xsl:param name="TargetNode"/>
    <span>    
      <xsl:attribute name="id">    
        <xsl:call-template name="PopulateID">
          <xsl:with-param name="TargetNode" select="$TargetNode"/>
        </xsl:call-template>    
      </xsl:attribute>        
      <xsl:call-template name="PopulateChgHistory">
        <xsl:with-param name="targetNode" select="$TargetNode"/>        
        <xsl:with-param name="subString" select="'3,2'"/>  <!-- Jessica: 'start,length' for substring(string,start,length) -->    
      </xsl:call-template>                
    </span>        
  </xsl:template>  
  
  
  <!--
***************************************************************************************************************************************************************
Name:           PopulateMonthForMonthType
Description:    Template retrieving the month from an date element in format MM: see schema define
Req Param:   
Opt Param:   
Called By:      
Calls:          PopulateID, PopulateChgHistory
Log:
***************************************************************************************************************************************************************
-->
  <xsl:template name="PopulateMonthForMonthType">
    <xsl:param name="TargetNode"/>
    <span>    
      <xsl:attribute name="id">    
        <xsl:call-template name="PopulateID">
          <xsl:with-param name="TargetNode" select="$TargetNode"/>
        </xsl:call-template>    
      </xsl:attribute>        
      <xsl:call-template name="PopulateChgHistory">
        <xsl:with-param name="targetNode" select="$TargetNode"/>        
        <xsl:with-param name="subString" select="'3,2'"/>  <!-- Jessica: 'start,length' for substring(string,start,length) -->    
      </xsl:call-template>                
    </span>        
  </xsl:template>
  
<!--
***************************************************************************************************************************************************************
Name:           PopulateMonthYearForYearMonthType
Description:    Template showing mm-yyyy from an date element in format yyyy-mm: see schema define
Req Param:   
Opt Param:   
Called By:      
Calls:          PopulateID, PopulateChgHistory
Log:
***************************************************************************************************************************************************************
-->
  <xsl:template name="PopulateMonthYearForYearMonthType">
    <xsl:param name="TargetNode"/>
    <span>    
      <xsl:attribute name="id">    
        <xsl:call-template name="PopulateID">
          <xsl:with-param name="TargetNode" select="$TargetNode"/>
        </xsl:call-template>    
      </xsl:attribute>        
      <xsl:call-template name="PopulateChgHistory">
        <xsl:with-param name="targetNode" select="$TargetNode"/>        
        <xsl:with-param name="subString" select="'6,2'"/>  <!-- 'start,length' for substring(string,start,length) -->    
      </xsl:call-template> -    
      <xsl:call-template name="PopulateChgHistory">
        <xsl:with-param name="targetNode" select="$TargetNode"/>        
        <xsl:with-param name="subString" select="'1,4'"/>  <!-- 'start,length' for substring(string,start,length) -->    
      </xsl:call-template>                
    </span>        
  </xsl:template>  

<!--
***************************************************************************************************************************************************************
Name:           PopulateIndividualLetterBox
Description:    Template for splitting up Text fields into individual letter boxes such as on 8849
Req Param:   
Opt Param:   
Called By:      
Calls:          PopulateID, PopulateChgHistory
Log:            2007-05-21 - Adjusted height and width of letter boxes and letter placement
                2007-06-26 - Added <span> tags around calls to PopulateID and PopulateChangeHistory
***************************************************************************************************************************************************************
-->
  <xsl:template name="PopulateIndividualLetterBox">
    <xsl:param name="TargetNode"/>
    <xsl:param name="BoxNum"/>
    
    <div style="width:5mm;height:7mm;padding-top:1.3mm;text-align:center;border:1 solid black;border-right-width:0;clear:none;float:left">
      <span>
        <xsl:attribute name="id">    
          <xsl:call-template name="PopulateID">
            <xsl:with-param name="TargetNode" select="$TargetNode"/>
          </xsl:call-template>    
        </xsl:attribute>
        <xsl:call-template name="PopulateChgHistory">
          <xsl:with-param name="targetNode" select="$TargetNode"/>
          <xsl:with-param name="thisTemplate" select=" 'forLetterBox' "/>   
          <xsl:with-param name="boxNum" select="$BoxNum"/>  
        </xsl:call-template>
      </span>   
    </div>        
    
  </xsl:template>  
 
<!--
***************************************************************************************************************************************************************
Name:           PopulateIndividualSizableLetterBox
Description:    Template for splitting up Text fields into individual letter boxes of varying sizes such as on 2290 Schedule 1
Req Param:      BoxWidth,BoxHeight,BoxTopPadding
Opt Param:   
Called By:      
Calls:          PopulateID, PopulateChgHistory
Log:            2007-05-21 - Initial creation
                2007-06-26 - Added <span> tags around calls to PopulateID and PopulateChangeHistory
***************************************************************************************************************************************************************
-->
  <xsl:template name="PopulateIndividualSizableLetterBox">
    <xsl:param name="TargetNode"/>
    <xsl:param name="BoxNum"/>
    <xsl:param name="BoxWidth" />
    <xsl:param name="BoxHeight" />
    <xsl:param name="BoxTopPadding" />

    <div style="width:{$BoxWidth};height:{$BoxHeight};padding-top:{$BoxTopPadding};text-align:center;border:1 solid black;clear:none;float:left" >
      <span>    
        <xsl:attribute name="id">    
          <xsl:call-template name="PopulateID">
            <xsl:with-param name="TargetNode" select="$TargetNode"/>
          </xsl:call-template>    
        </xsl:attribute>        
        <xsl:call-template name="PopulateChgHistory">
          <xsl:with-param name="targetNode" select="$TargetNode"/>
          <xsl:with-param name="thisTemplate" select=" 'forLetterBox' "/>   
          <xsl:with-param name="boxNum" select="$BoxNum"/>  
        </xsl:call-template> 
      </span>        
    </div>        
    
  </xsl:template>  
 

  
  
  <!--
***************************************************************************************************************************************************************
Name:           PopulateIndividualSizableLetterBoxAdjustableBorders
Description:    Template for splitting up Text fields into individual letter boxes of varying sizes with configurable border widths
Req Param:      BoxWidth,BoxHeight,BoxTopPadding, BoxTopBorderWidth, BoxBottomBorderWidth, BoxLeftBorderWidth, 		
                       BoxRightBorderWidth
Opt Param:   
Called By:      
Calls:          PopulateID, PopulateChgHistory
Log:            2013-04-11 - Initial creation
***************************************************************************************************************************************************************
-->
  <xsl:template name="PopulateIndividualSizableLetterBoxAdjustableBorders">
    <xsl:param name="TargetNode"/>
    <xsl:param name="BoxNum"/>
    <xsl:param name="BoxWidth" />
    <xsl:param name="BoxHeight" />
    <xsl:param name="BoxTopPadding" />
    <xsl:param name="BoxTopBorderWidth" />
    <xsl:param name="BoxBottomBorderWidth" />
    <xsl:param name="BoxLeftBorderWidth" />
    <xsl:param name="BoxRightBorderWidth" />

    <div style="width:{$BoxWidth};height:{$BoxHeight};padding-top:{$BoxTopPadding};text-align:center;border:black solid 0px;border-top-width:{$BoxTopBorderWidth};border-bottom-width:{$BoxBottomBorderWidth};border-left-width:{$BoxLeftBorderWidth};border-right-width:{$BoxRightBorderWidth};clear:none;float:left" >
      <span>    
        <xsl:attribute name="id">    
          <xsl:call-template name="PopulateID">
            <xsl:with-param name="TargetNode" select="$TargetNode"/>
          </xsl:call-template>    
        </xsl:attribute>        
        <xsl:call-template name="PopulateChgHistory">
          <xsl:with-param name="targetNode" select="$TargetNode"/>
          <xsl:with-param name="thisTemplate" select=" 'forLetterBox' "/>   
          <xsl:with-param name="boxNum" select="$BoxNum"/>  
        </xsl:call-template> 
      </span>        
    </div>        
    
  </xsl:template>
  
  
  
  
  
      
<!--
***************************************************************************************************************************************************************
Name:           PopulateMonthDayYear
Description:    Template for formatting the date as mm-dd-yyyy
Req Param:  
Opt Param:   
Called By:      PopulateReturnHeaderTaxPeriodBeginDate, PopulateReturnHeaderTaxPeriodEndDate
Calls:          PopulateID, PopulateChgHistory
Log:
***************************************************************************************************************************************************************
-->  
  <xsl:template name="PopulateMonthDayYear">
    <xsl:param name="TargetNode"/>
    <span>    
      <xsl:attribute name="id">    
        <xsl:call-template name="PopulateID">
          <xsl:with-param name="TargetNode" select="$TargetNode"/>
        </xsl:call-template>    
      </xsl:attribute>        
      <xsl:call-template name="PopulateChgHistory">
        <xsl:with-param name="targetNode" select="$TargetNode"/>        
         <xsl:with-param name="thisTemplate" select=" 'forDate' "/>                          
      </xsl:call-template>                
    </span>        
  </xsl:template>


<!--
***************************************************************************************************************************************************************
Name:         PopulatePin
Description:  Populates the signature pin
Req Param:    TargetNode - Data location of the pin
Opt Param:    none
Called By:    PopulateReturnHeaderOfficer
Calls:        none
Log:
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulatePin">
  <xsl:param name="TargetNode"/>
    
  <xsl:if test="($TargetNode) and ($TargetNode != '')">
    ******
  </xsl:if>
</xsl:template>

<!--
***************************************************************************************************************************************************************
Name:         PopulatePhoneNumber
Description:  Populates phone number
Req Param:    TargetNode - Data location of the phone number
Opt Param:    none
Called By:     
Calls:        none
Log:                                  
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulatePhoneNumber">
  <xsl:param name="TargetNode"/>
    <span>      
      <xsl:attribute name="id">    
        <xsl:call-template name="PopulateID">
          <xsl:with-param name="TargetNode" select="$TargetNode"/>
        </xsl:call-template>    
      </xsl:attribute>       
      <xsl:call-template name="PopulateChgHistory">
        <xsl:with-param name="targetNode" select="$TargetNode"/> 
         <xsl:with-param name="thisTemplate" select=" 'forPhoneNumber' "/>                          
      </xsl:call-template>               
    </span>    
</xsl:template>


<!--
***************************************************************************************************************************************************************
Name:         PopulateUSAddressTemplate     
Description:  Populates the US address field.
Req Param:    TargetNode - Name of the US Address's node
Opt Param:    SpanWidth - Offset of all address data
Called By:    Stylesheets
Calls:        PopulateText 
Log:
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateUSAddressTemplate">
  <xsl:param name="TargetNode"/>
  <xsl:param name="SpanWidth">width:0px;</xsl:param>

  <xsl:variable name="addressLine2" select="$TargetNode/AddressLine2Txt"></xsl:variable>

  <span><xsl:attribute name="style"><xsl:value-of select="$SpanWidth"/></xsl:attribute></span>
  <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$TargetNode/AddressLine1Txt" /></xsl:call-template>
  <!-- Only create line space for AddressLine 2 if it exists -->
  <xsl:if test="$addressLine2 != ''">
    <br/><span><xsl:attribute name="style"><xsl:value-of select="$SpanWidth"/></xsl:attribute></span>
    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$TargetNode/AddressLine2Txt" /></xsl:call-template>
  </xsl:if>
  <!-- Only create line space for the City, State, and ForeignPostalCd if they exist-->
  <xsl:if test="$TargetNode/CityNm != '' or $TargetNode/StateAbbreviationCd != '' or $TargetNode/ZIPCd != ''">
    <br/>
    <span><xsl:attribute name="style"><xsl:value-of select="$SpanWidth"/></xsl:attribute></span>
    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$TargetNode/CityNm" /></xsl:call-template>
    <!-- Only display a comma between city and state if both city and state exist-->
    <xsl:if test="$TargetNode/CityNm != '' and $TargetNode/StateAbbreviationCd != ''">,<span style="width:2px;"></span></xsl:if>
    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$TargetNode/StateAbbreviationCd" /></xsl:call-template>
    <span style="width:7px;"></span>
    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$TargetNode/ZIPCd" /></xsl:call-template>
  </xsl:if>
</xsl:template>


<!--
***************************************************************************************************************************************************************
Name:         PopulateForeignAddressTemplate
Description:  Populates the foreign address field.
Req Param:    TargetNode - Name of the foreign address's node
Opt Param:    SpanWidth - Offset of all address data
Called By:    Stylesheets
Calls:        PopulateText 
Log:
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateForeignAddressTemplate">
  <xsl:param name="TargetNode"/>
  <xsl:param name="SpanWidth">width:0px;</xsl:param>
  <xsl:param name="MainForm">false</xsl:param>

  <xsl:variable name="addressLine2" select="$TargetNode/AddressLine2Txt"></xsl:variable>

  <span><xsl:attribute name="style"><xsl:value-of select="$SpanWidth"/></xsl:attribute></span>
  <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$TargetNode/AddressLine1Txt" /></xsl:call-template>
  <!-- Only create line space for AddressLine 2 if it exists -->
  <xsl:if test="$addressLine2 != ''">
    <br/><span><xsl:attribute name="style"><xsl:value-of select="$SpanWidth"/></xsl:attribute></span><xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$TargetNode/AddressLine2Txt" /></xsl:call-template>
  </xsl:if>
  <!-- Only create line space for the City, State, ForeignPostalCd if they exist-->
  <xsl:if test="$TargetNode/CityNm != '' or $TargetNode/ProvinceOrStateNm != '' or $TargetNode/ForeignPostalCd != ''">
    <br/><span><xsl:attribute name="style"><xsl:value-of select="$SpanWidth"/></xsl:attribute></span>
    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$TargetNode/CityNm" /></xsl:call-template>
    <!-- Only display a comma between city and state if both city and state exist-->
    <xsl:if test="$TargetNode/CityNm != '' and $TargetNode/ProvinceOrStateNm != ''">,<span style="width:2px;"></span></xsl:if>
    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$TargetNode/ProvinceOrStateNm" /></xsl:call-template>
    <span style="width:7px;"></span>
    <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$TargetNode/ForeignPostalCd" /></xsl:call-template>
  </xsl:if>
  <br/><span><xsl:attribute name="style"><xsl:value-of select="$SpanWidth"/></xsl:attribute></span>
  
  <!-- when MainForm is set to true, code will use CountriesList.xml to look up country name that corresponds with country code, otherwise will just print country abbreviation -->
	  <xsl:choose>
		   <xsl:when test="$MainForm = 'true' ">
			   <xsl:variable name="countryname" select="document('CountriesList.xml')/countries" />
                <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $TargetNode/CountryCd]" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
               <xsl:call-template name="PopulateText">
                 <xsl:with-param name="TargetNode" select="$TargetNode/CountryCd" />
                </xsl:call-template>
            </xsl:otherwise>
       </xsl:choose>

  <span style="width:6px"></span>

</xsl:template>


<!--
***************************************************************************************************************************************************************
Name:        PopulateCityStateInfo
Description: Populates the city and state information for both US and foreign addresses.  Country information is 
             not displayed in order to give the user the ability to choose where the country information will be  
             displayed (ie. how much space is needed in front the country).
Req Param:   TargetNode - The base element that contains the USAddress data
             ForeignAddressTargetNode - The base element that contains the ForeignAddress
Opt Param:   none
Called By:   PopulateReturnHeaderFiler, PopulateReturnHeaderPreparerFirm
Calls:       PopulateText
Log:
***************************************************************************************************************************************************************
-->  
<xsl:template name="PopulateCityStateInfo">
  <xsl:param name="TargetNode" select="."/>
  <xsl:param name="ForeignAddressTargetNode" select="." />
  <xsl:choose>
    <xsl:when test="$TargetNode">
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$TargetNode/CityNm" />
      </xsl:call-template><xsl:if test="($TargetNode/CityNm != '') and ($TargetNode/StateAbbreviationCd != '')">, </xsl:if>
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$TargetNode/StateAbbreviationCd" />
      </xsl:call-template>
      <span style="width:7px;"></span>
      <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$TargetNode/ZIPCd" />
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:if test="$ForeignAddressTargetNode/CityNm">        
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$ForeignAddressTargetNode/CityNm" />
        </xsl:call-template><xsl:if test="($ForeignAddressTargetNode/CityNm != '') and ($ForeignAddressTargetNode/ProvinceOrStateNm != '')">, </xsl:if>
        <xsl:if test="($ForeignAddressTargetNode/CityNm != '') and not($ForeignAddressTargetNode/ProvinceOrStateNm)"><span style="width:7px;"/></xsl:if>
      </xsl:if>
      <xsl:if test="$ForeignAddressTargetNode/ProvinceOrStateNm">        
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$ForeignAddressTargetNode/ProvinceOrStateNm" />
        </xsl:call-template>
        <span style="width:7px;"></span>
      </xsl:if>
      <xsl:if test="$ForeignAddressTargetNode/ForeignPostalCd">          
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$ForeignAddressTargetNode/ForeignPostalCd" />
        </xsl:call-template>
      </xsl:if>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>  

<!--
***************************************************************************************************************************************************************
Name:         PopulateReturnHeaderFiler
Description:  Populates the return header information.
Req Param:    TargetNode - Location of the Return Header information
Opt Param:    MainForm - Boolean value indicating whether this is a main form or not
                     Location - Indicates where to get the information.  Can have one of the three values "PAR", "SUB", or "RET"
                     EINChanged - Boolean value indicating whether you want to check for an updated EIN value to be displayed along with
                                            the delta image.
Called By:    Stylesheets, PopulateDepCommonLeftoverNameEIN, PopulateCommonLeftover
Calls:        PopulateCityStateInfo, PopulateEIN, PopulateSSN, PopulateText
Log:           2004-12-22 - Added a condition to check if TaxpayerPrint is true before displaying the change indicator
               2005-10-31 - Updated to display % in front of all InCareOfName elements
               2005-12-13 - Updated with Subsidiary MissingEINReason Data element.
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateReturnHeaderFiler">
  <xsl:param name="TargetNode" select="."/>
  <xsl:param name="EINChanged">false</xsl:param>
  <xsl:param name="MainForm">false</xsl:param>

  <xsl:choose>
  <xsl:when test="$Location='PAR'"> <!-- Indicating that the data needs to be pulled from Parent return header-->
     <xsl:choose>
        <xsl:when test="$TargetNode='BusinessNameLine1Txt' and not($ParRtnHdrData/ParentCorpGrp/BusinessName/BusinessNameLine1Txt)">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$ParRtnHdrData/ParentCorpGrp/Name" />
          </xsl:call-template>
        </xsl:when> 
        <xsl:when test="$TargetNode='CityStateInfo' ">
          <xsl:call-template name="PopulateCityStateInfo">
            <xsl:with-param name="TargetNode" select="$ParRtnHdrData/ParentCorpGrp/USAddress" />
            <xsl:with-param name="ForeignAddressTargetNode" select="$ParRtnHdrData/ParentCorpGrp/ForeignAddress" />
          </xsl:call-template>
        </xsl:when>              
        <xsl:when test="$TargetNode = 'EIN' ">    
          <xsl:call-template name="PopulateEIN">
            <xsl:with-param name="TargetNode" select="$ParRtnHdrData/ParentCorpGrp/EIN" />
          </xsl:call-template>
        </xsl:when>
        <xsl:when test="$TargetNode = 'Phone' ">    
          <xsl:call-template name="PopulatePhoneNumber">
            <xsl:with-param name="TargetNode" select="$ParRtnHdrData/ParentCorpGrp/Phone"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:when test="$TargetNode = 'SSN' ">                
          <xsl:call-template name="PopulateSSN">
            <xsl:with-param name="TargetNode" select="$ParRtnHdrData/ParentCorpGrp/SSN" />
          </xsl:call-template>
        </xsl:when>
        <xsl:when test="$TargetNode = 'CountryCd' ">
            <xsl:if test="$ParRtnHdrData/ParentCorpGrp/ForeignAddress">
              <xsl:choose>
                <xsl:when test="$MainForm = 'true' ">
                    <xsl:variable name="countryname" select="document('CountriesList.xml')/countries" />
                      <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $ParRtnHdrData/ParentCorpGrp/ForeignAddress/CountryCd]" />
                      </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$ParRtnHdrData/ParentCorpGrp/ForeignAddress/CountryCd" />
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:if>
          </xsl:when>
        <xsl:otherwise> <!-- Handles all other data. Populate data whose element name matches TargetNode element name-->
            <xsl:call-template name="PopulateText">
               <xsl:with-param name="TargetNode" select="$ParRtnHdrData/ParentCorpGrp//*[name(.)=$TargetNode]" />
            </xsl:call-template>
        </xsl:otherwise>
     </xsl:choose>
  </xsl:when>
  <xsl:when test="$Location='LSB'">
      <xsl:choose>
        <xsl:when test="$TargetNode='BusinessNameLine1Txt' and not($SubRtnHdrData/SubsidiaryCorpGrp/BusinessName/BusinessNameLine1Txt)">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$SubRtnHdrData/SubsidiaryCorpGrp/Name" />
          </xsl:call-template>
        </xsl:when>
        <xsl:when test="$TargetNode='CityStateInfo' ">
          <xsl:call-template name="PopulateCityStateInfo">
            <xsl:with-param name="TargetNode" select="$SubRtnHdrData/SubsidiaryCorpGrp/USAddress" />
            <xsl:with-param name="ForeignAddressTargetNode" select="$SubRtnHdrData/SubsidiaryCorpGrp/ForeignAddress" />
          </xsl:call-template>
        </xsl:when>              
        <xsl:when test="$TargetNode = 'EIN' ">    
          <xsl:call-template name="PopulateEIN">
            <xsl:with-param name="TargetNode" select="$SubRtnHdrData/SubsidiaryCorpGrp/EIN" />
          </xsl:call-template>
        </xsl:when>
        <xsl:when test="$TargetNode = 'Phone' ">    
          <xsl:call-template name="PopulatePhoneNumber">
            <xsl:with-param name="TargetNode" select="$SubRtnHdrData/SubsidiaryCorpGrp/Phone"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:when test="$TargetNode = 'SSN'">                
          <xsl:call-template name="PopulateSSN">
            <xsl:with-param name="TargetNode" select="$SubRtnHdrData/SubsidiaryCorpGrp/SSN" />
          </xsl:call-template>
        </xsl:when>
        <xsl:when test="$TargetNode = 'CountryCd' ">
            <xsl:if test="$SubRtnHdrData/SubsidiaryCorpGrp/ForeignAddress">
              <xsl:choose>
                <xsl:when test="$MainForm = 'true' ">
                    <xsl:variable name="countryname" select="document('CountriesList.xml')/countries" />
                      <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $SubRtnHdrData/SubsidiaryCorpGrp/ForeignAddress/CountryCd]" />
                      </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$SubRtnHdrData/SubsidiaryCorpGrp/ForeignAddress/CountryCd" />
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:if>
          </xsl:when>
        <xsl:otherwise> <!-- Handles all other data. Populate data whose element name matches TargetNode element name-->
            <xsl:call-template name="PopulateText">
               <xsl:with-param name="TargetNode" select="$SubRtnHdrData/SubsidiaryCorpGrp//*[name(.)=$TargetNode]" />
            </xsl:call-template>
        </xsl:otherwise>
     </xsl:choose>
  </xsl:when>
  <xsl:when test="$Location='PSB'">
      <xsl:choose>
        <xsl:when test="$TargetNode='BusinessNameLine1Txt' and not($SubRtnHdrData/SubsidiaryCorpGrp/BusinessName/BusinessNameLine1Txt)">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$SubRtnHdrData/SubsidiaryCorpGrp/Name" />
          </xsl:call-template>
        </xsl:when>
        <xsl:when test="$TargetNode='CityStateInfo' ">
          <xsl:call-template name="PopulateCityStateInfo">
            <xsl:with-param name="TargetNode" select="$SubRtnHdrData/SubsidiaryCorpGrp/USAddress" />
            <xsl:with-param name="ForeignAddressTargetNode" select="$SubRtnHdrData/SubsidiaryCorpGrp/ForeignAddress" />
          </xsl:call-template>
        </xsl:when>              
        <xsl:when test="$TargetNode = 'EIN' ">    
          <xsl:call-template name="PopulateEIN">
            <xsl:with-param name="TargetNode" select="$SubRtnHdrData/SubsidiaryCorpGrp/EIN" />
          </xsl:call-template>
        </xsl:when>
        <xsl:when test="$TargetNode = 'Phone' ">    
          <xsl:call-template name="PopulatePhoneNumber">
            <xsl:with-param name="TargetNode" select="$SubRtnHdrData/SubsidiaryCorpGrp/Phone"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:when test="$TargetNode = 'SSN' ">                
          <xsl:call-template name="PopulateSSN">
            <xsl:with-param name="TargetNode" select="$SubRtnHdrData/SubsidiaryCorpGrp/SSN" />
          </xsl:call-template>
        </xsl:when>
        <xsl:when test="$TargetNode = 'CountryCd' ">
            <xsl:if test="$SubRtnHdrData/SubsidiaryCorpGrp/ForeignAddress">
              <xsl:choose>
                <xsl:when test="$MainForm = 'true' ">
                    <xsl:variable name="countryname" select="document('CountriesList.xml')/countries" />
                      <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $SubRtnHdrData/SubsidiaryCorpGrp/ForeignAddress/CountryCd]" />
                      </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$SubRtnHdrData/SubsidiaryCorpGrp/ForeignAddress/CountryCd" />
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:if>
          </xsl:when>
        <xsl:otherwise> <!-- Handles all other data. Populate data whose element name matches TargetNode element name-->
            <xsl:call-template name="PopulateText">
               <xsl:with-param name="TargetNode" select="$SubRtnHdrData/SubsidiaryCorpGrp//*[name(.)=$TargetNode]" />
            </xsl:call-template>
        </xsl:otherwise>
     </xsl:choose>
  </xsl:when>

  <xsl:when test="$Location='SUB'"> <!-- Indicating that data needs to be pulled from Subsidiary return header-->
    <xsl:if test="$SubRtnHdrData/EliminationsOrAdjustments">
      <xsl:if test="$TargetNode='BusinessNameLine1Txt'">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$SubRtnHdrData/EliminationsOrAdjustments" />
        </xsl:call-template>      
      </xsl:if>  
    </xsl:if>
    <xsl:if test="$SubRtnHdrData/SubsidiaryCorpGrp">
      <xsl:choose>
        <xsl:when test="$TargetNode='BusinessNameLine1Txt' and not($SubRtnHdrData/SubsidiaryCorpGrp/BusinessName/BusinessNameLine1Txt)">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$SubRtnHdrData/SubsidiaryCorpGrp/Name" />
          </xsl:call-template>
        </xsl:when>
        <xsl:when test="$TargetNode='CityStateInfo' ">
          <xsl:call-template name="PopulateCityStateInfo">
            <xsl:with-param name="TargetNode" select="$SubRtnHdrData/SubsidiaryCorpGrp/USAddress" />
            <xsl:with-param name="ForeignAddressTargetNode" select="$SubRtnHdrData/SubsidiaryCorpGrp/ForeignAddress" />
          </xsl:call-template>
        </xsl:when>  
        <xsl:when test="$TargetNode = 'EIN' ">
                <xsl:if test="$SubRtnHdrData/SubsidiaryCorpGrp/EIN">
                     <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="$SubRtnHdrData/SubsidiaryCorpGrp/EIN" />
                      </xsl:call-template>
                </xsl:if>
                <xsl:if test="$SubRtnHdrData/SubsidiaryCorpGrp/MissingEINReason">    
                    <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$SubRtnHdrData/SubsidiaryCorpGrp/MissingEINReason" />
                    </xsl:call-template>
                </xsl:if>
       </xsl:when>
        <xsl:when test="$TargetNode = 'SSN' ">                
          <xsl:call-template name="PopulateSSN">
            <xsl:with-param name="TargetNode" select="$SubRtnHdrData/SubsidiaryCorpGrp/SSN" />
          </xsl:call-template>
        </xsl:when>       
        <xsl:when test="$TargetNode = 'Phone' ">    
          <xsl:call-template name="PopulatePhoneNumber">
            <xsl:with-param name="TargetNode" select="$SubRtnHdrData/SubsidiaryCorpGrp/Phone"/>
          </xsl:call-template>
        </xsl:when>
        <xsl:when test="$TargetNode = 'CountryCd' ">
            <xsl:if test="$SubRtnHdrData/SubsidiaryCorpGrp/ForeignAddress">
              <xsl:choose>
                <xsl:when test="$MainForm = 'true' ">
                    <xsl:variable name="countryname" select="document('CountriesList.xml')/countries" />
                      <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$countryname/country[@id=   $SubRtnHdrData/SubsidiaryCorpGrp/ForeignAddress/CountryCd]" />
                      </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$SubRtnHdrData/SubsidiaryCorpGrp/ForeignAddress/CountryCd" />
                  </xsl:call-template>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:if>
          </xsl:when>
          <xsl:otherwise> <!-- Handles all other data. Populate data whose element name matches TargetNode element name-->
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$SubRtnHdrData/SubsidiaryCorpGrp//*[name(.)=  $TargetNode]" />
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>
    </xsl:when>
    <xsl:otherwise> <!-- Indicating that the data needs to be pulled from Filer return header-->
    <xsl:choose>
		<xsl:when test="$Type = '720' or $Type='2290' or $Type='8849'"> <!--Type is 720 -->
		<xsl:choose>
			<xsl:when test="$TargetNode='BusinessNameLine1Txt' and not($RtnHdrData/Filer/Name/BusinessNameLine1Txt)">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/Name" />
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$TargetNode = 'EIN' ">  
                <!-- Calling PopulateEIN with the filer/EIN will always show the latest EIN and it will preserve the change history functions-->  
                <xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN" />
                </xsl:call-template>
                <!-- If the EIN (TIN) has changed and the form wants to show a delta image (set using the EINChanged parameter, show the delta image.-->
                <xsl:if test="$TaxpayerPrint = 'false' or $TaxpayerPrint = '0'">
                  <xsl:if test="($EINChanged='true' or $EINChanged='1') and ((/AppData/Parameters/TINChanged='true') or (/AppData/Parameters/TINChanged='1'))">
                     <span style="width:2px;" /><img src="{$NonVersionedImagePath}/changeSmall.gif" style="padding-top:1px;" alt="EIN has changed"/>
                  </xsl:if>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$TargetNode='CityStateInfo' ">
                <xsl:call-template name="PopulateCityStateInfo">
                    <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress" />
                    <xsl:with-param name="ForeignAddressTargetNode" select="$RtnHdrData/Filer/ForeignAddress" />
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$TargetNode = 'CountryCd' ">
                <xsl:if test="$RtnHdrData/Filer/ForeignAddress">
                  <xsl:choose>
                    <xsl:when test="$MainForm = 'true' ">
                      <xsl:variable name="countryname" select="document('CountriesList.xml')/countries" />
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$countryname/country[@id=$RtnHdrData/Filer/ForeignAddress/CountryCd]" />
                          </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer//CountryCd" />
                      </xsl:call-template>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:if>
            </xsl:when>
			<xsl:otherwise> <!-- Handles all other data. Populate data whose element name matches TargetNode element name-->
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer//*[name(.)=$TargetNode]" />
              </xsl:call-template>
            </xsl:otherwise>
		</xsl:choose>
		</xsl:when>
		<xsl:otherwise>
        <xsl:choose>
			<xsl:when test="$TargetNode='Name'">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt" />
				</xsl:call-template>
			</xsl:when>
            <xsl:when test="$TargetNode='BusinessNameLine1Txt' and not($RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt)">
              <xsl:choose>
				<xsl:when test="$Type = '1041'">
					<xsl:choose>
						<xsl:when test="$RtnHdrData/Filer/NationalMortgageAssocCd">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NationalMortgageAssocCd" />
							</xsl:call-template>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt" />
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:when test="$RtnHdrData/Filer/PersonFullName">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PersonFullName" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$RtnHdrData/Filer/PrimaryNm">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimaryNm" />
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$RtnHdrData/Filer/BusinessNameLine1Txt">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessNameLine1Txt" />
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/NameLine1Txt" />
					</xsl:call-template>
				</xsl:otherwise>
              </xsl:choose>
            </xsl:when>
            <xsl:when test="$TargetNode='BusinessNameLine2Txt' and $RtnHdrData/Filer/TradeName/BusinessNameLine2Txt">
				<!-- Catch for 94X forms, which can have two different elements of type BusinessName -->
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt" />
				</xsl:call-template>
            </xsl:when>
            <xsl:when test="$TargetNode='CityStateInfo' ">
                <xsl:call-template name="PopulateCityStateInfo">
                    <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress" />
                    <xsl:with-param name="ForeignAddressTargetNode" select="$RtnHdrData/Filer/ForeignAddress" />
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$TargetNode = 'EIN' ">  
                <!-- Calling PopulateEIN with the filer/EIN will always show the latest EIN and it will preserve the change history functions-->  
                <xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EIN" />
                </xsl:call-template>
                <!-- If the EIN (TIN) has changed and the form wants to show a delta image (set using the EINChanged parameter, show the delta image.-->
                <xsl:if test="$TaxpayerPrint = 'false' or $TaxpayerPrint = '0'">
                  <xsl:if test="($EINChanged='true' or $EINChanged='1') and ((/AppData/Parameters/TINChanged='true') or (/AppData/Parameters/TINChanged='1'))">
                     <span style="width:2px;" /><img src="{$NonVersionedImagePath}/changeSmall.gif" style="padding-top:1px;" alt="EIN has changed"/>
                  </xsl:if>
                </xsl:if>
            </xsl:when>
        <xsl:when test="$TargetNode = 'Phone' ">    
          <xsl:call-template name="PopulatePhoneNumber">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PhoneNum"/>
          </xsl:call-template>
        </xsl:when>
            <xsl:when test="$TargetNode = 'SSN' or $TargetNode = 'PrimarySSN' ">
				<xsl:if test="$RtnHdrData/Filer//PrimarySSN or $RtnHdrData/Filer//SSN">
					<xsl:call-template name="PopulateSSN">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer//*[name(.)=$TargetNode]"/>
					</xsl:call-template>
					<!-- If the EIN (TIN) has changed and the form wants to show a delta image (set using the EINChanged parameter, show the delta image.-->
					<xsl:if test="$TaxpayerPrint = 'false' or $TaxpayerPrint = '0'">
						<xsl:if test="($EINChanged = 'true') and ((/AppData/Parameters/TINChanged='true') or (/AppData/Parameters/TINChanged='1'))">
							<span style="width:2px;"/>
							<img src="{$NonVersionedImagePath}/changeSmall.gif" style="padding-top:1px;" alt="Primary SSN has changed"/>
						</xsl:if>
					</xsl:if>
				</xsl:if>
			</xsl:when>
			<xsl:when test="$TargetNode = 'SpouseSSN'">
				<xsl:call-template name="PopulateSSN">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/SpouseSSN"/>
				</xsl:call-template>
				<!-- If the EIN (TIN) has changed and the form wants to show a delta image (set using the EINChanged parameter, show the delta image.-->
				<xsl:if test="$RtnHdrData/Filer/SpouseSSN and ($TaxpayerPrint = 'false' or $TaxpayerPrint = '0')">
					<xsl:if test="($EINChanged = 'true') and ((/AppData/Parameters/SecondaryTINChanged='true') or (/AppData/Parameters/SecondaryTINChanged='1'))">
						<span style="width:2px;"/>
						<img src="{$NonVersionedImagePath}/changeSmall.gif" style="padding-top:1px;" alt="Spouse SSN has changed"/>
					</xsl:if>
				</xsl:if>
			</xsl:when>
            <xsl:when test="$TargetNode = 'CountryCd' ">
                <xsl:if test="$RtnHdrData/Filer/ForeignAddress">
                  <xsl:choose>
                    <xsl:when test="$MainForm = 'true' ">
                      <xsl:variable name="countryname" select="document('CountriesList.xml')/countries" />
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="$countryname/country[@id=$RtnHdrData/Filer/ForeignAddress/CountryCd]" />
                          </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer//CountryCd" />
                      </xsl:call-template>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$TargetNode='InCareOfName' ">
              <xsl:if test="($RtnHdrData/Filer/InCareOfNm != '')">
                <xsl:call-template name="PopulateText">
                   <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/InCareOfNm" />
                  </xsl:call-template>
              </xsl:if>
            </xsl:when>
            <xsl:otherwise> <!-- Handles all other data. Populate data whose element name matches TargetNode element name-->
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer//*[name(.)=$TargetNode]" />
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
         </xsl:otherwise>
   </xsl:choose>
   </xsl:otherwise>
   </xsl:choose>
  </xsl:template>
  
<!--   
****************************************************
Name:        PopulateReturnHeaderFilerTIN
Description: Populates an EIN or SSN based on which is available.
				For forms that apply to multiple form families.
Req Param:   None
Opt Param:   EINChanged: get delta icon when EINChanged set (currently just used on main forms)
Called By:   Stylesheets
Calls:       PopulateReturnHeaderFiler
Log:
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateReturnHeaderFilerTIN">
	<xsl:param name="EINChanged" select="false()"/>
	<xsl:variable name="Blank"></xsl:variable>
	<xsl:variable name="SSNExists">
		<xsl:call-template name="PopulateReturnHeaderFiler">
			<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
		</xsl:call-template>
	</xsl:variable>
	<xsl:choose>
		<xsl:when test="$SSNExists != $Blank">
			<xsl:call-template name="PopulateReturnHeaderFiler">
				<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
				<xsl:with-param name="EINChanged" select="$EINChanged"/>
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="PopulateReturnHeaderFiler">
				<xsl:with-param name="TargetNode">EIN</xsl:with-param>
				<xsl:with-param name="EINChanged" select="$EINChanged"/>
			</xsl:call-template>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
  
<!--
****************************************************
Name:        PopulateReturnHeaderTaxPeriodBeginDate
Description: Populates TaxPeriodBeginDate. The element exists in all three 
               ConsolidatedReturnHeader, SubsidiaryReturnHeader or ParentReturnHeader.  
               Depending on the $Location parameter the template decides from where to 
               pull the data.
Req Param:   None
Opt Param:   none
Called By:   Stylesheets
Calls:       PopulateMonthDayYear
Log:
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateReturnHeaderTaxPeriodBeginDate">
  <xsl:choose>
    <xsl:when test="$Location='PAR'"> <!-- Indicating the element needs to be pulled Parent return header -->
      <xsl:call-template name="PopulateMonthDayYear">
        <xsl:with-param name="TargetNode" select="$ParRtnHdrData/TaxPeriodBeginDt" />
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="$Location='SUB'"> <!-- Indicating the element needs to be pulled Subsidiary return header-->
      <xsl:call-template name="PopulateMonthDayYear">
        <xsl:with-param name="TargetNode" select="$SubRtnHdrData/TaxPeriodBeginDt" />
      </xsl:call-template>
    </xsl:when>
   <xsl:when test="$Location='ELM'"> <!-- Indicating the element needs to be pulled Subsidiary return header-->
      <xsl:call-template name="PopulateMonthDayYear">
        <xsl:with-param name="TargetNode" select="$SubRtnHdrData/TaxPeriodBeginDt" />
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="$Location='ADJ'"> <!-- Indicating the element needs to be pulled Subsidiary return header-->
      <xsl:call-template name="PopulateMonthDayYear">
        <xsl:with-param name="TargetNode" select="$SubRtnHdrData/TaxPeriodBeginDt" />
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="$Location='SSC'"> <!-- Indicating the element needs to be pulled Subsidiary return header-->
      <xsl:call-template name="PopulateMonthDayYear">
        <xsl:with-param name="TargetNode" select="$SubRtnHdrData/TaxPeriodBeginDt" />
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="$Location='SEL'"> <!-- Indicating the element needs to be pulled Subsidiary return header-->
      <xsl:call-template name="PopulateMonthDayYear">
        <xsl:with-param name="TargetNode" select="$SubRtnHdrData/TaxPeriodBeginDt" />
      </xsl:call-template>
    </xsl:when>
     <xsl:when test="$Location='SAJ'"> <!-- Indicating the element needs to be pulled Subsidiary return header-->
      <xsl:call-template name="PopulateMonthDayYear">
        <xsl:with-param name="TargetNode" select="$SubRtnHdrData/TaxPeriodBeginDt" />
      </xsl:call-template>
    </xsl:when>
     <xsl:when test="$Location='LSC'"> <!-- Indicating the element needs to be pulled Subsidiary return header-->
      <xsl:call-template name="PopulateMonthDayYear">
        <xsl:with-param name="TargetNode" select="$SubRtnHdrData/TaxPeriodBeginDt" />
      </xsl:call-template>
    </xsl:when>
     <xsl:when test="$Location='LSB'"> <!-- Indicating the element needs to be pulled Subsidiary return header-->
      <xsl:call-template name="PopulateMonthDayYear">
        <xsl:with-param name="TargetNode" select="$SubRtnHdrData/TaxPeriodBeginDt" />
      </xsl:call-template>
    </xsl:when>
     <xsl:when test="$Location='LEL'"> <!-- Indicating the element needs to be pulled Subsidiary return header-->
      <xsl:call-template name="PopulateMonthDayYear">
        <xsl:with-param name="TargetNode" select="$SubRtnHdrData/TaxPeriodBeginDt" />
      </xsl:call-template>
    </xsl:when>
     <xsl:when test="$Location='LAJ'"> <!-- Indicating the element needs to be pulled Subsidiary return header-->
      <xsl:call-template name="PopulateMonthDayYear">
        <xsl:with-param name="TargetNode" select="$SubRtnHdrData/TaxPeriodBeginDt" />
      </xsl:call-template>
    </xsl:when>
     <xsl:when test="$Location='PSC'"> <!-- Indicating the element needs to be pulled Subsidiary return header-->
      <xsl:call-template name="PopulateMonthDayYear">
        <xsl:with-param name="TargetNode" select="$SubRtnHdrData/TaxPeriodBeginDt" />
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise><!-- Indicating it needs to pull from filer info -->
      <xsl:call-template name="PopulateMonthDayYear">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/TaxPeriodBeginDt" />
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<!--
*******************************************
Name:         PopulateReturnHeaderTaxPeriodEndDate
Description:  Populates TaxPeriodEndDate. The element exists in all three ConsolidatedReturnHeader, SubsidiaryReturnHeader or ParentReturnHeader.  Depending on the $Location parameter the template decides from where to pull the data.
Req Param:    None
Opt Param:    none
Called By:    Stylesheets
Calls:        PopulateMonthDayYear
Log:
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateReturnHeaderTaxPeriodEndDate">
  <xsl:choose>
    <xsl:when test="$Location='PAR'"> <!-- Indicating the element needs to be pulled Parent return header -->
      <xsl:call-template name="PopulateMonthDayYear">
        <xsl:with-param name="TargetNode" select="$ParRtnHdrData/TaxPeriodEndDt" />
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="$Location='SUB'"> <!-- Indicating the element needs to be pulled Subsidiary return header-->
      <xsl:call-template name="PopulateMonthDayYear">
        <xsl:with-param name="TargetNode" select="$SubRtnHdrData/TaxPeriodEndDt" />
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="$Location='ELM'"> <!-- Indicating the element needs to be pulled Subsidiary return header-->
      <xsl:call-template name="PopulateMonthDayYear">
        <xsl:with-param name="TargetNode" select="$SubRtnHdrData/TaxPeriodEndDt" />
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="$Location='ADJ'"> <!-- Indicating the element needs to be pulled Subsidiary return header-->
      <xsl:call-template name="PopulateMonthDayYear">
        <xsl:with-param name="TargetNode" select="$SubRtnHdrData/TaxPeriodEndDt" />
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="$Location='SSC'"> <!-- Indicating the element needs to be pulled Subsidiary return header-->
      <xsl:call-template name="PopulateMonthDayYear">
        <xsl:with-param name="TargetNode" select="$SubRtnHdrData/TaxPeriodEndDt" />
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="$Location='SEL'"> <!-- Indicating the element needs to be pulled Subsidiary return header-->
      <xsl:call-template name="PopulateMonthDayYear">
        <xsl:with-param name="TargetNode" select="$SubRtnHdrData/TaxPeriodEndDt" />
      </xsl:call-template>
    </xsl:when>
     <xsl:when test="$Location='SAJ'"> <!-- Indicating the element needs to be pulled Subsidiary return header-->
      <xsl:call-template name="PopulateMonthDayYear">
        <xsl:with-param name="TargetNode" select="$SubRtnHdrData/TaxPeriodEndDt" />
      </xsl:call-template>
    </xsl:when>
     <xsl:when test="$Location='LSC'"> <!-- Indicating the element needs to be pulled Subsidiary return header-->
      <xsl:call-template name="PopulateMonthDayYear">
        <xsl:with-param name="TargetNode" select="$SubRtnHdrData/TaxPeriodEndDt" />
      </xsl:call-template>
    </xsl:when>
     <xsl:when test="$Location='LSB'"> <!-- Indicating the element needs to be pulled Subsidiary return header-->
      <xsl:call-template name="PopulateMonthDayYear">
        <xsl:with-param name="TargetNode" select="$SubRtnHdrData/TaxPeriodEndDt" />
      </xsl:call-template>
    </xsl:when>
     <xsl:when test="$Location='LEL'"> <!-- Indicating the element needs to be pulled Subsidiary return header-->
      <xsl:call-template name="PopulateMonthDayYear">
        <xsl:with-param name="TargetNode" select="$SubRtnHdrData/TaxPeriodEndDt" />
      </xsl:call-template>
    </xsl:when>
     <xsl:when test="$Location='LAJ'"> <!-- Indicating the element needs to be pulled Subsidiary return header-->
      <xsl:call-template name="PopulateMonthDayYear">
        <xsl:with-param name="TargetNode" select="$SubRtnHdrData/TaxPeriodEndDt" />
      </xsl:call-template>
    </xsl:when>
     <xsl:when test="$Location='PSC'"> <!-- Indicating the element needs to be pulled Subsidiary return header-->
      <xsl:call-template name="PopulateMonthDayYear">
        <xsl:with-param name="TargetNode" select="$SubRtnHdrData/TaxPeriodEndDt" />
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise><!-- Indicating it needs to pull from filer info -->
      <xsl:call-template name="PopulateMonthDayYear">
        <xsl:with-param name="TargetNode" select="$RtnHdrData/TaxPeriodEndDt" />
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<!--
*******************************************
Name:         PopulateReturnHeaderTaxYear
Description:  Populates TaxYear. The element exists only in ConsolidatedReturnHeader and it always will be displayed from there.
Req Param:    None
Opt Param:    none
Called By:    Stylesheets
Calls:        PopulateText
Log:
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateReturnHeaderTaxYear">
  <xsl:if test="$Location='RET'"> <!-- Indicating the element needs to be pulled from consolidated return header-->
    <xsl:call-template name="PopulateText">
      <xsl:with-param name="TargetNode" select="$RtnHdrData/TaxYr" />
    </xsl:call-template>
  </xsl:if>
</xsl:template>


<!--
***************************************************************************************************************************************************************
Name:         PopulateReturnHeaderOfficer
Description:  Populates the return header Officer information.  Currently Officer information exists only for the consolidated return header.  If ever the need occurs for the officer information in the other return headers it could be handled in this template.
Req Param:    TargetNode - element name that is being retrived.
Called By:    Stylesheets
Calls:        PopulateText,PopulatePin,PopulateYesCheckbox,PopulateNoCheckbox,PopulateLabelYes,PopulateLabelNo
Log:
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateReturnHeaderOfficer">
  <xsl:param name="TargetNode" select="."/>  
  <xsl:param name="BackupName" />     
  <xsl:if test="$Location='RET'"> <!-- Indicating the element needs to be pulled from consolidated return header-->
	 <xsl:choose>
	<xsl:when test="$Type = '720' or $Type='2290' or $Type='8849'"> <!--Type is 720 -->
	<xsl:choose>
      <xsl:when test="$TargetNode = 'TaxpayerPIN' ">
        <xsl:call-template name="PopulatePin">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/Officer/TaxpayerPIN" />
        </xsl:call-template>        
      </xsl:when>
      <xsl:when test="$TargetNode = 'Name' ">
		  <xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$RtnHdrData/Officer/Name"/>
		  </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode = 'Title' ">
		  <xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$RtnHdrData/Officer/Title"/>
		  </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode = 'EmailAddress' ">
		  <xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$RtnHdrData/Officer/EmailAddress"/>
		  </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode = 'DateSigned' ">
		  <xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$RtnHdrData/Officer/DateSigned"/>
		  </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode = 'AuthorizeThirdPartyYesCheckbox'">
        <xsl:call-template name="PopulateYesCheckbox">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DiscussWithThirdPartyYes" />
          <xsl:with-param name="BackupName"><xsl:value-of select="$BackupName"/></xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode = 'AuthorizeThirdPartyNoCheckbox'">
        <xsl:call-template name="PopulateNoCheckbox">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DiscussWithThirdPartyNo" />
          <xsl:with-param name="BackupName"><xsl:value-of select="$BackupName"/></xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode = 'AuthorizeThirdPartyYesLabel'">
        <xsl:call-template name="PopulateLabelYes">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DiscussWithThirdPartyYes" />
          <xsl:with-param name="BackupName"><xsl:value-of select="$BackupName"/></xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode = 'AuthorizeThirdPartyNoLabel'">
        <xsl:call-template name="PopulateLabelNo">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/ThirdPartyDesignee/DiscussWithThirdPartyNo" />
          <xsl:with-param name="BackupName"><xsl:value-of select="$BackupName"/></xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode ='Phone'">
        <xsl:if test="$RtnHdrData/Officer/Phone">
          <xsl:call-template name="PopulatePhoneNumber">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/Officer/Phone"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:when>
      <xsl:when test="$TargetNode ='ForeignPhone'">
        <xsl:if test="$RtnHdrData/Officer/ForeignPhone">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/Officer/ForeignPhone"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
      <!-- This clause handles all other elements such as 'Name','EmailAddress','Title','DateSigned'-->
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/Officer//*[name(.)=$TargetNode]" />
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>				
	</xsl:when>				
	<xsl:otherwise>
    <xsl:choose>
      <xsl:when test="$TargetNode = 'TaxpayerPIN' ">
        <xsl:call-template name="PopulatePin">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/BusinessOfficerGrp/TaxpayerPIN" />
        </xsl:call-template>        
      </xsl:when>
      <xsl:when test="$TargetNode = 'Name' ">
		  <xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$RtnHdrData/BusinessOfficerGrp/PersonNm"/>
		  </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode = 'Title' ">
		  <xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$RtnHdrData/BusinessOfficerGrp/PersonTitleTxt"/>
		  </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode = 'EmailAddress' ">
		  <xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$RtnHdrData/BusinessOfficerGrp/EmailAddressTxt"/>
		  </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode = 'DateSigned' ">
		  <xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$RtnHdrData/BusinessOfficerGrp/SignatureDt"/>
		  </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode = 'AuthorizeThirdPartyYesCheckbox'">
        <xsl:call-template name="PopulateYesCheckbox">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/BusinessOfficerGrp/DiscussWithPaidPreparerInd" />
          <xsl:with-param name="BackupName"><xsl:value-of select="$BackupName"/></xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode = 'AuthorizeThirdPartyNoCheckbox'">
        <xsl:call-template name="PopulateNoCheckbox">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/BusinessOfficerGrp/DiscussWithPaidPreparerInd" />
          <xsl:with-param name="BackupName"><xsl:value-of select="$BackupName"/></xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode = 'AuthorizeThirdPartyYesLabel'">
        <xsl:call-template name="PopulateLabelYes">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/BusinessOfficerGrp/DiscussWithPaidPreparerInd" />
          <xsl:with-param name="BackupName"><xsl:value-of select="$BackupName"/></xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode = 'AuthorizeThirdPartyNoLabel'">
        <xsl:call-template name="PopulateLabelNo">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/BusinessOfficerGrp/DiscussWithPaidPreparerInd" />
          <xsl:with-param name="BackupName"><xsl:value-of select="$BackupName"/></xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode ='Phone'">
        <xsl:if test="$RtnHdrData/BusinessOfficerGrp/PhoneNum">
          <xsl:call-template name="PopulatePhoneNumber">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/BusinessOfficerGrp/PhoneNum"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:when>
      <xsl:when test="$TargetNode ='ForeignPhone'">
        <xsl:if test="$RtnHdrData/BusinessOfficerGrp/ForeignPhoneNum">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/BusinessOfficerGrp/ForeignPhoneNum"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
      <!-- This clause handles all other elements such as 'Name','EmailAddress','Title','DateSigned'-->
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/BusinessOfficerGrp//*[name(.)=$TargetNode]" />
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
    </xsl:otherwise>
    </xsl:choose>
  </xsl:if>
</xsl:template>

<!--
***************************************************************************************************************************************************************
Name:        PopulateReturnHeaderPartner
Description: Populates the return header Partner information.  Currently Partner information exists only for the consolidated return header.  If ever the need occurs for the partner information in the other return headers it could be handled in this template.
Req Param:   TargetNode - element name that is being retrived.
Called By:   Stylesheets
Calls:       PopulateText,PopulatePin,PopulateYesCheckbox,PopulateNoCheckbox,PopulateLabelYes,PopulateLabelNo
Log:
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateReturnHeaderPartner">
  <xsl:param name="TargetNode" select="."/>  
  <xsl:param name="BackupName" />    
  <xsl:if test="$Location='RET'"> <!-- Indicating the element needs to be pulled from consolidated return header-->
    <xsl:choose>
      <xsl:when test="$TargetNode = 'TaxpayerPIN' ">
        <xsl:call-template name="PopulatePin">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/PartnerInformationGrp/TaxpayerPIN" />
        </xsl:call-template>        
      </xsl:when>
      <xsl:when test="$TargetNode = 'AuthorizeThirdPartyYesCheckbox'">
        <xsl:call-template name="PopulateYesCheckbox">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/PartnerInformationGrp/DiscussWithPaidPreparerInd" />
          <xsl:with-param name="BackupName"><xsl:value-of select="$BackupName"/></xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode = 'AuthorizeThirdPartyNoCheckbox'">
        <xsl:call-template name="PopulateNoCheckbox">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/PartnerInformationGrp/DiscussWithPaidPreparerInd" />
          <xsl:with-param name="BackupName"><xsl:value-of select="$BackupName"/></xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode = 'AuthorizeThirdPartyYesLabel'">
        <xsl:call-template name="PopulateLabelYes">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/PartnerInformationGrp/DiscussWithPaidPreparerInd" />
          <xsl:with-param name="BackupName"><xsl:value-of select="$BackupName"/></xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode = 'AuthorizeThirdPartyNoLabel'">
        <xsl:call-template name="PopulateLabelNo">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/PartnerInformationGrp/DiscussWithPaidPreparerInd" />
          <xsl:with-param name="BackupName"><xsl:value-of select="$BackupName"/></xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode ='Phone'">
        <xsl:if test="$RtnHdrData/PartnerInformationGrp/PhoneNum">
          <xsl:call-template name="PopulatePhoneNumber">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/PartnerInformationGrp/PhoneNum"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:when>
      <xsl:when test="$TargetNode ='ForeignPhone'">
        <xsl:if test="$RtnHdrData/PartnerInformationGrp/ForeignPhoneNum">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/PartnerInformationGrp/ForeignPhoneNum"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:when>
      <xsl:when test="$TargetNode = 'Name' ">
		  <xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$RtnHdrData/PartnerInformationGrp/PersonNm"/>
		  </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode = 'Title' ">
		  <xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$RtnHdrData/PartnerInformationGrp/PersonTitleTxt"/>
		  </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode = 'EmailAddress' ">
		  <xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$RtnHdrData/PartnerInformationGrp/EmailAddressTxt"/>
		  </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode = 'DateSigned' ">
		  <xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$RtnHdrData/PartnerInformationGrp/SignatureDt"/>
		  </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
      <!-- This clause handles all other elements such as 'Name','EmailAddress','Title','DateSigned'-->
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/PartnerInformationGrp//*[name(.)=$TargetNode]" />
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:if>
</xsl:template>

<!--
***************************************************************************************************************************************************************
Name:        PopulateReturnHeaderPaidPreparerInformation
Description: Populates the return header Paid Preparer information.
Req Param:   TargetNode - element name that is being retrived
Opt Param:   BackupName - that is to be used for PopulateCheckbox and PopulateLabel templates.
Called By:   Stylesheets
Calls:       PopulateCheckbox, PopulateText,PopulateSSN,PopulateLabel
Log:         04-24-2009: Initial Creation
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateReturnHeaderPaidPreparerInformation">
  <xsl:param name="TargetNode" select="."/> 
  <xsl:param name="BackupName" />    
    <xsl:choose>
      <xsl:when test="$TargetNode ='SelfEmployedCheckbox'">
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
          <xsl:with-param name="BackupName"><xsl:value-of select="$BackupName"/></xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode ='SelfEmployedLabel'">
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
          <xsl:with-param name="BackupName"><xsl:value-of select="$BackupName"/></xsl:with-param>
        </xsl:call-template>
      </xsl:when>    
      <xsl:when test="$TargetNode ='DateSigned'">
        <xsl:call-template name="PopulateMonthDayYear">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SignatureDt" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode='BusinessNameLine1Txt' and not(($RtnHdrData/PaidPreparerInformationGrp/PreparerBusinessName/BusinessNameLine1Txt) 
			  or ($RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine1Txt))">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode ='PreparerSSN'">
        <xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN">
          <xsl:call-template name="PopulateSSN">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:when>
      <xsl:when test="$TargetNode ='PTIN'">
        <xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PTIN">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PTIN"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:when>
       <xsl:when test="$TargetNode ='PreparerFirmIDNumber'">
        <xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN">
          <xsl:call-template name="PopulateEIN">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:when>           
      <xsl:when test="$TargetNode ='Phone'">
        <xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PhoneNum">
          <xsl:call-template name="PopulatePhoneNumber">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PhoneNum"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:when>
      <xsl:when test="$TargetNode ='ForeignPhone'">
        <xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/ForeignPhoneNum">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/ForeignPhoneNum"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:when>
      <xsl:when test="$TargetNode='CityStateInfo' ">
          <xsl:call-template name="PopulateCityStateInfo">
              <xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress" />
              <xsl:with-param name="ForeignAddressTargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress" />
          </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode = 'PreparerPersonName' ">
		  <xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$RtnHdrData/PartnerInformationGrp/PreparerPersonNm"/>
		  </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode = 'EmailAddress' ">
		  <xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$RtnHdrData/PartnerInformationGrp/EmailAddressTxt"/>
		  </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
      <!-- This clause handles all other elements such as 'Name','EmailAddress','DatePrepared'-->
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp//*[name(.)=$TargetNode]" />
        </xsl:call-template>
      </xsl:otherwise>      
    </xsl:choose>    
</xsl:template>

<!--
***************************************************************************************************************************************************************
Name:         PopulateReturnHeaderPreparer
Description:  Populates the return header Preparer information.  Currently  Preparer information exists only for the consolidated return header.  If ever the need occurs for the Preparer information in the other return headers it could be handled in this template.
Req Param:    TargetNode - element name that is being retrived
Opt Param:    BackupName - that is to be used for PopulateCheckbox and PopulateLabel templates.
Called By:    Stylesheets
Calls:        PopulateCheckbox, PopulateText,PopulateSSN,PopulateLabel
Log:
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateReturnHeaderPreparer">
  <xsl:param name="TargetNode" select="."/> 
  <xsl:param name="BackupName" />    
  <xsl:if test="$Location = 'RET' ">
  <xsl:choose>
	<xsl:when test="$Type='720' or $Type='2290' or $Type='8849'">
	<xsl:choose>
      <xsl:when test="$TargetNode ='SSN'">
        <xsl:if test="$RtnHdrData/Preparer/SSN">
          <xsl:call-template name="PopulateSSN">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/Preparer/SSN"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:when>
      <xsl:when test="$TargetNode ='PTIN'">
        <xsl:if test="$RtnHdrData/Preparer/PTIN">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/Preparer/PTIN"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:when>
       <xsl:when test="$TargetNode ='EIN'">
        <xsl:if test="$RtnHdrData/Preparer/EIN">
          <xsl:call-template name="PopulateEIN">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/Preparer/EIN"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:when>           
      <xsl:when test="$TargetNode ='Phone'">
        <xsl:if test="$RtnHdrData/Preparer/Phone">
          <xsl:call-template name="PopulatePhoneNumber">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/Preparer/Phone"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:when>
      <xsl:when test="$TargetNode ='ForeignPhone'">
        <xsl:if test="$RtnHdrData/Preparer/ForeignPhone">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/Preparer/ForeignPhone"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:when>
      <xsl:when test="$TargetNode ='SelfEmployedCheckbox'">
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/Preparer/SelfEmployed"/>
          <xsl:with-param name="BackupName"><xsl:value-of select="$BackupName"/></xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode ='SelfEmployedLabel'">
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/Preparer/SelfEmployed"/>
          <xsl:with-param name="BackupName"><xsl:value-of select="$BackupName"/></xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode = 'Name' ">
		  <xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$RtnHdrData/Preparer/Name"/>
		  </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode = 'BusinessName' ">
		  <xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$RtnHdrData/Preparer/Name"/>
		  </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode = 'EmailAddress' ">
		  <xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$RtnHdrData/Preparer/EmailAddress"/>
		  </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode = 'DatePrepared' ">
		  <xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$RtnHdrData/Preparer/DatePrepared"/>
		  </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
      <!-- This clause handles all other elements such as 'Name','EmailAddress','DatePrepared'-->
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/Preparer//*[name(.)=$TargetNode]" />
        </xsl:call-template>
      </xsl:otherwise>      
    </xsl:choose>
	</xsl:when>
	<xsl:otherwise>			
    <xsl:choose>
      <xsl:when test="$TargetNode ='SSN'">
        <xsl:if test="$RtnHdrData/PreparerPersonGrp/SSN">
          <xsl:call-template name="PopulateSSN">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/SSN"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:when>
      <xsl:when test="$TargetNode ='PTIN'">
        <xsl:if test="$RtnHdrData/PreparerPersonGrp/PTIN">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/PTIN"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:when>
       <xsl:when test="$TargetNode ='EIN'">
        <xsl:if test="$RtnHdrData/PreparerPersonGrp/EIN">
          <xsl:call-template name="PopulateEIN">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/EIN"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:when>           
      <xsl:when test="$TargetNode ='Phone'">
        <xsl:if test="$RtnHdrData/PreparerPersonGrp/PhoneNum">
          <xsl:call-template name="PopulatePhoneNumber">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/PhoneNum"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:when>
      <xsl:when test="$TargetNode ='ForeignPhone'">
        <xsl:if test="$RtnHdrData/PreparerPersonGrp/ForeignPhoneNum">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/ForeignPhoneNum"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:when>
      <xsl:when test="$TargetNode ='SelfEmployedCheckbox'">
        <xsl:call-template name="PopulateCheckbox">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/SelfEmployedInd"/>
          <xsl:with-param name="BackupName"><xsl:value-of select="$BackupName"/></xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode ='SelfEmployedLabel'">
        <xsl:call-template name="PopulateLabel">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/SelfEmployedInd"/>
          <xsl:with-param name="BackupName"><xsl:value-of select="$BackupName"/></xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode = 'Name' ">
		  <xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/PreparerPersonNm"/>
		  </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode = 'EmailAddress' ">
		  <xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/EmailAddressTxt"/>
		  </xsl:call-template>
      </xsl:when>
      <xsl:when test="$TargetNode = 'DatePrepared' ">
		  <xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp/PreparationDt"/>
		  </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
      <!-- This clause handles all other elements such as 'Name','EmailAddress','DatePrepared'-->
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerPersonGrp//*[name(.)=$TargetNode]" />
        </xsl:call-template>
      </xsl:otherwise>      
    </xsl:choose>
    </xsl:otherwise>
	</xsl:choose>    
  </xsl:if>
</xsl:template>
  
  
<!--
***************************************************************************************************************************************************************
Name:         PopulateReturnHeaderPreparerFirm
Description:  Populates the return header Preparer Firm information.  Currently Preparer Firm information exists only for the consolidated return header.  If ever the need occurs for the Preparer Firm information in the other return headers it could be handled in this template.
Req Param:    TargetNode - element name that is being retrived.
Opt Param:    BackupName - that is to be used for PopulateCheckbox and PopulateLabel templates.
Called By:    Stylesheets
Calls:        PopulateText,PopulateEIN,PopulateCityStateInfo
Log:
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateReturnHeaderPreparerFirm">
  <xsl:param name="TargetNode" select="."/>  
  <xsl:param name="BackupName" />    
  <xsl:if test="$Location='RET'"> <!-- Indicating the element needs to be pulled from consolidated return header-->
  <xsl:choose>
	<xsl:when test="$Type='720' or $Type='2290' or $Type='8849'">
	<xsl:choose>
      <xsl:when test="$TargetNode = 'EIN' ">
        <xsl:call-template name="PopulateEIN">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerFirm/EIN" />
        </xsl:call-template>        
      </xsl:when>
      <xsl:when test="$TargetNode = 'MissingEINReason' ">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerFirm/MissingEINReason" />
        </xsl:call-template>        
      </xsl:when>
      <xsl:when test="$TargetNode='CityStateInfo' ">
        <xsl:call-template name="PopulateCityStateInfo">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerFirm/PreparerFirmUSAddress" />
          <xsl:with-param name="ForeignAddressTargetNode" select="$RtnHdrData/PreparerFirm/PreparerFirmForeignAddress" />          
        </xsl:call-template>
      </xsl:when>              
      <xsl:when test="$TargetNode = 'CountryCd' ">
          <xsl:if test="$RtnHdrData/PreparerFirm/PreparerFirmForeignAddress">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerFirm/PreparerFirmForeignAddress/CountryCd" />
            </xsl:call-template>
          </xsl:if>
        </xsl:when>
      <xsl:when test="$TargetNode = 'PreparerFirmBusinessName' ">
		  <xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerFirm/PreparerFirmBusinessName" />
		  </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
      <!-- This clause handles all other elements such as 'PreparerFirmBusinessName'-->
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerFirm//*[name(.)=$TargetNode]" />
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
	</xsl:when>
	<xsl:otherwise>	
    <xsl:choose>
      <xsl:when test="$TargetNode = 'EIN' ">
        <xsl:call-template name="PopulateEIN">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerFirmGrp/PreparerFirmEIN" />
        </xsl:call-template>        
      </xsl:when>
      <xsl:when test="$TargetNode = 'MissingEINReason' ">
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerFirmGrp/MissingEINReasonCd" />
        </xsl:call-template>        
      </xsl:when>
      <xsl:when test="$TargetNode='CityStateInfo' ">
        <xsl:call-template name="PopulateCityStateInfo">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerFirmGrp/PreparerUSAddress" />
          <xsl:with-param name="ForeignAddressTargetNode" select="$RtnHdrData/PreparerFirmGrp/PreparerForeignAddress" />          
        </xsl:call-template>
      </xsl:when>              
      <xsl:when test="$TargetNode = 'CountryCd' ">
          <xsl:if test="$RtnHdrData/PreparerFirmGrp/PreparerForeignAddress">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerFirmGrp/PreparerForeignAddress/CountryCd" />
            </xsl:call-template>
          </xsl:if>
        </xsl:when>
      <xsl:when test="$TargetNode = 'PreparerFirmBusinessName' ">
		  <xsl:call-template name="PopulateText">
			  <xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerFirmGrp/PreparerFirmName" />
		  </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
      <!-- This clause handles all other elements such as 'PreparerFirmBusinessName'-->
        <xsl:call-template name="PopulateText">
          <xsl:with-param name="TargetNode" select="$RtnHdrData/PreparerFirmGrp//*[name(.)=$TargetNode]" />
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
    </xsl:otherwise>
	</xsl:choose>
  </xsl:if>
</xsl:template>


<!--
***************************************************************************************************************************************************************
Name:           FormTitle
Description:  
Req Param:  
Opt Param:   
Called By:     
Calls:            
Log:
***************************************************************************************************************************************************************
-->
  <xsl:template name="FormTitle">
    <xsl:param name="RootElement"></xsl:param>
    <xsl:param name="TY" select="'TY '"></xsl:param>
    <xsl:param name="Form" select="' Form '"></xsl:param>
    <xsl:param name="Schedule" select="' Schedule '"></xsl:param>
    <xsl:param name="AMT" select="' AMT'"></xsl:param>
    <xsl:param name="POL" select="'-POL'"></xsl:param>
    <xsl:param name="K1" select="'K-1'"></xsl:param>
    <xsl:param name="Year" select="substring($Version,1,4)"></xsl:param>
    <xsl:param name="Name" select="substring-after($RootElement, 'IRS')"></xsl:param>    
    <xsl:param name="BeforeSchedule" select="substring-before($Name, 'Schedule')"></xsl:param>
    <xsl:param name="AfterSchedule" select="substring-after($Name, 'Schedule')"></xsl:param>
    <xsl:param name="BeforeAMT" select="substring-before($Name, 'AMT')"></xsl:param>
    <xsl:param name="BeforePOL" select="substring-before($Name, 'POL')"></xsl:param>
    
    <xsl:choose>
      <xsl:when test="contains($Name, 'Schedule')">
        <xsl:choose>
          <xsl:when test="$AfterSchedule = 'K1'">
            <xsl:value-of select="concat($TY, $Year, $Form, $BeforeSchedule, $Schedule, $K1)"></xsl:value-of>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="concat($TY, $Year, $Form, $BeforeSchedule, $Schedule, $AfterSchedule)"></xsl:value-of>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:when test="contains($Name, 'AMT')">
        <xsl:value-of select="concat($TY, $Year, $Form, $BeforeAMT, $AMT)"></xsl:value-of>
      </xsl:when>
      <xsl:when test="contains($Name, 'POL')">
        <xsl:value-of select="concat($TY, $Year, $Form, $BeforePOL, $POL)"></xsl:value-of>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="concat($TY, $Year, $Form, $Name)"></xsl:value-of>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


<!--
***************************************************************************************************************************************************************
Name:         InitJS
Description:  Defines all javascript functions to run when the stylesheet is loaded into the browser
Req Param:    none
Opt Param:    none
Called By:    Stylesheets
Calls:        none
Log:
***************************************************************************************************************************************************************
-->
<xsl:template name="InitJS">  
  <!-- Load only when the Print parameter is empty -->
  <xsl:if test="not($Print) or $Print=''">
    <script>
      //Jessica: move variable and function to global level for referece by postRtnIndexDocByxpath() from ReturnTree   
      var rtnTree = top.ReturnTree;
      var rtnLocation = '<xsl:value-of select="$Location"/>';   
      var rtnLocationSeq = '<xsl:value-of select="/AppData/Parameters/LocationSeq"/>';       
      var ackErrorHiLited = '';
      var myDocId = '<xsl:value-of select="$DocId" />';
      var myDisplayName = "<xsl:value-of select="$DisplayName" />";
      var myRegulation = "<xsl:value-of select='$Regulation' />";
      <xsl:variable name="myDocName" select="/AppData/SubmissionHeaderAndDocument/SubmissionDocument/child::*[1]/@documentName" />
      <xsl:variable name="myPrintName" select="name(/AppData/SubmissionHeaderAndDocument/SubmissionDocument/child::*[1])" />
      <xsl:variable name="isLandscapeDoc" select="document('PrintMode.xml')/PrintMode/Landscape/Document[@documentName = $myDocName]" />
      var myDocName = '<xsl:value-of select="$myDocName" />';
      var myPrintName = '<xsl:value-of select="$myPrintName" />';
      var myNotInDBIndicator = '<xsl:value-of select="/AppData/Parameters/NotInDBIndicator" />'; 
      var myStartPosition = '<xsl:value-of select="/AppData/Parameters/StartPosition" />';
      var myDocumentLength = '<xsl:value-of select="/AppData/Parameters/DocumentLength" />';
      var myDocumentSequenceNumber = '<xsl:value-of select="/AppData/Parameters/DocumentSequenceNumber" />';
      var isLandscapeDoc = '<xsl:value-of select="$isLandscapeDoc/@documentName" />';
      var K1SeqNum = "<xsl:value-of select="$K1SeqNum" />";
      if (K1SeqNum != "" &amp;&amp; K1SeqNum != 0) {
        rtnTree.setK1SequenceNumber(K1SeqNum);
      }
      var submissionType = '<xsl:value-of select="/AppData/Parameters/SubmissionType" />';
      if (((submissionType == '1040PR') &amp;&amp; (myPrintName == 'IRS1040SSPR')) || 
          ((submissionType == '940PR') &amp;&amp; (myPrintName == 'IRS940_940PR')) ||
          ((submissionType == '941PR') &amp;&amp; (myPrintName == 'IRS941SSPR')) ||
          ((submissionType == '941PR') &amp;&amp; (myPrintName == 'IRS941ScheduleB')) ||
          ((submissionType == '943PR') &amp;&amp; (myPrintName == 'IRS943_943PR'))) {
              var language = '<xsl:value-of select="/AppData/Parameters/Language" />';
              myPrintName = myPrintName + language;
      } 

      function locateError(thisID) {
        var elementFound = false;          
        clearHiLite();
        var docIndex = thisID.indexOf(myDocName);
        var pos1 = docIndex + myDocName.length;
        var leftBracket = thisID.charAt(pos1);
        if(leftBracket == '[') {
          var pos2 = thisID.indexOf(']', pos1);
          thisID = thisID.substring(0, (pos1 + 1)) + "1" + thisID.substring(pos2);
        }
        elementFound = rtnTree.chgFieldBgColor(parent.frames['FormDisplayArea'].document, thisID, '<xsl:value-of select="$UserPref/View/ErrorFieldBgColor"/>', 0, '', '');                                                                              
        ackErrorHiLited = thisID;
        return elementFound;
      }    
    
      function clearHiLite() {
        if (ackErrorHiLited == '') return;
        rtnTree.chgFieldBgColor(parent.frames['FormDisplayArea'].document, ackErrorHiLited, 'transparent', -1, '', ''); 
        ackErrorHiLited = '';   
      }   
    </script>
    <script language="JavaScript" type="text/javascript" for="window" event="onload">
  
      //Function defined in the Return Tree. Call this function to indicate that the form has been loaded in the Form Viewer Frame.
      top.ReturnTree.formLoadedInFrame();           
        
      // scroll to the field pointed to in XPath.    
      var xpath = '<xsl:value-of select="$XPath"/>';              
    
      if (xpath != '') rtnTree.postRtnIndexDoc('<xsl:value-of select="$DocId"/>', 'errorAck', '');
     
      if (xpath != '' &amp;&amp; rtnTree.ackErrorHiLited == '') { //Jessica: see associated code in ReturnTreeBase.xsl      
        locateError(rtnTree.transformXPath(xpath));            
      } 
      else if (xpath != '' &amp;&amp; rtnTree.ackErrorHiLited != '') {      
        locateError(rtnTree.ackErrorHiLited);      
      }
    
      if (document.getElementById(rtnTree.attachPushPin) != null) {    
        if (rtnTree.attachPushPin != '') {
          document.getElementById(rtnTree.attachPushPin).scrollIntoView()
          rtnTree.attachPushPin = ''
        }  
      }    
    </script>
  </xsl:if>  
</xsl:template>


<!--
***************************************************************************************************************************************************************
Name:         GlobalStylesForm
Description:  Links to the common CSS styles for all PDF-lookalike stylesheets when displaying in the browser.  When printing, these
               styles are linked in a different manner to insure a proper printout.
Req Param:    none
Opt Param:    none
Called By:    Stylesheets
Calls:        none
Log:
***************************************************************************************************************************************************************
-->
<xsl:template name="GlobalStylesForm">  
  <!-- If the Print parameter is empty -->

<!--  <xsl:if test="not(string($Print))">-->

    <link rel="stylesheet" type="text/css" name="HeaderStyleSheet" href="{$CSSPath}/header.css"/>
    <link rel="stylesheet" type="text/css" name="BodyStyleSheet" href="{$CSSPath}/body.css"/>
    <link rel="stylesheet" type="text/css" name="General" href="{$CSSPath}/general.css"/>

  <!--</xsl:if>-->

</xsl:template>


<!--
***************************************************************************************************************************************************************
Name:         GlobalStylesDep
Description:  Links to the common CSS styles for all dependency stylesheets when displaying in the browser.  When printing, these
                      styles are linked in a different manner to insure a proper printout.
Req Param:    none
Opt Param:    none
Called By:    Stylesheets
Calls:        none
Log:
***************************************************************************************************************************************************************
-->
<xsl:template name="GlobalStylesDep">  
  <!-- If the Print parameter is empty -->
 <!-- <xsl:if test="not(string($Print))">-->
    <link rel="stylesheet" type="text/css" name="HeaderStyleSheet" href="{$CSSPath}/header.css"/>
 <!-- </xsl:if>-->  
</xsl:template>


<!--
***************************************************************************************************************************************************************
Name:           SetInitialState
Description:    Template for setting the print state of the table, print mode is activated when the print param is not empty
Req Param:  
Opt Param:   
Called By:      Stylesheets
Calls:          none
Log:       
***************************************************************************************************************************************************************
-->
  <xsl:template name="SetInitialState">
    <xsl:if test="($Print='inline' or $Print='separated')">
      <xsl:attribute name="style">overflow:visible</xsl:attribute>
    </xsl:if>
  </xsl:template>
  
  
<!--
***************************************************************************************************************************************************************
Name:           SetTableToggleButton
Description:    Template for calling the functions necessary to display the table in expanded, collapsed, or print display formats.
                In collapsed mode, the table height is set to the static page-defined height
Req Param:  
Opt Param:   
Called By:      Stylesheets
Calls:          none
Log:
***************************************************************************************************************************************************************
-->
  <xsl:template name="SetTableToggleButton">
    <xsl:param name="TargetNode"/>
    <xsl:param name="containerHeight"/>
    <!-- this is an integer in number of rows -->
    <xsl:param name="containerID"/>
    <xsl:param name="imageID"><xsl:value-of select="$containerID"/>image</xsl:param>
    <xsl:param name="buttonID"><xsl:value-of select="$containerID"/>button</xsl:param>
    <xsl:param name="Jfunc">toggle('<xsl:value-of select="$containerID"/>', '<xsl:value-of select="$imageID"/>', '<xsl:value-of select="$buttonID"/>');</xsl:param>
    <xsl:param name="overflowed" select="count($TargetNode)&gt;$containerHeight"/>
    <xsl:if test="$overflowed and (not($Print) or $Print='')">
      <button style="width:15px;height:14px;cursor:hand;" TabIndex="1" title="Click here to expand table">
        <xsl:attribute name="id"><xsl:value-of select="$buttonID"/></xsl:attribute>
        <xsl:attribute name="onclick"><xsl:value-of select="$Jfunc"/></xsl:attribute>
        <img src="{$NonVersionedImagePath}/expand.gif" width="7" height="8" alt="Click here to expand table" border="0" align="top">
          <xsl:attribute name="id"><xsl:value-of select="$imageID"/></xsl:attribute>
        </img>
      </button>
    </xsl:if>
  </xsl:template>

 
 <!--
***************************************************************************************************************************************************************
Name:           SetDynamicTableToggleButton
Description:    Alternate template for calling the functions necessary to display the table in expanded, collapsed, or print display formats. 
                In collapsed mode, the table height is set to the actual height of the first x rows, where x is the number of rows to be displayed.
Req Param:  
Opt Param:   
Called By:      Stylesheets
Calls:          none
Log:
***************************************************************************************************************************************************************
-->
  <xsl:template name="SetDynamicTableToggleButton">
    <xsl:param name="TargetNode"/>
    <!-- containerHeight is the number of rows to be displayed in collapsed table form-->
    <xsl:param name="containerHeight"/> 
    <!-- headerHeight is the number of rows in the header. Default is 1. -->
    <xsl:param name="headerHeight">1</xsl:param>
    <xsl:param name="containerID"/>
    <xsl:param name="imageID"><xsl:value-of select="$containerID"/>image</xsl:param>
    <xsl:param name="buttonID"><xsl:value-of select="$containerID"/>button</xsl:param>
    <xsl:param name="headerRowCount"><xsl:value-of select="$headerHeight"/></xsl:param>
    <xsl:param name="displayRowCount"><xsl:value-of select="$containerHeight"/></xsl:param>    
    <xsl:param name="Jfunc">dynamicHeightToggle('<xsl:value-of select="$containerID"/>', '<xsl:value-of select="$imageID"/>', '<xsl:value-of select="$buttonID"/>', '<xsl:value-of select="$headerRowCount"/>', '<xsl:value-of select="$displayRowCount"/>');</xsl:param>
    <xsl:param name="overflowed" select="count($TargetNode)&gt;$containerHeight"/>
    <xsl:if test="$overflowed and (not($Print) or $Print='')">
      <button style="width:15px;height:14px;cursor:hand;" TabIndex="1" title="Click here to expand table">
        <xsl:attribute name="id"><xsl:value-of select="$buttonID"/></xsl:attribute>
        <xsl:attribute name="onclick"><xsl:value-of select="$Jfunc"/></xsl:attribute>
        <img src="{$NonVersionedImagePath}/expand.gif" width="7" height="8" alt="Click here to expand table" border="0" align="top">
          <xsl:attribute name="id"><xsl:value-of select="$imageID"/></xsl:attribute>
        </img>
      </button>
    </xsl:if>
  </xsl:template>
  

<!--  
***************************************************************************************************************************************************************
Name:           SetDynamicTableToggleRowCount
Description:    A variation of the template SetDynamicTableToggleButton that takes in the row count instead of a node set.
                Use this template when passing in the number of rows in the table, usually used with SetInitialDynamicTableHeightRowCount.
Req Param:  
Opt Param:   
Called By:      Stylesheets
Calls:          none
Log:
***************************************************************************************************************************************************************
-->
  <xsl:template name="SetDynamicTableToggleRowCount">
    <xsl:param name="DataRowCount"/>
    <!-- containerHeight is the number of rows to be displayed in collapsed table form-->
    <xsl:param name="containerHeight"/> 
    <!-- headerHeight is the number of rows in the header. Default is 1. -->
    <xsl:param name="headerHeight">1</xsl:param>
    <xsl:param name="containerID"/>
    <xsl:param name="imageID"><xsl:value-of select="$containerID"/>image</xsl:param>
    <xsl:param name="buttonID"><xsl:value-of select="$containerID"/>button</xsl:param>
    <xsl:param name="headerRowCount"><xsl:value-of select="$headerHeight"/></xsl:param>
    <xsl:param name="displayRowCount"><xsl:value-of select="$containerHeight"/></xsl:param>    
    <xsl:param name="Jfunc">dynamicHeightToggle('<xsl:value-of select="$containerID"/>', '<xsl:value-of select="$imageID"/>', '<xsl:value-of select="$buttonID"/>', '<xsl:value-of select="$headerRowCount"/>', '<xsl:value-of select="$displayRowCount"/>');</xsl:param>
    <xsl:param name="overflowed" select="$DataRowCount&gt;$containerHeight"/>
    <xsl:if test="$overflowed and (not($Print) or $Print='')">
      <button style="width:15px;height:14px;cursor:hand;" TabIndex="1" title="Click here to expand table">
        <xsl:attribute name="id"><xsl:value-of select="$buttonID"/></xsl:attribute>
        <xsl:attribute name="onclick"><xsl:value-of select="$Jfunc"/></xsl:attribute>
        <img src="{$NonVersionedImagePath}/expand.gif" width="7" height="8" alt="Click here to expand table" border="0" align="top">
          <xsl:attribute name="id"><xsl:value-of select="$imageID"/></xsl:attribute>
        </img>
      </button>
    </xsl:if>
  </xsl:template>   
  
  
<!--
***************************************************************************************************************************************************************
Name:           SetInitialDynamicTableHeight
Description:    Template that sets the display settings of an expandable table when the SetDynamicTableToggleButton template is being used. 
Req Param:  
Opt Param:   
Called By:      Stylesheets
Calls:          none
Log:
***************************************************************************************************************************************************************
-->
  <xsl:template name="SetInitialDynamicTableHeight">
    <xsl:param name="TargetNode"/>
    <!-- containerHeight is the number of rows to be displayed in collapsed table form-->
    <xsl:param name="containerHeight"/> 
    <!-- headerHeight is the number of rows in the header. Default is 1. -->
    <xsl:param name="headerHeight">1</xsl:param>
    <xsl:param name="containerID"/>
    <xsl:param name="headerRowCount"><xsl:value-of select="$headerHeight"/></xsl:param>
    <xsl:param name="displayRowCount"><xsl:value-of select="$containerHeight"/></xsl:param>    
    <xsl:param name="setDynamicHeight" select="count($TargetNode)&gt;$containerHeight"/>
    <xsl:param name="Jfunc">setInitialDynamicTableHeight('<xsl:value-of select="$containerID"/>', '<xsl:value-of select="$headerRowCount"/>', '<xsl:value-of select="$displayRowCount"/>', '<xsl:value-of select="$setDynamicHeight"/>');</xsl:param>
    <xsl:if test="(not($Print) or $Print='' or $Print='separated')">
      <script language="JavaScript" type="text/javascript"><xsl:value-of select="$Jfunc"/></script>
    </xsl:if>
  </xsl:template>
  
  
<!--
***************************************************************************************************************************************************************
Name:           SetInitialDynamicTableHeightRowCount
Description:    A variation of the template SetInitialDynamicTableHeight that takes in the row count instead of a node set.
                Use this template when passing in the number of rows in the table, usually used with SetDynamicTableToggleRowCount.
Req Param:  
Opt Param:   
Called By:      Stylesheets
Calls:          none
Log:
***************************************************************************************************************************************************************
-->
 <xsl:template name="SetInitialDynamicTableHeightRowCount">
    <xsl:param name="DataRowCount"/>
    <!-- containerHeight is the number of rows to be displayed in collapsed table form-->
    <xsl:param name="containerHeight"/> 
    <!-- headerHeight is the number of rows in the header. Default is 1. -->
    <xsl:param name="headerHeight">1</xsl:param>
    <xsl:param name="containerID"/>
    <xsl:param name="headerRowCount"><xsl:value-of select="$headerHeight"/></xsl:param>
    <xsl:param name="displayRowCount"><xsl:value-of select="$containerHeight"/></xsl:param>    
    <xsl:param name="setDynamicHeight" select="$DataRowCount&gt;$containerHeight"/>
    <xsl:param name="Jfunc">setInitialDynamicTableHeight('<xsl:value-of select="$containerID"/>', '<xsl:value-of select="$headerRowCount"/>', '<xsl:value-of select="$displayRowCount"/>', '<xsl:value-of select="$setDynamicHeight"/>');</xsl:param>
    <xsl:if test="(not($Print) or $Print='')">
      <script language="JavaScript" type="text/javascript"><xsl:value-of select="$Jfunc"/></script>
    </xsl:if>
  </xsl:template>  
  
  
<!--
***************************************************************************************************************************************************************
Name:           SetFormLinkInlineRRD (RRD version)
Description:    Template to display the form link image (usually pushpin image); image is displayed inline (normally) using img tags
Req Param:  
Opt Param:   
Called By:      Stylesheets
Calls:          none
Log:
***************************************************************************************************************************************************************
-->
  <xsl:template name="SetFormLinkInlineRRD">
    <xsl:param name="TargetNode"/>
    <xsl:param name="TabOrder">1</xsl:param>
    <xsl:param name="IDstring">
    <!--xsl:value-of select="name($TargetNode)"/-->
    <xsl:text/><xsl:call-template name="PopulateID">
      <xsl:with-param name="TargetNode" select="$TargetNode"/>
    </xsl:call-template>/@referenceDocumentId<xsl:text/>  
    </xsl:param>
    <xsl:param name="HeaderColor"><xsl:value-of select="$UserPref/View/TableHeaderBgColor" /></xsl:param>
    <xsl:param name="OddRowColor"><xsl:value-of select="$UserPref/View/TableRow1BgColor" /></xsl:param>
    <xsl:param name="EvenRowColor"><xsl:value-of select="$UserPref/View/TableRow2BgColor" /></xsl:param>
    <xsl:param name="ColorSchema">
       <xsl:value-of select="$UserPref/View/TableHeaderBgColor" />,<xsl:value-of select="$UserPref/View/TableRow1BgColor" />,<xsl:value-of select="$UserPref/View/TableRow2BgColor" />
     </xsl:param>

    <!-- do nothing if for printing -->
    <!--xsl:if test="not($Print) or $Print=''"-->
    <xsl:if test="($TargetNode/@referenceDocumentId) and not($TargetNode/@referenceDocumentId='')">
      <img src="{$NonVersionedImagePath}/attach.gif" style="cursor:auto;">
        <xsl:attribute name="alt">Click to see attachment</xsl:attribute>
        <xsl:if test="contains(normalize-space($TargetNode/@referenceDocumentId), ' ')">
        <!-- assume more then one attachments exist when the string contains space-->
          <xsl:attribute name="alt">Click to see list of attachments</xsl:attribute>
        </xsl:if>
        <xsl:attribute name="TabIndex">
          <xsl:value-of select="$TabOrder"/>
        </xsl:attribute>
        <xsl:attribute name="id">          
      <xsl:value-of select="$IDstring"/>    
        </xsl:attribute>
  <xsl:if test="not($Print) or $Print=''">  
    <xsl:attribute name="style">cursor:hand;</xsl:attribute>
     <xsl:attribute name="onclick">rtnTree.attachPushPin = '<xsl:value-of select="$IDstring"/>'; showAttachedDocs("<xsl:value-of select="$IDstring"/>", "<xsl:value-of select="$ColorSchema"/>", "<xsl:value-of select="$TargetNode/@referenceDocumentId"/>");</xsl:attribute>
    <xsl:attribute name="onkeypress">rtnTree.attachPushPin = '<xsl:value-of select="$IDstring"/>'; showAttachedDocs("<xsl:value-of select="$IDstring"/>", "<xsl:value-of select="$ColorSchema"/>", "<xsl:value-of select="$TargetNode/@referenceDocumentId"/>");</xsl:attribute>
  </xsl:if> 
      </img>
    </xsl:if>
    <!--/xsl:if-->
  </xsl:template>  
  
  <!--
***************************************************************************************************************************************************************
Name: SetFormLinkInline
Description: Template to display the form link image (usually pushpin image); image is displayed inline (normally) using img tags
Req Param:
Opt Param:
Called By: Stylesheets
Calls: SendRef() java script function (requires addition of this script to script file)
Log: - Mike Farrell - This is a Modification of the original by Charles Moore
***************************************************************************************************************************************************************
-->
<xsl:template name="SetFormLinkInline">
<xsl:param name="TargetNode"/>
<!-- do nothing if for printing -->
<!--xsl:if test="not($Print) or $Print=''"-->
<xsl:if test="($TargetNode/@referenceDocumentId) and not($TargetNode/@referenceDocumentId='')">
<img src="{$NonVersionedImagePath}/attach.gif" style="cursor:auto;">
<xsl:attribute name="alt">Click to see attachment</xsl:attribute>
<xsl:if test="contains(normalize-space($TargetNode/@referenceDocumentId), ' ')">
<!-- assume more then one attachments exist when the string contains space -->
<xsl:attribute name="alt">Click to see list of attachments</xsl:attribute>
</xsl:if>
<xsl:if test="not($Print) or $Print=''">
<xsl:attribute name="style">cursor:hand;</xsl:attribute>
<xsl:attribute name="onclick">SendRef('<xsl:value-of select="$TargetNode/@referenceDocumentId"/>')</xsl:attribute>
</xsl:if>
</img>
</xsl:if>
<!--/xsl:if-->
</xsl:template>
  
  
  


  
<!--
***************************************************************************************************************************************************************
Name:           LinkToLeftoverBooleanDataTableInline
Description:    Template to handle left-over data with boolean values with image that is displayed inline using absolute position
Req Param:  
Opt Param:   
Called By:     
Calls:            
Log:
***************************************************************************************************************************************************************
-->
  <xsl:template name="LinkToLeftoverBooleanDataTableInline">
    <xsl:param name="Desc"></xsl:param>
    <xsl:param name="TargetNode"></xsl:param>    
    <xsl:param name="TabOrder">1</xsl:param>

    <!-- do nothing if for printing -->
    <!--xsl:if test="not($Print) or $Print=''" Commented to print pen images Ravi Venigalla 09/14/04-->
      <xsl:if test="($TargetNode or $TargetNode!='')">                  
          <xsl:choose>
            <xsl:when test="count($TargetNode) &gt; 1">
              <img src="{$NonVersionedImagePath}/pen.gif" alt="See additional data table" TabIndex="{$TabOrder}" style="cursor:hand;" onclick="this.id =window.event.x + 'and' +     window.event.y;goToLeftoverDataTable( this.id );"  onkeypress="this.id =window.event.x + 'and' + window.event.y;goToLeftoverDataTable( this.id );"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:if test="($TargetNode = 1) or ($TargetNode='true')">
                <img src="{$NonVersionedImagePath}/pen.gif" alt="{$Desc}: yes" TabIndex="{$TabOrder}" style="cursor:hand;" onclick="this.id =window.event.x + 'and' +     window.event.y;goToLeftoverDataTable( this.id );"  onkeypress="this.id =window.event.x + 'and' + window.event.y;goToLeftoverDataTable( this.id );"/>
              </xsl:if>
              <xsl:if test="($TargetNode = 0) or ($TargetNode='false')">
                <img src="{$NonVersionedImagePath}/pen.gif" alt="{$Desc}: no" TabIndex="{$TabOrder}" style="cursor:hand;" onclick="this.id =window.event.x + 'and' +     window.event.y;goToLeftoverDataTable( this.id );"  onkeypress="this.id =window.event.x + 'and' + window.event.y;goToLeftoverDataTable( this.id );"/>
             </xsl:if>
            </xsl:otherwise>
          </xsl:choose>        
      </xsl:if>
    <!--/xsl:if-->
  </xsl:template>

<!--
***************************************************************************************************************************************************************
Name:           LinkToLeftoverCheckboxDataTableInline
Description:    Template to handle left-over data with checkbox values with image that is displayed inline using absolute position
Req Param:  
Opt Param:   
Called By:     
Calls:            
Log:
***************************************************************************************************************************************************************
-->
  <xsl:template name="LinkToLeftoverCheckboxDataTableInline">
    <xsl:param name="Desc"></xsl:param>
    <xsl:param name="TargetNode"></xsl:param>    
    <xsl:param name="TabOrder">1</xsl:param>

    <!-- do nothing if for printing -->
    <!--xsl:if test="not($Print) or $Print=''" Commented to print pen images Chris Jung 11/24/04-->
      <xsl:if test="($TargetNode or $TargetNode!='')">                  
          <xsl:choose>
            <xsl:when test="count($TargetNode) &gt; 1">
              <img src="{$NonVersionedImagePath}/pen.gif" alt="See additional data table" TabIndex="{$TabOrder}" style="cursor:hand;" onclick="this.id =window.event.x + 'and' +     window.event.y;goToLeftoverDataTable( this.id );"  onkeypress="this.id =window.event.x + 'and' + window.event.y;goToLeftoverDataTable( this.id );"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:if test="($TargetNode='X')">
                <img src="{$NonVersionedImagePath}/pen.gif" alt="{$Desc}: Yes" TabIndex="{$TabOrder}" style="cursor:hand;" onclick="this.id =window.event.x + 'and' +     window.event.y;goToLeftoverDataTable( this.id );"  onkeypress="this.id =window.event.x + 'and' + window.event.y;goToLeftoverDataTable( this.id );"/>
              </xsl:if>
           </xsl:otherwise>
          </xsl:choose>        
      </xsl:if>
    <!--/xsl:if-->
  </xsl:template>

<!--
***************************************************************************************************************************************************************
Name:           LinkToLeftoverDataTableInline
Description:    Template to handle left-over data with image that is displayed inline (normally)
Req Param:  
Opt Param:   
Called By:     
Calls:            
Log:
***************************************************************************************************************************************************************
-->
  <xsl:template name="LinkToLeftoverDataTableInline">
    <xsl:param name="Desc"></xsl:param>
    <xsl:param name="TargetNode"></xsl:param>
    <xsl:param name="TabOrder">1</xsl:param>

    <!-- do nothing if for printing -->
    <!--xsl:if test="not($Print) or $Print=''" Commented to print pen images Ravi Venigalla 08/19/04-->
    <xsl:if test="($TargetNode or $TargetNode!='')">
        <xsl:choose>
          <xsl:when test="count($TargetNode) &gt; 1">
          <img src="{$NonVersionedImagePath}/pen.gif" alt="See additional data table" TabIndex="{$TabOrder}" style="cursor:hand;" onclick="this.id =window.event.x + 'and' + window.event.y;goToLeftoverDataTable( this.id );"  onkeypress="this.id =window.event.x + 'and' + window.event.y;goToLeftoverDataTable( this.id );"/>
          </xsl:when>
          <xsl:otherwise>
          <img src="{$NonVersionedImagePath}/pen.gif" alt="{$Desc}: {$TargetNode}" TabIndex="{$TabOrder}" style="cursor:hand;" onclick="this.id =window.event.x + 'and' + window.event.y;goToLeftoverDataTable( this.id );"  onkeypress="this.id =window.event.x + 'and' + window.event.y;goToLeftoverDataTable( this.id );"/>
          </xsl:otherwise>
        </xsl:choose>
    </xsl:if>
    <!--/xsl:if-->
  </xsl:template>  
  
<!--
***************************************************************************************************************************************************************
Name:         PopulateCommonLeftover
Description:  Displays the common leftover table elements.  If the form has separated repeating data, it displays the EIN and Name from
               the top of the form. This data comes from the ReturnHeader
Req Param:    TargetNode - Location of data
Opt Param:    DescWidth - Width of the description
              AmountWidth - Width of the amount - difference between 187 and the description width
Called By:    none  
Calls:        PopulateText, PopulateReturnHeaderFiler
Log:          2004-12-16 - Added Name and EIN for separated repeating data calls
              2009-05-11 - Added support to pull EIN or Primary SSN depending on current form family
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateCommonLeftover">
  <xsl:param name="TargetNode"/>
  <xsl:param name="DescWidth">100</xsl:param>
  <xsl:param name="AmountWidth" select="187 - $DescWidth"/>

  <br/>
  <tr>
    <td class="styLeftOverTableRowDesc" style="width:{$DescWidth}mm;" scope="row">Software ID:</td>  
    <td class="styLeftOverTableRowAmount" style="width:{$AmountWidth}mm;">
      <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$TargetNode/@softwareId"/></xsl:call-template>
    </td>                          
  </tr>
  <tr>
    <td class="styLeftOverTableRowDesc" style="width:{$DescWidth}mm;" scope="row">Software Version:</td>  
    <td class="styLeftOverTableRowAmount" style="width:{$AmountWidth}mm;">
      <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$TargetNode/@softwareVersionNum"/></xsl:call-template>
    </td>                          
  </tr>
  <xsl:if test="$Print = $Separated">
    <xsl:variable name="PrimarySSNExists">
      <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param></xsl:call-template>
    </xsl:variable>
    <xsl:variable name="SpouseSSNExists">
      <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param></xsl:call-template>
    </xsl:variable>    
    
    <xsl:choose>
      <xsl:when test="$PrimarySSNExists != ''"> <!-- Indicating that the Primary SSN should be displayed -->
        <tr>
          <td class="styLeftOverTableRowDesc" style="width:{$DescWidth}mm;" scope="row">SSN:</td>  
          <td class="styLeftOverTableRowAmount" style="width:{$AmountWidth}mm;">
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param></xsl:call-template>
          </td>
		</tr>
     
        <xsl:if test="$SpouseSSNExists != ''"> <!-- Indicating that the Spouse SSN should be displayed -->
          <tr>
          <td class="styLeftOverTableRowDesc" style="width:{$DescWidth}mm;" scope="row">Spouse SSN:</td>  
          <td class="styLeftOverTableRowAmount" style="width:{$AmountWidth}mm;">
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param></xsl:call-template>
          </td>
          </tr>
        </xsl:if>
        
      </xsl:when>
      <xsl:otherwise> <!-- Indicating that the EIN should be displayed -->
        <tr>
          <td class="styLeftOverTableRowDesc" style="width:{$DescWidth}mm;" scope="row">EIN:</td>  
          <td class="styLeftOverTableRowAmount" style="width:{$AmountWidth}mm;">
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">EIN</xsl:with-param></xsl:call-template>
          </td>                          
        </tr>
      </xsl:otherwise>
    </xsl:choose>
      
    <tr>
      <td class="styLeftOverTableRowDesc" style="width:{$DescWidth}mm;vertical-align:top;" scope="row">Name:</td>  
      <td class="styLeftOverTableRowAmount" style="width:{$AmountWidth}mm;">
        <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param></xsl:call-template><br />
        <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param></xsl:call-template>
      </td>                          
    </tr>
    
  </xsl:if>
  <br/>
</xsl:template> 


<!--
***************************************************************************************************************************************************************
Name:           PopulateCommonLeftoverLandscape
Description:    Template for displaying common leftover table elements  in landscape format
Req Param:  
Opt Param:   
Called By:      Stylesheets
Call:           PopulateText
Log:            2009-05-11 - Added support to pull EIN or Primary SSN depending on current form family
***************************************************************************************************************************************************************
--> 
<xsl:template name="PopulateCommonLeftoverLandscape">
  <xsl:param name="TargetNode"/>
  <xsl:param name="DescWidth">100</xsl:param>
  <xsl:param name="AmountWidth" select="256 - $DescWidth"/>

  <br/>
  <tr>
    <td class="styLeftOverTableRowDesc" style="width:{$DescWidth}mm;" scope="row">Software ID:</td>  
    <td class="styLeftOverTableRowAmount" style="width:{$AmountWidth}mm;">
      <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$TargetNode/@softwareId"/></xsl:call-template>
    </td>                          
  </tr>
  <tr>
    <td class="styLeftOverTableRowDesc" style="width:{$DescWidth}mm;" scope="row">Software Version:</td>  
    <td class="styLeftOverTableRowAmount" style="width:{$AmountWidth}mm;">
      <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$TargetNode/@softwareVersionNum"/></xsl:call-template>
    </td>                          
  </tr>
  <xsl:if test="$Print = $Separated">
    <xsl:variable name="PrimarySSNExists">
      <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param></xsl:call-template>
    </xsl:variable>
    <xsl:variable name="SpouseSSNExists">
      <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param></xsl:call-template>
    </xsl:variable>    

    <xsl:choose>
      <xsl:when test="$PrimarySSNExists != ''"> <!-- Indicating that the Primary SSN should be displayed -->
        <tr>
          <td class="styLeftOverTableRowDesc" style="width:{$DescWidth}mm;" scope="row">SSN:</td>  
          <td class="styLeftOverTableRowAmount" style="width:{$AmountWidth}mm;">
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param></xsl:call-template>
          </td>
       </tr>

        <xsl:if test="$SpouseSSNExists != ''"> <!-- Indicating that the Spouse SSN should be displayed -->
        <tr>
          <td class="styLeftOverTableRowDesc" style="width:{$DescWidth}mm;" scope="row">Spouse SSN:</td>  
          <td class="styLeftOverTableRowAmount" style="width:{$AmountWidth}mm;">
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param></xsl:call-template>
          </td>
       </tr>
        </xsl:if> 
 
      </xsl:when>
      <xsl:otherwise> <!-- Indicating that the EIN should be displayed -->
        <tr>
          <td class="styLeftOverTableRowDesc" style="width:{$DescWidth}mm;" scope="row">EIN:</td>  
          <td class="styLeftOverTableRowAmount" style="width:{$AmountWidth}mm;">
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">EIN</xsl:with-param></xsl:call-template>
          </td>                          
        </tr>
      </xsl:otherwise>
    </xsl:choose>
    <tr>
      <td class="styLeftOverTableRowDesc" style="width:{$DescWidth}mm;vertical-align:top;" scope="row">Name:</td>  
      <td class="styLeftOverTableRowAmount" style="width:{$AmountWidth}mm;">
        <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param></xsl:call-template><br />
        <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param></xsl:call-template>
      </td>                          
    </tr>
  </xsl:if>
  <br/>
</xsl:template>


<!--
***************************************************************************************************************************************************************
Name:           PopulateLeftoverRow
Description:    Template for displaying leftover table rows
Req Param:  
Opt Param:   
Called By:      Stylesheets
Calls:          PopulateText
Log:
***************************************************************************************************************************************************************
--> 
<xsl:template name="PopulateLeftoverRow">
  <xsl:param name="Desc"/>
  <xsl:param name="TargetNode"/>
  <xsl:param name="DescWidth">100</xsl:param>
  <xsl:param name="AmountWidth" select="187 - $DescWidth"/>

  <xsl:if test="$TargetNode">
    <tr>
      <td class="styLeftOverTableRowDesc" style="width:{$DescWidth}mm;" scope="row"><xsl:value-of select="$Desc"></xsl:value-of>:</td>  
      <td class="styLeftOverTableRowAmount" style="width:{$AmountWidth}mm;">
        <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$TargetNode"/></xsl:call-template>
      </td>                          
    </tr>
  </xsl:if>
</xsl:template>


<!--
***************************************************************************************************************************************************************
Name:           PopulateLeftoverRowAmount
Description:    Template for displaying leftover table rows with data that is an amount
Req Param:  
Opt Param:   
Called By:      Stylesheets
Calls:          PopulateAmount
Log:
***************************************************************************************************************************************************************
-->  
<xsl:template name="PopulateLeftoverRowAmount">
  <xsl:param name="Desc"/>
  <xsl:param name="TargetNode"/>
  <xsl:param name="DescWidth">100</xsl:param>
  <xsl:param name="AmountWidth" select="187 - $DescWidth"/>
  <xsl:if test="$TargetNode">
    <tr>
      <td class="styLeftOverTableRowDesc" style="width:{$DescWidth}mm;" scope="row"><xsl:value-of select="$Desc"></xsl:value-of>:</td>  
      <td class="styLeftOverTableRowAmount" style="width:{$AmountWidth}mm;">
        <xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="$TargetNode"/></xsl:call-template>
      </td>                          
    </tr>
  </xsl:if>
</xsl:template>


<!--
***************************************************************************************************************************************************************
Name:           PopulateLeftoverRowLandscape
Description:    Template for displaying landscape leftover table rows
Req Param:  
Opt Param:   
Called By:      Stylesheets
Calls:          PopulateText
Log:
***************************************************************************************************************************************************************
-->  
  <xsl:template name="PopulateLeftoverRowLandscape">
    <xsl:param name="Desc"/>
    <xsl:param name="TargetNode"/>
    <xsl:param name="DescWidth">100</xsl:param>
    <xsl:param name="AmountWidth" select="256 - $DescWidth"/>
    <xsl:if test="$TargetNode">
      <tr>
        <td class="styLeftOverTableRowDesc" style="width:{$DescWidth}mm;" scope="row"><xsl:value-of select="$Desc"></xsl:value-of>:</td>  
        <td class="styLeftOverTableRowAmount" style="width:{$AmountWidth}mm;">
          <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$TargetNode"/></xsl:call-template>
        </td>                          
      </tr>
    </xsl:if>
  </xsl:template>
  
<!--
***************************************************************************************************************************************************************
Name:           PopulateDepCommonLeftover
Description:    Template for displaying common leftover table elements for Dependencies
Req Param:  
Opt Param:   
Called By:     
Calls:          PopulateDepCommonLeftoverNameEIN, PopulateText 
Log:            2005-12-01 - Added formating for eliminating line spaces with pushpins
***************************************************************************************************************************************************************
-->
  <xsl:template name="PopulateDepCommonLeftover">
  <xsl:param name="TargetNode"/>
    <xsl:param name="NoGap">false</xsl:param>
    <xsl:call-template name="PopulateDepCommonLeftoverNameEIN">
     <xsl:with-param name="NoGap" select="$NoGap"/> 
    </xsl:call-template>
     
     <xsl:if test="(($TargetNode/@softwareId) or ($TargetNode/@softwareId != ''))">
      <div class="styTopSectionLine">
        <span class="styTopSectionLineLbl"> Software ID:</span>      
        <span style="font-size:10pt;">
          <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$TargetNode/@softwareId"/></xsl:call-template>          
        </span>  
      </div>      
    </xsl:if>
    <xsl:if test="(($TargetNode/@softwareVersionNum) or ($TargetNode/@softwareVersionNum != ''))">
      <div class="styTopSectionLine">
        <span class="styTopSectionLineLbl"> Software Version:</span>      
        <span style="font-size:10pt;">
          <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$TargetNode/@softwareVersionNum"/></xsl:call-template>        
        </span>    
      </div>            
    </xsl:if>
    <!-- Ku Lee 2003-10-07 changed the source for Regulation for Defect 2437-->
    <xsl:if test="$Regulation != ''">
      <div class="styTopSectionLine" style="width:187mm;">
        <div style="float:left;clear:none;"><span class="styTopSectionLineLbl"> Regulation:</span></div>
        <div style="float:left;clear:none;font-size:10pt;">
          <xsl:value-of select="$Regulation" />
        </div>
      </div>      
    </xsl:if>
  </xsl:template>
  

<!--
***************************************************************************************************************************************************************
Name:           PopulateDepCommonLeftoverNameEIN
Description:    Template for displaying Name and EIN on Dependencies for "Outstanding Stylesheet Issues"
Req Param:  
Opt Param:   
Called By:      PopulateDepCommonLeftover
Calls:          PopulateText, PopulateReturnHeaderFiler
Log:            2009-05-11 - Added support to pull EIN or Primary SSN depending on current form family
***************************************************************************************************************************************************************
-->
  <xsl:template name="PopulateDepCommonLeftoverNameEIN">
  <xsl:param name="NoGap">false</xsl:param>
  <xsl:if test="$NoGap = 'false'">
    <div style="height:20px;"></div>    
  </xsl:if>
    <div class="styTopSectionLine">
      <div class="styTopSectionLineLbl" style="float:left;clear:none;"> Name:</div>      
      <div style="font-size:10pt;float:left;clear:none;">        
        <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param></xsl:call-template>                  
      </div>    
    </div>
  
    <xsl:choose>
      <xsl:when test="$Location='PAR'"> <!-- Indicating that data should be pulled from parent return header -->
          <xsl:if test="$ParRtnHdrData/ParentCorpGrp/BusinessName/BusinessNameLine2Txt and $ParRtnHdrData/ParentCorpGrp/BusinessName/BusinessNameLine2Txt != '' ">
            <div class="styTopSectionLine">
              <div class="styTopSectionLineLbl" style="float:left;clear:none;"></div>      
              <div style="font-size:10pt;float:left;clear:none;">          
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$ParRtnHdrData/ParentCorpGrp/BusinessName/BusinessNameLine2Txt" />
                </xsl:call-template>
              </div>    
            </div>  
          </xsl:if>
      </xsl:when>
      <xsl:when test="$Location='SUB'"> <!-- Indicating that data should be pulled from subsidiary return header-->
          <xsl:if test="$SubRtnHdrData/SubsidiaryCorpGrp/BusinessName/BusinessNameLine2Txt and $SubRtnHdrData/SubsidiaryCorpGrp/BusinessName/BusinessNameLine2Txt != '' ">
            <div class="styTopSectionLine">
              <div class="styTopSectionLineLbl" style="float:left;clear:none;"></div>      
              <div style="font-size:10pt;float:left;clear:none;">          
                <xsl:call-template name="PopulateText">
                   <xsl:with-param name="TargetNode" select="$SubRtnHdrData/SubsidiaryCorpGrp/BusinessName/BusinessNameLine2Txt" />
                </xsl:call-template>
              </div>    
            </div>  
          </xsl:if>
      </xsl:when>
      <xsl:when test="$Type = '1041'">
          <xsl:if test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt and $RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt != '' ">
            <div class="styTopSectionLine">
              <div class="styTopSectionLineLbl" style="float:left;clear:none;"></div>      
              <div style="font-size:10pt;float:left;clear:none;">          
                <xsl:call-template name="PopulateText">
                   <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt" />
                </xsl:call-template>
              </div>    
            </div>  
          </xsl:if>
      </xsl:when>
      <xsl:otherwise> <!-- Indicating that data should be pulled from filer return header -->
          <xsl:if test="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt and $RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt != '' ">
            <div class="styTopSectionLine">
              <div class="styTopSectionLineLbl" style="float:left;clear:none;"></div>      
              <div style="font-size:10pt;float:left;clear:none;">          
                <xsl:call-template name="PopulateText">
                   <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt" />
                </xsl:call-template>
              </div>    
            </div>  
          </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  
    <xsl:variable name="PrimarySSNExists">
      <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param></xsl:call-template>
    </xsl:variable>
     <xsl:variable name="SpouseSSNExists">
      <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param></xsl:call-template>
    </xsl:variable>   
    
    <xsl:choose>
      <xsl:when test="$PrimarySSNExists != ''"> <!-- Indicating that the Primary SSN should be displayed -->
        <div class="styTopSectionLine">
          <span class="styTopSectionLineLbl">SSN: </span>      
          <span style="font-size:10pt;">          
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param></xsl:call-template>        
          </span>    
        </div>
 <xsl:if test="$SpouseSSNExists != ''"> <!-- Indicating that the Spouse SSN should be displayed -->
         <div class="styTopSectionLine">
          <span class="styTopSectionLineLbl">Spouse SSN: </span>      
          <span style="font-size:10pt;">          
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param></xsl:call-template>        
          </span>    
        </div>
     </xsl:if>   
      </xsl:when>
      <xsl:otherwise> <!-- Indicating that the EIN should be displayed -->
        <div class="styTopSectionLine">
          <span class="styTopSectionLineLbl">EIN: </span>      
          <span style="font-size:10pt;">          
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">EIN</xsl:with-param></xsl:call-template>        
          </span>    
        </div>
      </xsl:otherwise>
    </xsl:choose>
  
</xsl:template>

<!--
***************************************************************************************************************************************************************
Name:           PopulateDepCommonLeftoverLandscape
Description:    Template for displaying common leftover table elements for landscape dependencies
Req Param:  
Opt Param:   
Called By:     
Calls:          PopulateDepCommonLeftoverNameEIN, PopulateText 
Log:            2005-10-14 - Initial creation
***************************************************************************************************************************************************************
-->
  <xsl:template name="PopulateDepCommonLeftoverLandscape">
    <xsl:param name="TargetNode"/>
    <xsl:call-template name="PopulateDepCommonLeftoverNameEINLandscape"></xsl:call-template>
    
    <xsl:if test="(($TargetNode/@softwareId) or ($TargetNode/@softwareId != ''))">
      <div class="styTopSectionLineLandscape">
        <span class="styTopSectionLineLbl"> Software ID:</span>      
        <span style="font-size:10pt;">
          <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$TargetNode/@softwareId"/></xsl:call-template>          
        </span>  
      </div>      
    </xsl:if>
    <xsl:if test="(($TargetNode/@softwareVersionNum) or ($TargetNode/@softwareVersionNum != ''))">
      <div class="styTopSectionLineLandscape">
        <span class="styTopSectionLineLbl"> Software Version:</span>      
        <span style="font-size:10pt;">
          <xsl:call-template name="PopulateText"><xsl:with-param name="TargetNode" select="$TargetNode/@softwareVersionNum"/></xsl:call-template>        
        </span>    
      </div>            
    </xsl:if>
    <xsl:if test="$Regulation != ''">
      <div class="styTopSectionLineLandscape">
        <div style="float:left;clear:none;"><span class="styTopSectionLineLbl"> Regulation:</span></div>
        <div style="float:left;clear:none;font-size:10pt;">
          <xsl:value-of select="$Regulation" />
        </div>
      </div>      
    </xsl:if>
  </xsl:template>
  

<!--
***************************************************************************************************************************************************************
Name:           PopulateDepCommonLeftoverNameEINLandscape
Description:    Template for displaying Name and EIN on Landscape Dependencies
Req Param:  
Opt Param:   
Called By:      PopulateDepCommonLeftoverLandscape
Calls:          PopulateText, PopulateReturnHeaderFiler
Log:            2005-10-14 - Initial creation
                2009-05-11 - Added support to pull EIN or Primary SSN depending on current form family
***************************************************************************************************************************************************************
-->
  <xsl:template name="PopulateDepCommonLeftoverNameEINLandscape">    
  <div style="height:20px;"></div>    
  
    <div class="styTopSectionLineLandscape">
      <div class="styTopSectionLineLbl" style="float:left;clear:none;"> Name:</div>      
      <div style="font-size:10pt;float:left;clear:none;">        
        <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param></xsl:call-template>                  
      </div>    
    </div>
  
    <xsl:choose>
          <xsl:when test="$Location='PAR'"> <!-- Indicating that data should be pull from parent return header -->
              <xsl:if test="$ParRtnHdrData/ParentCorpGrp/BusinessName/BusinessNameLine2Txt and $ParRtnHdrData/ParentCorpGrp/BusinessName/BusinessNameLine2Txt != '' ">
                <div class="styTopSectionLineLandscape">
                  <div class="styTopSectionLineLbl" style="float:left;clear:none;"></div>      
                  <div style="font-size:10pt;float:left;clear:none;">          
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$ParRtnHdrData/ParentCorpGrp/BusinessName/BusinessNameLine2Txt" />
                    </xsl:call-template>
                  </div>    
                </div>  
              </xsl:if>
          </xsl:when>
          <xsl:when test="$Location='SUB'"> <!-- Indicating that data should be pull from subsidiary return header-->
              <xsl:if test="$SubRtnHdrData/SubsidiaryCorpGrp/BusinessName/BusinessNameLine2Txt and $SubRtnHdrData/SubsidiaryCorpGrp/BusinessName/BusinessNameLine2Txt != '' ">
                <div class="styTopSectionLineLandscape">
                  <div class="styTopSectionLineLbl" style="float:left;clear:none;"></div>      
                  <div style="font-size:10pt;float:left;clear:none;">          
                    <xsl:call-template name="PopulateText">
                       <xsl:with-param name="TargetNode" select="$SubRtnHdrData/SubsidiaryCorpGrp/BusinessName/BusinessNameLine2Txt" />
                    </xsl:call-template>
                  </div>    
                </div>  
              </xsl:if>
          </xsl:when>
          <xsl:when test="$Type = '1041'">
            <xsl:if test="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt and $RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt != '' ">
              <div class="styTopSectionLineLandscape">
                <div class="styTopSectionLineLbl" style="float:left;clear:none;"></div>      
                <div style="font-size:10pt;float:left;clear:none;">          
                  <xsl:call-template name="PopulateText">
                   <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt" />
                  </xsl:call-template>
                </div>    
              </div>  
            </xsl:if>
          </xsl:when>
          <xsl:otherwise> <!-- Indicating that data should be pull from filer return header -->
              <xsl:if test="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt and $RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt != '' ">
                <div class="styTopSectionLineLandscape">
                  <div class="styTopSectionLineLbl" style="float:left;clear:none;"></div>      
                  <div style="font-size:10pt;float:left;clear:none;">          
                    <xsl:call-template name="PopulateText">
                       <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt" />
                    </xsl:call-template>
                  </div>    
                </div>  
              </xsl:if>
          </xsl:otherwise>
    </xsl:choose>
  
    <xsl:variable name="PrimarySSNExists">
      <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param></xsl:call-template>
    </xsl:variable>
    <xsl:variable name="SpouseSSNExists">
      <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param></xsl:call-template>
    </xsl:variable>    
    
    <xsl:choose>
      <xsl:when test="$PrimarySSNExists != ''"> <!-- Indicating that the Primary SSN should be displayed -->
        <div class="styTopSectionLineLandscape">
          <span class="styTopSectionLineLbl">SSN: </span>      
          <span style="font-size:10pt;">          
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param></xsl:call-template>        
          </span>    
        </div>
 <xsl:if test="$SpouseSSNExists != ''"> <!-- Indicating that the Spouse SSN should be displayed -->
         <div class="styTopSectionLineLandscape">
          <span class="styTopSectionLineLbl">Spouse SSN: </span>      
          <span style="font-size:10pt;">          
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">SpouseSSN</xsl:with-param></xsl:call-template>        
          </span>    
        </div>
     </xsl:if>    
      </xsl:when>
      <xsl:otherwise> <!-- Indicating that the EIN should be displayed -->
        <div class="styTopSectionLineLandscape">
          <span class="styTopSectionLineLbl">EIN: </span>      
          <span style="font-size:10pt;">          
            <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">EIN</xsl:with-param></xsl:call-template>        
          </span>    
        </div>
      </xsl:otherwise>
    </xsl:choose>
  
</xsl:template>


<!--
***************************************************************************************************************************************************************
Name:           PopulateDisplayName
Description:    Displays the name.
Req Param:  
Opt Param:   
Called By:     
Calls:        
Log:            2003-10-07 - Changed the source for DisplayName for Defect 2437
                2003-10-13 - Added code so the title would look consistent
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateDisplayName">  
  <xsl:param name="TargetNode"/>    
  <xsl:param name="Year" select="substring($Version,1,4)"></xsl:param>    

  <xsl:choose>
    <xsl:when test="$DisplayName != ''"><xsl:value-of select="concat('TY ', $Year, ' ', $DisplayName)" /></xsl:when>
    <xsl:otherwise><xsl:value-of select="concat('TY ', $Year, ' ', local-name($TargetNode))" /></xsl:otherwise>
  </xsl:choose>  
</xsl:template>


<!--
***************************************************************************************************************************************************************
Name:           PopulateAdditionalDataTableMessage
Description:  Displays the message in the original table when the seperated tag is on and the repeating data is place in a table at the
                      end of the form.
Req Param:  TargetNode - Location of repeating data
Opt Param:   ShortMessage - Set to 'true' if the message needs to be shorter in order to fit in a smaller space
Called By:     Stylesheets
Calls:            none
Log:
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateAdditionalDataTableMessage">
    <xsl:param name="TargetNode"/>
    <xsl:param name="ShortMessage">false</xsl:param>

    <!-- If the Print parameter is set to 'Separated' and the node is not empty, the message will be displayed-->
    <xsl:if test="($Print = $Separated) and (count($TargetNode) &gt; 0)">
      <xsl:choose>
        <xsl:when test="$ShortMessage= 'true' ">See Add'l Data</xsl:when>
        <xsl:otherwise>See Additional Data Table</xsl:otherwise>
      </xsl:choose>
    </xsl:if>
</xsl:template>


<!--
***************************************************************************************************************************************************************
Name:           PopulateID
Description:    Populates the id with the XPath of a data element.  The XPath is the ID of the data element's corresponding HTML element for things
                      like error highlighting and return acknowledgement
Req Param:      TargetNode - The element forwhich the user wants to find the XPath
Opt Param:      none
Called By:      PopulateSpan, PopulateLabel, PopulateLabelYes, PopulateLabelNo, PopulateCheckbox, PopulateCheckbox, 
                      PopulateYesCheckbox, PopulateNoCheckbox, PopulateText, PopulatePercent, PopulateYesBox, PopulateNoBox, 
                      PopulateYesBoxText, PopulateNoBoxText, SetFormLinkInline, PopulateMonth, PopulateDay, PopulateYear, 
                      PopulateMonthForMonthDayType, PopulateMonthDayYear, PopulateEIN, PopulateSSN, PlaceCommas
Calls:          none
Log:
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateID">
  <xsl:param name="TargetNode" select="."/>

  <xsl:choose>
    <xsl:when test="$TargetNode">
      <!-- For each element in the path at and above the TargetNode itself, append "/" and the element name to the id. Other than "AppData" and "SubmissionDocument," add data position.-->
      <xsl:for-each select="$TargetNode[1]/ancestor-or-self::*">
        <xsl:text/>/<xsl:value-of select="name()"/><xsl:text/>
        <xsl:if test = "name() != 'AppData' and name() != 'SubmissionDocument' and name() != 'SubmissionHeaderAndDocument'">
          <xsl:text/>[<xsl:value-of select="count(preceding-sibling::*[name() = name(current())]) + 1"/>]<xsl:text/>    
        </xsl:if>
      </xsl:for-each>
      <xsl:choose>
        <!-- If the TargetNode is the root, append "/" to id. -->
        <xsl:when test="not($TargetNode[1]/..)">
          <xsl:text>/</xsl:text>
        </xsl:when>
        <!-- If the TargetNode is a namespace, append "/@" and the namespace name to the end of the id.-->
        <xsl:when test="count($TargetNode[1]/../namespace::* | $TargetNode[1]) = count($TargetNode[1]/../namespace::*)">
          <xsl:text/>/namespace::<xsl:value-of select="name($TargetNode[1])" />
        </xsl:when>
        <!-- If the TargetNode is an attribute, append "/@" and the attribute name to the end of the id.-->
        <xsl:when test="count($TargetNode[1]/../@* | $TargetNode[1]) = count($TargetNode[1]/../@*)">
          <xsl:text/>/@<xsl:value-of select="name($TargetNode[1])" />
        </xsl:when>
      </xsl:choose>      
    </xsl:when>
    <xsl:otherwise> <!-- TargetNode is empty, set id to "/.." -->
      <xsl:text>/..</xsl:text>
    </xsl:otherwise>
  </xsl:choose>  
</xsl:template>    


<!--
***************************************************************************************************************************************************************
Name:         PopulateSpan
Description:  Populates any span with the id attribute of a data element.  Yes/No checkboxes use this to assign the id to both check-
                      boxes to make them both 508 compliant.
Req Param:    TargetNode - The element the span is around
Opt Param:    none
Called By:    Stylesheets
Calls:        PopulateID
Log:
***************************************************************************************************************************************************************
-->
<xsl:template name="PopulateSpan">
  <xsl:param name="TargetNode" select="."/>

  <xsl:attribute name="id">
    <xsl:call-template name="PopulateID">
      <xsl:with-param name="TargetNode" select="$TargetNode" />
    </xsl:call-template>
  </xsl:attribute>
</xsl:template>   


<!--
***************************************************************************************************************************************************************
Name:           PlaceCommas
Description:    Place commas in amount, a comma between every three digits from the right
                Implement change history features and format of money amount field when 
                amount is bigger than 12 digits. If it is called directly, then 12 is used 
                for numberformat. If it is called through PopulateAmount then the 
                numberformat is changed according to the passed total digits value
Req Param:  
Opt Param:   
Called By:      PopulateAmount
Calls:          PopulateID, PopulateChgHistory
Log:
***************************************************************************************************************************************************************
-->
  <xsl:template name="PlaceCommas">
    <xsl:param name="TargetNode"/>
    <xsl:param name="MaxSize" />
    <xsl:param name="numberFormat">12</xsl:param>
    <xsl:param name="MaxSizeWithSign" />
   <xsl:choose>
       <xsl:when test="$MaxSize &lt; 5"><!-- numbers 0 through 4 -->
          <xsl:attribute name="id">    
            <xsl:call-template name="PopulateID">
              <xsl:with-param name="TargetNode" select="$TargetNode"/>
            </xsl:call-template>    
          </xsl:attribute>
          <xsl:call-template name="PopulateChgHistory">
            <xsl:with-param name="targetNode" select="$TargetNode"/>        
             <xsl:with-param name="numberFormat" select="0"/>
          </xsl:call-template>                
        </xsl:when>
        <xsl:when test="$MaxSize &lt; 8 and $MaxSize&gt; 4"><!-- digits 5,6,7-->
          <xsl:attribute name="id">    
            <xsl:call-template name="PopulateID">
              <xsl:with-param name="TargetNode" select="$TargetNode"/>
            </xsl:call-template>    
          </xsl:attribute>
          <xsl:call-template name="PopulateChgHistory">
            <xsl:with-param name="targetNode" select="$TargetNode"/>        
            <xsl:with-param name="numberFormat" select="($MaxSizeWithSign - 1)"/>
          </xsl:call-template>                
        </xsl:when>
         <xsl:when test="$MaxSize &lt; 12 and $MaxSize &gt; 7"><!-- 8,9,10,11-->
          <xsl:attribute name="id">    
            <xsl:call-template name="PopulateID">
              <xsl:with-param name="TargetNode" select="$TargetNode"/>
            </xsl:call-template>    
          </xsl:attribute>
          <xsl:call-template name="PopulateChgHistory">
            <xsl:with-param name="targetNode" select="$TargetNode"/>        
            <xsl:with-param name="numberFormat" select="($MaxSizeWithSign - 2)"/>
          </xsl:call-template>                
        </xsl:when>
        <xsl:when test="$MaxSize &lt; 16 and $MaxSize &gt; 11"><!-- 12,13,14,15-->
          <xsl:attribute name="id">    
            <xsl:call-template name="PopulateID">
              <xsl:with-param name="TargetNode" select="$TargetNode"/>
            </xsl:call-template>    
          </xsl:attribute>
          <xsl:call-template name="PopulateChgHistory">
            <xsl:with-param name="targetNode" select="$TargetNode"/>        
            <xsl:with-param name="numberFormat" select="($MaxSizeWithSign - 3)"/>
          </xsl:call-template>                
        </xsl:when>
        <xsl:when test="$MaxSize &lt; 18 and $MaxSize &gt; 15"><!-- 16,17-->
          <xsl:attribute name="id">    
            <xsl:call-template name="PopulateID">
              <xsl:with-param name="TargetNode" select="$TargetNode"/>
            </xsl:call-template>    
          </xsl:attribute>
          <xsl:call-template name="PopulateChgHistory">
            <xsl:with-param name="targetNode" select="$TargetNode"/>        
            <xsl:with-param name="numberFormat" select="($MaxSizeWithSign - 4)"/>
          </xsl:call-template>                
        </xsl:when>
        <xsl:otherwise><!-- 18 plus -->
          <xsl:attribute name="id">    
            <xsl:call-template name="PopulateID">
              <xsl:with-param name="TargetNode" select="$TargetNode"/>
            </xsl:call-template>    
          </xsl:attribute>
          <xsl:call-template name="PopulateChgHistory">
            <xsl:with-param name="targetNode" select="$TargetNode"/>        
            <xsl:with-param name="numberFormat" select="($MaxSizeWithSign - 5)"/>
          </xsl:call-template>                
        </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
   
 
 <!--
***************************************************************************************************************************************************************
Name:           PopulateChgHistory
Description:    Implement changing history features including switch display between original/latest data, showing background color and 
                cursor driven quick tip, etc. The original data is located where it would normally appear, but the latest data is located 
                under the element tag called ChangeHistory. Whichever data is displayed depends on the param called Stage. Also, set a 
                unique flag (param) to indicate that a new template implements the XSL function and PopulateChgHistory. Pass along the 
                param thru templates 'PopulateChgHistory', 'displayData' and 'getValue', then have your specific function process 
                implemented in template 'getValue'. See 'PopulateAmount' as an example. Do not create new flag if any reuseable template 
                could be found. Use 'PopulateText' if no specific XSL funtion need to be implemented, so no param(flag) need to be passed along.
  
                Explaining the implementation procedure in detail to create a new template using PopulateChgHistory.
                PopulateChgHistory will be used for any new template which will populate data. Inside your new template call 
                "PopulateChgHistory" and also set unique parameter to indicate a new XSL function will be using "PopulateChgHistory".
                Pass the parameter through templates 'PopulateChgHistory', 'displayData' and 'getValue'. The logic of your template should 
                be placed in "getValue". The flow is your template will call "PopulateChgHistory", which will call "displayData", which will 
                inturn call "getValue" which contains the logic for your template. See "PopulateEIN"  as an example.

Req Param:  
Opt Param:   
Called By:      PopulateCheckbox, PopulateYesCheckbox, PopulateNoCheckbox, PopulateText, PopulatePercent, PopulateYesBox,
                PopulateNoBox, PopulateYesBoxText, PopulateNoBoxText, PopulateMonth, PopulateDay, PopulateYear, PopulateMonthForMonthDayType,
                PopulateMonthDayYear, PopulateEIN, PopulateSSN, PlaceCommas
Calls:          displayData
Log:            2007-10-19 - Added Checkbox1or2Type for ennumerated checkbox (1 or 2)
***************************************************************************************************************************************************************
-->  
  <xsl:template name="PopulateChgHistory">
    <xsl:param name="targetNode"/>      
    <xsl:param name="usePercent"/>  
    <xsl:param name="subString"/>  
    <xsl:param name="chxBoxType"/>  
    <xsl:param name="Checkbox1or2Type" />
    <xsl:param name="displayedCheckboxValue" />
    <xsl:param name="txtBoxType"/>  
    <xsl:param name="numberFormat"/>    
    <xsl:param name="thisTemplate"/>
    <xsl:param name="boxNum"/>
    
    <xsl:choose>
      <xsl:when test="name($targetNode/self::*) = name($targetNode)">  <!-- targetNode points to a NODE -->
        <xsl:call-template name="displayData">
          <xsl:with-param name="targetNode" select="$targetNode"/>        
          <xsl:with-param name="latestNode" select="$targetNode/ChangeHistory"/> <!-- Possible matched NODE under Change History tag -->            
          <xsl:with-param name="usePercent" select="$usePercent"/>  
          <xsl:with-param name="subString" select="$subString"/>  
          <xsl:with-param name="chxBoxType" select="$chxBoxType"/>  
          <xsl:with-param name="Checkbox1or2Type" select="$Checkbox1or2Type" />
          <xsl:with-param name="displayedCheckboxValue" select="$displayedCheckboxValue"/>
          <xsl:with-param name="txtBoxType" select="$txtBoxType"/>  
          <xsl:with-param name="numberFormat" select="$numberFormat"/>       
          <xsl:with-param name="thisTemplate" select="$thisTemplate" />  
          <xsl:with-param name="boxNum" select="$boxNum" />
        </xsl:call-template>  
      </xsl:when>    
      <xsl:otherwise> <!-- targetNode points to an ATTRIBUTE -->
        <xsl:call-template name="displayData">
          <xsl:with-param name="targetNode" select="$targetNode"/>        
          <xsl:with-param name="latestNode" select="$targetNode/parent::*/ChangeHistory/@*[name() = name($targetNode)]" />  <!-- Jessica: Possible matched ATTRIBUTE under Change History tag -->    
          <xsl:with-param name="usePercent" select="$usePercent"/>  
          <xsl:with-param name="subString" select="$subString"/>  
          <xsl:with-param name="chxBoxType" select="$chxBoxType"/>  
          <xsl:with-param name="Checkbox1or2Type" select="$Checkbox1or2Type" />
          <xsl:with-param name="displayedCheckboxValue" select="$displayedCheckboxValue"/>
          <xsl:with-param name="txtBoxType" select="$txtBoxType"/>  
          <xsl:with-param name="numberFormat" select="$numberFormat"/>
          <xsl:with-param name="thisTemplate" select="$thisTemplate" />  
          <xsl:with-param name="boxNum" select="$boxNum" />    
        </xsl:call-template>  
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>      
  

<!--
***************************************************************************************************************************************************************
Name:           getValue
Description:    This template determines how to format the data based on the functionality.
Req Param:  
Opt Param:   
Called By:      displayData
Calls:          FormatPercent
Log:
***************************************************************************************************************************************************************
-->
  <xsl:template name="getValue">  
    <xsl:param name="targetNode"/>            
    <xsl:param name="usePercent"/>  
    <xsl:param name="subString"/>  
    <xsl:param name="chxBoxType"/>  
    <xsl:param name="displayedCheckboxValue"/>  
    <xsl:param name="txtBoxType"/>  
    <xsl:param name="numberFormat"/>  
    <xsl:param name="thisTemplate"/>
    <xsl:param name="boxNum"/>
    <xsl:variable name="subStrgStart" select="number(substring-before($subString, ','))"/>  
    <xsl:variable name="subStrgLength" select="number(substring-after($subString, ','))"/>   

    <xsl:choose>
      <xsl:when test="$thisTemplate">  
        <xsl:if test=" $thisTemplate = 'forLetterBox' ">
            <xsl:value-of select="substring($targetNode, $boxNum, 1)"/>    
        </xsl:if>
        <xsl:if test=" $thisTemplate = 'forEIN' ">
            <xsl:choose>
              <xsl:when test="normalize-space($targetNode) != '' and number($targetNode) "> 
                <xsl:value-of select="substring($targetNode, 1, 2)"/>-<xsl:value-of select="substring($targetNode, 3, 7)"/>
              </xsl:when> 
              <xsl:otherwise>
                <xsl:value-of select="$targetNode"/>    
              </xsl:otherwise>
            </xsl:choose>
         </xsl:if>
         <xsl:if test=" $thisTemplate = 'forSSN' ">
         <xsl:choose>
              <xsl:when test="normalize-space($targetNode) != '' and number($targetNode) "> 
                 <xsl:value-of select="substring($targetNode, 1, 3)"/>-<xsl:value-of select="substring($targetNode, 4, 2)"/>-<xsl:value-of select="substring($targetNode, 6, 4)"/> 
              </xsl:when>
              <!-- A special condition to format the SSN even when it is just nine digits with all zero's.  Without this clause the zeros will not be shown in dashes as the XSLT doesn't recognize 000000000 as a number.-->
              <xsl:when test="$targetNode = 000000000 ">
                 <xsl:value-of select="substring($targetNode, 1, 3)"/>-<xsl:value-of select="substring($targetNode, 4, 2)"/>-<xsl:value-of select="substring($targetNode, 6, 4)"/> 
              </xsl:when> 
              <xsl:otherwise>
               <xsl:value-of select="$targetNode"/>    
              </xsl:otherwise>
          </xsl:choose>
         </xsl:if>
         <xsl:if test=" $thisTemplate = 'forPhoneNumber' ">
            <xsl:choose>
              <xsl:when test="normalize-space($targetNode) != '' "> 
                (<xsl:value-of select="substring($targetNode, 1, 3)"/>) <xsl:value-of select="substring($targetNode, 4, 3)"/>-<xsl:value-of select="substring($targetNode, 7, 4)"/>
              </xsl:when> 
              <xsl:otherwise>
                <xsl:value-of select="$targetNode"/>    
              </xsl:otherwise>
            </xsl:choose>
         </xsl:if>
         <!-- IF the date is not valid then the date needs to be shown as it is-->
         <!-- The valid format is YYYY-MM-DD. The first check is to test for the total length of character a valie date would have 10 characters.  After that it is checked for the first four letter if it is a number.  Also checking is, if the first letter is '-' as the xslt number function treates -199 in the place of year as a valid number.  The same goes for the Month and Dates-->
         <xsl:if test=" $thisTemplate = 'forDate' ">
           <xsl:if test="normalize-space($targetNode) != '' ">   
             <xsl:choose>
              <xsl:when test="normalize-space(string-length($targetNode)) &lt;11">
                <xsl:choose>
                  <xsl:when test="number(substring($targetNode, 1, 4)) and substring($targetNode, 5, 1) = '-' and number(substring($targetNode, 6, 2)) and substring($targetNode, 8, 1) = '-' and number(substring($targetNode, 9, 2)) and substring($targetNode, 9, 1) != '-' and substring($targetNode, 6, 1) != '-' and substring($targetNode, 1, 1) != '-'">
                   <xsl:value-of select="substring($targetNode, 6, 2)"/>-<xsl:value-of select="substring($targetNode, 9, 2)"/>-<xsl:value-of select="substring($targetNode, 1, 4)"/> 
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="$targetNode"/>  
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>
              <xsl:otherwise>
               <xsl:value-of select="$targetNode"/>  
              </xsl:otherwise>
            </xsl:choose>
           </xsl:if>
         </xsl:if>                           
      </xsl:when>
      <xsl:when test="$subString">     
        <xsl:value-of select="substring($targetNode, $subStrgStart, $subStrgLength)"/>                    
      </xsl:when>
      <xsl:when test="$usePercent = 1 and string($targetNode)">    
        <xsl:call-template name="FormatPercent">
          <xsl:with-param name="s0" select="$targetNode"/>
        </xsl:call-template> %
      </xsl:when>    
      <xsl:when test="(($targetNode='1' or $targetNode='true') and $txtBoxType='Yes') or (($targetNode='0' or $targetNode='false') and $txtBoxType='No')">
        <xsl:value-of select="'X'"/>    
      </xsl:when>  
      <xsl:when test="($targetNode='1' or $targetNode='true') and $txtBoxType='YesTxt'">
        <xsl:value-of select="'Yes'"/>    
      </xsl:when>  
      <xsl:when test="($targetNode='0' or $targetNode='false') and $txtBoxType='NoTxt'">
        <xsl:value-of select="'No'"/>   
      </xsl:when>  
      <!-- When data is an enumerated checkbox -->
      <xsl:when test="($targetNode = $displayedCheckboxValue) and $chxBoxType='Enumerated'">
        <xsl:value-of select="'X'"/>   
      </xsl:when>  
      <xsl:when test="$numberFormat and number($targetNode)">                   
        <xsl:choose>
          <xsl:when test="string-length($targetNode) &gt; $numberFormat">
            <xsl:value-of select="$targetNode"/>    
          </xsl:when>
          <xsl:otherwise>  
            <xsl:choose>
              <xsl:when test="contains($targetNode,'.')">
                    <xsl:value-of select="concat(format-number(number(substring-before($targetNode,'.')), '#,###'),'.',substring-after($targetNode,'.'))"/> 
             </xsl:when>
              <xsl:otherwise>
                    <xsl:value-of select="format-number(number($targetNode), '#,###')"/>  
              </xsl:otherwise>
            </xsl:choose>
          </xsl:otherwise>
        </xsl:choose>                
      </xsl:when>      
      
      <xsl:when test="string($targetNode) and not(string($txtBoxType))">    
        <xsl:value-of select="$targetNode"/>  
      </xsl:when>                
      <xsl:otherwise>
        &nbsp;
      </xsl:otherwise>    
    </xsl:choose>    
  </xsl:template>       
        

<!--
***************************************************************************************************************************************************************
Name:           displayData
Description:    Display the data in a particular format depending on the data type and specify display settings, such as background color and cursor driven quick tip.
Req Param:  
Opt Param:   
Called By:      PopulateChgHistory
Calls:          getIndex, getValue
Log:            2004-09-21 - Changed "$Print != 'taxpayer'" to "$TaxpayerPrint = 'false' or $TaxpayerPrint = '0'"
                2007-10-19 - Added Checkbox1or2Type for ennumerated checkbox (1 or 2)
***************************************************************************************************************************************************************
-->
  <xsl:template name="displayData">
    <xsl:param name="targetNode"/>        
    <xsl:param name="latestNode"/>
    <xsl:param name="usePercent"/>  
    <xsl:param name="subString"/>  
    <xsl:param name="chxBoxType"/>  
    <xsl:param name="Checkbox1or2Type" />
    <xsl:param name="displayedCheckboxValue" />    
    <xsl:param name="txtBoxType"/>    
    <xsl:param name="numberFormat"/>  
    <xsl:param name="thisTemplate"/>
    <xsl:param name="boxNum"/>

      <!-- The value of $targetNode includes any attribute values. So that these attribute values 
           are not sent to getValue, we create a variable titled argVal that extracts only the 
           text value of the $targetNode itself. Then argVal is sent to getValue for data display
           feature implementation.-->

      <xsl:variable name="argVal">  <!-- Original data -->      
        <xsl:choose>
          <xsl:when test="not($latestNode) or $latestNode='' or not(name($targetNode/self::*) = name($targetNode))">
             <xsl:choose>
               <xsl:when test="$Checkbox1or2Type='yes'"> <!-- If checkbox type is ennumerated 1 or 2, 
                                                              subtract 1 from targetNode                             
                                                              and use that value as argVal-->
                 <xsl:value-of select="($targetNode)-1"></xsl:value-of>
               </xsl:when>
               <xsl:otherwise> <!-- otherwise, use existing targetNode value -->
                 <xsl:value-of select="$targetNode" />
               </xsl:otherwise>
             </xsl:choose> 
          </xsl:when>
          <xsl:otherwise>
              <xsl:value-of select="$targetNode/text()" />
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
  
      <xsl:variable name="thisValue">
        <xsl:call-template name="getValue">    
          <xsl:with-param name="targetNode" select="$argVal"/>         
          <xsl:with-param name="usePercent" select="$usePercent"/>  
          <xsl:with-param name="subString" select="$subString"/>  
          <xsl:with-param name="chxBoxType" select="$chxBoxType"/>  
          <xsl:with-param name="displayedCheckboxValue" select="$displayedCheckboxValue"/>  
          <xsl:with-param name="txtBoxType" select="$txtBoxType"/>    
          <xsl:with-param name="numberFormat" select="$numberFormat"/> 
          <xsl:with-param name="thisTemplate" select="$thisTemplate" />     
          <xsl:with-param name="boxNum" select="$boxNum"/>
        </xsl:call-template>        
      </xsl:variable>
      
      <xsl:variable name="latestValue"> <!-- Latest data -->
        <xsl:call-template name="getValue"> 
          <xsl:with-param name="targetNode" select="$latestNode"/>              
          <xsl:with-param name="usePercent" select="$usePercent"/>  
          <xsl:with-param name="subString" select="$subString"/>  
          <xsl:with-param name="chxBoxType" select="$chxBoxType"/>  
          <xsl:with-param name="displayedCheckboxValue" select="$displayedCheckboxValue"/>  
          <xsl:with-param name="txtBoxType" select="$txtBoxType"/>    
          <xsl:with-param name="numberFormat" select="$numberFormat"/>
          <xsl:with-param name="thisTemplate" select="$thisTemplate" />
          <xsl:with-param name="boxNum" select="$boxNum"/>      
        </xsl:call-template>  
      </xsl:variable>     

      <xsl:variable name="thisValueText">
      </xsl:variable>
     
      <xsl:variable name="thisChxBoxFlag">
        <xsl:if test="$thisValue='X' or (($thisValue='1' or $thisValue='true') and $chxBoxType='Yes') or (($thisValue='0' or $thisValue='false') and $chxBoxType='No')">
          <xsl:value-of select="'chxed'"/>
        </xsl:if>
      </xsl:variable>    
      <xsl:variable name="latestChxBoxFlag">
        <xsl:if test="$latestValue='X' or (($latestValue='1' or $latestValue='true') and $chxBoxType='Yes') or (($latestValue='0' or $latestValue='false') and $chxBoxType='No')">
          <xsl:value-of select="'chxed'"/>
        </xsl:if>
      </xsl:variable> 
      <xsl:choose>
        <!-- If data under Change History tag is greater than 0 AND original data does not equal latest data, then set the corresponding display properties base on the parameter value-->
        <xsl:when test="not(not($latestNode) or $latestNode='') and ($thisValue != $latestValue)">        
          <xsl:choose>
            <xsl:when test="$chxBoxType"> <!-- For checkbox type -->
              <xsl:if test="($TaxpayerPrint = 'false' or $TaxpayerPrint = '0')"> <!-- If parameter TaxpayerPrint is false or '0', then set these attributes-->     
                <xsl:if test="($chxBoxType != 'Enumerated') or ($chxBoxType = 'Enumerated' and ($displayedCheckboxValue = $argVal or $displayedCheckboxValue = $latestNode))">
                  <xsl:attribute name="style">
                    border:1 solid <xsl:value-of select="$UserPref/View/ChangedFieldBgColor"/>                          
                  </xsl:attribute>                
                  <xsl:attribute name="title">  
                    <xsl:choose>
                      <xsl:when test="$Stage='original'">Latest: <xsl:choose><xsl:when test="$latestChxBoxFlag = 'chxed'">Checked</xsl:when><xsl:otherwise>Unchecked</xsl:otherwise></xsl:choose></xsl:when>
                      <xsl:otherwise>Original: <xsl:choose><xsl:when test="$thisChxBoxFlag = 'chxed'">Checked</xsl:when><xsl:otherwise>Unchecked</xsl:otherwise></xsl:choose></xsl:otherwise>            
                    </xsl:choose>          
                  </xsl:attribute> 
                </xsl:if>     
              </xsl:if>     
              <xsl:choose> 
                <xsl:when test="$Stage='original'"> <!-- Check for these conditions: data is checkbox type, Stage is original, and thisChxBoxFlag is true. If so, set attribute thisChxBoxFlag to checked-->
                  <xsl:if test="$thisChxBoxFlag = 'chxed'">
                    <xsl:attribute name="checked">checked</xsl:attribute>
                  </xsl:if>                                      
                </xsl:when>
                <xsl:otherwise> <!-- Check for these conditions: data is checkbox type, Stage is latest, latestChxBoxFlag is true. If so, set attribute latestChxBoxFlag to checked-->             
                  <xsl:if test="$latestChxBoxFlag = 'chxed'">
                    <xsl:attribute name="checked">checked</xsl:attribute>
                  </xsl:if>                                                              
                </xsl:otherwise>            
              </xsl:choose>  
            </xsl:when> 
            <xsl:otherwise> <!-- For non-checkbox type -->                  
              <xsl:if test="$TaxpayerPrint = 'false' or $TaxpayerPrint = '0'"> <!-- If parameter TaxpayerPrint is false or '0', then set these attributes-->
                <xsl:attribute name="style">                      
                  background-color: <xsl:value-of select="$UserPref/View/ChangedFieldBgColor"/>
                  <xsl:if test="((not(string($thisValue)) or normalize-space($thisValue)='&nbsp;') and $Stage='original') or ((not(string($latestValue)) or normalize-space($latestValue)='&nbsp;') and $Stage='latest')">              
                    ; width:35%
                  </xsl:if>                        
                </xsl:attribute>  
                <xsl:attribute name="title">  
                  <xsl:choose>
                    <xsl:when test="$Stage='original'">Latest: <xsl:value-of select="$latestValue"/></xsl:when>
                    <xsl:otherwise>Original: <xsl:value-of select="$thisValue"/></xsl:otherwise>            
                  </xsl:choose>          
                </xsl:attribute>  
            </xsl:if>    
              <xsl:choose> <!-- Check for these conditions: data is not checkbox type and Stage is original. If so, display original data value-->
                <xsl:when test="$Stage='original'">
                  <xsl:value-of select="$thisValue"/>                                    
                </xsl:when>
                <xsl:otherwise> <!-- Check for these conditions: data is not checkbox type and Stage is latest. If so, display latest data value-->
                  <xsl:value-of select="$latestValue"/>                                                                 
                </xsl:otherwise>            
              </xsl:choose>    
            </xsl:otherwise>
          </xsl:choose>            
        </xsl:when>  
        <!-- If there is no latest data OR the original data is equal to the latest data, then set the corresponding display properties based on the parameter value-->
        <xsl:otherwise>     
          <xsl:choose>    
            <xsl:when test="$chxBoxType"> <!-- If the data is checkbox type and thisCHxBoxFlag is set to checked, set attribute "checked" to checked  -->
             <xsl:if test="$thisChxBoxFlag = 'chxed'">
               <xsl:attribute name="checked">checked</xsl:attribute>
              </xsl:if>
            </xsl:when>    
            <xsl:otherwise> <!-- If the data is not checkbox type, then display original data value-->
            
              <xsl:value-of select="$thisValue"/>
            </xsl:otherwise>   
          </xsl:choose>            
        </xsl:otherwise> 
      </xsl:choose>
      
  </xsl:template>  
  
<!--
***************************************************************************************************************************************************************
Name:           getXPath
Description:    Gets the XPath of the original data. Trace the path from the root node down to the target node.
Req Param:  
Opt Param:   
Called By:      getIndex
Calls:            
Log:
***************************************************************************************************************************************************************
-->
  <xsl:template name="getXPath">
    <xsl:param name="thisNode"/>    
    <xsl:for-each select="$thisNode/ancestor::*">
      <xsl:if test="name() != 'ChangeHistory'">
        /<xsl:value-of select="name()"/>    
      </xsl:if>
    </xsl:for-each>    
  </xsl:template>
  
</xsl:stylesheet>