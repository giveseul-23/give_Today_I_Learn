    //체크박스의 클릭이 발생하면 상태에 따라서 금액 계산
    //체크상태 : 해당금액 더하기
    //체크해제 : 해당금액 빼기
    let totalTag; //차량금액(옵션포함) 객체 저장용
    let totalValue = 0; //차량금액 + 옵션금액
    window.onload = function(){
        totalTag = document.getElementById("total");
        totalValue = parseInt(totalTag.value);
    }
    
    function computeTotal(opt) {
        let optValue = parseInt(opt.value);
        if (opt.checked) { //체크상태 : 금액 더하기
            totalValue += optValue;
        } else { //체크해제 상태 : 금액 빼주기
            totalValue -= optValue;
        }
        console.log("totalValue : " + totalValue);
        totalTag.value = totalValue;
    }