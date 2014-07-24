  <script src="common/jquery-1-10-2/jquery.min.js" type="text/javascript"></script>
  <script src="common/raphael212/raphael.min.js" type="text/javascript"></script>
  <script src="common/elycharts/elycharts.js" type="text/javascript"></script>
  
  
<div id="chart"></div>
<script type="text/javascript">

$.elycharts.templates['pie_basic_1'] = {
  type: "pie",
  
  defaultSeries: {
    plotProps: {
      stroke: "white",
      "stroke-width": 2,
      opacity: 0.6
    },
    highlight: {
      newProps: {
        opacity: 1
      }
    },
    tooltip: {
      frameProps: {
        opacity: 0.8
      }
    },
    label: {
      active: true,
      //props: {
      //  fill: "white"
      //}
    },
    startAnimation: {
      active: true,
      type: "avg"
    }
  }
};


 $("#chart").chart({
  template: "pie_basic_1",
  values: {
    serie1: [89, 33, 65, 56]
  },
  labels: ["a", "b", "c", "d"],
  tooltips: {
    serie1: ["a", "b", "c", "d"]
    
  },
  defaultSeries: {
    values: [{
      plotProps: {
        fill: "red"
      }
    }, {
      plotProps: {
        fill: "blue"
      }
    }, {
      plotProps: {
        fill: "green"
      }
    }, {
      plotProps: {
        fill: "gray"
      }
    }]
  }
});

</script>