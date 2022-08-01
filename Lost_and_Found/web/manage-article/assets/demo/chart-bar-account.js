new Chart(document.getElementById("barChartHeadcount"), {
  type: 'bar',
  data: {
    labels: ['Trần Phương Thái', 'Nguyễn Quốc Sỹ', 'Hoàng Nhã Thy', 'Hoàng Đình Thái', 'Ngô Xuân Thiệp'],
    datasets: [{
      label: 'Like',
      backgroundColor: 'rgb(0, 197, 106)',
      data: [100, 70, 59, 60,83]
    }, {
      label: 'Comment',
      backgroundColor: 'rgb(255, 114, 107)',
      data: [300, 250, 244,230,210]
    }, {
      label: 'Report',
      backgroundColor: 	'#FFFF00',
      data: [20, 38, 5,2,5]
      
    }]
    
  },
  options: {
    title: {
      display: true,
      text: 'Top 5 most active accounts'
    },
    tooltips: {
      mode: 'index',
      intersect: false
    },
    responsive: true,
    scales: {
      xAxes: [{
        stacked: false
      }],
      yAxes: [{
        stacked: false
      }]
    },
    plugins: {
      datalabels: {
        align: 'end',
        anchor: 'end',
        backgroundColor: function(context) {
          return context.dataset.backgroundColor;
        },
        borderRadius: 4,
        color: 'white',
        formatter: function(value){
        	return value + ' (100%) ';
        }
      }
    }
  }
});
