/*
 * @Author: liuyr 
 * 职位管理页面
 * @Date: 2019-12-23 17:11:53 
 * @Last Modified by: liuyr
 * @Last Modified time: 2019-12-29 10:22:28
 */
<template>

  <div id="modulePosition">
<!-- {{jobsData}} -->
    <div class="header">
      <div class="buttonDiv">
          <el-button  @click="savejobtype" size="mini"  type="primary" align ="left">增加工种</el-button>
           <el-button @click="savejob" size="mini" type="primary" align ="left">增加职位</el-button>
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
  </div>
</template>

<script>
import {findAllJobType} from "@/api/job-type.js";
import {findJobsByStatus,findAllJobs,deleteJobsById} from "@/api/jobs.js";
export default {
  data() {
    return {
      //工种
      jobtype: "",
      //职业
        job:[],
      //工作数组
     jobsData: [],

    };
  },
  computed: {},
  methods: {
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
     savejobtype() {
        this.$prompt('请输入工种名称', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: "warning"
        }).then(async(value) => {   
          try{
             let res = await saveOrUpdateProvince({ name:value });
            if (res.status === 200) {
              config.successMsg(this, "保存成功");
              this.findAlljt();
            } else {
              config.errorMsg(this, "保存失败");
            }
          } catch (error) {
            config.errorMsg(this, "保存完成");
          }
          })
        .catch(() => {
          this.$message({
            type: 'info',
            message: '保存完成'
          });       
        });
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
          let staus = item.name;
          let resp = await findJobsByStatus({staus:staus})
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
.mount{
  margin-top:10px ;
  width: 100%,
}
.header{
  overflow: hidden;
}
</style>