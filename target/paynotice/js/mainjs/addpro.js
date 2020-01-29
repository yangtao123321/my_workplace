$(function() {

    $(".but1").click(function() {

        var pname=$(".pname_val").val();

        var did=$(".dept_val").val();

        var ursday=$(".urs_val").val();


        if(pname.trim()=='') {
            alert("项目名称不能为空!");
        }else if(did.trim()=='') {
            alert("部门不能为空!");
        }else if(ursday.trim()=='') {
            alert("URS所需时间不能为空!");
        }else{
            $.ajax({
                url:"start.do",
                type:"post",
                async:false,
                data:{"pname":pname,"dept.did":did,"status.sid":"1","ursday":ursday},
                dataType:"json",
                success:function(data) {

                    if(data=='addok') {
                        alert("该流程已开启,将进入URS准备阶段");
                        $(".right_1").slideToggle(300);
                    }
                }
            });
        }

    });
});