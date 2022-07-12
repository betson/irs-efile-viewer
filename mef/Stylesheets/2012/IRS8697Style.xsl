<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="IRS8697Style">

  <!-- CSS Styles Go Here -->
  .styForm8697TableCell{ /* Table cell in repeating Part 1 and 2 tables */
      width: 29mm;
      color: black;
      text-align: right;
      border-color:black;
      border-style: solid;
      vertical-align:bottom;
      padding-bottom:1mm;
      border-top-width: 0px;
      border-bottom-width: 1px; 
      border-left-width: 0px; 
      border-right-width: 1px;
      }

  .styForm8697TableCellNumber{ /* Table cell that has a number */
      width: 7mm;
      color: black;
      text-align: left;
      padding-left: 1.5mm;
      border-color:black;
      border-style: solid;
      vertical-align:top;
      font-weight:bold;
      border-right:none;
      border-bottom:none;
      padding-bottom:1mm;
      border-top-width: 0px;
      border-bottom-width: 1px; 
      border-left-width: 0px; 
      border-right-width: 0px;
      }

  .styForm8697TableCellDescription{ /* Table cell descriptions */
      width: 80mm;
      color: black;
      text-align: justify;
      border-style: solid;
      border-color:black;
      border-bottom:none;
      padding-right:2mm;
      border-top-width: 0px; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 1px;
      }

  .styForm8697TableCellEmptyGray{ /* Table cell that is grayed out */
      width: 29mm;
      color: black;
      background-color:lightgrey;
      border-right:none;
      border-bottom:none;
      text-align: right;
      border-color:black;
      border-style: solid;
      vertical-align:bottom;
      padding-bottom:1mm;
      border-top-width: 0px;
      border-bottom-width: 0px; 
      border-left-width: 0px; 
      border-right-width: 0px;
      }
  .styForm8697GenericCell {   /* Form Name */
  border-style: solid; border-color: black;
  border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-right-width: 0px;
}

</xsl:template>
</xsl:stylesheet>



