<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>果蔬超市</title>
</head>
<body>
    <footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <img src="images/footer_logo.png" class="footer-logo" alt="" />
                <p>
                    欢迎来到果蔬超市。我们的产品是刚收获的，洗好就可以装箱，最后从我们的线下门店送到你家门口。
                </p>
                <div class="footer-social">
                    <a href="#" data-toggle="tooltip" data-placement="top" title="Facebook"><i class="fa fa-facebook"></i></a>
                    <a href="#" data-toggle="tooltip" data-placement="top" title="Twitter"><i class="fa fa-twitter"></i></a>
                    <a href="#" data-toggle="tooltip" data-placement="top" title="Pinterest"><i class="fa fa-pinterest"></i></a>
                    <a href="#" data-toggle="tooltip" data-placement="top" title="Instagram"><i class="fa fa-instagram"></i></a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="widget">
                    <h3 class="widget-title">快捷操作</h3>
                    <ul>
                        <li><a href="#">前往购物</a></li>
                        <li><a href="#">关于我们</a></li>
                        <li><a href="#">联系我们</a></li>
                        <li><a href="#">网站后台</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-5">
                <div class="widget">
                    <h3 class="widget-title">联系我们</h3>
                    <p>
                        您有任何意见都可以和我们联系，我们会尽快回复您的信息。
                    </p>
                    <form class="newsletter" >
                        <label for="message"></label><input type="text" id="message" name="message" placeholder="Leave us a message" required="" />
                        <button id="leave-message" class="leave-message"><i class="fa fa-paper-plane"></i></button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</footer>
    <div class="copyright">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    Copyright &copy; 2020.Personal HaoDi All rights reserved.
                </div>
                <div class="col-md-4">
                    <img src="images/footer_payment.png" alt="" />
                </div>
            </div>
        </div>
        <div class="backtotop" id="backtotop"></div>
    </div>
</body>
<script>
    layui.use(['layer'], function() {
        $(".leave-message").click(function () {
            let page = "checkLogin";
            $.get(page, function (res) {
                if (res == "success") {
                    let message = $("input[name='message']").val();
                    $.ajax({
                        url: 'leaveMessage',
                        type: "POST",
                        data: {
                            content: message,
                        },
                        function (result) {
                            if (result == "success") {
                                layer.msg("留言成功");
                                return true;
                            }
                            else {
                                layer.msg("留言失败");
                                return false;
                            }
                        }
                });
                } else {
                    layer.msg("请先登录");
                    return false;
                }
            });
        });
    });
</script>
</html>
