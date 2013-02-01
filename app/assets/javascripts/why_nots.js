$(function() {
  whyNots = (function() {

    var pubInterface = {};

    $.ajaxSetup({
      async: true,
//        timeout: 2000,
      dataType: 'json',
      global: true,
      beforeSend: function() {
        $("#ajax_response").html("");
      },
      success: function(textStatus, xmlHttpRequest, data) {
        if (xmlHttpRequest.status == 204) {
          alert("no data found");
          return true;
        }
        return false;
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert("ajax error: " + errorThrown + ",     status code: " + jqXHR.status);
      }
    });

    $("#get_wines").click(function() {
      $.ajax({
        url: 'get_wines',
        type: 'GET',
        success: pubInterface.showWines
      });
    });

    $("#get_wine").click(function() {
      var wine_id = $("#wine_id").val().trim();
      if (!wine_id) {
        alert("must first enter the wine id");
        return;
      }
      $.ajax({
        url: 'get_wine' + "?id=" + wine_id,
        type: 'GET',
        success: pubInterface.showWine
      });
    });

    $("#post_wine").click(function() {
      var wine_id = $("#post_wine_id").val().trim();
      if (!wine_id) {
        alert("must first enter the wine id");
        return;
      }
      $.ajax({
        url: 'post_wine',
        data: {id: wine_id},
        type: 'POST',
        success: pubInterface.showWine
      });
    });

    pubInterface.showWines = function(data, textStatus, jqXHR) {
      if ($.ajaxSettings.success.call(this, textStatus, jqXHR, data))
        return;

      var dataStr = "";
      for (var i = 0; i < data.length; ++i) {
        dataStr = dataStr + "<p>" + JSON.stringify(data[i]) + "</p>";
      }
      $("#ajax_response").html(dataStr);
    };

    pubInterface.showWine = function(data, textStatus, jqXHR) {
      if ($.ajaxSettings.success.call(this, textStatus, jqXHR, data))
        return;

      $("#ajax_response").html("<p>" + JSON.stringify(data) + "</p>");
    };

    return pubInterface;
  })();
})