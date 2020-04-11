
function closeMsg() {
    $(".blackMask").css("display","none");
    $(".whiteContent").css("display","none");
}

<!-- 打印(PRINT) -->
function preview(oper) {
    if (oper < 10) {
        bdhtml = window.document.body.innerHTML;//获取当前页的html代码
        sprnstr = "<!--startprint" + oper + "-->";//设置打印开始区域
        eprnstr = "<!--endprint" + oper + "-->";//设置打印结束区域
        prnhtml = bdhtml.substring(bdhtml.indexOf(sprnstr) + 18); //从开始代码向后取html

        prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));//从结束代码向前取html
        window.document.body.innerHTML = prnhtml;
        window.print();
        window.document.body.innerHTML = bdhtml;
        //window.location.reload(); //刷新当前页面
    } else {
        window.print();
    }
}

<!-- 分页提示  -->
function chose() {
    var val = $("#select").val();
    var lastPageNum = $("input[name='lastPageNum']").val();
    if (val <= 0 || val > lastPageNum) {
        $('#light').show();
        $("#light").css("display","block");
        $("#fade").css("display","block");
        return false;
    }

}

//添加修改站点
function update(obj) {
    if (obj == null) {
        $('#update').modal('show');		//添加操作
    }
    if (obj != null) {
        if (confirm("确认要修改信息？")) {
            window.event.returnValue = false;
            var tds = $(obj).parent().parent().find('td');
            $('#na').val(tds.eq(1).text());
            $('#name').val(tds.eq(2).text());
            $('#namea').val(tds.eq(3).text());
            $('#nameb').val(tds.eq(4).text());
            $('#namec').val(tds.eq(5).text());
            $('#named').val(tds.eq(6).text());
            $('#namee').val(tds.eq(7).text());
            $('#nameh').val(tds.eq(8).text());
            if (tds.eq(8).text() == '超级管理员') {
                $('input[type=radio]').eq(2).attr("checked", 'checked');
            } else if (tds.eq(8).text() == '普通用户') {
                $('input[type=radio]').eq(0).attr("checked", 'checked');
            } else {
                $('input[type=radio]').eq(1).attr("checked", 'checked');
            }
            $('#update1').modal('show');
        }
    }
}

//全选，全不选
function getAll() {
    var tit = document.getElementById('all');
    var inputs = document.getElementsByTagName("input");
    for (var i = 0; i < inputs.length; i++) {
        if (inputs[i].type == "checkbox") {
            if (tit.checked == true) {
                inputs[i].checked = true;
            } else {
                inputs[i].checked = false;
            }
        }
    }
}

$(function () {

    showMsgModel();

    function showMsgModel() {
        var msg = $("#msg").val();
        if (msg != null && msg != "") {
            $('#light1').show();
            $("#light1").css("display","block");
            $("#fade1").css("display","block");
            return false;
        }
    }

    //导出表单数据
    $('#export').bind('click', function(e) {
        e.preventDefault();
        if(e.target.nodeName === "A"){
            tableExport('sample-table-2', "用户管理", e.target.getAttribute('data-type'));
        }
    });
});


