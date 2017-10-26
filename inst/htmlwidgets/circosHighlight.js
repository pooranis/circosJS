HTMLWidgets.widget({

  name: 'circosHighlight',

  type: 'output',

  factory: function(el, width, height) {

    var circosHighlight = new Circos({
      container: el,
      width: width,
      height: height
    });

    return {

      renderValue: function(x) {

        var data = HTMLWidgets.dataframeToD3(x.sectors);
        var cytobands = HTMLWidgets.dataframeToD3(x.df);
        var color = x.color;
        console.log(data);

        circosHighlight.layout(
          data,
          {
            innerRadius: width / 2 - 100,
            outerRadius: width / 2 - 50,
            labels: {display: false}
          }
          );

        circosHighlight.highlight(
          'cytobands',
          cytobands,
          {
            innerRadius: width / 2 - 100,
            outerRadius: width / 2 - 50,
            opacity: 0.5,
            color: function (d) {
              return color[d.colorcat];
            }
          }

        );

        circosHighlight.render();

      }

//      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

//      }

    };
  }
});
