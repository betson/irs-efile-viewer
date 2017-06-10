# `/mef` Directory

This directory contains the official IRS form stylesheets. The Modernized e-File (MeF) program defines the format and content of XML documents to represent each of the IRS forms and schedules related to tax filing. The [stylesheets](https://www.irs.gov/tax-professionals/e-file-providers-partners/modernized-e-file-mef-stylesheets) and [schemas](https://www.irs.gov/tax-professionals/e-file-providers-partners/modernized-e-file-mef-schemas-and-business-rules) are available on the IRS website.

Each year, the IRS lists a `.zip` file containing all updates to the stylesheets that were developed for the upcoming tax year. This directory is modeled on the structure of those `.zip` files to reduce changes that are needed in maintaining updates to the files.

## Updating IRS Stylesheets

Each year, the package released by the IRS contains:
- new assets and stylesheets to support an upcoming tax year
- updates to existing files

However, the directories within the IRS package are not comprehensive. They contain only the files that have been added and updated. This means that when updating the repository with new files from the IRS, the existing folders **should not** be replaced with the folders contained in the `.zip` file. Instead, the new files need to be merged into the existing directory structure.

Additionally, any files containing relative links need to be updated to include Jekyll front matter and to support the hosted address of this application. Ex:
```
<xsl:param name="NonVersionedImagePath">{{ site.github.url }}/mef/rrprd/common/images</xsl:param>  
```

Lastly, updates to support a new tax year should be contained within a single commit.

## `rrprd/` Subdirectory

The [`rrprd/`](rrprd/) directory contains assets (images, JavaScript, and CSS) that can be included in the HTML transformations. Originally, this directory was listed as `rrdprd/` (Return Request and Display - Production); however, the IRS updated the name around 2014.

Within the directory, [`common/`](rrprd/common/) contains assets that could be used by any form for any Tax Year. These are predominantly icons. Alternatively, [`sdi/versioned/`](rrprd/sdi/versioned/) contains a directory for each tax year. Within each year are form-specific images or styles that relate to that tax year's version of the forms. Sometimes these year-specific styles are updated in future years to address bugs or compatibility fixes.

Notably while most years contain `style.css` and `MainStyles.css`, these files do not appear to be used from any of the provided XSLT transformations.

## `Stylesheets/` Subdirectory

The [`Stylesheets/`](Stylesheets/) directory is similar to `sdi/versioned/` and contains a directory for each tax year. Within each year are a number of `.xsl` files which are used to transform a particular type of XML e-file document.

The root transformation documents for each IRS form have names prefixed with "IRS", such as [`IRS990.xsl`](Stylesheets/2016/IRS990.xsl). Each of these files will then contain a number of `xsl:include` statements that can be used to pull templates from additional XSLT documents. In addition, each of these root transformation documents has a pair stylesheet that specifically contains the CSS used for that form (e.g., [`IRS990Style.xsl`](Stylesheets/2016/IRS990Style.xsl)).

Some of the shared stylesheets used across forms are:
- [`CommonPathRef.xsl`](Stylesheets/2016/CommonPathRef.xsl)
- [`AddHeader.xsl`](Stylesheets/2016/AddHeader.xsl)
- [`AddOnTable.xsl`](Stylesheets/2016/AddOnTable.xsl)
- [`PopulateTemplate.xsl`](Stylesheets/2016/PopulateTemplate.xsl)
