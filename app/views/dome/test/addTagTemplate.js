/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-08-31 15:50:14
 * @LastEditTime: 2019-08-31 16:46:42
 * @LastEditors: Please set LastEditors
 */
var formCode = {
    get: function(index){
        var type = addoninfos[index].inputtype;
        if(type in formCode) return formCode[type](index);
        return "formCode中不存在" + type + "组件";
    },

    input: function(index){
        var str = '<tr>' +
                '<td>' + echo(addoninfos[index].itemname) + '：</td>' +
                '<td>' +
                    '<div class="form-group col-xs-4">' +
                        '<input class="form-control" name="' + addoninfos[index].field + '"  '+ echo(addoninfos[index].attr) + ' value=" "/>' +
                    '</div>' +
                    '<span style="line-height: 40px;"><i class="iconfont icon-tishi comment" style="color: #1C66A7;"></i></span>' +
                '</td>' +           
            '</tr>';

        return str;
    },

    test: function(){
        return "this.test;"
    }

}

