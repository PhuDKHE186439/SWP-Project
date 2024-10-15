<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 
    Document   : NewsDetails
    Created on : Oct 14, 2024, 3:04:03 AM
    Author     : P C
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Apz News</title>
        <link href="dcss/css/bootstrap.min.css" rel="stylesheet">
        <link href="dcss/css/global.css" rel="stylesheet">
        <link href="dcss/css/blog.css" rel="stylesheet">
        <link href="dcss/css/index.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="dcss/css/font-awesome.min.css" />
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap" rel="stylesheet">
        <script src="dcss/js/jquery-2.1.1.min.js"></script>
        <script src="dcss/js/bootstrap.min.js"></script>
    </head>

    <body>
<section id="center" class="center_home">
    <div class="container">
        <div class="row">
            <div class="center_home_1 clearfix">
                
                                 <div class="col-sm-3 space_left">
                    <div class="center_home_1rm clearfix">
                        <c:forEach var="newsItem" items="${newsList}" begin="8" end="10"> <!-- Show one more news item -->
                            <div class="center_home_1lm1 clearfix">
                                <a href="?action=view&id=${newsItem.id}">
                                    <img src="${newsItem.image}" class="iw" alt="${newsItem.title}">
                                </a>
                                <h6 class="col_2">
                                    <span class="bold col_1">${newsItem.location}</span> / ${newsItem.created_at}
                                </h6>
                                <h5 class="bold">
                                    <a href="?action=view&id=${newsItem.id}">${newsItem.title}</a>
                                </h5>
                            </div>
                        </c:forEach>
                        <div class="center_home_1r1 clearfix">
                            <ul class="nav_1">
                                <li class="active"><a data-toggle="tab" href="#home">LATEST </a></li>
                            </ul>
                            <div class="tab-content clearfix">
                                <div id="home" class="tab-pane fade clearfix active in">
                                    <c:forEach var="newsItem" items="${newsList}" begin="4" end="8"> <!-- Display more news in tabs -->
                                        <div class="click clearfix">
                                            <div class="click_i clearfix">
                                                <div class="col-sm-4 space_left">
                                                    <div class="click_il clearfix">
                                                        <a href="?action=view&id=${newsItem.id}">
                                                            <img src="${newsItem.image}" class="iw" alt="${newsItem.title}">
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col-sm-8 space_all">
                                                    <div class="click_ir clearfix">
                                                        <h6 class="col_2 mgt">
                                                            <span class="bold col_1">${newsItem.location}</span> / ${newsItem.created_at}
                                                        </h6>
                                                        <h5 class="bold">
                                                            <a href="?action=view&id=${newsItem.id}">${newsItem.title}</a>
                                                        </h5>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>