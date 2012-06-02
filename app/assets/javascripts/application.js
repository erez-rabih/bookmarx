// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//
function showVideoTitleAndThumbnail(jsonp_data){
  var info = jsonp_data.feed.entry[0];
  var title = info.title.$t;
  var thumbnail_src = info.media$group.media$thumbnail[0].url;
  var id = info.id.$t.match(/video:(\w+)/)[1];

  bookmark_tr = $("tr[data-video-id='"+id+"']");
  bookmark_tr.find("td.video_title'").html(title);
  bookmark_tr.find("td.thumbnail img").attr('src', thumbnail_src);

}
