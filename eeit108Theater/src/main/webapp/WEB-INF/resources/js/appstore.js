/* 
    Document   : appstore.js
    Created on : 29 Sep, 2013, 12:20:32 AM
    Author     : RAM SWAROOP
*/
(function($){
    $.extend({ appstore : function(options) {
            // fetches options
            var opts = $.extend({},$.appstore.defaults,options);
//			輸入來源 = opts.json的輸入， 
//          如果輸入為檔案則開啟        $.getJSON  方法取得data，
//          如果是JSON字串則用	$.parseJSON
//          如果是JSON物件則開啟     var data = opts.json
//			JSON格式
//            "title"         :"甜蜜小套房",
//            "description"   :"租金：90,000/月",
//            "link"          :"https://tw.yahoo.com/",
//            "previewPic"     :".jpg",
//            "tag"           :"台北市",
//            "date"          :"2017-10-30"
            
            
//                      
            //-----------------修改版 V2------------------- 
            var data =opts.json;
            $.each(data.items,function(i){
                var item = 
                '<div id="as-item-'+i+'" class="as-item" '+((opts.theme!="light")?"style=\'background-color:"+opts.backgroundColor+";box-shadow:none\'":"")+'>'+
                '<a href="HousePage?NO='+data.items[i].houseNO+' ">'+
                '<div class="as-item-thumbnail"><img class="lazyload" height="180" width="300" style="max-height:180px;max-width:300px" src="'+ data.items[i].previewPic +'"/>  </div>'+
                '</a><div class="as-item-desc"><span class="as-icon as-icon-small"><span class="as-icon-tag"></span></span><span class="as-tag">'+data.items[i].cityName+'</span>'+
                '&nbsp;&nbsp;<span class="as-icon as-icon-small"><span class="as-icon-tag"></span>'+
                '</span><span class="as-tag">'+data.items[i].hForm+'</span>'+
                '&nbsp;&nbsp;<span class="as-icon as-icon-small"><span class="as-icon-tag"></span>'+
                '</span><span class="as-tag">坪數:'+data.items[i].houseSize+'坪</span>'+
                '<h3 '+((opts.theme!="light")?"style=\'color:"+opts.titleColor+"\'":"")+
                '><a style="color:black;font-weight: bold;text-decoration: none;" href="HousePage?NO='+data.items[i].houseNO+'">'+data.items[i].houseTitle+'</a></h3>'+
                '<p '+((opts.theme!="light")?"style=\'color:"+opts.descColor+"\'":"")+'><span>租金:&nbsp;</span><span style="font-size:1.5em;color:red;">'+data.items[i].houseRent+'</span><span>/月</span></p>'+
                '<p '+((opts.theme!="light")?"style=\'color:"+opts.descColor+"\'":"")+'><span>地址:&nbsp;</span>'+data.items[i].cityName+data.items[i].boroughName+data.items[i].houseAddr+'</p>'+
                '<a href="HousePage?NO='+data.items[i].houseNO+'" class="as-btn" style="background-color:'+opts.buttonColor+((opts.theme!="light")?";box-shadow:none":"")+'">'+opts.buttonValue+'</a></div></div>';
                $("#appstore-container").append(item);
            });
    	}
            
//            
            
            
            
            
            
           //-----------------修改版 V1------------------- 
//          $.getJSON(opts.json,function createAppStore(data){
//          var data =$.parseJSON(opts.json);
//            var data =opts.json;
//                $.each(data.items,function(i){
//                    var item = '<div id="as-item-'+i+'" class="as-item" '+
//                    ((opts.theme!="light")?"style=\'background-color:"+opts.backgroundColor+";box-shadow:none\'":"")+
//                    '><a href="'+data.items[i].houseNO+'"><div class="as-item-thumbnail" style="background-size:100% 100%;background-image:url(\''+
//                    data.items[i].thumbnail+'\')"></div></a><div class="as-item-desc"><span class="as-icon as-icon-small"><span class="as-icon-tag"></span></span><span class="as-tag">'+
//                    data.items[i].tag+'</span>&nbsp;&nbsp;<span class="as-icon as-icon-small"><span class="as-icon-calendar"></span></span><span class="as-date">'+
//                    data.items[i].date+'</span><h3 '+((opts.theme!="light")?"style=\'color:"+opts.titleColor+"\'":"")+'><a style="color:black;font-weight: bold;text-decoration: none;" href="'+data.items[i].houseNO+'">'+
//                    data.items[i].title+'</a></h3><p '+((opts.theme!="light")?"style=\'color:"+opts.descColor+"\'":"")+'>'+
//                    data.items[i].description+'</p><a href="'+data.items[i].houseNO+'" class="as-btn" style="background-color:'+
//                    opts.buttonColor+((opts.theme!="light")?";box-shadow:none":"")+'">'+opts.buttonValue+'</a></div></div>';
//                    $("#appstore-container").append(item);
//                });
//            });
//        }

    //-------------------原版----------------
//          $.getJSON(opts.json,function createAppStore(data){
//          var data =$.parseJSON(opts.json);
//            var data =opts.json;
//                $.each(data.items,function(i){
//                	
//                    var item = '<div id="as-item-'+i+'" class="as-item" '+
//                    ((opts.theme!="light")?"style=\'background-color:"+opts.backgroundColor+";box-shadow:none\'":"")+
//                    '><div class="as-item-thumbnail" style="background-image:url(\''+
//                    data.items[i].thumbnail+'\')"><a href="'+data.items[i].houseNO+'"><img src="'+data.items[i].logo+
//                    '" class="as-item-logo" '+((opts.theme!="light")?"style=\'background-color:"+opts.backgroundColor+"\'":"")+
//                    '/></a></div><div class="as-item-desc"><span class="as-icon as-icon-small"><span class="as-icon-tag"></span></span><span class="as-tag">'+
//                    data.items[i].tag+'</span>&nbsp;&nbsp;<span class="as-icon as-icon-small"><span class="as-icon-calendar"></span></span><span class="as-date">'+
//                    data.items[i].date+'</span><h3 '+((opts.theme!="light")?"style=\'color:"+opts.titleColor+"\'":"")+'>'+
//                    data.items[i].title+'</h3><p '+((opts.theme!="light")?"style=\'color:"+opts.descColor+"\'":"")+'>'+
//                    data.items[i].description+'</p><a href="'+data.items[i].houseNO+'" class="as-btn" style="background-color:'+
//                    opts.buttonColor+((opts.theme!="light")?";box-shadow:none":"")+'">'+opts.buttonValue+'</a></div></div>';
//                    $("#appstore-container").append(item);
//                });
////            });
//        }
    });
        
    $.extend($.appstore,{
        defaults : {
            json            : "",
            theme           : "light",
            buttonValue     : "查看更多",
            buttonColor     : "#0066FF",
            backgroundColor : "#0e0e0e",
            titleColor      : "#d4d4d4",
            descColor       : "#7e7e7e"
        }
    });
}(jQuery));