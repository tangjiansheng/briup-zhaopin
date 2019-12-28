/*
 * @Author: liuyr 
 * 职位管理页面
 * @Date: 2019-12-23 17:11:53 
 * @Last Modified by: liuyr
 * @Last Modified time: 2019-12-28 16:34:39
 */
<template>
  <div id="modulePosition">
    <div class="mount">
       <div class="header">
     <div class="buttonDiv">
      <el-button @click="show3 = !show3" size="small" type="danger" icon="el-icon-info">添加省份</el-button>
    </div>
    </div>
    <div class="table_1">
       <div class="provinceDiv_1">
          职位
      </div>
      <div class="CityDiv_1">
         工种
      </div>
    </div>
          <!-- <el-collapse-transition>
        <div v-show="show3"> -->
       <div class="table_2" >
       <div class="provinceDiv_2">
          职位
      </div>
      <div class="CityDiv_2">
         工种
      </div>
    </div> 
    <!-- </div>
      </el-collapse-transition> -->
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {};
  },
  computed: {},
  methods: {},
  created() {},
  mounted() {}
};
</script>
<style lang="scss" scoped>
.mount{
  margin-top:10px ;
  width: 100%,
}
.header{
  overflow: hidden;

.buttonDiv{
  float: right;
  margin-right: 20%;
  margin-top: 10px;
}
}
.table_1{
margin-top: 20px;
width:80%;
height:80px;
border:1px solid #000
to
}
.provinceDiv_1{
  font-size: 12px;
  color: white;
  background-color: #000;
  width:100%;
  height:35%;
  border:1px solid #000
}
.CityDiv_1{
  font-size: 12px;
  color: black;
  width:100%;
  height:65%;
  border:1px solid #000
}
.table_2{
margin-top: 20px;
width:80%;
height:80px;
border:1px solid #000
to
}
.provinceDiv_2{
  font-size: 12px;
  color: white;
  background-color: #000;
  width:100%;
  height:35%;
  border:1px solid #000
}
.CityDiv_2{
  font-size: 12px;
  color: black;
  width:100%;
  height:65%;
  border:1px solid #000
}
</style>