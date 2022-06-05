/**
 * 去结账
 */
// function goToPay() {
//     let layer = layui.layer;
//     let totalCount = $("#cartNumberTotal").text()
//     if (totalCount <= 0) {
//         layer.msg('购物车没有可以结账的商品哦！', {
//             timer: 1000
//         })
//         return false;
//     } else {
//         let checkLogin = "checkLogin";
//         $.get(checkLogin, function (result) {
//             if (result === "success") {
//                 return true;
//             } else {
//                 layer.msg('您的登录已过期，请重新登录！', {
//                     timer: 1000
//                 })
//                 window.location.href = "login";
//             }
//         });
//     }
// }
//检查登陆
function checkLogin() {
    let layer = layui.layer;
    let url = "checkLogin";
    $.get(url, function (result) {
        if (result === "success") {
            return true;
        } else {
            layer.msg('您的登录已过期，请重新登录！', {
                timer: 1000
            })
            window.location.href = "login";
            return false;
        }
    });
    return true;
}

$(".goToPay").click(function () {
    let layer = layui.layer;
    let totalCount = $("#cartNumberTotal").text()
    let cartItemIds = sumUpdate();
    if (checkLogin()) {
        if (totalCount == 0) {
            layer.msg('购物车没有可以结账的商品哦！', {
                timer: 1000
            })
            return false;
        } else {
            let url = "buy?";
            url += "cartItemId=" + cartItemIds[0]
            for (let i = 1; i < cartItemIds.length; i++) {
                url += "&cartItemId=" + cartItemIds[i];
            }
            console.log(url);
            window.location.href = url;
        }
    }
});


//计算总价和总数量
function calculate(table) {
    let sumPrice = 0;
    let totalNum = 0;
    let cartItemIds = [];
    let checkbox1 = document.querySelectorAll(".checkbox1");
    let i = 0;
    $(table).find("tr").each(function () {
        if (checkbox1[i].checked) {
            if (!isNaN(Number($(this).attr("data-sum")))) {
                sumPrice += Number($(this).attr("data-sum"));
                totalNum += Number($(this).attr("data-num"));
                cartItemIds.push($(this).attr("data-id"));
            }
        }
        if (i < checkbox1.length - 1) {
            i++;
        }
    });
    console.log(cartItemIds);
    return [sumPrice.toFixed(2), totalNum, cartItemIds];
}

function sumUpdate() {
    //结算更新器，更新按钮颜色 已选商品数量 更新全选按钮，单品总价也更新
    let result = calculate($("table.table.shop-cart"));
    $(".sum-text").text(result[0]);
    $(".cart-subtotal").text(result[1]);
    return result[2];
}

$(function () {
    let qx = document.querySelector("#qx");
    let checkbox1 = document.querySelectorAll(".checkbox1");
    qx.onclick = function () {
        for (let i = 0; i < checkbox1.length; i++) {
            checkbox1[i].checked = qx.checked;
        }
        sumUpdate();
    }
    for (let i = 0; i < checkbox1.length; i++) {
        checkbox1[i].onclick = function () {
            let flag = true;
            for (let j = 0; j < checkbox1.length; j++) {
                if (!checkbox1[j].checked) {
                    flag = false;
                    break;
                }
            }
            sumUpdate();
            qx.checked = flag;
        }
    }
    sumUpdate()
});
/**
 * 为购物车数量框绑定改变事件
 */
$("input[name='number']").change(function () {
    let val = $(this).val();
    let stock = parseInt($(this).attr("data-stock"));
    let number = parseInt($(this).attr("data-number"));
    let ciid = parseInt($(this).attr("data-ciid"));
    let price = parseInt($(this).attr("data-price"));
    let nowPrice = parseInt($(this).attr("data-nowPrice"));
    let sum = parseInt($(this).attr("data-sum"));
    let originalPrice = parseInt($(this).attr("data-originalPrice"));

    // val为null代表输入的数字不合法
    if (val) {
        // 查看输入的数量是否大于库存
        if (val > stock) {
            layer.msg("当前商品的库存没有这么多啦！", {
                timer: 800
            })
            $(this).val(number);
            return;
        }
        // 数量没问题, 更新购物车信息
        $.get("changeCartNum",
            {"ciid": ciid, "num": val},
            function (result) {
                if (result !== "success") {
                    layer.msg("数量更改出错，可能是库存不足", {
                        timer: 800
                    })
                    return false;
                } else {
                    layer.msg("数量更改成功", {
                        timer: 100
                    })
                    window.location.reload();
                    sumUpdate();
                }
                return true;
            });
    }
})

$(".removeItem").click(function () {
    deleteCiid = $(this).attr("data-id");
    $.get("deleteCartItem", {"ciid": deleteCiid},
        function (result) {
            if (result == "success") {
                layer.msg("删除成功", {
                    timer: 800
                })
                sumUpdate();
            } else {
                layer.msg("删除失败", {
                    timer: 800
                })
            }
        });
//    刷新页面
//     window.location.reload(ture);
});
