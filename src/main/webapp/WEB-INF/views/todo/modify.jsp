<%--
  Created by IntelliJ IDEA.
  User: Park
  Date: 2024-01-08
  Time: 오후 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col">
            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">Navbar</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Features</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Pricing</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link disabled" aria-disabled="true">Disabled</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <div class="row">
        <div class="row content">
            <div class="col">
                <div class="card">
                    <h5 class="card-header">Featured</h5>
                    <div class="card-body">
                        <form action="/todo/modify" method="post">
                            <div class="input-group mb-3">
                                <span class="input-group-text">TNO</span>
                                <input type="text" name="tno" class="form-control" value=<c:out value="${dto.tno}"/> readonly>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text">Title</span>
                                <input type="text" name="title" class="form-control" value=<c:out value="${dto.title}"/>>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text">DueDate</span>
                                <input type="date" name="dueDate" class="form-control" value=<c:out value="${dto.dueDate}"/>>
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-text">Writer</span>
                                <input type="text" name="writer" class="form-control" value=<c:out value="${dto.writer}"/> readonly>
                            </div>
                            <div class="form-check">
                                <label class="form-check-label">
                                    Finished &nbsp;
                                    <input class="form-check-input" type="checkbox" name="finished" ${dto.finished?"checked":""}>
                                </label>
                            </div>
                            <div class="my-4">
                                <div class="float-end">
                                    <button type="button" class="btn btn-danger">Remove</button>
                                    <button type="button" class="btn btn-primary">Modify</button>
                                    <button type="button" class="btn btn-secondary">List</button>
                                </div>
                            </div>
                            <script>
                                const formObj = document.querySelector("form")
                                document.querySelector(".btn-danger").addEventListener("click", function(e){
                                    e.preventDefault()
                                    e.stopPropagation()
                                    formObj.action = `/todo/remove?${pageRequestDTO.link}`
                                    formObj.method = "post"
                                    formObj.submit()
                                },false)

                                document.querySelector(".btn-primary").addEventListener("click", function(e) {
                                    e.preventDefault()
                                    e.stopPropagation()
                                    formObj.action = "/todo/modify"
                                    formObj.method = "post"
                                    formObj.submit()
                                },false)

                                document.querySelector(".btn-secondary").addEventListener("click", function(e){
                                    e.preventDefault()
                                    e.stopPropagation()
                                    self.location = `/todo/list?${pageRequestDTO.link}`
                                },false)
                            </script>
                        </form>
                    </div>
                    <script>
                        const serverValidResult = {}
                        <c:forEach items="${error}" var="error">
                            serverValidResult['${error.getField()}'] = '${error.defaultMessage}'
                        </c:forEach>
                        console.log(serverValidResult)
                    </script>
                </div>
            </div>
        </div>
    </div>
    <div class="row content">
        <h1>Content</h1>
    </div>
    <div class="row footer">
        <div class="row fixed-bottom" style="z-index: -100">
            <footer class="py-1 my-1">
                <p class="text-center text-muted">Footer</p>
            </footer>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>
