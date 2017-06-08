// ajax call to load initial json
var loadBarChart1Data = function(){
  return $.ajax({
    method: 'GET',
    contentType: "application/json; charset=utf-8",
    url: '/api/v1/projects/most_backers?limit=15',
    dataType: 'json'
  }).done(function(data){
    drawBarPlot1(data);
  }).fail(function(error){
    console.error(error);
  })
};

function drawBarPlot1(data) {

  var margin = {top: 40, right: 10, bottom: 100, left:70},
      width = 700 - margin.right - margin.left,
      height = 500 - margin.top - margin.bottom;

  var svg = d3.select("#plot-container")
        .append('svg')
        .attr("width", width + margin.right + margin.left)
        .attr("height", height + margin.top + margin.bottom)
        .append('g')
        .attr("transform","translate(" + margin.left + "," + margin.right + ")");

  // define the x y scales
  var xScale = d3.scaleBand()
                 .range([0, width])
                 .padding(0.2);

  var yScale = d3.scaleLinear()
                 .range([height, 0])


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
     .attr("x", function(d) { return xScale(d.title); })
     .attr("y", function(d) { return yScale(d.backers); })
     .attr("width", xScale.bandwidth())
     .attr("height", function(d) {return height - yScale(d.backers); })
     .style("fill", function (d, i) { return 'rgb(20, 20, ' + ((i * 30) + 100) + ')'});

  // label the bars
  svg.selectAll('text')
     .data(data)
     .enter()
     .append('text')
     .text(function(d) {return d.backers; })
     .attr('x', function(d) { return xScale(d.title) + xScale.bandwidth()/2;})
     .attr('y', function(d) { return yScale(d.backers) + 12; })
     .style("fill", "white")
     .style("text-anchor", "middle");

  // draw the xAxis
  svg.append("g")
     .attr("class", "x axis")
     .attr("transform", "translate(0," + height + ")")
     .call(d3.axisBottom(xScale))
     .selectAll("text")
     .attr("dx", "-.8em")
     .attr("dy", ".25em")
     .attr("transform", "rotate(-40)" )
     .style("text-anchor", "end")
     .attr("font-size", "10px");

  // Draw yAxis and postion the label
  svg.append("g")
     .attr("class", "y axis")
     .call(d3.axisLeft(yScale))
     .append("text")
     .attr("transform", "rotate(-90)")
     .attr("x", -height/2)
     .attr("dy", "-3em")
     .style("text-anchor", "middle")
     .text("Number of Backers");

}

// ajax call to load initial json
var loadPieChartData = function(){
  return $.ajax({
    method: 'GET',
    contentType: "application/json; charset=utf-8",
    url: '/api/v1/categories/count_by_project',
    dataType: 'json'
  }).done(function(data){
    drawPieChart(data);
  }).fail(function(error){
    console.error(error);
  })
};

function drawPieChart(data) {
  // margin and radius
  var margin = {top: 20, right: 20, bottom: 20, left: 20},
      width = 500 - margin.right - margin.left,
      height = 500 - margin.top - margin.bottom,
      radius = width/2;

  // color range
  var color = d3.scaleOrdinal()
    .range(["#BBDEFB", "#90CAF9", "#64B5F6", "#42A5F5", "#2196F3", "#1E88E5", "#1976D2"]);

  // arc generator
  var arc = d3.arc()
              .outerRadius(radius - 10)
              .innerRadius(0);

  // arc for the label positions
  var labelArc = d3.arc()
                   .outerRadius(radius - 40)
                   .innerRadius(radius - 40);

  // generate pie chart
  var pie = d3.pie()
              .sort(null)
              .value(function(d) {return d.count; });

  // define svg

  var svg = d3.select("#pie-container").append("svg")
              .attr("width", width)
              .attr("height", height)
              .append("g")
              .attr("transform", "translate(" + width/2 + "," + height/2 + ")");

  // append g elements (arc)
  var g = svg.selectAll(".arc")
             .data(pie(data))
             .enter().append("g")
             .attr("class", "arc");

  // append the path of the arc
  g.append("path")
   .attr("d", arc)
   .style("fill", function(d) { return color(d.data.name); })
   .transition()
   .duration(3000)
   .attrTween("d", function(b) {
     b.innerRadius = 0;
     var i = d3.interpolate({startAngle: 0, endAngle: 0}, b);
     return function(t) {return arc(i(t))}
   });

 // append the text (labels)

 g.append("text")
  .attr("transform", function(d) { return "translate(" + labelArc.centroid(d) + ")"; })
  .attr("dy", ".35em")
  .text(function(d) {return d.data.name; });

}

// load data on page load
$(document).ready(function(){
  loadBarChart1Data();
  loadPieChartData();
})
