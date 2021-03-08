package com.spring.biz.view.viewResolver;

/*
    ViewResolver 클래스는 Controller 가 리턴한 String(뷰이름)에
    접두어(prefix)와 접미어(suffix)를 결합해서
    "응답할 페이지의 경로와 파일명을 완성"해서 "리턴"
    DisplatcherServlet 의 init() 호출시 생성
*/
public class ViewResolver {
    private String prefix; //경로명
    private String suffix; //파일확장자

    public void setPrefix(String prefix) {
        this.prefix = prefix;
    }

    public void setSuffix(String suffix) {
        this.suffix = suffix;
    }

    /*
        예시 )  login.jsp 으로 응답처리할 경우
        전달되는 viewName은 login
        리턴값 : "./" + login + ".jsp"
        prefix 는 "./"
        suffix 는 ".jsp"
    */
    public String getView(String viewName){
        return prefix + viewName + suffix;
    }
}
