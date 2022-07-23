STYLESHEET_FIXES = {
    "2008": {
        scripts: {
            FormDisplay: ["04a28d1"]
        },
        stylesheets: {
            CommonPathRef: ["04a28d1"],
            IRS1065B: ["04a28d1"],
            PrintDocList: ["04a28d1"],
            PrintReturnSections: ["04a28d1"]
        }
    },
    "2009": {
        scripts: {
            FormDisplay: ["04a28d1"]
        },
        stylesheets: {
            CommonPathRef: ["04a28d1"],
            IRS1065B: ["04a28d1"],
            PrintDocList: ["04a28d1"],
            PrintReturnSections: ["04a28d1"]
        }
    },
    "2010": {
        scripts: {
            FormDisplay: ["04a28d1"]
        },
        stylesheets: {
            CommonPathRef: ["04a28d1"],
            PrintDocList: ["04a28d1"],
            PrintReturnSections: ["04a28d1"]
        }
    },
    "2011": {
        scripts: {
            FormDisplay: ["04a28d1"]
        },
        styles: {
            style: ["04a28d1"]
        },
        stylesheets: {
            CommonPathRef: ["04a28d1"],
            PrintDocList: ["04a28d1"],
            PrintReturnSections: ["04a28d1"]
        }
    },
    "2012": {
        scripts: {
            FormDisplay: ["04a28d1"]
        },
        styles: {
            style: ["04a28d1"]
        },
        stylesheets: {
            CommonPathRef: ["04a28d1"],
            IRS1040SSPRStyle: ["04a28d1"],
            PrintDocList: ["04a28d1"],
            PrintReturnSections: ["04a28d1"]
        }
    },
    "2013": {
        scripts: {
            FormDisplay: ["04a28d1"]
        },
        styles: {
            header: ["e71ed26"],
            style: ["04a28d1"]
        },
        stylesheets: {
            CommonPathRef: ["04a28d1"],
            IRS940_940PRStyle: ["04a28d1"],
            IRS941ScheduleBStyle: ["04a28d1"],
            IRS990: ["b57ff68"],
            PrintDocList: ["04a28d1"],
            PrintReturnSections: ["04a28d1"]
        }
    },
    "2014": {
        scripts: {
            FormDisplay: ["04a28d1"]
        },
        styles: {
            header: ["e71ed26"],
            style: ["04a28d1"]
        },
        stylesheets: {
            CommonPathRef: ["04a28d1"],
            IRS940_940PRStyle: ["04a28d1"],
            IRS941ScheduleBStyle: ["04a28d1"],
            IRS990: ["b57ff68"],
            IRS990PF: ["6cbd8cb"],
            PrintDocList: ["04a28d1"],
            PrintReturnSections: ["04a28d1"]
        }
    },
    "2015": {
        scripts: {
            FormDisplay: ["04a28d1"]
        },
        styles: {
            header: ["e71ed26"],
            style: ["04a28d1"]
        },
        stylesheets: {
            CommonPathRef: ["04a28d1", "5507a3c"],
            IRS940_940PRStyle: ["04a28d1"],
            IRS941ScheduleBStyle: ["04a28d1"],
            IRS990: ["b57ff68"],
            IRS990PF: ["6cbd8cb"],
            PrintDocList: ["04a28d1"],
            PrintReturnSections: ["04a28d1"]
        }
    },
    "2016": {
        scripts: {
            FormDisplay: ["04a28d1"]
        },
        styles: {
            header: ["04a28d1"],
            style: ["04a28d1"]
        },
        stylesheets: {
            CommonPathRef: ["5507a3c"],
            IRS940_940PRStyle: ["04a28d1"],
            IRS941ScheduleBStyle: ["04a28d1"],
            PrintDocList: ["04a28d1"],
            PrintReturnSections: ["04a28d1"]
        }
    },
    "2017": {
        scripts: {
            FormDisplay: ["04a28d1"]
        },
        styles: {
            header: ["04a28d1"],
            style: ["04a28d1"]
        },
        stylesheets: {
            IRS941ScheduleBStyle: ["04a28d1"],
            PrintDocList: ["04a28d1"],
            PrintReturnSections: ["04a28d1"]
        }
    }
}

FIX_STATUS = {
    "04a28d1": {
        status: "resolved",
        notes: "rrdprd references are automatically cleaned on import"
    },
    "b57ff68": {
        status: "resolved",
        notes: "similar updates were made in the final IRS download for TY 2016"
    },
    "6cbd8cb": {
        status: "resolved",
        notes: "similar updates were made in the final IRS download for TY 2016"
    },
    "e71ed26": {
        status: "open"
    },
    "5507a3c": {
        status: "open"
    }
}
