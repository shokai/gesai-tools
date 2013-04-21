#!/usr/bin/env phantomjs

if(phantom.args.length < 1){
  console.error("extract_links.js http://example.com");
  phantom.exit();
}

var url = phantom.args[0];
var wait = phantom.args[1] || 100;
 
page = new WebPage();
page.open(url, function(stat){
  if(!stat){
    phantom.exit();
  }
  setTimeout(function(){
    if(!page.injectJs("jquery-2.0.0.min.js")){
      console.error("inject jQuery error");
      phantom.exit();
    }
    var links = page.evaluate(function(){
      var result = [];
      $.each($("a"), function(index, i){
        result.push(i.href);
      });
      return result;
    });
    for(var i = 0; i < links.length; i++){
      console.log(links[i]);
    }
    phantom.exit();
  }, wait);
});
