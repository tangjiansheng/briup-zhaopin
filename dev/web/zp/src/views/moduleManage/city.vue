/*
 * @Author: liuyr 
 * 城市管理页面
 * @Date: 2019-12-23 17:11:53 
 * @Last Modified by: liuyr
 * @Last Modified time: 2019-12-29 17:43:53
 */
<template>
  <div id="moduleCity">
    <div class="header">
          <div class="buttonDiv">
          <el-button  @click="getprovible" class="butt" size="mini" type="primary">
            增加省份</el-button>
           <el-button @click="getcivible" size="mini" type="primary">增加城市</el-button>
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
          <el-table-column prop="id"  label="城市Id" align ="center">
            <template slot-scope="scope">
            <span>{{ scope.row.id}}</span>
            </template>
          </el-table-column>
            <el-table-column prop="name"  label="城市名称" align ="center">
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
        <el-table-column
      align="right"
      label="ID" 
      prop="id">
      <template slot-scope="scope"> 
         <span>{{ scope.row.id}}</span>
      </template>
    </el-table-column>
  </el-table>
    </div>
        <!-- 添加城市模态框 -->
     <el-dialog title="添加城市" :visible.sync="cityVisible" width="15%">
              <el-form :model="cityform">
                     <el-row :gutter="20">
                       <el-col>
                    <el-form-item label="城市名称" :label-width="formLabelWidth">
                    <el-input v-model="cityform.name" auto-complete="off">
                   </el-input>   
                    </el-form-item>                                           
                       </el-col>
                         <el-col>
                   <el-form-item label="省份Id" :label-width="formLabelWidth">
                    <el-input v-model="cityform.provinceId" auto-complete="off">
                   </el-input>   
                    </el-form-item>                                           
                       </el-col>
                     </el-row>
              </el-form>
          <div slot="footer" class="dialog-footer" >
             <el-button size="mini" @click="cityVisible = false">取消</el-button>
             <el-button size="mini" @click="savecity">确认</el-button>
          </div>
            </el-dialog>
    <!-- 添加省份模态框 -->
     <el-dialog title="添加省份" :visible.sync="proVisible" width="15%">
              <el-form :model="provinceform">
                     <el-row :gutter="20">
                       <el-col>
                          <el-form-item label="省份名称" :label-width="formLabelWidth">
                    <el-input v-model="provinceform.name" auto-complete="off">
                   </el-input>   
                    </el-form-item>                                           
                       </el-col>
                     </el-row>
              </el-form>
          <div slot="footer" class="dialog-footer" >
             <el-button size="mini" @click="proVisible = false">取消</el-button>
             <el-button size="mini" @click="saveprovince">确认</el-button>
          </div>
            </el-dialog>
  </div>
</template>

<script>
import { findAllProvince,saveOrUpdateProvince} from "@/api/province.js";
import { findAllCity, findCityByProvinceId,deleteCityById,saveOrUpdateCity } from "@/api/city.js";
export default {
  data() {
    return { 
      acriveName:"1",
      input:"",
      cityform:{
        name:"",
        provinceId:"",
      },
      provinceform:{
        name:'',
      },
      //添加省份模块显示与否
      cityVisible :false,
      //添加省份模块显示与否
      proVisible : false,
      //省份
      province: "",
      //城市
        cityform: {
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
    //显示添加城市页面表单。
    getcivible(){
      this. cityform= { };
      this.cityVisible = true;
    },
    //显示添加省份页面表单。
    getprovible(){
      this. provinceform= { };
      this.proVisible = true;
    },
    //保存省份
     async saveprovince(){
     console.log(this.provinceform)
     let name = this.provinceform
     try{
       let res = await saveOrUpdateProvince(name);
       console.log(res);
       this.proVisible=false;
       this.findAllPro()
       this.$notify({
         title:"成功",
         message:"保存成功",
         type:"success"
       });
     }catch(err){
       console.log(err)
     }
     },
      //保存城市
     async savecity(){
     console.log(this.cityform)
     let name = this.cityform
     try{
       let res = await saveOrUpdateCity(name);
       console.log(res);
       this.cityVisible=false;
       this.findAllPro()
       this.$notify({
         title:"成功",
         message:"保存成功",
         type:"success"
       });
     }catch(err){
       console.log(err)
     }
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
            let res = await deleteCityById({ id: id });
            if (res.status === 200) {
             this.$message({
             type:'success',
             message:'删除成功',
             });
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
          //城市输入框
   async  savegetcity () {
        
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