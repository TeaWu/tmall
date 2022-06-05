/**
 * 点击修改地址按钮修改地址
 */
$(".saveAddress").click(function () {
    let receiver = $("input[name='receiver']").val();
    let mobile = $("input[name='mobile']").val();
    let address = $("input[name='address']").val();
    $.post("updateReceiverInfo", {
        "receiver": receiver,
        "mobile": mobile,
        "address": address,
    }, function (res) {
        if (res == "success") {
            layer.msg("修改成功", {
                timer: 800
            })
            window.location.reload();
        } else {
            layer.msg("修改失败", {
                timer: 800
            })
        }
    })
})

function submitOrder() {
    // 检查是否输入了地址
    let receiver = $("input[name='receiver']").val();
    let mobile = $("input[name='mobile']").val();
    let address = $("input[name='address']").val();
    // 检测地址是否合法
    if (!address || !receiver || !mobile) {
        layer.msg("检测到您没有输入合法的地址信息！", {
            timer: 800
        });
        return;
    }
    let load = layer.load(1, {
        shade: 0.2
    })
    // 提交订单信息
    $.post("createOrder", {"receiver": receiver, "mobile": mobile, "address": address,},
        function (res) {
            console.log(res)
            layer.close(load);
            if (res != 'fail') {
                layer.open({
                    title: '温馨提示'
                    , content: '订单提交成功！请前往支付'
                    , shade: 0.2
                    , icon: 6
                    , anim: 6
                    , closeBtn: 0
                    , end: function () {
                        window.location.href = res;
                    }
                })
            }
        });
}

$(function () {
    countTotalPrice()
});

//计算订单总价
function countTotalPrice() {
    //结算更新器，更新按钮颜色 已选商品数量 更新全选按钮，单品总价也更新
    let result = calculate($("table.checkout-review-order-table"));
    $(".sum-text").text("¥" + result);
}

function calculate(table) {
    let sumPrice = 0;
    let totalNum = 0;
    $(table).find("tr").each(function () {
        if (!isNaN(Number($(this).attr("data-sum")))) {
            sumPrice += Number($(this).attr("data-sum"));
        }
    });
    return sumPrice.toFixed(2);
}