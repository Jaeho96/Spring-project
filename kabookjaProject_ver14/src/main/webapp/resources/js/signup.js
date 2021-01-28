const textcountlb = document.getElementById('idlb');

let idc = false;
let idck = RegExp(/^[a-zA-Z0-9]{4,12}$/);
$(function () {
	/*$('#sub_btn').click(function(e) {
		if($('#memberPW').val() == $('#memberPW2').val() && idc) {
			alert("가입완료 되었습니다");
			$('#signupForm').submit();
		} else {
			alert("가입 내용을 확인하세요!!");
		}
	});*/
    $('#memberPhoneNumber').keydown(function (event) {
        let key = event.charCode || event.keyCode || 0;
        $text = $(this);
        if (key !== 8 && key !== 9) {
            if ($text.val().length === 3) $text.val($text.val() + '-');
            if ($text.val().length === 8) $text.val($text.val() + '-');
        } else if (key == 8) {
            if ($text.val().length === 5) $text.val($text.val().substr(0, 4));
            if ($text.val().length === 10) $text.val($text.val().substr(0, 9));
        }
        return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
        // Key 8- 백스페이스, Key 9- 탭, Key 46- Delete || 0 ~ 9까지, Key 96 ~ 105- 넘버패트
        // 0 ~~~ 9 숫자 백스페이스, 탭, Delete 키 넘버패드외에는 입력못함
    });
    $('#memberID').on('keyup', function () {
        if ($('#memberID').val() == "") {
        	$('#idlb').html('<b style="color:red;">[아이디를 입력해주세요]</b>');
            idc = false;
        } else if (!idck.test($("#memberID").val())) {
            $('#idlb').html('<b style="color:red;">[영문자,숫자 4~12자로 입력해주세요]</b>');
            idc = false;
        } else {
            $.ajax({
                type: "POST",
                url: "members_idCheck.do",
                data: {
                    "memberID": $('#memberID').val()
                },
                success: function (data) {
                    if ($.trim(data) == "OK") {
                        $('#idlb').html('<b style="color:green;">[사용가능한 아이디]</b>');
                        idc = true;
                    } else {
                        $('#idlb').html('<b style="color:red;">[중복 아이디]</b>');
                        idc = false;
                    }
                }
            });
        }
    }); 
    $('#memberPW').on('keyup', function () {
        if ($("#memberPW").val() != "" && $("#memberPW2").val() != "") {
            if ($("#memberPW").val() != $("#memberPW2").val()) {
                $('#pwlb').html('<b style="font-size:16px;color:red;">[비밀번호 불일치!!]</b>');
            } else {
                $('#pwlb').html('<b style="font-size:16px;color:green;">[비밀번호 일치]</b>');
            }
        }
    });

    $('#memberPW2').on('keyup', function () {
        if ($("#memberPW2").val() == "") {
            $('#pwlb').html('<b style="font-size:16px;color:red;">[비밀번호를 확인해주세요]</b>');
        } else if ($("#memberPW").val() != $("#memberPW2").val()) {
            $('#pwlb').html('<b style="font-size:16px;color:red;">[비밀번호 불일치!!]</b>');
        } else {
            $('#pwlb').html('<b style="font-size:16px;color:green;">[비밀번호 일치]</b>');
        }

    });
});