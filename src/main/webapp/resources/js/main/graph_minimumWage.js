var options = {
    chart: {
        // height: 380,
        height: 600,
        width: "100%",

        type: "area",
        animations: {
            initialAnimation: {
                enabled: false
            }
        }
    },
    series: [
        {
            // 최저임금
            name: "Minimum Wage",
            data: [
                {
                    x: "1988",
                    y: 487.5
                },
                {
                    x: "1989",
                    y: 600
                },
                {
                    x: "1990",
                    y: 690
                },
                {
                    x: "1991",
                    y: 820
                },
                {
                    x: "1992",
                    y: 925
                },
                {
                    x: "1993",
                    y: 1005
                }
                ,
                {
                    x: "1994",
                    y: 1085
                },
                {
                    x: "1995",
                    y: 1170
                },
                {
                    x: "1996",
                    y: 1275
                },
                {
                    x: "1997",
                    y: 1400
                },
                {
                    x: "1998",
                    y: 1485
                },
                {
                    x: "1999",
                    y: 1525
                }
                ,
                {
                    x: "2000",
                    y: 1600
                }
                ,
                {
                    x: "2001",
                    y: 1865
                }
                ,
                {
                    x: "2002",
                    y: 2100
                },
                {
                    x: "2003",
                    y: 2275
                },
                {
                    x: "2004",
                    y: 2510
                },
                {
                    x: "2005",
                    y: 2840
                },
                {
                    x: "2006",
                    y: 3100
                },
                {
                    x: "2007",
                    y: 3480
                }
                ,
                {
                    x: "2008",
                    y: 3770
                },
                {
                    x: "2009",
                    y: 4000
                },
                {
                    x: "2010",
                    y: 4110
                },
                {
                    x: "2011",
                    y: 4320
                },
                {
                    x: "2012",
                    y: 4580
                },
                {
                    x: "2013",
                    y: 4860
                },
                {
                    x: "2014",
                    y: 5210
                },
                {
                    x: "2015",
                    y: 5580
                },
                {
                    x: "2016",
                    y: 6030
                },
                {
                    x: "2017",
                    y: 6470
                },
                {
                    x: "2018",
                    y: 7530
                },
                {
                    x: "2019",
                    y: 8350
                }
                ,
                {
                    x: "2020",
                    y: 8590
                },
                {
                    x: "2021",
                    y: 8720
                },
                {
                    x: "2022",
                    y: 9160
                },
                {
                    x: "2023",
                    y: 9620
                }
                ,
                {
                    x: "2024",
                    y: 9860
                }


            ]



        }
    ],
    xaxis: {
        type: "datetime",
        title: {
            text: '₩(원)'
        }
    }
    ,
    colors: ['#DF01A5']
    ,
    title: {
        // text: '최저임금',
        // align: 'left'
    }






};

var chart = new ApexCharts(document.querySelector("#chartMinimumwage"), options);

chart.render();