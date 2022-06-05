layui.use(['layer'], function () {

    let layer = layui.layer;

    $(function () {
        let type = $("input[name='type']").val();
        let container = document.getElementById('dowebok')
        let sendTimer = 60;
        let timer;
        // let isClick = false;

        init();

        function init() {
            if (type === 'register') {
                container.classList.add('right-panel-active')
                $("#addForm").show();
                $("#editForm").hide();
            } else if (type === 'editPassword') {
                container.classList.add('right-panel-active')
                $("#editForm").show();
                $("#addForm").hide();
            }
        }

        // 监听登陆按钮点击事件
        $("#loginBtn").click(function () {
            // 非空验证
            let name = $("input[name='loginName']").val();
            let password = $("input[name='loginPassword']").val();
            if (!name || !password) {
                layer.msg("请填写完整登录信息！", {timer: 1000});
                return;
            }
            // 调用登陆验证接口
            // 发送请求
            $.ajax({
                url: 'loginIn',
                type: "POST",
                async: false,
                data: {
                    name: name,
                    password: password
                },
                success: function (res) {
                    if (res == "success") {
                        layer.msg("登录成功", {
                            timer: 1000,
                            end: function () {
                                window.location.href = getPath();
                            }
                        })
                    } else {
                        layer.msg("登录失败", {
                            timer: 1000
                        })
                    }
                },
                error: function (res) {
                    layer.confirm('啊哦！访问出问题了！快找开发狗算账！', {
                        btn: ['确定']  //按钮
                        , icon: 5
                        , anim: 6
                    }, function (index) {
                        lock = true;
                        layer.close(index);
                    });
                }
            })
        })

        // 监听提交修改按钮点击事件
        $("#editPassBtn").click(function () {
            // 提交时进行非空验证
            let name = $("input[name='forgetName']").val();
            let oldPassword = $("input[name='oldPassword']").val();
            let newPassword = $("input[name='newPassword']").val();
            if (!name || !oldPassword || !newPassword) {
                layer.msg('请填写完整信息！', {timer: 1000});
                return;
            }
            // 发送请求
            $.ajax({
                url: 'forget',
                type: "POST",
                async: false,
                data: {
                    name: name,
                    oldPassword: oldPassword,
                    newPassword: newPassword
                },
                success: function (res) {
                    console.log(res);
                    if (res == "success") {
                        layer.msg("密码修改成功", {
                            timer: 1000,
                            end: function () {
                                resetForm();
                                $("input[name='type']").val("login");
                                container.classList.remove('right-panel-active')
                            }
                        })
                    } else if (res == "Fail") {
                        layer.msg("用户不存在或原密码不正确，请重新输入", {
                            timer: 1000
                        })
                    }
                },
                error: function (res) {
                    layer.confirm('啊哦！访问出问题了！快找开发狗算账！', {
                        btn: ['确定']  //按钮
                        , icon: 5
                        , anim: 6
                    }, function (index) {
                        lock = true;
                        layer.close(index);
                    });
                }
            })
        })

        // 监听注册按钮点击事件
        $("#registerBtn").click(function () {
            // 提交时进行非空验证
            let regexp = /^[a-zA-Z\d_-]{4,16}$/;
            let name = $("input[name='registerName']").val();
            let password = $("input[name='registerPassword']").val();
            if (!name || !password) {
                layer.msg('请填写完整注册信息！', {timer: 1000});
                return;
            }
            if (!regexp.test(name)) {
                layer.msg('用户名格式不正确,只允许数字和英文字母！', {timer: 1000});
                return;
            }
            // 发送请求
            $.ajax({
                url: 'registerAdd',
                type: "POST",
                async: false,
                data: {
                    name: name,
                    password: password,
                },
                success: function (res) {
                    if (res == "success") {
                        layer.msg("注册成功，请登录", {
                            timer: 1000,
                            end: function () {
                                resetForm();
                                $("input[name='type']").val("login");
                                container.classList.remove('right-panel-active')
                            }
                        })
                    } else {
                        layer.msg("注册失败", {
                            timer: 1000
                        })
                    }
                },
                error: function (res) {
                    layer.confirm('啊哦！访问出问题了！快找开发狗算账！', {
                        btn: ['确定']  //按钮
                        , icon: 5
                        , anim: 6
                    }, function (index) {
                        lock = true;
                        layer.close(index);
                    });
                }
            })
        })
    })
})