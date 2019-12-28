/*
 * @Author: liuyr 
 * 客服列表页面
 * @Date: 2019-12-23 17:11:53 
 * @Last Modified by: mikey.zhaopeng
 * @Last Modified time: 2019-12-28 16:18:11
 */
<template>

  <div class="wrap">
    <div class="buttonDiv" align="right">
        <el-button @click="toAdd()" type="warning" size="mini">添加用户</el-button>
        <el-button @click="toinput()"   type="primary" size="mini">导入用户</el-button>
    </div>

    <!-- 下拉框和输入框 -->
     <div class="selectDiv">
       <!-- 下拉框1 -->
       <el-select v-model="value" multiple placeholder="在线">
       <el-option v-for="item in options" :key="item.value" :label="item.label" :value="item.value"></el-option>
       </el-select>
       <!-- 下拉框2 -->
       <el-select v-model="value" multiple collapse-tags style="margin-left: 20px;" placeholder="性别">
       <el-option v-for="item in options1" :key="item.value" :label="item.label" :value="item.value"></el-option>
       </el-select>
       <!-- 输入框 -->
       <div class="inputDiv">
        <el-input  placeholder="请输入关键字" v-model="input" class="input-with-select">
         <el-select v-model="select" slot="prepend" placeholder="请选择"></el-select>
         <el-button slot="append" icon="el-icon-search"></el-button>
        </el-input>
       </div>
     </div>
     
     <!-- 表格内容 -->
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

    <!-- 模态框 -->
    <div  class="dialog">
       <el-dialog title="工作分配" :visible.sync="dialogVisible" width="50%" >
         <!-- 嵌套表格 -->
            <div class="table">
                <el-table ref="multipleTable" :data="wrap" tooltip-effect="dark" style="width: 100%" >
                <el-table-column type="selection" width="55"></el-table-column>
                <el-table-column prop="jobhunter.realname" label="求职人" ></el-table-column>
                <el-table-column prop="jobhunter.telephone" label="联系方式" ></el-table-column>
                <el-table-column prop="employment.job" label="求职岗位" ></el-table-column>
                <el-table-column prop="status" label="经手人" ></el-table-column>
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
    </div>

     
    

</div>
</template>

<script>
import {findAllCustomerService,deleteCustomerServiceById} from "@/api/customer-service.js";
import {findAllEmploymentWithJobhAndEmpl} from "@/api/employment-jobhunter.js";
import config from "@/utils/config.js";
export default {
  data() {
    return {
      options: [{ value: '选项1', label: '在线'},
                 { value: '选项2', label: '离线'}],
      options1: [{ value: '选项1', label: '男'},
                 { value: '选项2', label: '女'}],
      value:'',
      select: '',
      input:'',
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
//添加用户
toAdd(){
   alert
},
//导入用户
toinput(){
   alert
},
//删除操作
toDelete(id) {
      // alert("删除");
      this.$confirm("是否删除该记录?", "提示", {
        confirmButtonText: "删除",
        // cancelButtonText: "取消",
        type: "warning"
      })
        .then(async () => {
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

    
//页数改变
  pageChange(page) {
      this.currentPage = page;
  },

//查找所有客服信息
  async findAllCustomerService(){
      try{
        let res = await findAllCustomerService();
        this.CustomerServiceData=res.data;
       }catch(error){
          config.errorMsg(this, "查找错误");
       }
    },
  //查看工作分配
   toSee(row) {
      this.currentwaiter={...row};
      this.dialogVisible=true;
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
<style scoped>
.buttonDiv{
  margin-top: -45px;
}

.selectDiv{
 margin-top: 20px;
 width: 100%;
 display:inline-block;
}
.inputDiv{
  width: 300px;
  float: right;
}
.tableDiv{
  margin-top: 10px;
  clear: both;
}
</style>