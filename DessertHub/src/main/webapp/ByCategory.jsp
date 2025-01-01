<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="Dessert.DessertDAO, Dessert.DessertVO" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>범주 선택 방식</title>
    <style>
        .thumbnail { width: 300px; margin: 20px auto; }
        .center { text-align: center; }
    </style>
</head>
<body>
    <h1 class="center">디저트 추천 - 범주 선택</h1>

    <%-- 첫 번째 화면: 썸네일 이미지와 시작 버튼 --%>
    <div class="center">
        <img src="images/dessert_thumbnail.jpg" alt="디저트 썸네일" class="thumbnail">
        <br><br>
        <form action="ByCategory.jsp" method="get">
            <button type="submit">추천 시작하기</button>
        </form>
    </div>

    <%-- 사용자가 선택한 항목에 따라 진행할 다른 화면 --%>
    <% 
        String step = request.getParameter("step");
        if (step == null) {
            // 첫 번째 선택지 화면: 포만감 있는 디저트 vs 가벼운 디저트
    %>
        <h2 class="center">1. 포만감 있는 디저트와 가볍게 먹을 수 있는 디저트 중 선택</h2>
        <form action="ByCategory.jsp" method="get" class="center">
            <button type="submit" name="step" value="chara1">포만감 있는 디저트</button>
            <button type="submit" name="step" value="chara2">가볍게 먹을 수 있는 디저트</button>
        </form>

    <% 
        } else if (step.equals("chara1") || step.equals("chara2")) {
            // 두 번째 선택지 화면: 달콤한 디저트 vs 덜 달콤한 디저트
    %>
        <h2 class="center">2. 많이 달콤한 디저트와 많이 달지 않은 디저트 중 선택</h2>
        <form action="ByCategory.jsp" method="get" class="center">
            <button type="submit" name="step" value="<%= step + "-chara1" %>">많이 달콤한 디저트</button>
            <button type="submit" name="step" value="<%= step + "-chara2" %>">많이 달지 않은 디저트</button>
        </form>

    <% 
        } else if (step.endsWith("-chara1") || step.endsWith("-chara2")) {
            // 세 번째 선택지 화면: 케이크 vs 케이크 아닌 것
    %>
        <h2 class="center">3. 케이크와 케이크가 아닌 것 중 선택</h2>
        <form action="ByCategory.jsp" method="get" class="center">
            <button type="submit" name="step" value="<%= step + "-chara1" %>">케이크</button>
            <button type="submit" name="step" value="<%= step + "-chara2" %>">케이크가 아닌 것</button>
        </form>

    <% 
        } else {
            // 최종 선택 후 디저트 결과 페이지
            String finalChoice = request.getParameter("step");

            // 사용자가 선택한 "특징"에 해당하는 랜덤 디저트 가져오기
            DessertDAO dao = new DessertDAO();
            String chara = " asdf" ;
//             String chara = getCharaFromStep(finalChoice);  // 선택한 특징을 기반으로 chara 값 추출
            DessertVO dessert = dao.getRandomByChara(chara);  // 해당 특징에 맞는 디저트 가져오기
    %>
            <div class="center">
                <h2>지금 먹고 싶은 디저트는 "<%= dessert.getDName() %>" 입니다.</h2>
                <img src="<%= dessert.getDImg() %>" alt="<%= dessert.getDName() %>" class="thumbnail">
                <p><%= dessert.getDName() %></p>
                <br><br>
                <form action="index.jsp">
                    <button type="submit">홈으로 돌아가기</button>
                </form>
                <form action="ByCategory.jsp">
                    <button type="submit">다시 하기</button>
                </form>
            </div>
    <% 
        }
        
        // step 값에 따라 chara 값을 매핑하는 메서드
//         public String getCharaFromStep(String step) {
//             switch (step) {
//                 case "chara1-chara1": return "포만감"; break;
//                 case "chara1-chara2": return "가볍게 먹을 수 있는"; break;
//                 case "chara2-chara1": return "많이 달콤한"; break;
//                 case "chara2-chara2": return "많이 달지 않은"; break;
//                 case "chara3-chara1": return "케이크"; break;
//                 case "chara3-chara2": return "케이크가 아닌"; break;
//                 default: return ""; break;
//             }
//         }
    %>
</body>
</html>