function userService(){
    this.reg = function(data,callback){
        //act=开放平台(wxkf),微信小程序(wxxcx),微信公众号(wxgzh),无授权数据(cnn)
        let self = this;
        let opnid1="";
        let opnid2="";
        let opnid3="";
        let act = data.act;
        if(act=='wxkf'){
            opnid3=data.openid;
        }else if(act=='wxxcx'){
            opnid1=data.openid;
        }else if(act=='wxgzh'){
            opnid2=data.openid;
        }
        let checkTimer = function(stm){
            let mm = new Date().getTime();
            let rtn = (mm-stm)/1000;
            return rtn;
        }
        let mask = Math.floor(Math.random()*900000+100000);
        let utility = require('utility');
        let passwd  = utility.md5(data.pwd + mask);
        let code = data.code;
        let db = self.DB("Redis");
        let ky = "yzm_"+data.phone;
        let checkName = function(s) {
            //var regex = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~！@#……&*（）|{}]");
            var regex = new RegExp("[`~!$^*()|{}';',\\[\\]<>~！@#……*（）|{}]");
            var rs    = "";
            for (var i = 0; i < s.length; i++) {
                rs = rs + s.substr(i, 1).replace(regex, '');
            }
            return rs;
        }
        let name = checkName(data.nick);
        let sqla = "select * from ranyun_member where mobile='"+data.phone+"'";
        let sql="insert into ranyun_member(nick,password,mask,unionid,openid1,openid2,openid3,mobile,addTime,face,sex) values('"+name+"','"+passwd+"',"+mask+",'"+data.unionid+"','"+opnid1+"','"+opnid2+"','"+opnid3+"','"+data.phone+"',now(),'"+data.face+"','"+data.sex+"')";
        console.log(sqla);
        console.log(sql);
        console.log(code);
        db.getRedis(ky,function(dd){
            if(dd!=false){
                let jsn = JSON.parse(dd);
                console.log(jsn);
                if(code==jsn.code){
                    let lng = checkTimer(jsn.time);
                    if(lng<120){//验证码在有效期内时添加数据
                        self.DB().query(sqla,function(rsx){
                            if(rsx==false){
                                self.DB().excute(sql,function(rs){
                                    callback(rs);
                                });
                            }else{
                                let sqlx="";
                                let obj=rsx[0];
                                if(act=='wxkf'){
                                    sqlx="update ranyun_member set openid3='"+opnid3+"' where id="+obj.id;
                                }else if(act=='wxxcx'){
                                    sqlx="update ranyun_member set openid1='"+opnid1+"' where id="+obj.id;
                                }else if(act=='wxgzh'){
                                    sqlx="update ranyun_member set openid2='"+opnid2+"' where id="+obj.id;
                                }
                                if(sqlx!=''){
                                    self.DB().excute(sqlx,function(rs){});
                                }
                                callback(false,1);
                            }
                        })
                    }else{
                        callback(false);
                    }
                }else{
                    callback(false);
                }
            }else{
                callback(false);
            }
        });
    }
    this.loginother = function(data,callback){
        let act = data.act;
        let openid = data.openid;
        console.log(JSON.stringify(data))
        let whtj = "";
        if(act == "wxkf"){
            whtj = "a.openid3='"+openid+"'";
        }else if(act=="wxxcx"){
            whtj = "a.openid1='"+openid+"'";
        }else if(act=="wxgzh"){
            whtj = "a.openid2='"+openid+"'";
        }
        let self=this;
        let sql = "select a.id,a.nick,a.mask,a.password,a.face,a.sex,ifnull((select b.id from ranyun_suppliers b where b.memberId=a.id order by b.id asc limit 0,1),0)suppliersId,ifnull((select b.templateId from ranyun_suppliers b where b.memberId=a.id order by b.id asc limit 0,1),0)templateId from ranyun_member a where "+whtj;
        let fun = function(usid,sid){
            let sql = "select * from ranyun_suppliers_member where memerId="+usid+" and suppliersId="+sid;
            self.DB().query(sql,function(rs){
                if(rs==false){
                    let sqla = "insert into ranyun_suppliers_member(suppliersId,memerId,score,addtime) values("+sid+","+usid+",0,now())";
                    self.DB().excute(sqla,function(rsa){});
                }
            });
        }
        this.DB().query(sql,function(rs){
            if(rs==false){
                callback(false);
            }else{
                let obj=rs[0];
                if(data.suppid>0){
                    fun(obj.id,data.suppid);
                }
                callback({id:obj.id,nick:obj.nick,face:obj.face,sex:obj.sex,suppliersId:obj.suppliersId,templateId:obj.templateId});
            }
        });
    }
    this.login = function(phone,pwd,act,suppid,callback){
        console.log("========suppid========"+suppid)
        let sql = "select a.id,a.nick,a.mask,a.password,a.face,a.sex,ifnull((select b.id from ranyun_suppliers b where b.memberId=a.id order by b.id asc limit 0,1),0)suppliersId,ifnull((select b.templateId from ranyun_suppliers b where b.memberId=a.id order by b.id asc limit 0,1),0)templateId from ranyun_member a where a.mobile='"+phone+"'";
        let db = this.DB("Redis");
        let ky = "yzm_"+phone;
        let checkTimer = function(stm){
            let mm = new Date().getTime();
            let rtn = (mm-stm)/1000;
            return rtn;
        }
        let self=this;
        let fun = function(usid,sid){
            let sql = "select * from ranyun_suppliers_member where memerId="+usid+" and suppliersId="+sid;
            self.DB().query(sql,function(rs){
                if(rs==false){
                    let sqla = "insert into ranyun_suppliers_member(suppliersId,memerId,score,addtime) values("+sid+","+usid+",0,now())";
                    self.DB().excute(sqla,function(rsa){});
                }
            });
        }
        console.log("===============a=="+phone)
        this.DB().query(sql,function(rs){
            if(rs==false){
                callback(false);
            }else{
                let utility = require('utility');
                let obj=rs[0];
                let passwd  = utility.md5(pwd + obj.mask);
                let objx = {id:obj.id,nick:obj.nick,face:obj.face,sex:obj.sex,suppliersId:obj.suppliersId,templateId:obj.templateId};
                console.log("==============1==="+pwd)
                console.log("==============2==="+act)
                console.log("==============3==="+passwd)
                console.log("==============4==="+obj.password)
                if (act == "pwd"){
                    if(obj.password == passwd){
                        if(suppid>0){
                            fun(obj.id,suppid);
                        }
                        callback(objx);
                    }else{
                        callback(false);
                    }
                }else if(act == "code"){
                    db.getRedis(ky,function(dd){
                        if(dd!=false){
                            let jsn = JSON.parse(dd);
                            if(pwd==jsn.code){
                                let lng = checkTimer(jsn.time);
                                if(lng<120){
                                    if(suppid>0){
                                        fun(obj.id,suppid);
                                    }
                                    callback(objx);
                                }else{
                                    callback(false);
                                }
                            }else{
                                callback(false);
                            }
                        }else{
                            callback(false);
                        }
                    });
                }else{
                    callback(false);
                }
            }
        });
    };
    this.apply = function(sqlStruct,usid,callback){
        let self=this;
        let st  = sqlStruct;
        let sql = 'insert into ranyun_suppliers ' +
        st.insertNames() +
        st.insertValues();
        let sqla = "select id,templateId from ranyun_suppliers where memberId="+usid;
        let fungds = function(suppid,tmpid){
            let sqla = "";
            if(tmpid==4){
                sqla="insert into ranyun_commoditytype(pid,title,weight,addTime,suppliersId,imgurl) values(0,'生鲜时令',50,now(),"+suppid+",'uploads/temp/4/type1.png'),(0,'调味品',50,now(),"+suppid+",'uploads/temp/4/type2.png')"
            }else{
                sqla="insert into ranyun_commoditytype(pid,title,weight,addTime,suppliersId) values(0,'测试分类',50,now(),"+suppid+")"
            }
            let sqlv = "select * from ranyun_commoditytype where suppliersId="+suppid;
            let gdsa=[{name:"石墨麦粉",detail:'<br><img src="http://api.ranyunkj.com/uploads/temp/1/a1.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/1/a2.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/1/a3.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/1/a4.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/1/a5.jpg" style="width:100%;" alt="图片未加载成功"><br>'},
            {name:"五谷杂粮",detail:'<br><img src="http://api.ranyunkj.com/uploads/temp/1/b1.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/1/b2.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/1/b3.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/1/b4.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/1/b5.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/1/b6.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/1/b7.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/1/b8.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/1/b9.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/1/b10.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/1/b11.jpg" style="width:100%;" alt="图片未加载成功"><br>'},
            {name:"薏仁米",detail:'<br><img src="http://api.ranyunkj.com/uploads/temp/1/c1.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/1/c2.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/1/c3.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/1/c4.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/1/c5.jpg" style="width:100%;" alt="图片未加载成功"><br>'},
            {name:"农家精选前腿肉",detail:'<br><img src="http://api.ranyunkj.com/uploads/temp/1/d1.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/1/d2.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/1/d3.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/1/d4.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/1/d5.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/1/d6.jpg" style="width:100%;" alt="图片未加载成功"><br>'},
            {name:"特级燕麦粉",detail:'<br><img src="http://api.ranyunkj.com/uploads/temp/1/e1.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/1/e2.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/1/e3.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/1/e4.jpg" style="width:100%;" alt="图片未加载成功"><br>'},
            {name:"特级黑米",detail:'<br><img src="http://api.ranyunkj.com/uploads/temp/1/f1.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/1/f2.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/1/f3.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/1/f4.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/1/f5.jpg" style="width:100%;" alt="图片未加载成功"><br>'}];
            
            let gdsb=[{name:"小米8青春版",detail:'<br><img src="http://api.ranyunkj.com/uploads/temp/2/a1.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/2/a2.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/2/a3.jpg" style="width:100%;" alt="图片未加载成功"><br>'},
            {name:"小米8指纹版",detail:'<br><img src="http://api.ranyunkj.com/uploads/temp/2/b1.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/2/b2.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/2/b3.jpg" style="width:100%;" alt="图片未加载成功"><br>'},
            {name:"红米6",detail:'<br><img src="http://api.ranyunkj.com/uploads/temp/2/c1.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/2/c2.jpg" style="width:100%;" alt="图片未加载成功"><br>'},
            {name:"红米6X",detail:'<br><img src="http://api.ranyunkj.com/uploads/temp/2/d1.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/2/d2.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/2/d3.jpg" style="width:100%;" alt="图片未加载成功"><br>'},
            {name:"小米8SE",detail:'<br><img src="http://api.ranyunkj.com/uploads/temp/2/e1.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/2/e2.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/2/e3.jpg" style="width:100%;" alt="图片未加载成功"><br>'},
            {name:"小米平板",detail:'<br><img src="http://api.ranyunkj.com/uploads/temp/2/f1.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/2/f2.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/2/f3.jpg" style="width:100%;" alt="图片未加载成功"><br>'}];
            
            let gdsc=[{name:"连衣裙女",detail:'<br><img src="http://api.ranyunkj.com/uploads/temp/3/a1.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/3/a2.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/3/a3.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/3/a4.jpg" style="width:100%;" alt="图片未加载成功"><br>'},
            {name:"波点连衣裙",detail:'<br><img src="http://api.ranyunkj.com/uploads/temp/3/b1.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/3/b2.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/3/b3.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/3/b4.jpg" style="width:100%;" alt="图片未加载成功"><br>'},
            {name:"一字肩连衣裙",detail:'<br><img src="http://api.ranyunkj.com/uploads/temp/3/c1.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/3/c2.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/3/c3.jpg" style="width:100%;" alt="图片未加载成功"><br>'},
            {name:"无袖连衣裙",detail:'<br><img src="http://api.ranyunkj.com/uploads/temp/3/d1.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/3/d2.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/3/d3.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/3/d4.jpg" style="width:100%;" alt="图片未加载成功"><br>'},
            {name:"男士夹克",detail:'<br><img src="http://api.ranyunkj.com/uploads/temp/3/e1.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/3/e2.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/3/e3.jpg" style="width:100%;" alt="图片未加载成功"><br>'},
            {name:"韩版休闲开衫",detail:'<br><img src="http://api.ranyunkj.com/uploads/temp/3/f1.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/3/f2.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/3/f3.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/3/f4.jpg" style="width:100%;" alt="图片未加载成功"><br>'}];
            
            let gdsd=[{name:"1",detail:'<br><img src="http://api.ranyunkj.com/uploads/temp/4/a1.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/4/a2.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/4/a3.jpg" style="width:100%;" alt="图片未加载成功"><br>'},
            {name:"2",detail:'<br><img src="http://api.ranyunkj.com/uploads/temp/4/b1.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/4/b2.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/4/b3.jpg" style="width:100%;" alt="图片未加载成功"><br>'},
            {name:"3",detail:'<br><img src="http://api.ranyunkj.com/uploads/temp/4/c1.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/4/c2.jpg" style="width:100%;" alt="图片未加载成功"><br>'},
            {name:"4",detail:'<br><img src="http://api.ranyunkj.com/uploads/temp/4/d1.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/4/d2.jpg" style="width:100%;" alt="图片未加载成功"><br>'},
            {name:"5",detail:'<br><img src="http://api.ranyunkj.com/uploads/temp/4/e1.jpg" style="width:100%;" alt="图片未加载成功"><br>'},
            {name:"6",detail:'<br><img src="http://api.ranyunkj.com/uploads/temp/4/f1.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/4/f2.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/4/f3.jpg" style="width:100%;" alt="图片未加载成功"><br>'}];
            
            let gdse=[{name:"红茶A",detail:'<br><img src="http://api.ranyunkj.com/uploads/temp/5/a1.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/5/a2.jpg" style="width:100%;" alt="图片未加载成功"><br>'},
            {name:"红茶B",detail:'<br><img src="http://api.ranyunkj.com/uploads/temp/5/b1.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/5/b2.jpg" style="width:100%;" alt="图片未加载成功"><br>'},
            {name:"红茶C",detail:'<br><img src="http://api.ranyunkj.com/uploads/temp/5/c1.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/5/c2.jpg" style="width:100%;" alt="图片未加载成功"><br>'},
            {name:"绿茶A",detail:'<br><img src="http://api.ranyunkj.com/uploads/temp/5/d1.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/5/d2.jpg" style="width:100%;" alt="图片未加载成功"><br>'},
            {name:"绿茶B",detail:'<br><img src="http://api.ranyunkj.com/uploads/temp/5/e1.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/5/e2.jpg" style="width:100%;" alt="图片未加载成功"><br>'},
            {name:"红茶D",detail:'<br><img src="http://api.ranyunkj.com/uploads/temp/5/f1.jpg" style="width:100%;" alt="图片未加载成功"><br><img src="http://api.ranyunkj.com/uploads/temp/5/f2.jpg" style="width:100%;" alt="图片未加载成功"><br>'}];
            
            
            self.DB().query(sqlv,function(rs){
                if(rs==false){
                    self.DB().excute(sqla,function(rsa){
                        self.DB().query(sqlv,function(rsx){
                            if(rsx!=false){
                                let obj = rsx[0];
                                let sqlb = "";
                                for(let i=1;i<7;i++){
                                    if(tmpid==4){
                                        if(i==4){
                                            obj = rsx[1];
                                        }
                                    }
                                    let spn=i;
                                    let dtl="这家伙很懒，啥都没说!";
                                    if(tmpid==1){
                                        let obj = gdsa[i-1];
                                        spn = obj.name;
                                        dtl = obj.detail;
                                    }else if(tmpid==2){
                                        let obj = gdsb[i-1];
                                        spn = obj.name;
                                        dtl = obj.detail;
                                    }else if(tmpid==3){
                                        let obj = gdsc[i-1];
                                        spn = obj.name;
                                        dtl = obj.detail;
                                    }else if(tmpid==4){
                                        let obj = gdsd[i-1];
                                        spn = obj.name;
                                        dtl = obj.detail;
                                    }else if(tmpid==5){
                                        let obj = gdse[i-1];
                                        spn = obj.name;
                                        dtl = obj.detail;
                                    }
                                    if(sqlb==""){
                                        sqlb="("+obj.id+",'染云模板商品"+spn+"','1','uploads/temp/"+tmpid+"/gds"+i+".png','uploads/temp/"+tmpid+"/gds"+i+".png','',100,'"+dtl+"',88,88,88,88,now(),'1',"+suppid+",'1',50)";
                                    }else{
                                        sqlb += ",("+obj.id+",'染云模板商品"+spn+"','1','uploads/temp/"+tmpid+"/gds"+i+".png','uploads/temp/"+tmpid+"/gds"+i+".png','',100,'"+dtl+"',88,88,88,88,now(),'1',"+suppid+",'1',50)";
                                    }
                                }
                                let sqlc = "insert into ranyun_commidity(typeId,title,recommend,litPic,mainPic,description,stock,detail,marketPrice,currentPrice,salePrice,vipPrice,addTime,enable,suppliersId,freeEmail,weight) values"+sqlb
                                console.log(sqlc)
                                self.DB().excute(sqlc,function(rsb){});
                            }
                        })
                    })
                }
            });
        }
        let funadd = function(sql1,sql2,sql3,sql4){
            if(sql1==undefined){
                sql1="";
            }
            if(sql2==undefined){
                sql2="";
            }
            if(sql3==undefined){
                sql3="";
            }
            if(sql4==undefined){
                sql4="";
            }
            if(sql1!=""){
                self.DB().excute(sql1,function(rs){});
            }
            if(sql2!=""){
                self.DB().excute(sql2,function(rs){});
            }
            if(sql3!=""){
                self.DB().excute(sql3,function(rs){});
            }
            if(sql4!=""){
                self.DB().excute(sql4,function(rs){});
            }
        }
        let fundel = function(suppid,sqla,sqlb,sqlc,sqld){
            if(sqla==undefined){
                sqla="";
            }
            if(sqlb==undefined){
                sqlb="";
            }
            if(sqlc==undefined){
                sqlc="";
            }
            if(sqld==undefined){
                sqld="";
            }
            let sql1 = "delete from ranyun_banner where suppliersId="+suppid;
            let sql2 = "delete from ranyun_homeIcon where suppliersId="+suppid;
            let sql3 = "delete from ranyun_message where suppliersId="+suppid;
            let sql4 = "delete from ranyun_advertisement where suppliersId="+suppid;
            self.DB().excute(sql1,function(rs){
                self.DB().excute(sql2,function(rs){
                    self.DB().excute(sql3,function(rs){
                        self.DB().excute(sql4,function(rs){
                            funadd(sqla,sqlb,sqlc,sqld);
                        })
                    })
                })
            })
        }
        let funtmp=function(suppid,tmpid){
            //ranyun_banner,ranyun_homeIcon,ranyun_message,ranyun_advertisement
            if(tmpid==1){
                let sqla = "insert into ranyun_banner(title,imgurl,goodsId,suppliersId,addtime,linkType,linkUrl,openType,weight) values('','uploads/temp/1/banner.jpg',0,"+suppid+",now(),1,'',4,50)";
                let sqlb = "insert into ranyun_homeIcon(title,suppliersId,imgurl,linkType,linkUrl,openType,jumpParm) values('邀请有礼',"+suppid+",'uploads/temp/1/icon1.png',1,'',4,1),('充值',"+suppid+",'uploads/temp/1/icon2.png',1,'',4,1),('优惠券',"+suppid+",'uploads/temp/1/icon3.png',1,'',4,1),('分类',"+suppid+",'uploads/temp/1/icon4.png',1,'',4,1)";
                let sqlc = "insert into ranyun_message(suppliersId,message,goodsId,linkType,linkUrl,openType) values("+suppid+",'我的染云小店开店成功了！来恭贺吧！',0,1,'',4)";
                fundel(suppid,sqla,sqlb,sqlc);
            }else if(tmpid==2){
                let sqla = "insert into ranyun_banner(title,imgurl,goodsId,suppliersId,addtime,linkType,linkUrl,openType,weight) values('','uploads/temp/2/banner.png',0,"+suppid+",now(),1,'',4,50)";
                let sqlb = "insert into ranyun_advertisement(imgurl,goodsId,suppliersId,mark,addtime,linkType,linkUrl,openType,weight) values('uploads/temp/2/adv1.png',0,"+suppid+",2,now(),0,'',4,50),('uploads/temp/2/adv2.png',0,"+suppid+",1,now(),0,'',4,50),('uploads/temp/2/adv3.png',0,"+suppid+",1,now(),0,'',4,50),('uploads/temp/2/adv4.png',0,"+suppid+",3,now(),0,'',4,50)";
                fundel(suppid,sqla,sqlb);
            }else if(tmpid==3){
                let sqla = "insert into ranyun_banner(title,imgurl,goodsId,suppliersId,addtime,linkType,linkUrl,openType,weight) values('','uploads/temp/3/banner.jpg',0,"+suppid+",now(),1,'',4,50)";
                let sqlb = "insert into ranyun_advertisement(imgurl,goodsId,suppliersId,mark,addtime,linkType,linkUrl,openType,weight) values('uploads/temp/3/adv1.png',0,"+suppid+",1,now(),0,'',4,50),('uploads/temp/3/adv2.png',0,"+suppid+",1,now(),0,'',4,50),('uploads/temp/3/adv3.png',0,"+suppid+",3,now(),0,'',4,50),('uploads/temp/3/adv4.png',0,"+suppid+",1,now(),0,'',4,50),('uploads/temp/3/adv5.png',0,"+suppid+",1,now(),0,'',4,50)";
                fundel(suppid,sqla,sqlb);
            }else if(tmpid==4){
                let sqla = "insert into ranyun_banner(title,imgurl,goodsId,suppliersId,addtime,linkType,linkUrl,openType,weight) values('','uploads/temp/4/banner.png',0,"+suppid+",now(),1,'',4,50)";
                let sqlb = "insert into ranyun_homeIcon(title,suppliersId,imgurl,linkType,linkUrl,openType,jumpParm) values('每日特惠',"+suppid+",'uploads/temp/4/icon1.png',1,'',4,1),('限时抢购',"+suppid+",'uploads/temp/4/icon2.png',1,'',4,1),('生鲜专卖',"+suppid+",'uploads/temp/4/icon3.png',1,'',4,1),('为你推荐',"+suppid+",'uploads/temp/4/icon4.png',1,'',4,1)";
                let sqlc = "insert into ranyun_advertisement(imgurl,goodsId,suppliersId,mark,addtime,linkType,linkUrl,openType,weight) values('uploads/temp/4/adv1.png',0,"+suppid+",3,now(),0,'',4,50),('uploads/temp/2/adv2.png',0,"+suppid+",3,now(),0,'',4,50),('uploads/temp/2/adv3.png',0,"+suppid+",3,now(),0,'',4,50)";
                fundel(suppid,sqla,sqlb,sqlc);
            }else if(tmpid==5){
                let sqla = "insert into ranyun_banner(title,imgurl,goodsId,suppliersId,addtime,linkType,linkUrl,openType,weight) values('','uploads/temp/5/banner.png',0,"+suppid+",now(),1,'',4,50)";
                let sqlb = "insert into ranyun_homeIcon(title,suppliersId,imgurl,linkType,linkUrl,openType,jumpParm) values('白茶',"+suppid+",'uploads/temp/5/icon1.png',1,'',4,1),('红茶',"+suppid+",'uploads/temp/5/icon2.png',1,'',4,1),('绿茶',"+suppid+",'uploads/temp/5/icon3.png',1,'',4,1),('果茶',"+suppid+",'uploads/temp/5/icon4.png',1,'',4,1),('小罐茗茶',"+suppid+",'uploads/temp/5/icon5.png',1,'',4,1)";
                let sqlc = "insert into ranyun_message(suppliersId,message,goodsId,linkType,linkUrl,openType) values("+suppid+",'我的染云小店开店成功了！来恭贺吧！',0,1,'',4)";
                let sqld = "insert into ranyun_advertisement(imgurl,goodsId,suppliersId,mark,addtime,linkType,linkUrl,openType,weight) values('uploads/temp/5/adv1.png',0,"+suppid+",1,now(),0,'',4,50),('uploads/temp/5/adv2.png',0,"+suppid+",1,now(),0,'',4,50),('uploads/temp/5/adv3.png',0,"+suppid+",2,now(),0,'',4,50),('uploads/temp/5/adv4.png',0,"+suppid+",1,now(),0,'',4,50),('uploads/temp/5/adv5.png',0,"+suppid+",1,now(),0,'',4,50),('uploads/temp/5/adv6.png',0,"+suppid+",3,now(),0,'',4,50)";
                fundel(suppid,sqla,sqlb,sqlc,sqld);
            }
            fungds(suppid,tmpid);
        }
        self.DB().excute(sql,function(rs){
            if(rs==false){
                callback(rs);
            }else{
                self.DB().query(sqla,function(rsa){
                    if(rsa==false){
                        callback(rsa);
                    }else{
                        let obj = rsa[0];
                        funtmp(obj.id,obj.templateId);
                        callback(obj);
                    }
                })
            }
        })
    };
    this.collect = function(usid,suppid,page,callback){
        let whtj="";
        let size = 10;
        if(page<1){
            page = 1;
        }
        let snum = (page - 1)*size;
        if(suppid>0){
            whtj = " and a.suppliersId="+suppid;
        }
        let sql = "select a.id,a.title,a.litPic,a.description,a.salePrice,a.vipPrice,a.salesVolume from ranyun_commidity a,ranyun_myfavorites b where b.goodsId=a.id and a.enable='1' and b.memberId="+usid+whtj+" order by b.addTime desc,b.id desc limit "+snum+","+size;
        this.DB().query(sql,function(rs){
            callback(rs);
        })
    }
    this.coupon = function(data,callback){
        let self = this;
        let sql="select id,title,money,value,DATE_FORMAT(effect,'%Y-%m-%d %H:%i')effect,DATE_FORMAT(expirate,'%Y-%m-%d %H:%i')expirate,expirate>now() and effect<now() isexpire from ranyun_membercoupon where memberId="+data.usid+" and suppliersId="+data.suppid+" and status='0'"
        self.DB().query(sql,function(rs){
            callback(rs);
        })
    }
    this.info = function(data,callback){
        let self = this;
        let sql="select id,nick,mobile,face,sex,birthday,ifnull((select name from ranyun_suppliers where memberId="+data.usid+" limit 1),'')sname,ifnull((select state from ranyun_certification a,ranyun_suppliers b where b.memberId="+data.usid+" and a.suppliersId=b.id limit 1),0)state from ranyun_member where id="+data.usid;
        self.DB().query(sql,function(rs){
            if(rs==false){
                callback(rs);
            }else{
                callback(rs[0]);
            }
        })
    }
    this.code = function(data,callback){
        let sms = require("../../../e/smsutil");
        let phone = data.phone;
        console.log(phone)
        if(phone.length==11&&phone.substr(0,1)=='1'){
            let db = this.DB("Redis");
            let ky = "yzm_"+phone;
            let checkTimer = function(stm){
                let mm = new Date().getTime();
                let rtn = (mm-stm)/1000;
                return rtn;
            }
            let fun = function(code){
                sms.sendSMS(phone,code,function(rs){
                    console.log("===============",rs)
                    if(rs==false){
                        callback(false);
                    }else{
                        db.setRedis(ky,{code:code,time:new Date().getTime()},function(sd){})
                        callback(true);
                    }
                });
            };
            db.getRedis(ky,function(dd){
                let rnd = Math.floor(Math.random()*900000+100000)+"";
                if(dd!=false){
                    let jsn = JSON.parse(dd);
                    let lng = checkTimer(jsn.time);
                    if(lng>120){
                        fun(rnd);
                    }else{
                        callback(false);
                    }
                }else{
                    fun(rnd);
                }
            });
        }else{
            callback(false);
        }
    }
    this.addnotice=function(data,callback){
        let self = this;
        let sql="insert into ranyun_notice(type,content,stype,rtype,sender,recipient,addtime) values("+data.type+",'"+data.content+"',"+data.stype+","+data.rtype+","+data.sender+","+data.recipient+",now())"
        self.DB().excute(sql,function(rs){
            callback(rs);
        })
    }
    this.notice=function(data,callback){
        let self = this;
        let page = data.page;
        let rid = data.recipient;
        let rtp = data.rtype;
        let tp = data.type;
        let size = 30;
        if(page<1){
            page=1;
        }
        let snum = (page-1)*size;
        let sql="select a.id,a.type,a.content,DATE_FORMAT(a.addtime,'%Y-%m-%d %H:%i')addtime,a.stype,a.rtype,a.sender,a.recipient,(case when a.stype=1 then ifnull((select name from ranyun_suppliers where id=a.sender),'') else ifnull((select nick from ranyun_member where id=a.sender),'') end)sname,(case when a.rtype=1 then ifnull((select name from ranyun_suppliers where id=a.recipient),'') else ifnull((select nick from ranyun_member where id=a.recipient),'') end)rname from ranyun_notice a where (a.recipient="+rid+" and a.rtype="+rtp+" and a.stype>0 and a.type="+tp+") or (a.sender="+rid+" and a.stype="+rtp+" and a.rtype>0 and a.type="+tp+") order by id desc limit "+snum+","+size;
        console.log(sql)
        self.DB().query(sql,function(rs){
            callback(rs);
        })
    }
    this.edit=function(data,callback){
        let self = this;
        let sql="update ranyun_member set face='"+data.imgurl+"',nick='"+data.nick+"' where id="+data.usid;
        console.log(sql)
        self.DB().excute(sql,function(rs){
            callback(rs);
        })
    }
}
module.exports = userService;