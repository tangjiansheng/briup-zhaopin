/*
 * @Author: liuyr 
 * 求职列表页面
 * @Date: 2019-12-23 17:11:53 
 * @Last Modified by: Amily
 * @Last Modified time: 2019-12-28 16:41:18
 */
<template>
  <div id="jobList">
    <div class="jobButton">
      <el-button type="primary" size="mini">待联系</el-button>
    </div>

    <div class="jobTable">
      <el-table ref="multipleTable" :data="tableData" tooltip-effect="dark" style="width: 100%" @selection-change="selectionChange">
        <el-table-column prop="realname" label="求职人" width="180"></el-table-column>
        <el-table-column prop="telephone" label="联系方式" width="180"></el-table-column>
        <el-table-column prop="job" label="求职岗位" width="180"></el-table-column>

        <el-table-column prop="name" label="简历" width="180">
          <template slot-scope="scope">
            <el-button @click="toSee(scope.row)" type="text" size="small">查看</el-button>
          </template>
        </el-table-column>
        
        <el-table-column prop="publishTime" label="申请时间"></el-table-column>
      </el-table>
    </div>

  </div>
</template>

<script>
import { findAllWithJobhAndEmpl } from "@/api/jobhuntercontroller.js";
import config from "@/utils/config.js";
export default {
  data() {
    return {
      realname:'', realnameData:[],
      telephone:'', telephoneData:[],
      job:'', jobData:[],
      publishTime:'', publishTimeData:[],
      tableData:[],withJobhAndEmplData:[],
      jobList:[]
    };
  },
  computed: {},
  methods: {
    //查找所有求职者信息信息
    async findAllJob() {
      try {
        let res = await findAllWithJobhAndEmpl();
        this.withJobhAndEmplData = res.data;
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
.jobTable {
  margin-top: 10px;
}
</style>