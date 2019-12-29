/*
 * @Author: liuyr 
 * 求职列表页面
 * @Date: 2019-12-23 17:11:53 
 * @Last Modified by: Amily
 * @Last Modified time: 2019-12-29 16:46:58
 */
<template>
  <div id="jobhunterList">
    <div>
      <el-tag background-color="rgb">待联系</el-tag>
    </div>

    <div class="tableDiv">
      <el-table align="center" :data="jobhunterList"  style="width: 100%" >
        <el-table-column  prop="jobhunter.realname" label="求职人" ></el-table-column>
        <el-table-column  prop="jobhunter.telephone" label="联系方式" ></el-table-column>
        <el-table-column  prop="employment.job" label="求职岗位" ></el-table-column>

        <el-table-column label="简历" >
          <template slot-scope="scope">
            <el-button @click="toSee(scope.row)" type="text" size="small">查看</el-button>
          </template>
        </el-table-column>
        
        <el-table-column align="center" prop="askTime" label="申请时间"></el-table-column>
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
           :total="withJobhAndEmplData.length"
          >
          </el-pagination>
    </div>

      <!-- 模态框 -->
      <el-dialog title="个人简历" :visible.sync="seeVisible" width="500px">
        <div class="aDiv">
            {{currentJob.realname}}
            <i class="el-icon-mobile-phone" ></i>
            <span>手机认证</span>
        </div>

        <div class="xianDiv"></div>

      <div class="bDiv">
        <el-tag style="weight=100%" size=mini>个人信息</el-tag>
        
        <el-form :model="form">
          <el-form-item label="性别：" label-width=50% >
            {{currentJob.gender}}
          </el-form-item>
        </el-form>
        <el-form :model="form" style="height=250">
          <el-form-item label="最高学历：" label-width=50% >
            {{currentJob.education}}
          </el-form-item>
        </el-form>
        
        
        <el-form :model="form">
          <el-form-item label="出生年月：" label-width=50%>
            {{currentJob.birth}}
          </el-form-item>
        </el-form>
        <el-form :model="form">
          <el-form-item label="工作经验：" label-width=50%>
            {{currentJob.workTime}}
          </el-form-item>
        </el-form>
        </div>
      
    </el-dialog>

  </div>
</template>

<script>
import { findAllWithJobhAndEmpl } from "@/api/employmentjobhunter.js";
import config from "@/utils/config.js";
export default {
  data() {
    return {
      withJobhAndEmplData:[],
      withJobhAndEmplList:[],
      currentJob:{},
      //模态框显示与否
      seeVisible: false,
      formLabelWidth:'100px',
      //当前页
      currentPage: 1,
      //每页条数
      pageSize: config.pageSize,
    };
  },
  computed: {
    // 分页数据
    jobhunterList() {
      let temp = [...this.withJobhAndEmplData];
      let page = this.currentPage;
      let pageSize = config.pageSize;
      return temp.slice((page - 1) * pageSize, page * pageSize);
    }
  },
  methods: {
// 页数发生改变
    pageChange(page) {
      this.currentPage = page;
    },

    //查看
    toSee(row) {
      this.currentJob = { ...row.jobhunter };
      this.seeVisible = true;
      name = currentJob.name;
    },
    
    //查找所有求职者信息
    async findAllJob() {
      try {
        let res = await  findAllWithJobhAndEmpl();
        this.withJobhAndEmplData = res.data;

        this.withJobhAndEmplData.forEach(item=>{
          item.askTime = item.askTime.slice(0,10);
        })
      } catch (error) {
        config.errorMsg(this, "查找错误");
      }
    },
  },
  created() {
    this.findAllJob();
  },
  mounted() {}
};
</script>
<style scoped>
.tableDiv{
  margin-top: 10px;
}
.pageDiv {
  float: right;
  }
  .bDiv{
    margin-top: 10px;
  }
  .el-form-item{
    margin-bottom: 1px;
  }
  .aDiv{
    margin-top: 1px;
    font-weight: bold;
    font-size: 20px;
    padding-right: 5px;
  }
   span{
    font-size: 13px;
    font-weight: normal;
  }
  .bDiv{
    margin-bottom: 20px;
  }
  .xianDiv{
    background-color: rgb(12, 162, 248);
    width:100%;
    height:1px;
    margin: 10px auto;
  }
</style>

