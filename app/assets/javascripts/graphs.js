// ajax call to load initial json
var loadData = function(){
  return $.ajax({
    method: 'GET',
    contentType: "application/json; charset=utf-8",
    url: 'http://127.0.0.1:3000/api/v1/projects/most_backers?limit=15',
    dataType: 'json'
  }).done(function(data){
    drawBarPlot(data);
  }).fail(function(error){
    console.error(error);
  })
};

function drawBarPlot(data) {

  var margin = {top: 40, right: 10, bottom: 100, left:70},
      width = 700 - margin.right - margin.left,
      height = 500 - margin.top - margin.bottom;

  var svg = d3.select("#plot-container")
        .append('svg')
        .attr ({
          "width": width + margin.right + margin.left,
          "height": height + margin.top + margin.bottom
        })
      .append('g')
        .attr("transform","translate(" + margin.left + "," + margin.right + ")");

  // define the x y scales
  var xScale = d3.scale.ordinal()
                 .rangeRoundBands([0, width], 0.2, 0.2);

  var yScale = d3.scale.linear()
                 .range([height, 0])

  // define axis
  var xAxis = d3.svg.axis()
                    .scale(xScale)
                    .orient("bottom");

  var yAxis = d3.svg.axis()
                    .scale(yScale)
                    .orient("left");

  // specify domains of x and y scales
  xScale.domain(data.map(function(d) {return d.title; }));
  yScale.domain([0, d3.max(data, function(d) {return d.backers; })]);

  svg.selectAll('rect')
     .data(data)
     .enter()
     .append('rect')
     .attr("height", 0)
     .attr("y", height)
     .transition().duration(3000)
     .delay(function(d, i) {return i + 200;})
     .attr ({
       "x": function(d) { return xScale(d.title); },
       "y": function(d) { return yScale(d.backers); },
       "width": xScale.rangeBand(),
       "height": function(d) { return height - yScale(d.backers); }
     })
     .style("fill", function (d, i) { return 'rgb(20, 20, ' + ((i * 30) + 100) + ')'});

  // label the bars
  svg.selectAll('text')
     .data(data)
     .enter()
     .append('text')
     .text(function(d) {return d.backers; })
     .attr('x', function(d) { return xScale(d.title) + xScale.rangeBand()/2;})
     .attr('y', function(d) { return yScale(d.backers) + 12; })
     .style("fill", "white")
     .style("text-anchor", "middle");

  // draw the xAxis
  svg.append("g")
     .attr("class", "x axis")
     .attr("transform", "translate(0," + height + ")")
     .call(xAxis)
     .selectAll("text")
     .attr("dx", "-.8em")
     .attr("dy", ".25em")
     .attr("transform", "rotate(-40)" )
     .style("text-anchor", "end")
     .attr("font-size", "10px");

  // Draw yAxis and postion the label
  svg.append("g")
     .attr("class", "y axis")
     .call(yAxis)
     .append("text")
     .attr("transform", "rotate(-90)")
     .attr("x", -height/2)
     .attr("dy", "-3em")
     .style("text-anchor", "middle")
     .text("Number of Backers");

}

// load data on page load
$(document).ready(function(){
  loadData();
})
