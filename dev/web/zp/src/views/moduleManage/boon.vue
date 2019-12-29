/*
 * @Author: liuyr 
 * 福利管理页面
 * @Date: 2019-12-23 17:11:53 
 * @Last Modified by: liuyr
 * @Last Modified time: 2019-12-29 21:13:13
 */
<template>
  <div id="moduleBoon">
    <!-- {{buttonData}} -->
 <div class="searchDiv">
      <el-select @change="idChange" size="small" v-model="welfare" clearable placeholder="全部">
        
        <el-option
          v-for="item in welfareData"
          :key="item.id"
          :label="item.name"
          :value="item.id"
        ></el-option>
      </el-select>
    </div>
    <div class="tableDiv">
      <el-table
        ref="multipleTable"
        :data="welfareList"
        tooltip-effect="dark"
        style="width: 100%"
        @selection-change="selectionChange"
      >
        <el-table-column align="center" type="selection" width="55"></el-table-column>
        <el-table-column align="left" prop="name" label="福利名称" width="800"></el-table-column>
        <el-table-column align="center" prop="status" label="状态" width="70"></el-table-column>
        <el-table-column align="center" label="操作" width="100">
          <template slot-scope="scope">

            <el-button type="text"  @click="changestatus(scope.row)" size="small">
              {{buttonData[scope.$index]}}
            </el-button>
          </template>
        </el-table-column>
      </el-table>
<div class="footer">
  <div class="button">
    <el-button @click="toBatchDelete" size="mini" type="danger">删除</el-button>
    </div>
<div class="pagi">
  <el-pagination
   @current-change="currentChange"
  :current-page.sync="currentPage"
  size="mini"
  background
  layout="pager"
  :total="welfareData.length">
</el-pagination>
</div>
</div>
</div>
  </div>
</template>
<script>
import { findAllWelfare,deleteWelfareById,findWelfareById } from "@/api/boon.js";
import config from "@/utils/config.js";
import qs from "qs";
export default {
  data() {
        return{
          //福利
          welfare:"",
          //当前页
          currentPage: 1,
          //福利名称
          name :"",
          //当前查看或修改的对象
          currentwel:[],
          //状态
          status : [],
          //福利名称数组
          nameData :[],
          //状态数组
          statusData :[],
          //福利列表数组
          welfareData : [],
          //福利列表
          moduleBoon :[],
          //按钮数组
          buttonData:[],
          //每页条数
          pageSize: config.pageSize,
          //批量删除ids
          ids: [],
          //当前查看或修改的对象
          currentWel: {},
          //模态框显示与否
          editVisible: false,
          
        }
  },
    computed: {
         welfareList() {
      //  1   2   3
      let temp = [...this.welfareData];
      let pageSize = 5;
      let page = this.currentPage;
      return temp.slice((page - 1) * pageSize, page * pageSize);
    }
    },
      methods: {
      //按钮显示
      //福利名称改变
     async idChange(val) {
      //val 是option的value值
      if (val) {
        try {
          let res = await findWelfareById({ id: val });
          this.welfareData = [res.data];
          this.currentPage = 1;
        } catch (error) {
          config.errorMsg(this, "通过id查找福利信息错误");
        }
      } else {
        this.findAllWel();
      }
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
                  let res = await deleteWelfareById({ id: id });
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
                this.findAllWel();
              }, 2000);
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
       currentChange(val) {
      //val是当前点击的页数
      // console.log(val);
      this.currentPage = val;
    },

changestatus(val) {
       console.log("val="+val);
       var new_status = val.status;
       if(val.status="使用中"){
           new_status= "冻结中";
       } else{
           new_status= "使用中";
       }
       try{
         let res = saveOrUpdateWelfare({id: val.id, status:new_status, name: val.name});
         this.findAllWel();
       }catch(err){
         this.$notify.error({
           title:"错误",
           message:"修改失败",
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
        //查找所有福利信息
    async findAllWel() {
    try {

        let res = await findAllWelfare();
        this.welfareData = res.data;
        //福利名称数组
        let nameArr = res.data.map(item => {
          return item.name;
        });
        //去重
        this.nameData = [...new Set(nameArr)];
        //状态数组
        let statusArr = res.data.map(item => {
          return item.status;
        });
        //去重
        this.statusData = [...new Set(statusArr)];
        var a = [];
        if(statusArr){
          for(var i=0;i<statusArr.length;i++){
            if(statusArr[i]=='使用中'){
              a[i]='冻结';
            }else{
              a[i]='恢复';
            }
          }
        }
        this.buttonData=[...a];
      } catch (error) {
        config.errorMsg(this, "查找错误");
      }
    },
    },
  created() {
    this. findAllWel();
  },
  mounted() {
    
  }
};
</script>
<style lang="scss" scoped>
// .tableDiv{
//   margin-top:20px ;
// }
.tableDiv {
  margin-top: 10px;
}
.footer{
  overflow: hidden;
  .button{
    float: left;
     margin-top: 10px;
  }
  .pagi {
  float: right;
  margin-right: 30%;
  margin-top: 10px;
}

}

</style>
           