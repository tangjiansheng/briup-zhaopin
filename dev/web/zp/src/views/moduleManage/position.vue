/*
 * @Author: liuyr 
 * 职位管理页面
 * @Date: 2019-12-23 17:11:53 
 * @Last Modified by: liuyr
 * @Last Modified time: 2019-12-29 16:46:06
 */
<template>

  <div id="modulePosition">
{{jobsData}}
    <div class="header">
      <div class="buttonDiv">
          <el-button  @click="getjobtype" size="mini"  type="primary" align ="left">增加工种</el-button>
           <el-button @click="getjob" size="mini" type="primary" align ="left">增加职位</el-button>
      </div>
    </div>
    <div class="tableDiv">
      <el-table
    :data="jobsData"
    style="width: 40%">
    <el-table-column
     type="expand"
      prop="job" >
      <template slot-scope="scope">
       <el-table :data="scope.row.job">
          <el-table-column prop="name"  label="职业" align ="left">
            <template slot-scope="scope">
            <span>{{ scope.row.name}}</span>
            </template>
          </el-table-column>
            <el-table-column prop="play"  label="操作" align ="right">
            <template slot-scope="scope">
   <el-button @click="toDelete(scope.row.id)" type="danger" size="mini"  icon="el-icon-delete"></el-button>
            </template>
          </el-table-column>
       </el-table>
     </template>
    </el-table-column>
    <el-table-column
      align="left"
      label="工种" 
      prop="staus">
      <template slot-scope="scope"> 
         <span>{{ scope.row.name}}</span>
      </template>
    </el-table-column>
  </el-table>
    </div>
<!-- 添加工种模态框 -->
     <el-dialog title="添加工种" :visible.sync="jobtVisible" width="15%">
              <el-form :model="jobtpeform">
                     <el-row :gutter="20">
                       <el-col :span="12">
                          <el-form-item label="工种名称" :label-width="formLabelWidth">
                    <el-input v-model="jobtpeform.name" auto-complete="off">
                   </el-input>   
                    </el-form-item>                                           
                       </el-col>
                     </el-row>
              </el-form>
          <div slot="footer" class="dialog-footer" >
             <el-button size="mini" @click="jobtVisible = false">取消</el-button>
             <el-button size="mini" @click="jobtpesave">确认</el-button>
          </div>
            </el-dialog>
  </div>
</template>

<script>
import {findAllJobType,saveOrUpdateJobType} from "@/api/job-type.js";
import {findJobsByStatus,findAllJobs,deleteJobsById} from "@/api/jobs.js";
export default {
  data() {
    return {
      acriveName:"1",
      input:"",
      //工种
      jobtype: "",
      //职业
      job:[],
      //工作数组
      jobsData: [],
      jobtpeform:{
        name:'',
      },
      jobtVisible:false,
    };
  },
  computed: {},
  methods: {
    //显示添加工种表单
    getjobtype(){
      this. javatpeform= { };
      this. jobtVisible = true;
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
            let res = await deleteJobsById({ id: id });
            if (res.status === 200) {
              config.successMsg(this, "删除成功");
              this.findAlljt();
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
            message: "删除成功"
          });
        });
    },
     //保存工种
async jobtpesave(){
     console.log(this.form)
     let name = this.form
     try{
       let res = await saveOrUpdateJobType();
       console.log(res);
       this.jobtVisible=false;
       this.findAlljt()
       this.$notify({
         title:"成功",
         message:"保存成功",
         type:"success"
       });
     }catch(err){
       console.log(err)
     }
     },
          //保存职业
  savejob() {
        this.$prompt('请输入职业名称', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
        }).then(({ value }) => {
          this.$message({
            type: 'success',
            message: '保存成功 ' + value
          });
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '取消输入'
          });       
        });
      },
  //查找所有工种信息
 async findAlljt(page) {
      try {
        let res = await findAllJobType();
        let temp = [...res.data];
        temp.forEach(async(item)=>{
          let name = item.name;
          let resp = await findJobsByStatus({staus:name})
          console.log(resp);
          item.job = resp.data; 
        })
        setTimeout(()=>{
          this.jobsData = temp; 
        },500)
      } catch (err) {
        this.$notify.error({
          title:"错误",
          message:"查找失败"
        });
      }
 },

  },
  created() {
     this.findAlljt()
  },
  mounted() {
    
  }
};
</script>
<style lang="scss" scoped>
.tableDiv {
  margin-top: 10px;
}
.mount{
  margin-top:10px ;
  width: 100%,
}
.header{
  overflow: hidden;
}

</style>