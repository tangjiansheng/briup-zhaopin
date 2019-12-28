/*
 * @Author: RealsenWang 
 * @Date: 2019-12-27 20:24:26 
 * @Last Modified by: RealsenWang
 * @Last Modified time: 2019-12-28 10:09:26
 */

<template>
  <div id="userList">
    <div class="btn">
      <el-button @click="toAdd()" size="small" type="primary" icon="el-icon-info" style="background:rgb(235, 108, 50)">新增用户</el-button>
      <el-button @click="toAdd()" size="small" type="primary" icon="el-icon-info">导入用户</el-button>
    </div>
    <!-- {{searchTypeValue}} -->
    <!-- {{educationData}} -->
    <!-- {{jobhunterData}} -->
    <!-- {{currentJob}} -->
    <div class="searchDiv">
      <div class="selectDiv">
        <el-select @change="educationChange" v-model="education" clearable placeholder="学历">
          <el-option
            v-for="item in educationData"
            :key="item"
            :label="item"
            :value="item">
          </el-option>
        </el-select>
        <el-select @change="genderChange" v-model="gender" clearable placeholder="性别">
          <el-option
            v-for="item in genderData"
            :key="item"
            :label="item"
            :value="item">
          </el-option>
        </el-select>
        <div class="input-with-select">
          <el-input clearable @change="inputChange" placeholder="请输入内容" v-model="searchKeyword">
            <el-select style="width:100px" v-model="searchType" slot="prepend" placeholder="请选择">
              <el-option label="用户名" value="1"></el-option>
              <el-option label="电话" value="2"></el-option>
            </el-select>
            <el-button @click="searchForJobhunter(searchKeyword)" slot="append" icon="el-icon-search"></el-button>
          </el-input>
        </div>
      </div>
    </div>
  <div class="tableDiv">
    <el-table
    ref="multipleTable"
    :data="jobhunterList"
    tooltip-effect="dark"
    style="width: 100%"
    @selection-change="selectionChange">
    <el-table-column
      type="selection"
      width="55">
    </el-table-column>
    <el-table-column
      prop="username"
      label="用户名"
      width="120">
      <!-- <template slot-scope="scope">{{ scope.row.date }}</template> -->
    </el-table-column>
    <el-table-column
      prop="realname"
      label="姓名"
      width="120">
    </el-table-column>
    <el-table-column
      prop="telephone"
      label="手机号"
      show-overflow-tooltip>
    </el-table-column>
    <el-table-column
      prop="gender"
      label="性别"
      show-overflow-tooltip>
    </el-table-column>
    <el-table-column
      prop="birth"
      label="出生年月"
      show-overflow-tooltip>
    </el-table-column>
    <el-table-column
      prop="education"
      label="最高学历"
      show-overflow-tooltip>
    </el-table-column>
    <el-table-column
      prop="address"
      label="操作"
      show-overflow-tooltip>
      <template slot-scope="scope">
        <el-button @click="toEdit(scope.row)" type="text" size="small">编辑</el-button>
        <el-button @click="toDelete(scope.row.id)" type="text" size="small" >删除</el-button>
      </template>
    </el-table-column>
  </el-table>
  </div>
  <div class="footerDiv">
      <div class="btnDiv">
        <el-button @click="toBatchDelete" size="mini" type="danger" plain>批量删除</el-button>
      </div>
      <div class="pageDiv">
        <el-pagination
          :page-size="pageSize"
          :current-page.sync="currentPage"
          background
          @current-change="pageChange"
          layout="prev, pager, next"
          :total="jobhunterData.length"
        ></el-pagination>
      </div>
  </div>
  <!-- 新增模态框 -->
    <el-dialog title="新增用户信息" :visible.sync="addVisible" width="60%" :before-close="beforeClose">
      <el-form :model="currentJob" :rules="rules" ref="ruleForm">
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item prop="username" label="用户名:" :label-width="formLabelWidth">
              <el-input v-model="currentJob.username"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item prop="realname" label="姓名:" :label-width="formLabelWidth">
              <el-input v-model="currentJob.realname"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item prop="telephone" label="手机号:" :label-width="formLabelWidth">
              <el-input v-model="currentJob.telephone"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item prop="gender" label="性别:" :label-width="formLabelWidth">
              <el-input v-model="currentJob.gender"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item prop="birth" label="出生年月:" :label-width="formLabelWidth">
              <el-input v-model="currentJob.birth"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item prop="education" label="最高学历:" :label-width="formLabelWidth">
              <el-input v-model="currentJob.education"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item prop="currentStatus" label="求职状态:" :label-width="formLabelWidth">
              <el-input v-model="currentJob.currentStatus"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item prop="password" label="密码:" :label-width="formLabelWidth">
              <el-input v-model="currentJob.password"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item prop="resume" label="简历:" :label-width="formLabelWidth">
              <el-input v-model="currentJob.resume"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item prop="workTime" label="工作时间:" :label-width="formLabelWidth">
              <el-input v-model="currentJob.workTime"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button size="mini" @click="toCancel('ruleForm')">取 消</el-button>
        <el-button size="mini" type="primary" @click="toSave('ruleForm')">确 定</el-button>
      </div>
    </el-dialog>
  <!-- 修改模态框 -->
    <el-dialog title="修改用户信息" :visible.sync="editVisible" width="60%" :before-close="beforeClose">
      <el-form :model="currentJob" :rules="rules" ref="ruleForm">
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item prop="username" label="用户名" :label-width="formLabelWidth">
              <el-input v-model="currentJob.username"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item prop="realname" label="姓名" :label-width="formLabelWidth">
              <el-input v-model="currentJob.realname"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item prop="telephone" label="手机号" :label-width="formLabelWidth">
              <el-input v-model="currentJob.telephone"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item prop="gender" label="性别" :label-width="formLabelWidth">
              <el-input v-model="currentJob.gender"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item prop="birth" label="出生年月" :label-width="formLabelWidth">
              <el-input v-model="currentJob.birth"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item prop="education" label="最高学历" :label-width="formLabelWidth">
              <el-input v-model="currentJob.education"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button size="mini" @click="toCancel('ruleForm')">取 消</el-button>
        <el-button size="mini" type="primary" @click="toSave('ruleForm')">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  findAllJobhunter,
  findJobhunterByEducation,
  findJobhunterByGender,
  deleteJobhunterById,
  saveOrUpdateJobhunter,
  findJobhunterByTelephone,
  findJobhunterByUsername,
  } 
  from '@/api/jobhunter.js';
import config from "@/utils/config.js";
export default {
  data() {
    return {
      searchTypeValue:'',
      searchKeyword:'',
      searchType:'',
      education:'',
      gender:'',
      //当前页数
      currentPage: 1,
      //每页条数
      pageSize: config.pageSize,
      //批量删除ids
      ids: [],
      jobhunter:'',
      //修改的对象
      currentJob:{},
      // jobhunterList:[],
      jobhunterData:[],
      educationData:[],
      genderData:[],
      addVisible:false,
      editVisible:false,
      rules: {
        username: [{ required: true, message: "请输入用户名", trigger: "blur" }],
        realname: [
          { required: true, message: "请输入真实姓名", trigger: "blur" }
        ],
        telephone: [{ required: true, message: "请输入电话号码", trigger: "blur" }],
        gender: [
          { required: true, message: "请输入性别", trigger: "blur" }
        ],
        birth: [
          { required: true, message: "请输入出生年月", trigger: "blur" }
        ],
        education: [
          { required: true, message: "请输入最高学历", trigger: "blur" }
        ],
        currentStatus: [
          { required: true, message: "请输入求职状态", trigger: "blur" }
        ],
        password: [
          { required: true, message: "请输入密码", trigger: "blur" }
        ],
        resume: [
          { required: true, message: "请输入简历", trigger: "blur" }
        ],
        workTime: [
          { required: true, message: "请输入工作时间", trigger: "blur" }
        ],
      }
    };
  },
  computed: {
    //分页数据
    jobhunterList() {
      let temp = [...this.jobhunterData];
      let page = this.currentPage;
      let pageSize = config.pageSize;
      return temp.slice((page - 1) * pageSize, page * pageSize);
    }
  },
  methods: {
    inputChange(searchKeyword){
      this.findAllJob();
    },
    //通过招聘标题发生改变
    async searchForJobhunter(searchKeyword){
      if(this.searchType === "2"){
        if(searchKeyword){
          
          try {
            let res = await findJobhunterByTelephone({telephone:searchKeyword});
            this.jobhunterData = res.data;
            this.currentPage = 1;
          } catch (error) {
            config.errorMsg(this,'请输入与'+'this.'+'相关的关键字');
          }
        }
        else{
          this.findAllJob();
        }
      }
      else{
        if(searchKeyword){
          try {
            let res = await findJobhunterByUsername({username:searchKeyword});
            this.jobhunterData = res.data;
            this.currentPage = 1;
          } catch (error) {
            config.errorMsg(this,'请输入与'+'searchType'+'相关的关键字');
          }
        }
        else{
          this.findAllJob();
        }
      }
      
    },

    //右上角，模态框关闭之前
    beforeClose() {
      this.$refs["ruleForm"].resetFields();
      this.addVisible = false;
      this.editVisible = false;
    },
    //关闭模态框
    toCancel(formName) {
      //重置表单验证，关闭模态框
      this.$refs[formName].resetFields();
      this.addVisible = false;
      this.editVisible = false;
    },
    // 页数发生改变
    pageChange(page) {
      this.currentPage = page;
    },
    //查找所有学历信息
    async findAllJob(){
      try {
        let res = await findAllJobhunter();
        this.jobhunterData = res.data;
        let educationArr = res.data.map((item)=>{
        return item.education;
      })
      this.educationData = [...new Set(educationArr)];
        let genderArr = res.data.map((item)=>{
        return item.gender;
      })
      this.genderData = [...new Set(genderArr)];
      } catch (error) {
        config.errorMsg(this,'查找错误')
      }
    },
    //学位发生改变
    async educationChange(val){
      this.gender='';
      if (val) {
        try {
          let res = await findJobhunterByEducation({education:val});
          this.jobhunterData = res.data;
          this.currentPage = 1;
        } catch (error) {
          config.errorMsg(this, "通过学位查找用户信息错误");
        }
      }else{
        this.findAllJob();
      }
    },
    //性别发生改变
    async genderChange(val){
      this.education='';
      if (val) {
        try {
          let res = await findJobhunterByGender({gender:val});
          this.jobhunterData = res.data;
          this.currentPage = 1;
        } catch (error) {
          config.errorMsg(this, "通过性别查找用户信息错误");
        }
      }else{
        this.findAllJob();
      }
    },
    //编辑
    toEdit(row) {
      this.currentJob = { ...row };
      this.editVisible = true;
    },
    //新增
    toAdd(){
      this.currentJob = {};
      // this.$refs["ruleForm"].resetFields();
      this.addVisible = true;
    },
    //删除
    toDelete(id) {
      // alert("删除");
      this.$confirm("是否删除该记录?", "提示", {
        confirmButtonText: "删除",
        cancelButtonText: "取消",
        type: "warning"
      })
        .then(async () => {
          //访问后台接口
          try {
            // alert(id);
            let res = await deleteJobhunterById({ id:id });
            if (res.status === 200) {
              config.successMsg(this, "删除成功");
              this.findAllJob();
            } else {
              config.errorMsg(this, "删除失败");
            }
          } catch (error) {
            config.errorMsg(this, "删除失败");
          }
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消删除"
          });
        });
    },
    //保存
    toSave(formName) {
      this.$refs[formName].validate(async valid => {
        if (valid) {
          //通过验证
          //保存
          try {
            let res = await saveOrUpdateJobhunter(this.currentJob);
            if (res.status === 200) {
              this.findAllJob();
              this.addsVisible = false;
              config.successMsg(this, "修改成功");
            } else {
              config.errorMsg(this, "修改失败");
            }
          } catch (error) {
            console.log(error);
            config.errorMsg(this, "修改失败");
          }
          } else {
          console.log("error submit!!");
          return false;
        }
      });
      this.editVisible = false;
    },
    //批量删除
    toBatchDelete() {
      //获取要批量删除的id  this.ids
      let ids = this.ids;
      if (ids.length > 0) {
        this.$alert("是否删除？", "提示", {
          confirmButtonText: "删除",
          callback: action => {
            if (action === "confirm") {
              let result = [];
              ids.forEach(async id => {
                try {
                  let res = await deleteJobhunterById({ id: id });
                  result.push(res.status);
                } catch (error) {
                  result.push(500);
                }
              });
              setTimeout(() => {
                // console.log(result);
                //判断是否都是200
                let resu = result.every(item => {
                  return item === 200;
                });
                if (resu) {
                  config.successMsg(this, "批量删除成功");
                } else {
                  config.errorMsg(this, "批量删除失败");
                }
                this.findAllBus();
              }, 500);
            }
          }
        });
      } else {
        this.$message({
          message: "请选中要删除的数据",
          type: "warning"
        });
      }
    },
    //复选框选中切换
    selectionChange(val) {
      //val 就是选中的对象组成的数组
      // console.log(val);
      let ids = val.map(item => {
        return item.id;
      });
      this.ids = ids;
    },

  },
  created() {
    this.findAllJob();
  },
  mounted() {}
};
</script>
<style lang="scss" scoped>
.btn{
  float: right;
  margin: 10px 0;
}
.tableDiv {
  margin-top: 10px;
}
.footerDiv {
  overflow: hidden;
  margin-top: 10px;
  .btnDiv {
    float: left;
  }
  .pageDiv {
    float: right;
  }
}
  .searchDiv{
    display: inline-block;
    width: 100%;
    .selectDiv{
      width: 100%;
      .input-with-select{
        float: right;
        width: 350px;
      } 
    }
  } 
</style>