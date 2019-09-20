/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-05-27 09:47:19
 * @LastEditTime: 2019-08-31 09:42:49
 * @LastEditors: Please set LastEditors
 */
function TableModel() {
    this.attr = "attr in model Test";

    //查询案例2：
    this.list = function(data,callback){
        //使用案例：实例化ShimService并调用成员方法查询
        var struct = {
            where  : [],
            groupBy: [],
            orderBy: [],
            limit  : []
        };

        //添加查询条件
        if(this.GET('grade')) struct.where.push(" grade =" + this.REQUEST('grade')); 

        //初始化构造查询对象
        var sqlStruct = this.SqlStruct(struct);
        
        //调用服务类进行查询
        var shim = this.service('Shim');
        shim.salgrade(sqlStruct,function(res){
            if(res.length){

                shim.tables(function(res){
                    callback(res);
                });
            }
        });
        
    }

    /**
     * 向数据表写入新的记录
     */
    this.add = function(data,callback){
        var struct = [
            //待写入的第一组数据
            {
                grade: this.POST('grade',{default:10}),
                losal: this.GET('losal',{default:1500}),
                hisal: this.POST('hisal') || 2500,
            },
            //待写入的第二组数据
            {
                grade: this.POST('grade',{default:10}),
                losal: this.GET('losal',{default:1600}),
                hisal: this.POST('hisal') || 2600,
            }
        ];

        //初始化构造查询对象
        var sqlStruct = this.SqlStruct(struct);

        var shim = this.service('Shim');
        shim.add(sqlStruct,function(error,results,fields){

            callback(res);
        });
    }

    //更新数据
    this.update = function(callback){
        var struct = {
            feilds:{
                losal: 23,
                hisal: 'now()+23',
            },
            where:[
                'grade = 10',
            ]
         };

        //初始化构造查询对象
        var sqlStruct = this.SqlStruct(struct);

        var shim = this.service('Shim');
        shim.update(sqlStruct,function(error,results,fields){
            
            callback(res);
        })
    }

    //删除数据
    this.delete = function(callback){
        var struct= {
            where:[
                'grade = 10',
                //在这里写更多条件
            ]
        }

        var sqlStruct = this.SqlStruct(struct);
        var shim      = this.service('Shim');
        shim.delete(sqlStruct,function(error,results,fields){

            callback(res)
        })
    }

    /**
     * 以表对象查询
     */
    this.tableObjTest = function(data,callback){
        //使用案例：实例化TestService并调用showApp()方法
        var conditions = {
            table:['snowball_sys_acount'],
            where:['pid=1'],
            having:[],
            groupBy:[],
            orderBy:[],
            limit:[]
        }
        
        this.DB().get(conditions,function(error,results,fields){
            callback(error,results,fields);
        });
    }

    /**
     * 以表对象保存在数据
     * params= {
     *      table:'',
            where:[
                'grade = 10',
                //在这里写更多条件
            ],
            fields:[
            //待写入的第一组数据
                {
                    grade: this.POST('grade',{default:10}),
                    losal: this.GET('losal',{default:1500}),
                    hisal: this.POST('hisal') || 2500,
                },
                //待写入的第二组数据
                {
                    grade: this.POST('grade',{default:10}),
                    losal: this.GET('losal',{default:1600}),
                    hisal: this.POST('hisal') || 2600,
                }
            ]
        }
     */
    this.tableObjSet = function(data,callback){
        var conditions = {
            table:'test',
            where:[ 'id=1' ],
            fields:[
            //待写入的第一组数据
                {
                    age: 99,
                },
               
            ]
        }
        
        this.DB().set(conditions,function(error,results,fields){
            callback(error,results,fields);
        });
    }

    /**
     * 使用案例：DB().set()方法修改记录，增加记录或增加字段并增加或修改记录
     */
    this.addField = function(){
        var params = {
            table:'ranyun_test',
            where:[
                'id="'+this.GET('id')+'"',
            ],
            fields:[
                { name:"可达森林",sex:254,cash:295.82,grade:''}
            ]
        };
        this.DB().set(params,function(error,results,fields){
            
            that.renderJson(results);
        });
    }

    /**
     * 测试mysql数据库同步查询
     */
    this.testSql = async function(){
        var sql = "select * from #@addonadv";
        var res = await this.DB().syncQuery(sql);
        return res;
    }
    this.testSql2 = async function(){
        var sql = "select * from #@arcatt";
        var res = await this.DB().syncQuery(sql);
        return res;
    }

}

module.exports = TableModel;