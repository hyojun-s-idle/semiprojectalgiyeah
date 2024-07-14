var options = {
  series: [12210, 10000, 9860, 9860, 9620],
  chart: {
    width: 390,
    // heigth:1000,
    type: 'pie',
  },
  labels: ['근로자측(최초)', '근로자측(최종)', '최종결정', '사용자측(최종)', '사용자측(최초)'],
  responsive: [{
    breakpoint: 480,
    options: {
      chart: {
        width: 200
      },
      legend: {
        position: 'bottom'
      }
    }
  }],
  colors: [
    '#F6CED8',
    '#F5A9BC',
    '#F7819F',
    '#FA5882',
    '#FE2E64'
  ]
}
  ;

var chart = new ApexCharts(document.querySelector("#chartMinimumwageProposal"), options);
chart.render();