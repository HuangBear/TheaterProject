$(function() {  
    var sWidth = $("#focus").width(); //獲取焦點圖的寬度（顯示面積）  
    var len = $("#focus ul li").length; //獲取焦點圖個數  
    var index = 0;  
    var picTimer;  
      
    //以下代碼添加數字按鈕和按鈕後的半透明條，還有上一頁、下一頁兩個按鈕  
    var btn = "<div class='btnBg'></div><div class='btn'>";  
    for(var i=0; i < len; i++) {  
        btn += "<span></span>";  
    }  
    btn += "</div><div class='preNext pre'></div><div class='preNext next'></div>";  
    $("#focus").append(btn);  
    $("#focus .btnBg").css("opacity",0.5);  
  
    //為小按鈕添加鼠標滑入事件，以顯示相應的內容  
    $("#focus .btn span").css("opacity",0.4).mouseover(function() {  
        index = $("#focus .btn span").index(this);  
        showPics(index);  
    }).eq(0).trigger("mouseover");  
  
    //上一頁、下一頁按鈕透明度處理  
    $("#focus .preNext").css("opacity",0.2).hover(function() {  
        $(this).stop(true,false).animate({"opacity":"0.5"},300);  
    },function() {  
        $(this).stop(true,false).animate({"opacity":"0.2"},300);  
    });  
  
    //上一頁按鈕  
    $("#focus .pre").click(function() {  
        index -= 1;  
        if(index == -1) {index = len - 1;}  
        showPics(index);  
    });  
  
    //下一頁按鈕  
    $("#focus .next").click(function() {  
        index += 1;  
        if(index == len) {index = 0;}  
        showPics(index);  
    });  
  
    //本例為左右滾動，即所有li元素都是在同一排向左浮動，所以這裡需要計算出外圍ul元素的寬度
    $("#focus ul").css("width",sWidth * (len));  
      
    //鼠標滑上焦點圖時停止自動播放，滑出時開始自動播放
    $("#focus").hover(function() {  
        clearInterval(picTimer);  
    },function() {  
        picTimer = setInterval(function() {  
            showPics(index);  
            index++;  
            if(index == len) {index = 0;}  
        },2000);//此2500代表自動撥放的間隔
    }).trigger("mouseleave");  
      
    //顯示圖片函數，根據接收的index值顯示相應的內容  
    function showPics(index) { //普通切換  
        var nowLeft = -index*sWidth; //根據index值計算ul元素的left值  
        $("#focus ul").stop(true,false).animate({"left":nowLeft},300); //通過animate()調整ul元素滾動到計算出的position  
        $("#focus .btn span").stop(true,false).animate({"opacity":"0.4"},300).eq(index).stop(true,false).animate({"opacity":"1"},300);//为当前的按钮切换到选中的效果   
    }  
});  