var options = {
    series: [
        {
            data: [
                {
                    x: 'Restraurant',
                    y: 218
                },
                {
                    x: 'Store management',
                    y: 52
                },
                {
                    x: 'Service',
                    y: 184
                },
                {
                    x: 'Office job',
                    y: 55
                },
                {
                    x: 'Drive / Delivery',
                    y: 84
                },
                {
                    x: 'etc',
                    y: 31
                },
                {
                    x: 'Design',
                    y: 70
                },
                {
                    // x: 'Infomation Technology',
                    x: 'IT',
                    y: 30
                },
                {
                    x: 'Education',
                    y: 44
                },
                {
                    x: 'Production',
                    y: 68
                }
            ]
        }
    ],
    legend: {
        show: false
    },
    chart: {
        width:410,
        height: 350,
        type: 'treemap'
    },
    title: {
        text: 'Part-time Occupation',
        align: 'center'
    },
    colors: [
        '#3B93A5',
        '#F7B844',
        '#ADD8C7',
        '#EC3C65',
        '#CDD7B6',
        '#C1F666',
        '#D43F97',
        '#1E5D8C',
        '#421243',
        '#7F94B0',
        '#EF6537',
        '#C0ADDB'
    ],
    plotOptions: {
        treemap: {
            distributed: true,
            enableShades: false
        }
    }
};

var chart = new ApexCharts(document.querySelector("#chartTreemap"), options);
chart.render();