/*
 * @Author: liuyr 
 * 客服列表页面
 * @Date: 2019-12-23 17:11:53 
<<<<<<< HEAD
 * @Last Modified by: liuyr
 * @Last Modified time: 2019-12-29 20:08:54
=======
 * @Last Modified by: RealsenWang
 * @Last Modified time: 2019-12-29 20:20:37
>>>>>>> d6d74deb56631f07b06db0530af9edec6f3dc8c3
 */
<template>

  <div class="wrap">
    <!-- 下拉框和输入框 -->
     <div class="selectDiv">
       <div class="select1">
<<<<<<< HEAD
       <!-- 下拉框1 -->
       <el-select  @change="statusChange" v-model="status" clearable placeholder="在线">
=======
         <!-- 下拉框1 -->
       <el-select @change="statusChange" v-model="status" clearable placeholder="在线">
>>>>>>> d6d74deb56631f07b06db0530af9edec6f3dc8c3
        <el-option v-for="item in statusData" :key="item" :label="item" :value="item"></el-option>
       </el-select>
       <!-- 下拉框2 -->
       <el-select @change="genderChange" v-model="gender"  clearable placeholder="性别">
        <el-option v-for="item in genderData" :key="item" :label="item" :value="item"></el-option>
       </el-select>
       <!-- 输入框 -->
      <div class="inputDiv">
        <el-input clearable  placeholder="请输入关键字" @change="inputChange" v-model="inputWord" class="input-with-select">
         <el-select clearable v-model="input2" slot="prepend" placeholder="关键字" class="choose">
        <el-option
                v-for="item in options"
                :key="item.value"
                :label="item.label"
                :value="item.value"
        ></el-option>
         </el-select>
         <el-button slot="append" icon="el-icon-search" @click="KeyWordhanshu"></el-button>
        </el-input>
      </div>
       </div>
  </div>
  <!-- 按钮 -->
     <div class="buttonDiv">
        <el-button @click="toNew()" type="warning" size="medium" style="background:rgb(245, 157, 50)">添加客服</el-button>
        <el-button @click="toinput" type="primary" size="medium">导入客服</el-button>
     </div>
<<<<<<< HEAD
   </div>  
     <!-- 表格内容 -->
=======
  <!-- 表格内容 -->
>>>>>>> d6d74deb56631f07b06db0530af9edec6f3dc8c3
     <div class="tableDiv">
       <el-table ref="multipleTable" :data="CustomerServiceData" tooltip-effect="dark" style="width: 100%" >
          <el-table-column type="selection" width="55"></el-table-column>
          <el-table-column prop="username" label="用户名" ></el-table-column>
          <el-table-column prop="realname" label="姓名" ></el-table-column>
          <el-table-column prop="gender" label="性别" ></el-table-column>
          <el-table-column prop="status" label="状态" ></el-table-column>
          <el-table-column prop="address" label="分配工作" >
             <template slot-scope="scope">
             <el-button @click="toSee(scope.row)" type="text" size="small">分配</el-button>
             </template>
          </el-table-column>
          <el-table-column prop="address" label="操作">
             <template slot-scope="scope">
             <el-button type="text" size="small" @click="toDelete(scope.row.id)">删除</el-button>
             </template>
          </el-table-column>
      </el-table>
    </div>

    <!-- 自动分配和填满 -->
    <div class="btnDiv">
        <el-button type="info" size="mini">自动分配</el-button>
        <el-button type="info" size="mini">自动填满</el-button>
    </div>

    <!-- 模态框 -->
       <el-dialog class="dialogDiv1" title="工作分配" :visible.sync="dialogVisible" width="50%" >
            <div class="fenpei">
               <el-button type="info" size="mini">自动分配</el-button>
               <el-button type="info" size="mini">自动填满</el-button>
            </div>
        
         <!-- 嵌套表格 -->
            <div class="table">
                <el-table ref="multipleTable" :data="wrap" tooltip-effect="dark" style="width: 100%" >
                <el-table-column type="selection" width="55"></el-table-column>
                <el-table-column prop="jobhunter.realname" label="求职人" ></el-table-column>
                <el-table-column prop="jobhunter.telephone" label="联系方式" ></el-table-column>
                <el-table-column prop="employment.job" label="求职岗位" ></el-table-column>
                <el-table-column prop="jobhunter.realname" label="经手人" >
                      
                </el-table-column>
                <el-table-column prop="askTime" label="申请时间" ></el-table-column>
                </el-table>
            </div>
            <!-- 分页 -->
            <div class="pageDiv">
                <el-pagination
                 :page-size="pageSize"
                 :current-page.sync="currentPage"
                 background
                 @current-change="pageChange"
                 layout="prev, pager, next"
                 :total="EmploymentWithJobhAndEmplData.length"
                ></el-pagination>
            </div>
      </el-dialog>
    
    <!-- 模态框1 -->
    <div>
     <el-dialog title="添加客服" :visible.sync=" Visible1" :before-close="beforeClose" >
         <el-form :model="CustomerService" ref= "ruleForm">
            <el-form-item prop="username" label="用户名" :label-width="formLabelWidth">
            <el-input v-model="CustomerService.username" autocomplete="off"></el-input>
            </el-form-item>
         
            <el-form-item prop="realname" label="姓名" :label-width="formLabelWidth">
            <el-input v-model="CustomerService.realname" autocomplete="off"></el-input>
          </el-form-item>
          
          <el-form-item prop="status" label="状态" :label-width="formLabelWidth">
            <el-input v-model="CustomerService.status" autocomplete="off"></el-input>
          </el-form-item>

            <el-form-item prop="gender" label="性别" :label-width="formLabelWidth">
             <template>
              <el-radio v-model="CustomerService.gender" label="男">男</el-radio>
              <el-radio v-model="CustomerService.gender" label="女">女</el-radio>
             </template>
          </el-form-item>
         </el-form>
        <el-button @click="toAdd('ruleForm')" type="primary" >添加</el-button>
     </el-dialog>
    </div>

     <!-- 模态框2 -->
    <div>
       <el-dialog title="导入说明" :visible.sync="Visible2" width="30%" >
               <span>使用导入功能时，请按照模板表格规定的字段
               去填写对应信息，您可以点击按钮下载模板表格，
               填写完后在下提交:</span>
               <el-button size="mini" type="info" class="down">下载模板</el-button>
               <el-upload class="upload-demo" drag action="https://jsonplaceholder.typicode.com/posts/" multiple>
               <i class="el-icon-upload"></i>
               <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
               <div class="el-upload__tip" slot="tip">只能上传jpg/png文件，且不超过500kb</div>
               </el-upload>
       </el-dialog>
      
      </div>

    </div>
<<<<<<< HEAD

=======
</div>
>>>>>>> d6d74deb56631f07b06db0530af9edec6f3dc8c3
</template>

<script>
import {findAllCustomerService,
deleteCustomerServiceById,
findCustomerServiceByEducation,
findCustomerServiceByGender,
findCustomerServiceByUsername,saveOrUpdateCustomerService} from "@/api/customer-service.js";
import {findAllEmploymentWithJobhAndEmpl} from "@/api/employment-jobhunter.js";
import config from "@/utils/config.js";
export default {
  data() {
    return {
      value:'',
      select: '',
      input:'',
      status:"",
      gender:"",
      CustomerService:{},
      CustomerServiceData:[],
      statusData:[],
      genderData:[],
      EmploymentWithJobhAndEmplData:[],
      currentwaiter:{},
      //模态框
      dialogVisible:false,
      //分页
      pageSize: config.pageSize,
      currentPage: 1,
      //模态框1
      Visible1:false,
      formLabelWidth: '120px',
      radio: '1',
      //模态框2     
      Visible2:false,
      // 关键字
      input2:'',
      // 输入的关键字
      inputWord:"",
      // 输入的搜索分类
      options:[{
          value: '姓',
          label: '性别'
        }, {
          value: '户',
          label: '用户名'
        }, 
            ],
        
    };
  },
  computed: {
    //分页数据
    wrap() {
      let temp = [...this.EmploymentWithJobhAndEmplData];
      let page = this.currentPage;
      let pageSize = config.pageSize;
      return temp.slice((page - 1) * pageSize, page * pageSize);
     
    }
  },
  methods: {

    //查看工作分配
   toSee(row) {
      this.currentwaiter={...row};
      this.dialogVisible=true;
     },
   
    //选择关键字类型发生改变时调用的函数改变input2的值
    inputChange(){
      this.findAllCustomerService();
    },    
    //输入关键字
    async KeyWordhanshu(keyWord){
        if(this.input2){
            try {
                let res;
                //性别
                if(this.input2==this.options[0].value){
                    res=await findCustomerServiceByGender({ gender :this.inputWord });
                    this.CustomerServiceData=res.data;
                    this.currentPage=1;
                }
                // 用户名
                else{
                    res=await findCustomerServiceByUsername({ username :this.inputWord });
                    this.CustomerServiceData=res.data;
                    this.currentPage=1;
                }                                    
            } catch (error) {
                console.log(error);
                config.errorMsg(this, "通过关键字查找用户信息错误！");
            }          
        }
        else{
            // 弹出警告
            config.errorMsg(this,"请选择关键字！");
            // 恢复原本数据
            this.findAllCustomerService();
        }
    },

//状态改变
async statusChange(val) {
      //val 是option的value值
      if (val) {
        try {
          let res = await findCustomerServiceByEducation({status: val });
          this.CustomerServiceData = res.data;
        } catch (error) {
          config.errorMsg(this, "通过状态查找客服信息错误");
        }
      } else {
        this.findAllCustomerService();
      }
    },
  //性别状态
  async genderChange(val) {
      //val 是option的value值
      if (val) {
        try {
          let res = await findCustomerServiceByGender({gender: val });
          this.CustomerServiceData = res.data;
        } catch (error) {
          config.errorMsg(this, "通过性别查找客服信息错误");
        }
      } else {
        this.findAllCustomerService();
      }
    },

toNew(){
  this.Visible1 = true;
},

beforeClose() {
      this.$refs["ruleForm"].resetFields();
      this.Visible1 = false; 
    },

toCancel(formName) {
      //重置表单验证，关闭模态框
      this.$refs[formName].resetFields();
      this.$message({
            type: "info",
            message: "已取消修改"
          });
      this.editVisible = false;
    },


//添加客服
  toAdd(formName) {
     this.$refs[formName].validate(async (valid) => {
        if (valid) {
          try{
            let res = await saveOrUpdateCustomerService(this.CustomerService);
            console.log(res);
            if(res.status===200){
              this.findAllCustomerService();//查找所有客服信息
              this.Visible1 = false,
              config.successMsg(this, "保存成功");
            }else{
              config.errorMsg(this, "保存失败");
            }
          }catch(error){
            console.log(error);
            config.errorMsg(this, "保存错误");
          }
        }
       });
  },

//导入用户
toinput(){
   this.Visible2 = true;
},

//删除操作
toDelete(id) {
      // alert("删除");
      this.$confirm("是否删除该记录?", "提示", {
        confirmButtonText: "删除",
        // cancelButtonText: "取消",
        type: "warning"
      }).then(async () => {
          //访问后台接口
          try {
            let res = await deleteCustomerServiceById({ id: id });
            if (res.status === 200) {
              config.successMsg(this, "删除成功");
              this.findAllCustomerService();
            } else {
              config.errorMsg(this, "删除失败");
            }
          } catch (error) {
            console.log(error);
            config.errorMsg(this, "删除失败");
          }
        })
        .catch((err) => {
          console.log(err);
          this.$message({
            type: "info",
            message: "已取消删除"
          });
        });
  },

    
//页数改变
  pageChange(page) {
      this.currentPage = page;
  },

//查找所有客服信息
  async findAllCustomerService(){
      try{
        let res = await findAllCustomerService();
        this.CustomerServiceData=res.data;
        //性别
        let genderArr = res.data.map(item => {
          return item.gender;
        });
        //去重
        this.genderData = [...new Set(genderArr)];
       
        //状态数组
        let statusArr = res.data.map(item => {
          return item.status;
        });
        //去重
        this.statusData = [...new Set(statusArr)];

       }catch(error){
          config.errorMsg(this, "查找错误");
       }
    },
  
  //查找求职者信息
  async findAllJob(){
      try{
        let res = await findAllEmploymentWithJobhAndEmpl();
        this.EmploymentWithJobhAndEmplData=res.data;

        
        this.EmploymentWithJobhAndEmplData.forEach(item => {
          item.askTime = item.askTime.slice(0,10);
        })
       }catch(error){
          config.errorMsg(this, "查找错误");
       }
    },
  },
  
  
  created() {
    this.findAllCustomerService();
    this.findAllJob();
  },
  mounted() {}
};
</script>
<style lang="scss" scoped>
.buttonDiv{
  float: right;
}
.selectDiv{
<<<<<<< HEAD
 margin-top: -30px;
 width: 53%;
 display:inline-block;

}
.inputDiv{
  width: 280px;
  float:right;
=======
  float: left;
  display: inline-block;
  margin-bottom: 10px;
  .select1{
    width: 100%;
    .inputDiv{
      margin-left: 10px;
      float: right;
      width: 350px;
    }
  }
>>>>>>> d6d74deb56631f07b06db0530af9edec6f3dc8c3
}
.tableDiv{
  margin-top: 10px;
  clear: both;
}
.choose{
  width: 90px;
}
.down{
   float: right;
}
.btnDiv{
  margin-top: 20px;
}
.dialogDiv1{
  
  .fenpei{
    margin-top: -26px;
    float: right;
  }
  .pageDiv{
    float: right;
    
  }
}
 </style>