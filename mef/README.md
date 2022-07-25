# `/mef` Directory

This directory contains the official IRS form stylesheets. The Modernized e-File (MeF) program defines the format and content of XML documents to represent each of the IRS forms and schedules related to tax filing. The [stylesheets](https://www.irs.gov/e-file-providers/modernized-e-file-mef-stylesheets) and [schemas](https://www.irs.gov/e-file-providers/modernized-e-file-mef-schemas-and-business-rules) are available on the IRS website.

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

To automate the process of importing a new tax year, the [`import_taxyear` script](/script/import_taxyear.rb) is available.

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

## Importing a New Tax Year

1. Start with a new git branch. Each import creates and overwrites a lot of files. It's best to do this in an isolated environment you can destroy if necessary to start over.
2. Execute the automated import: `script/import_taxyear.rb path/to/PY20XXRYY`
3. Stash the output of the import script for review. This includes details of files you want to review before merging in your changes.
4. Create a commit of the import, following the pattern from previous years. Include the tax year in the commit title, and include the IRS archive name and the date accessed within the commit description.
5. Review any files listed by the import script. Make any changes to the `/mef` files as necessary. If you make any changes, commit these to preserve the stylesheet fixes made previously.
6. Test transformations for each tax year that had updated files within the import. Start the webserver with `script/server` and upload sample XML documents. [Nonprofit Explorer](https://projects.propublica.org/nonprofits/) is a good place to start to get test documents.
7. Troubleshoot issues if the transformation doesn't work (suggestions below).
8. For any new changes you make, commit them as a STYLESHEET FIX following the pattern from previous years. First commit the change with details in the commit message. Include a reference to a sample e-File that can be used to reproduce the issue. AFTER committing the stylesheet fix, then update [`stylesheet_fixes.rb`](/script/stylesheet_fixes.rb) with the files that were changed and a reference to the commit hash. Commit this as "add stylesheet fix commit to ledger".
9. Package everything as a pull request

## Troubleshooting Transformation Failures

XSLT transformation failures are frustrating because they fail without much guidance for what caused the issue. Here are a few tips for working through these issues.
- Double-check that transformations for previous years aren't impacted.
- Start by reviewing the resources used by your form. For example, if you're trying to transform a 990-PF document, then go to `Stylesheets/{year}/IRS990PF.xsl`. Each stylesheet starts with a series of `<xsl:include>` elements. These should be the only files you need to review.
- For each file, review what changed in your import. The git command `git show HEAD -- mef/Stylesheets/{year}/{filename}.xsl` is a helpful tool. This assumes you're testing immediately after committing the initial import. Replace `HEAD` as necessary with the necessary commit.
- Review [`stylesheet_fixes.rb`]](/script/stylesheet_fixes.rb) to see what's traditionally been an issue in prior years. Fixes were necessary from 2008-2017, but they haven't been common since then. A frequent issue was missing variables in `CommonPathRef.xsl`.
- Alongside the stylesheets, another necessary tool in the transformation is [`form_template.xml`](/form_template.xml). This is the actual XML document that gets transformed. The content of your desired 990 (or other form) gets merged into this template. So this is the source for variables referenced in `CommonPathRef.xsl`.
