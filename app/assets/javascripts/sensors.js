var graphData = []
tmp_list = []
var firstPlot = 0
var interval = 5000
var plotObj = new Object

var graphAjax = function()
{
  $.ajax({
    url: "sensors/graph", 
    success: function(data) 
    {
      graphData = data["data"]
    },
    complete: function (data) {
      setTimeout(graphAjax,interval);
    }
    }).done(function() {
      plotObj = $.plot($("#placeholder"),[graphData]);
    });
}

var initiateMonitor = function()
{
  $.ajax({
    type: "POST",
    url: "sensors/monitor",
    success: function(data)
    {
      alert("Initializing Monitor");
    }
  });
}

$(document).ready(function() {
  $("#initiate_monitoring").click(function (){
    initiateMonitor();
    setTimeout(graphAjax,interval);
  });
});
