var kaixin_domain ="#HTTP_PROTOCOL#://#API_URL#";
//var kaixin_domain = "https://api-kxxyx-dev.kaixin001.com"
function GetQueryString(name)
{
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
}
function envelopeList(){
	var token=GetQueryString('token');
	var times=0;
	ajaxType({
        method: "POST",
        url: kaixin_domain+"/game/todayPlayGameTimeTotal/timeFormatType=1&token="+token,
        success: function(data) {
        	var res = JSON.parse(data);
			if(res.code == 200){
				times=parseInt(res.msg);
				var indexMinutes=times/60,
					progress=times/1200*100;
				$(".timeProgress span").css("width",progress+'%');
				if(indexMinutes>=2&&indexMinutes<4){
					$("#rate1-1,#rate1-2").attr("checked",true);
					
				}else if(indexMinutes>=4&&indexMinutes<8){
					$("#rate2-1,#rate2-2").attr("checked",true);
				}else if(indexMinutes>=8&&indexMinutes<12){
					$("#rate3-1,#rate3-2").attr("checked",true);
				}else if(indexMinutes>=12&&indexMinutes<16){
					$("#rate4-1,#rate4-2").attr("checked",true);
				}else if(indexMinutes>=16&&indexMinutes<20){
					$("#rate5-1,#rate5-2").attr("checked",true);
				}else if(indexMinutes>=20){
					$("#rate6-1,#rate6-2").attr("checked",true);
				}
				ajaxType({
			        method: "POST",
			        url: kaixin_domain+"/lottery/getDailyRedPacketInfo/?token="+token,
			        success: function(data) {
			        	var res = JSON.parse(data);
						if(res.code == 200 && res.msg){
							for(var i = 0; i < res.msg.packets.length; i++) {
								var seconds=res.msg.packets[i].seconds/60;
								if(res.msg.packets[i].status==0){
									if(times>=res.msg.packets[i].seconds){
										var userif='canUse';
									}else{
										var userif='';
									}
								}else if(res.msg.packets[i].status==1){
									var userif='userD';
								}
								
								var html = "<li class='"+userif+"' attr-id='"+res.msg.packets[i].id+"'>"+
												"<div class='top'>"+
													"<div class='iconClub'>"+
														"<img src='img/icon.png' />X"+res.msg.packets[i].num+""+
													"</div>"+
												"</div>"+
												"<div class='bottom'>"+seconds+"分钟</div>"+
											"</li>"	
								$(".envelopeList").append(html);
							}
						}
			        }
				});
			}
        }
	});
	
}
envelopeList();