/**
 * 
 */
$(document).ready(function() {  
      $("#ap_showDoctor").empty();
      $("#ap_showbuser").change(doctorshow);
      $("#ap_dday").change(dayselect);
      $("#ap_dtime").change(timeselect);
      $("#submit").click(function(){ // 빈칸 경고메시지
			if($("#ap_buser_show").val()==""){
				swal("경고","진료과를 선택해주세요","warning");
				return false;
			}else{  
				$("#ap_buser_show").focus();
			}
			if($("#ap_doctor_show").val()==""){
				swal("경고","진료의를 선택해주세요","warning");
				return false;
			}else{  
				$("#ap_doctor_show").focus(); 
			}
			if($("#ap_doctor_day").val()==""){
				swal("경고","진료일을 선택해주세요","warning"); 
				return false;
			}else{ 
				$("#ap_doctor_day").focus(); 
			}
			if($("#ap_doctor_time").val()==""){
				swal("경고","진료시간을 선택해주세요","warning");
				return false;
			}else{  
				$("#ap_doctor_time").focus(); 
			}
			swal("성공","예약이 접수 되었습니다.","success");
	});
});
   
function doctorshow(c_class){ //과 선택후 의사 보여주기

   $("#ap_showDoctor").empty();
   var show = $("#ap_showbuser option:selected").val();
   document.getElementById("ap_buser_show").value = show; // 과선택시 밑 화면 출력
   $.ajax({
         type:"get",
         url:"doctor",
         data:{"c_class":$("#ap_showbuser option:selected").val()},
         dataType:"json",
         success:function(doctors){
           var list = doctors.datas;
             var str ="<option name='select' value = '' selected disabled hidden>"+"==선택하세요=="+"</option>";
            $(list).each(function(idx, objArr){
               str += "<option value= '"+objArr.d_name+"'>"+objArr["d_name"]+ "</option>";
            });
            $("#ap_showDoctor").append(str);
            $("#ap_showDoctor").change(doctorselect); // 의사선택시 밑 화면 출력
   
         },
         error:function(){
            $("#ap_showDoctor").text("에러발생 "); 
         }
           
      });
}

function doctorselect(d_name){// 의사선택시 밑 화면 출력 and 의사번호 불러오기
   $.ajax({
         type:"get",
         url:"doctor_no",
         data:{"d_name":$("#ap_showDoctor> option:selected").val()},
         dataType:"json",
         success:function(doctorsnum){
           var list = doctorsnum.ddatas;
            $(list).each(function(idx, objArr){
               $("#ap_dno").val(objArr.d_number);
               var show5 = $("#ap_showDoctor> option:selected").val();
               document.getElementById("ap_doctor_show").value = show5;
            });
         },
         error:function(){
            $("#ap_dno").text("에러발생 "); 
         }
   });
}

function dayselect(){// 예약일 설정시 밑 화면 출력
   //alert("c");
   var show3 = $("#ap_dday").val();
   document.getElementById("ap_doctor_day").value = show3;

}
function timeselect(){// 시간 출력
   var show4 = $("#ap_dtime").val();
   document.getElementById("ap_doctor_time").value = show4;
}
