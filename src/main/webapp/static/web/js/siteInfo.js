
function closeMsg(){
    $(".white_content").css("display","none");
    $(".black_overlay").css("display","none");
}

//打印
function preview(oper)
{
    if (oper < 10)
    {
        bdhtml=window.document.body.innerHTML;//获取当前页的html代码
        sprnstr="<!--startprint"+oper+"-->";//设置打印开始区域
        eprnstr="<!--endprint"+oper+"-->";//设置打印结束区域
        prnhtml=bdhtml.substring(bdhtml.indexOf(sprnstr)+18); //从开始代码向后取html

        prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));//从结束代码向前取html
        window.document.body.innerHTML=prnhtml;
        window.print();
        window.document.body.innerHTML=bdhtml;
        //window.location.reload(); //刷新当前页面
    } else {
        window.print();
    }
}

//增加修改站点
function update(obj) {
    if (obj != null) {
        if (confirm("确认要修改信息？")) {
            window.event.returnValue = false;
            var tds = $(obj).parent().parent().find('td');
            $('#name').val(tds.eq(2).text());
            $('#namea').val(tds.eq(3).text());
            $('#nameb').val(tds.eq(4).text());
            $('#namec').val(tds.eq(5).text());
            $('#named').val(tds.eq(6).text());
            $('#namee').val(tds.eq(7).text());
            $('#namef').val(tds.eq(1).text());
            $('#nameh').val(tds.eq(8).text());
            if(tds.eq(8).text() == '是'){
                $('input[type=radio]').eq(1).attr("checked",'checked');
                //$("input[name='mid'][value='1']").attr("checked",'checked')
            }else{
                $('input[type=radio]').eq(2).attr("checked",'checked');
                //$("input[name='mid'][value='0']").attr("checked",'checked')
            }
            $('#update1').modal('show');
        }
    }

    if(obj == null) {
        $('#update').modal('show');
    }
}

//跳转页面检查
function chose(){
    var val = $("#select").val();
    var totalPageSize = $("input[name='lastPageNum']").val();
    if(val <= 0 || val > totalPageSize){
        $('#light').show();
        $("#light").css("display","block");
        $("#fade").css("display","block");
        return false;
    }
}

$(function(){

    showMessage();

    //显示修改提示信息
    function showMessage() {
        var msg = $("input[name='msg']").val();
        if(msg != null && msg != ""){
            $('#light1').show();
            $("#light1").css("display","block");
            $("#fade1").css("display","block");
            return false;
        }
    }

    //导出表单数据
    $('#export').bind('click', function(e) {
        var model = $("input[name='model']").val();
        var fileName;
        if(model == 2){
            fileName = "站点管理";
        } else {
            fileName = "站点信息";
        }
        e.preventDefault();
        if(e.target.nodeName === "A"){
            tableExport('sample-table-2', fileName, e.target.getAttribute('data-type'));
        }

    });

})
