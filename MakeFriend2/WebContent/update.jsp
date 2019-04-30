
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>用户修改页面</title>
		<!-- <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" /> -->
		<script src="js/jquery-3.3.1.min.js"></script>
		<!-- <script src="js/bootstrap.min.js"></script> -->
		<script src="js/bootstrapValidator.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/bootstrapValidator.min.css" />
		
		<script>
		
		$(function () {
	        $('form').bootstrapValidator({
	            message: 'This value is not valid',
	            feedbackIcons: {
	                valid: 'glyphicon glyphicon-ok',
	                invalid: 'glyphicon glyphicon-remove',
	                validating: 'glyphicon glyphicon-refresh'
	            },
	            fields:{

	                username: {
	                    message: '姓名验证失败',
	                    validators: {
	                        notEmpty: {
	                            message: '姓名不能为空'
	                        }
	                    }
	                },
		
	                loginName: {
	                    message: '用户名验证失败',
	                    validators: {
	                        notEmpty: {
	                            message: '用户名不能为空'
	                        },
	                        stringLength: {
	                            min: 6,
	                            max: 18,
	                            message: '用户名长度必须在6到18位之间'
	                        },
	                        regexp: {
	                            regexp: /^[a-zA-Z0-9_]+$/,
	                            message: '用户名只能包含大写、小写、数字和下划线'
	                        }
	                    }
	                },
	                email: {
	                    validators: {
	                        notEmpty: {
	                            message: '邮箱不能为空'
	                        },
	                        emailAddress: {
	                            message: '邮箱地址格式有误'
	                        }
	                    }
	                },
	           
	            
	            password: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                         different: {
                        	    field: 'username',
                        	       message: '不能和用户名相同'
                        	    }
                        
                       
                      
                    }
                },
	            
	            password1: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        },
                        identical: {
                        	field: 'password',
                        	message: '两次输入不一致'
                        }
                      }
                },
                card: {
                    validators: {
                        notEmpty: {
                            message: '身份证不能为空'
                        },
                        
                        regexp: {
                            regexp: /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/,
                            message: '身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X'
                        }
                        
                       
                      
                    }
                },
                
                tel: {
                    validators: {
                        notEmpty: {
                            message: '电话不能为空'
                        },
                        regexp: {
                            regexp: /^1[3|4|7|5|8][0-9]\d{4,8}$/,
                            message: '手机格式不正确，请重新输入'
                        }
                        
                        
                      
                    }
                },
                job: {
                    validators: {
                        notEmpty: {
                            message: '工作不能为空'
                        }
                      
                    }
                }
          
	        },   
	            submitHandler: function (validator, form, submitButton) {
	                alert("submit");
	            }
	        });
	    });
		
		
		
		
		
			$(function(){
				
			
			$("#rg").change(function(){
				//console.log(lb);
				var rg=$("#rg").val();
				//console.log(rg);
				$("#lb").text(rg);
			});
			
			$("#wg").change(function(){
				//console.log(lb);
				var wg=$("#wg").val();
				//console.log(rg);
				$("#wb").text(wg);
			});
			
			});
		</script>
			
		
		<script src="citys.js" type="text/javascript" charset="utf-8"></script>
		<script>
			window.onload = function() {
				//1.找到元素
				var province = document.getElementById("province");
				var qu = document.getElementById("qu");

				for(var i in data) {
					var a = data[i];
					//console.log(a.name);
					province.appendChild(new Option(a.name, a.name));
				}

				//3.给省Select添加事件
				province.onchange = selProvince;
			}

			function selProvince() {
				//1.找到元素
				var province = document.getElementById("province");
				var city = document.getElementById("city");

				//2.得到当前选择的省
				var provinceName = province.value;

				//console.log(provinceName);

				//3.获取城市列表
				for(var i in data) {
					var a = data[i];
					var sub = a.sub;
					
					if(a.name == provinceName) {
						city.options.length = 0; //清除
						for(var b in sub) {
							var c = sub[b];
							
							city.appendChild(new Option(c.name, c.name));
						}
					}
				}

				//3.给市Select添加事件
				city.onchange = selCity;
			}

			function selCity() {
				var province = document.getElementById("province");
				var city = document.getElementById("city");
				var qu = document.getElementById("qu");

				var provinceName = province.value;
				var cityName = city.value;

				//3.获取区列表
				for(var i in data) {
					var a = data[i];
					var sub = a.sub;
					if(a.name == provinceName) {
						for(b in sub) {
							var c = sub[b];
							var d = c.sub;
							if(c.name == cityName) {
								qu.options.length = 0; //清除
								for(e in d) {
									var f = d[e];
									qu.appendChild(new Option(f.name, f.name));

								}
							}

						}

					}

				}

			}
		</script>
		
		
	</head>
	
	
	<body  style="background: url('img/rigist-bg1.jpg')right top no-repeat;">
	<jsp:include page="header.jsp"></jsp:include>
		
		
		
		<!-- 页面正文 -->
		<div class="container"  style="background-color:white; width:60%;opacity: 0.93;margin-top:20px;border-radius:8px">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<h1>用户信息修改</h1>
					<form class="form-horizontal" action="uppost" method="post">
					
					
					 <div class="form-group">
					    <label for="inputloginName" class="col-sm-4 control-label">ID</label>
					    <div class="col-sm-8">
					      <input type="text" class="form-control"   name="id" value="${User1.id }" readonly="readonly">
					    </div>
					  </div>
					 
					  
					  <div class="form-group">
					    <label for="inputloginName" class="col-sm-4 control-label">姓名</label>
					    <div class="col-sm-8">
					      <input type="text" class="form-control"   name="username" value="${User1.username }" readonly="readonly">
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="inputloginName" class="col-sm-4 control-label">登录名</label>
					    <div class="col-sm-8">
					      <input type="text" class="form-control"   id="inputloginName" name="loginName" value="${User1.loginName }">
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="inputUserID" class="col-sm-4 control-label">密码</label>
					    <div class="col-sm-8">
					      <input type="password"  class="form-control"   name="password" value="${User1.password }">
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="inputUserID" class="col-sm-4 control-label">确认密码</label>
					    <div class="col-sm-8">
					      <input type="password"  class="form-control"   name="password1" value="${User1.password }">
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="inputloginName" class="col-sm-4 control-label">身份证号</label>
					    <div class="col-sm-8">
					      <input type="text" class="form-control"   id="inputloginName" name="card" value="${User1.card }">
					    </div>
					  </div>
					 
					 <div class="form-group">
					    <label for="inputloginName" class="col-sm-4 control-label">生日</label>
					    <div class="col-sm-8">
					      <input type="date" class="form-control"  name="birthday" value="${User1.birthday }">
					    </div>
					  </div>
					  
					  <div class="form-group">
					  	 <label for="inlineRadioOptions" class="col-sm-4 control-label">性别</label>
					  		<div class="col-sm-8">
					  	<label class="radio-inline" >
						  <input type="radio"   name="gender"   id="inlineRadio1" value="男"> 男
						</label>
						<label class="radio-inline">
						  <input type="radio"    name="gender" id="inlineRadio2" value="女"> 女
						</label>
					  	</div>
					  </div>
					  
					 
					 <div class="form-group">
					    <label for="inputEmail3" class="col-sm-4 control-label">邮箱</label>
					    <div class="col-sm-8">
					      <input type="text" class="form-control"  name="email"  id="inputEmail3" value="${User1.email }">
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="inputEmail3" class="col-sm-4 control-label">电话</label>
					    <div class="col-sm-8">
					      <input type="text" class="form-control"  name="tel"  id="inputEmail3" value="${User1.phone }">
					    </div>
					  </div>
					  
					   <div class="form-group">
					    <label for="inputEmail3" class="col-sm-4 control-label">职业</label>
					    <div class="col-sm-8">
					      <input type="text" class="form-control"  name="job"  id="inputEmail3" value="${User1.job }">
					    </div>
					  </div>
					  
					   <div class="form-group">
					    <label for="inputEmail3" class="col-sm-4 control-label">工资</label>
					    <div class="col-sm-8">
					      <select  class="form-control"  name="salary"  id="inputEmail3" >
					      <option>选择您的工资</option>
					      <option value="3000以下">3000以下</option>
					      <option value="3000-6000">3000-6000</option>
					      <option value="6000以上">6000以上</option>
					      </select>
					    </div>
					  </div>
					  
					  <div class="form-group">
					  	 <label for="inlineRadioOptions" class="col-sm-4 control-label">婚姻</label>
					  	<div class="col-sm-8">
					  	<label class="radio-inline">
						  <input type="radio"   name="marry"   id="inlineRadio1" value="未婚"> 未婚
						</label>
						<label class="radio-inline">
						  <input type="radio"    name="marry" id="inlineRadio2" value="已婚"> 已婚
						</label>
					  	</div>
					  </div>
					  
					  <div class="form-group">
					    <label for="inputEmail3" class="col-sm-4 control-label">身高</label>
					    <div class="col-sm-8">					    	
						<input id="rg" type="range" name="height" min="150" max="200" value="${User1.height }" />
						<label id="lb" >${User1.height }</label>公分
					    </div>
					  </div>
					  
					  
					  <div class="form-group">
					    <label for="inputEmail3" class="col-sm-4 control-label">体重</label>
					    <div class="col-sm-8">
					      <input id="wg" type="range" name="weight" min="50" max="100" value="${User1.weight }" />
						<label id="weight" >${User1.weight }</label>公斤
					    </div>
					  </div>
					  
					   <div class="form-group">
					    <label for="inputEmail3" class="col-sm-4 control-label">地址</label>
					    <div class="col-sm-8">
							 <select id="province" name="province"></select> 省 <select id="city" name="city"></select> 市 <select id="qu" name="qu">区</select>
						</div>
					  	</div>
					  	
					  	<div class="form-group">
					  	 <label for="inlineRadioOptions" class="col-sm-4 control-label">学历</label>
					  	<div class="col-sm-8">
					  	<label class="radio-inline">
						  <input type="radio"   name="edu"   id="inlineRadio1" value="本科以下"> 本科以下
						</label>
						<label class="radio-inline">
						  <input type="radio"    name="edu" id="inlineRadio2" value="本科"> 本科
						</label>
						<label class="radio-inline">
						  <input type="radio"    name="edu" id="inlineRadio2" value="本科以上"> 本科以上
						</label>
					  	</div>
					  </div>
					  
					  
					  
					  
					  <div class="form-group">
					    <label for="inputPassword3" class="col-sm-4 control-label">个人说明</label>
					    <div class="col-sm-8">
					      <input type="textarea" name="intruct" class="form-control" id="inputPassword3" value="${User1.introduction }">
					    </div>
					  </div>
					 
					  
					
					  <div class="form-group">
					    <div class="col-sm-offset-4 col-sm-8">
					      <button type="submit" class="btn btn-default">修改提交</button>
					    </div>
					  </div>
					</form>
					
				</div>				
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>
