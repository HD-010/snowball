/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-08-31 15:50:14
 * @LastEditTime: 2019-08-31 16:07:22
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

    checkbox: function(index){
        var str = '<tr>' +
                '<td>' + echo(addoninfos[index].itemname) + '：</td>' +
                '<td>' + 
                    '<div class="btn-group auto-checkbox" data-toggle="buttons" style="margin-left:15px;">'+
                        '<label class="btn btn-outline btn-success btn-checkbox dim">'+
                            '<input type="checkbox" name="' + addoninfos[index].field + '"  '+ echo(addoninfos[index].attr) + ' value=" "> <i class="fa fa-check"></i><!--<i class="fa fa-times"></i>-->'+
                        '</label>'+
                    '</div>'+
                '</td></tr>';     
            
        return str;
    },

    radio: function(index){
        var str = '<tr>' +
                '<td>' + echo(addoninfos[index].itemname) + '：</td>' +
                '<td>' + 
                    '<div class="btn-group auto-radio" data-toggle="buttons" style="margin-left:15px;">'+
                        '<label class="btn btn-outline btn-success btn-radio dim">'+
                            '<input type="radio" name="' + addoninfos[index].field + '"  '+ echo(addoninfos[index].attr) + ' value=" "> <i class="fa fa-check"></i><!--<i class="fa fa-times"></i>-->'+
                        '</label>'+
                    '</div>'+
                '</td></tr>';     
            
        return str;
    },

    select: function(index){
        var str = '<tr>' +
                '<td>' + echo(addoninfos[index].itemname) + '：</td>' +
                '<td>' +
                    '<div class="col-sm-4 col-xs-4 auto-select">' +
                        '<select class="form-control" name="' + addoninfos[index].field + '" '+ echo(addoninfos[index].attr) + ' value=" "></select>' +
                    '</div>' +
                '</td>' +           
            '</tr>';

        return str;
    },

    textarea: function(index){
        var str = '<tr>' +
                '<td>' + echo(addoninfos[index].itemname) + '：</td>' +
                '<td>' +
                    '<div class="form-group col-xs-8">' +
                        '<textarea class="form-control" name="' + addoninfos[index].field + '"  '+ echo(addoninfos[index].attr) + '></textarea>' +
                    '</div>' +
                    '<span style="line-height: 40px;"><i class="iconfont icon-tishi comment" style="color: #1C66A7;"></i></span>' +
                '</td>' +           
            '</tr>';

        return str;
    },

    uediter: function(index){
        return '<tr>' +
            '<td>' + echo(addoninfos[index].itemname) + '：</td>' +
            '<td style="margin: 0px;padding:0px;">' +
                '<div class="col-sm-12 col-xs-12 ueditor-box" style="padding: 0px;">' +
                    '<input type="hidden" id="ue-contents" name="' + addoninfos[index].field + '" value="" />'+
                    '<iframe src="/admin/arc/ueditor" id="iframeSon" style="width:100%;height:100%;min-height:520px;border: 0;overflow: hidden;"></iframe>' + 
                '</div>' +
            '</td>' +           
        '</tr>';
    },

    /**
    *   图片上传控件参数说明：
    *   data-limit: 限制图片上传的张数
    *   data-field: 字段名称，input的name值
    **/
    uploader: function(index){
        return '<tr>' + 
            '<td>'+ echo(addoninfos[index].itemname) + '：</td>' + 
            '<td class="pic-box" data-limit="5" data-field='+ addoninfos[index].field +'>' + 
                '<div class="form-group col-xs-8">' + 
                    '<div class="replaceImg-label">' + 
                        '<label class="col-sm-2 control-label img-add" for="replaceImg">' + 
                            '<img src="/img/plus.png" />' + 
                        '</label>' + 
                    '</div>' + 
                '</div>' + 
                '<span style="line-height: 40px;"><i class="iconfont icon-tishi" style="color: #1C66A7;"></i></span>' + 
            '</td>' +            
        '</tr>';
    },

    /**
    *   规格项参数说明：
    **/
    spec: function(index){
        var str = `<tr>
            <td>`+ echo(addoninfos[index].itemname) +`</td>
            <td>
                <label class="col-xs-8">
                    <input type="checkbox" id="oper-spec" style="width:20px;height:20px;vertical-align:bottom;" name="usespec" value="1" />启用分类
                </label>
                <div class="col-xs-8" id="oper-spec-nes" style="border:0;display:none;"></div>
                <table border='1' class="col-xs-12" id="spec-table" style="display:none;"> </table>
            </td>
            <input type="hidden" name="specname" value="">         
            <input type="hidden" name="specitem" value="">         
            <input type="hidden" name="specoption" value="">         
        </tr>`;

        return str;
    },

    /**
    *   nesmodal树型结构列表输入
    **/
    nesmodal: function(index){
        var fieldName = addoninfos[index].field;
        var typeName = array2value(addoninfos, 'field', fieldName, 'itemname') || '所属分类'; 
        var listName = array2value(addoninfos, 'field', fieldName, 'islist') || '所属分类'; 
        var str = `<tr>
            <td>` + typeName + `：</td>
            <td>
                <div class="form-group col-xs-4">
                    <div data-freemodal="state" data-name="` + listName + `" style="height:3em;line-height:3em;border:1px solid #CFDADD;padding-left:1em;"></div>
                    <input type="hidden" name="`+ fieldName +`" value=""/>
                </div>
                <span style="line-height: 40px;"><i class="iconfont icon-tishi" style="color: #1C66A7;"></i></span>
            </td>              
        </tr>`;

        return str;
    },

    /**
    *   联动地址输入控件
    **/
    address: function(index){
        var showDetail = (addoninfos[index].limit == 4) ? '': 'hidden';
        return  `<tr>
            <td>`+ echo(addoninfos[index].itemname) + `：</td>
            <td>
                <div class="form-group col-xs-12 address-group" data-type="`+ echo(ctag) + `" data-level="`+ addoninfos[index].limit +`">
                    <input type="hidden" data-name='address' name="` + addoninfos[index].field + `" `+ echo(addoninfos[index].attr) + ` value="">
                    <select class="form-control address address-province" style="width:25%;float:left" data-key="" data-val="" name="addr_province" placeholder="--省--" value=""></select>
                    <select class="form-control address hidden" style="width:25%;float:left" name="addr_city" placeholder="--市--" value=""></select>
                    <select class="form-control address hidden" style="width:25%;float:left" name="addr_country" placeholder="--县--" value=""></select>
                    <input class="form-control `+ echo(showDetail) +`" style="width:25%;float:left" type="text" name="addr_detail" placeholder="详细地址" value=""/>
                </div>
            </td>              
        </tr>`;
    }
}

