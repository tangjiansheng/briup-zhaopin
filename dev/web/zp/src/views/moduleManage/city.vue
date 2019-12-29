/*
 * @Author: liuyr 
 * 城市管理页面
 * @Date: 2019-12-23 17:11:53 
 * @Last Modified by: liuyr
 * @Last Modified time: 2019-12-29 10:04:26
 */
<template>
  <div id="moduleCity">
    <div class="header">
      <div class="buttonDiv">
          <el-button  @click="saveprovince" size="mini" type="primary" prain>增加省份</el-button>
           <el-button @click="savegetcity" size="mini" type="primary" prain>增加城市</el-button>
      </div>
    </div>
    <div class="tableDiv">
      <el-table
    :data="provinceData"
    style="width: 40%">
    <el-table-column
     type="expand"
      prop="city" >
      <template slot-scope="scope">
       <el-table :data="scope.row.city">
          <el-table-column prop="name"  label="城市" align ="left">
            <template slot-scope="scope">
            <span>{{ scope.row.name}}</span>
            </template>
          </el-table-column>
            <el-table-column prop="name"  label="操作" align ="right">
            <template slot-scope="scope">
   <el-button @click="toDelete(scope.row.id)" type="danger" size="mini"  icon="el-icon-delete"></el-button>
            </template>
          </el-table-column>
       </el-table>
     </template>
    </el-table-column>
    <el-table-column
      align="left"
      label="省份" 
      prop="name">
      <template slot-scope="scope"> 
         <span>{{ scope.row.name}}</span>
      </template>
    </el-table-column>
  </el-table>
    </div>
  </div>
</template>

<script>
import { findAllProvince,saveOrUpdateProvince} from "@/api/province.js";
import { findAllCity, findCityByProvinceId,deleteCityById } from "@/api/city.js";
export default {
  data() {
    return { 
      //省份
      province: "",
      //城市
        city: {
        name: "",
        provinceId: ""
      },
      //省份数组
      provinceData: [],
      //城市数组
      provinceCityData: [],
      
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
            let res = await deleteCityById({ id: id });
            if (res.status === 200) {
              config.successMsg(this, "删除成功");
              this.findAllPro();
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
    ////保存省份
     saveprovince() {
        this.$prompt('请输入省份名称', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: "warning"
        }).then(async(value) => {   
          try{
             let res = await saveOrUpdateProvince({ name:value });
            if (res.status === 200) {
              config.successMsg(this, "保存成功");
              this.findAllPro();
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
          //城市输入框
    savegetcity () {
        this.$prompt('请输入城市名称', '提示', {
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
      //查找所有城市信息
    async findAllCi() {
      try {
        let res = await findAllCity();
        this.cityData = res.data;
      } catch (error) {
        config.errorMsg(this, "查找错误");
      }
    },
      //查找所有省份信息
 async findAllPro(page) {
      try {
        let res = await findAllProvince();
        let temp = [...res.data];
        temp.forEach(async(item)=>{
          let id = item.id;
          let resp = await findCityByProvinceId({provinceId:id})
          console.log(resp);
          item.city = resp.data; 
        })
        setTimeout(()=>{
          this.provinceData = temp; 
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
     this.findAllPro();
  },
  mounted() {}
};
</script>
<style lang="scss" scoped>
 .demo-table-expand {
    font-size: 0;
  }
  .demo-table-expand label {
    width: 90px;
    color: #99a9bf;
  }
  .demo-table-expand .el-form-item {
    margin-right: 0;
    margin-bottom: 0;
    width: 50%;
  }
</style>