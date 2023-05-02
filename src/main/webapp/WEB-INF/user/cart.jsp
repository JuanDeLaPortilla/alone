<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrito | ALONE</title>
    <%@include file="/WEB-INF/commons/user-head-imports.jsp" %>
</head>
<body>

<!-- navbar -->
<jsp:include page="/WEB-INF/commons/user-header.jsp"/>
<!-- navbar -->

<section class="h-100 h-custom">
    <div class="container h-100 pt-5">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col">

                <div class="card mb-4 rounded p-3"
                     style="background-color: white !important;
                            box-shadow: 0px 0 30px rgb(1 41 112 / 10%) !important;
                            border: none !important;">

                    <!-- Carrito -->
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">Producto</th>
                                <th scope="col">Cantidad</th>
                                <th scope="col">Precio</th>
                            </tr>
                            </thead>

                            <tbody>
                            <tr>
                                <th scope="row">
                                    <div class="d-flex align-items-center">
                                        <img src="https://i.imgur.com/2DsA49b.webp" class="img-fluid rounded-3"
                                             style="width: 120px;" alt="Book">
                                        <div class="flex-column ms-4">
                                            <p class="mb-2 h5 descripcion">Descripcion</p>
                                            <p class="mb-0 small text-muted categoria">Categoria</p>
                                        </div>
                                    </div>
                                </th>
                                <td class="align-middle">
                                    <div class="d-flex flex-row">
                                        <button class="btn btn-link px-2 fs-4"
                                            <i class="bi bi-file-minus-fill"></i>
                                        </button>

                                        <p class="cantidad text-center">2</p>

                                        <button class="btn btn-link px-2 fs-4"
                                            <i class="bi bi-file-plus-fill"></i>
                                        </button>
                                    </div>
                                </td>
                                <td class="align-middle">
                                    <p class="mb-0 precio" style="font-weight: 500;">S/69</p>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- Carrito -->
                </div>

                <!-- Total de Compra -->
                <div class="card rounded p-3"
                     style="background-color: white !important;
                            box-shadow: 0px 0 30px rgb(1 41 112 / 10%) !important;
                            border: none !important;">
                    <div class="card-body p-0">

                        <div class="d-flex align-items-center justify-content-between">
                            <p class="mb-0 me-5 d-flex align-items-center justify-content-start">
                                <span class="me-2">Total:</span> <span
                                    class="lead fw-normal total">S/6969</span>
                            </p>

                            <div class="d-flex justify-content-end align-items-center">
                                <a class="mb-0 me-3 d-flex align-items-center btn btn-danger">
                                    <i class="bi bi-trash-fill"></i>
                                    <span class="d-lg-block d-none ms-2">Vaciar Carrito</span>
                                </a>

                                <a class="mb-0 d-flex align-items-center btn btn-primary">
                                    <i class="bi bi-arrow-right-circle"></i>
                                    <span class="d-lg-block d-none ms-2">Realizar el Pago</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Total de Compra -->
            </div>
        </div>

    </div>
</section>

<!-- footer -->
<jsp:include page="/WEB-INF/commons/user-footer.jsp"/>
<!-- footer -->

<%@include file="/WEB-INF/commons/user-footer-imports.jsp" %>
</body>
</html>
