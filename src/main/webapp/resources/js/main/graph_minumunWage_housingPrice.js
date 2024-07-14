var options = {
    series: [
        {
            name: '10 years',
            data: [0.88, 0.93, 1, 1.07, 1.16, 1.24, 1.45, 1.6, 1.65, 1.67, 1.76, 1.85
            ]
        },
        {
            name: "20 years",
            data: [1.76, 1.87, 2, 2.14, 2.32, 2.48, 2.89, 3.21, 3.3, 3.35, 3.52, 3.69

            ]
        },
        {
            name: "30 years",
            data: [
                2.64, 2.8, 3, 3.21, 3.47, 3.73, 4.34, 4.81, 4.95, 5.02, 5.28, 5.54
            ]

        },
        {
            name: "40 years",
            data: [
                3.52, 3.73, 4, 4.29, 4.63, 4.97, 5.78, 6.41, 6.6, 6.7, 7.03, 7.39
            ]
        },
        {
            name: "50 years",
            data: [
                4.4, 4.67, 5, 5.36, 5.79, 6.21, 7.23, 8.02, 8.25, 8.37, 8.79, 9.24
            ]
        },
        {
            name: "60 years",
            data: [
                5.28, 5.6, 6, 6.43, 6.95, 7.45, 8.67, 9.62, 9.9, 10.05, 10.55, 11.08
            ]
        },
        {
            name: "70 years",
            data: [
                6.16, 6.53, 7, 7.5, 8.1, 8.7, 10.12, 11.22, 11.54, 11.72, 12.31, 12.93
            ]
        },


        {
            name: "Seoul Housing Price",
            data: [4.33, 4.13, 4.12, 4.23, 4.33, 4.44, 5.39, 6.08, 6.46, 6.86, 7.29, 6.53]
            ,
            type: 'line'


        },
        {
            name: 'Nationwide Housing Price',
            data: [2.17, 2.11, 2.14, 2.19, 2.27, 2.31, 2.6, 2.78, 2.98, 3.28, 2.94, 2.62]
            ,
            type: 'line'

        }
    ],
    chart: {
        height: 800,
        type: 'area',
        zoom: {
            enabled: false
        },
    },
    dataLabels: {
        enabled: false,
        style: {
            colors: ['#DF0174', '#DF0174', '#DF0174', '#DF0174', '#DF0174', '#DF0174', '#DF0174', '#DF0174', '#DF0174']
        }
        ,
        blur: 3,
        opacity: 0.5
    },
    stroke: {
        width: [4, 4, 4, 4, 4, 4, 4, 8, 8],

        curve: [
            'straight', 'straight', 'straight', 'straight', 'straight', 'straight', 'straight',
            'straight', 'straight'

        ],

        dashArray: [2, 2, 2, 2, 2, 2, 2, 0, 0]
        //점선타입

    },
    title: {
        align: 'left',
        text: ''
    },
    legend: {
        tooltipHoverFormatter: function (val, opts) {
            return val + ' - <strong>' + opts.w.globals.series[opts.seriesIndex][opts.dataPointIndex] + '</strong>'
        }
        ,
        position: 'top'
    },
    markers: {
        size: 0,
        hover: {
            sizeOffset: 6
        }
    },
    xaxis: {
        categories: [
            '2012', '2013', '2014', '2015', '2016', '2017', '2018', '2019', '	2020	', '2021	', '2022	', '2023'

        ],
        title: {
            text: '₩(억)'
        }
    },
    tooltip: {
        y: [
            {
                title: {
                    formatter: function (val) {
                        return val + " (mins)"
                    }
                }
            },
            {
                title: {
                    formatter: function (val) {
                        return val + " per session"
                    }
                }
            },
            {
                title: {
                    formatter: function (val) {
                        return val;
                    }
                }
            }
        ]
    },
    grid: {
        borderColor: '#f1f1f1',
    }
    ,
    colors: [

        '#FE2E2E',
        '#FA5858',
        '#F78181',
        '#F5A9A9',
        '#F6CECE',
        '#F8E0E0',
        '#FBEFEF',

        '#FF00BF',
        '#FF0040'
    ]
    , fill: {
        type: [
            'gradient',
            'gradient',
            'gradient',
            'gradient',
            'gradient',
            'gradient',
            'gradient', 
            'solid', 
            'solid'
        ],
        gradient: {
            shadeIntensity: -0.3,
            opacityFrom: 0.7,
            opacityTo: 0,
            stops: [0, 100],
          }

    },

};

var chart = new ApexCharts(document.querySelector("#chartMinimunwageHousingprice"), options);
chart.render();