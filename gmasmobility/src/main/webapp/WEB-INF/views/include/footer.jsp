<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


  <!-- Bootstrap bundle JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
  <!--plugins-->
  <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/plugins/simplebar/js/simplebar.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/plugins/metismenu/js/metisMenu.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/pace.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/plugins/datatable/js/jquery.dataTables.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/plugins/datatable/js/dataTables.bootstrap5.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/table-datatable.js"></script>
  <!--app-->
  <script src="${pageContext.request.contextPath}/resources/assets/js/app.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/index.js"></script>
  <script src="${pageContext.request.contextPath}/resources/assets/js/pagenation.js"></script>
  <script>
    new PerfectScrollbar(".best-product")
 </script>
<script>
var lang_kor = {
        "decimal" : "",
        "emptyTable" : "데이터가 없습니다.",
        "info" : "_START_ - _END_ (총 _TOTAL_ 명)",
        "infoEmpty" : "0명",
        "infoFiltered" : "(전체 _MAX_ 명 중 검색결과)",
        "infoPostFix" : "",
        "thousands" : ",",
        "lengthMenu" : "_MENU_ 개씩 보기",
        "loadingRecords" : "로딩중...",
        "processing" : "처리중...",
        "search" : "검색 : ",
        "zeroRecords" : "검색된 데이터가 없습니다.",
        "paginate" : {
            "first" : "첫 페이지",
            "last" : "마지막 페이지",
            "next" : "다음",
            "previous" : "이전"
        },
        "aria" : {
            "sortAscending" : " :  오름차순 정렬",
            "sortDescending" : " :  내림차순 정렬"
        }
    };
</script>
<script>
$(document).ready(function() {
    // Get the .thumImg element
    var $thumImg = $(".thumbnail .thumImg");

    // Check if the image is loaded
    $thumImg.on("load", function() {
        // Check the image's dimensions
        var width = $thumImg.width();
        var height = $thumImg.height();

        // Add the 'portrait' class if the image is vertically long
        if (height > width) {
            $thumImg.addClass("portrait");
        }
    });
});
</script>

</body>

</html>