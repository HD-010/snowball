function TranceConfsModel(){
    /**
     * 配置说明：
     * SDFGDFGDFGDFG feature(特征码) 遵循键名定义规则的任意字符，和某一张数据表进行关联
     * 其只 table 表示 和 SDFGDFGDFGDFG 关联的表名称
     * 其它键名表示 SDFGDFGDFGDFG 中可以自动传输修改数据的字段名称，其值表示数据类型（当前没有做数据类型验证）
     */
    var confs = {
        SDFGDFGDFGDFG: {
            table: "youbang_commodities_orders",//表名
            number: 'float',                    //限制能够储存到数据的数据类型
            totalprice: 'float',
            trancefree: 'float',
            state: 'text',
            coupon: 'float',
        }
    
    }

    /**
     * 返回字段状态数据
     */
    this.get = function(params){
        return confs[params];  
    }
}

module.exports = TranceConfsModel;