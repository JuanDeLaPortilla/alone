<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contacto | ALONE</title>
    <%@include file="/WEB-INF/commons/user-head-imports.jsp"%>
</head>
<body>

<!-- navbar -->
<jsp:include page="/WEB-INF/commons/user-header.jsp"/>
<!-- navbar -->

<!-- sub header -->
<div class="sub-header" style="background-image: linear-gradient(rgba(0, 0, 0, 0.7), rgba(59,70,73,0.14)), url(${pageContext.request.contextPath}/assets/img/fondo3_1.jpg)">
    <h1 class="header-title fs-2">Cont&aacute;ctanos</h1>
</div>
<!-- sub header -->

<!-- contact -->
<div class="container content p-4">
    <div class="row" style="margin-top: 50px;">
        <div class="col-md-6 py-3 py-md-0">
            <div class="card">
                <img src="${pageContext.request.contextPath}/assets/img/" alt="">
            </div>
        </div>
        <div class="col-md-6 py-3 py-md-0">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maiores, vitae numquam aspernatur repellendus
                autem sint beatae, facilis quas deserunt iure natus minus ab deleniti eveniet neque quasi ullam id in
                alias consectetur quia nesciunt. Exercitationem vitae atque commodi architecto tenetur! Fugit
                necessitatibus nesciunt, eligendi tempora reprehenderit suscipit doloribus animi mollitia maiores?
                Numquam, est laborum dicta aperiam nobis deserunt libero non dolorem cum dolorum distinctio commodi
                iure, tenetur animi? Nam similique culpa consequuntur itaque quasi ipsa placeat ea perferendis est quo,
                ut eaque quis dolorem, aliquam iste reprehenderit provident neque magnam voluptatibus. Eaque provident
                omnis reiciendis ducimus, magni qui voluptatem quibusdam.</p>
        </div>
    </div>
    <div class="row" style="margin-top: 50px;">
        <div class="col-md-6 py-3 py-md-0">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maiores, vitae numquam aspernatur repellendus
                autem sint beatae, facilis quas deserunt iure natus minus ab deleniti eveniet neque quasi ullam id in
                alias consectetur quia nesciunt. Exercitationem vitae atque commodi architecto tenetur! Fugit
                necessitatibus nesciunt, eligendi tempora reprehenderit suscipit doloribus animi mollitia maiores?
                Numquam, est laborum dicta aperiam nobis deserunt libero non dolorem cum dolorum distinctio commodi
                iure, tenetur animi? Nam similique culpa consequuntur itaque quasi ipsa placeat ea perferendis est quo,
                ut eaque quis dolorem, aliquam iste reprehenderit provident neque magnam voluptatibus. Eaque provident
                omnis reiciendis ducimus, magni qui voluptatem quibusdam.</p>
        </div>
        <div class="col-md-6 py-3 py-md-0">
            <div class="card">
                <img src="${pageContext.request.contextPath}/assets/img/" alt="">
            </div>
        </div>
    </div>
</div>
<!-- contact -->

<!-- footer -->
<jsp:include page="/WEB-INF/commons/user-footer.jsp"/>
<!-- footer -->

<%@include file="/WEB-INF/commons/user-footer-imports.jsp"%>

</body>
</html>