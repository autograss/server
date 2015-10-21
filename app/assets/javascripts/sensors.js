var p1 = []
var p2 = []

var graphAjax = function()
{
  $.ajax({
    url: "sensors/graph", 
    success: function(data) 
    {
      $.each(data, function(key,value) 
          {
            if (key == 'x') { 
              p1.push(value[0]) 
                p2.push(value[1]) 
            }
            if (key == 'y') { 
              p1.push(value[0]) 
                p2.push(value[1]) 
            }
          });
    }}).done(function() {
    alert("p1:" + p1);
    alert("p2:" + p2);
    $.plot($("#placeholder"),[[p1, p2]]);
  });
}
$(document).ready(function (){
  graphAjax();
});

