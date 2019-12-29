/*
 * @Author:tangjs 
 * 招聘中页面
 * @Date: 2019-12-23 17:03:30 
 * @Last Modified by: tangjs
 * @Last Modified time: 2019-12-28 20:35:12
 */
<template>
  <div id="recruitDoing">
    <div class="icon">
      <el-button type="primary" icon="el-icon-edit" class="put" @click="toAdd()" :visible.sync="addVisible" width="60%" :before-close="beforeClose">发布职位</el-button>
      <el-button type="primary" icon="el-icon-edit" class="import" @click="toAdd()">导入职位</el-button>
    </div>
    <div class="searchDiv">
      <el-select @change="jobChange" v-model="jobtype" clearable placeholder="职位类型">
        <el-option
          v-for="item in jobtypeData"
          :key="item.id"
          :label="item.name"
          :value="item.name">
        </el-option>
      </el-select> 
    </div>
    <div class="key">
      <el-input @change="inputChange" clearable placeholder="请输入内容" v-model="input" class="input-with-select">
        <el-select class="select" clearable v-model="searchType" slot="prepend" placeholder="请选择">
          <el-option label="职位" value="1"></el-option>
          <el-option label="招聘标题" value="2"></el-option>
        </el-select>
        <el-button class="button" slot="append" icon="el-icon-search" @click="keyinto(input)"></el-button>
      </el-input>
    </div>
    <div class="tableDiv">
      <el-table
        ref="multipleTable"
        :data="cityList"
        tooltip-effect="dark"
        style="width: 100%"
        @selection-change="SelectionChange">
        <el-table-column
          align="center"
          type="selection"
          width="55">
        </el-table-column>
        <el-table-column align="center" prop="title" label="招聘标题"></el-table-column>
        <el-table-column align="center" prop="contactName" label="发布人"></el-table-column>
        <el-table-column align="center" prop="contactPhone" label="联系方式"></el-table-column>
        <el-table-column align="center" prop="job" label="职位">
          <!-- <template slot-scope="scope">{{scope.row.description}}-{{scope.row.job}}</template> -->
        </el-table-column>
        <el-table-column align="center" prop="publishTime" label="发布时间"></el-table-column>
        <el-table-column align="center" label="详情">
          <template slot-scope="scope">
            <el-button @click="toSee(scope.row)" type="text" size="small">查看</el-button>
          </template>
        </el-table-column>
        <el-table-column align="center" label="操作" width="100">
          <template slot-scope="scope">
            <el-button type="text" class="get" @click="toEdit(scope.row)" size="small">已完结</el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div class="footerDiv"> 
      <div class="btnDiv">
          <el-button  @click="toBatchDelete" size="mini" type="danger" plain>批量删除</el-button>
      </div>
      <div class="pageDiv">
        <el-pagination 
          @current-change = "currentChange" 
          :current-page.sync="currentPage" 
          size="mini"
          background
          layout="prev, pager, next"
          :total="employmentData.length">
        </el-pagination>
      </div>
    </div>
    <el-dialog
      :visible.sync="seeVisible">
      <div class="seeDiv1">
        <h2>{{currentEm.title}}</h2>
      </div>
      <div class="seeDiv2">
        {{currentEm.salary}}元/月
      </div>
      <div class="seeDiv3">
        招{{currentEm.num}}人
      </div>
      <div class="seeDiv5">
        福利：{{currentEm.welfare}}
      </div>
      <hr>
      <div class="seeDiv4">
        <h3>职位描述</h3>
        {{currentEm.description}}
      </div>
    </el-dialog>
     <!-- 发布模态框 -->
    <el-dialog title="发布职位" :visible.sync="addVisible" width="60%" :before-close="beforeClose">
      <el-form :model="currentEm" :rules="rules" ref="ruleForm">
        <el-form-item prop="title" label="兼职名称" :label-width="formLabelWidth">
          <el-input v-model="currentEm.title"></el-input>
        </el-form-item>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item prop="job" clearable required label="选择工种" :label-width="formLabelWidth">
              <el-select 
                clearable 
                v-model="currentEm.job" 
                placeholder="请选择工种信息">
                <el-option
                  v-for="item in jobtypeData"
                  :key="item.id"
                  :label="item.name"
                  :value="item.name">
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item prop="num" label="招聘人数" :label-width="formLabelWidth">
              <el-input v-model="currentEm.num"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item prop="businessId" clearable required label="招聘公司" :label-width="formLabelWidth">
              <el-select 
                clearable 
                v-model="currentEm.businessId" 
                placeholder="请选择工种信息">
                <el-option
                  v-for="item in businessData"
                  :key="item"
                  :label="item"
                  :value="item">
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item prop="salary" label="薪资水平" :label-width="formLabelWidth">
              <el-input v-model="currentEm.salary"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item prop="welfare" label="职位标签" :label-width="formLabelWidth">
          <el-input v-model="currentEm.welfare"></el-input>
        </el-form-item>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item prop="contactPhone" label="联系方式" :label-width="formLabelWidth">
              <el-input v-model="currentEm.contactPhone"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item prop="contactName" label="联系人姓名" :label-width="formLabelWidth">
              <el-input v-model="currentEm.contactName"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item clearable required label="招聘时长" :label-width="formLabelWidth">
              <div class="block">
                <el-date-picker
                  v-model="value2"
                  type="daterange"
                  align="right"
                  unlink-panels
                  range-separator="-"
                  start-placeholder="开始日期"
                  end-placeholder="结束日期"
                  :picker-options="pickerOptions">
                </el-date-picker>
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item prop="workingHours" label="工作时间" :label-width="formLabelWidth">
              <el-input v-model="currentEm.workingHours"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item prop="description" label="职位描述" :label-width="formLabelWidth">
          <el-input type="textarea" :rows="4" v-model="currentEm.description"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button size="mini" @click="toCancel('ruleForm')">取 消</el-button>
        <el-button size="mini" type="primary" @click="tosave('ruleForm')">确 定</el-button>
      </div>
    </el-dialog>
    <!-- 导入模态框 -->
    <el-dialog title="导入职位" :visible.sync="addVisible" width="60%" :before-close="beforeClose">
      <el-form :model="currentEm" :rules="rules" ref="ruleForm">
        <el-form-item prop="title" label="兼职名称" :label-width="formLabelWidth">
          <el-input v-model="currentEm.title"></el-input>
        </el-form-item>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item prop="job" clearable required label="选择工种" :label-width="formLabelWidth">
              <el-select 
                clearable 
                v-model="currentEm.job" 
                placeholder="请选择工种信息">
                <el-option
                  v-for="item in jobtypeData"
                  :key="item.id"
                  :label="item.name"
                  :value="item.name">
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item prop="num" label="招聘人数" :label-width="formLabelWidth">
              <el-input v-model="currentEm.num"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item prop="businessId" clearable required label="招聘公司" :label-width="formLabelWidth">
              <el-select 
                clearable 
                v-model="currentEm.businessId" 
                placeholder="请选择工种信息">
                <el-option
                  v-for="item in businessData"
                  :key="item"
                  :label="item"
                  :value="item">
                </el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item prop="salary" label="薪资水平" :label-width="formLabelWidth">
              <el-input v-model="currentEm.salary"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item prop="welfare" label="职位标签" :label-width="formLabelWidth">
          <el-input v-model="currentEm.welfare"></el-input>
        </el-form-item>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item prop="contactPhone" label="联系方式" :label-width="formLabelWidth">
              <el-input v-model="currentEm.contactPhone"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item prop="contactName" label="联系人姓名" :label-width="formLabelWidth">
              <el-input v-model="currentEm.contactName"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item clearable required label="招聘时长" :label-width="formLabelWidth">
              <div class="block">
                <el-date-picker
                  v-model="value2"
                  type="daterange"
                  align="right"
                  unlink-panels
                  range-separator="-"
                  start-placeholder="开始日期"
                  end-placeholder="结束日期"
                  :picker-options="pickerOptions">
                </el-date-picker>
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item prop="workingHours" label="工作时间" :label-width="formLabelWidth">
              <el-input v-model="currentEm.workingHours"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item prop="description" label="职位描述" :label-width="formLabelWidth">
          <el-input type="textarea" :rows="4" v-model="currentEm.description"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button size="mini" @click="toCancel('ruleForm')">取 消</el-button>
        <el-button size="mini" type="primary" @click="tosave('ruleForm')">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {findAllJobType} from '@/api/job-type.js';
import config from '@/utils/config.js';
import {findAllEmployment,findEmploymentByJob,deleteEmploymentById,findEmploymentByTitle,saveOrUpdateEmployment} from '@/api/employment.js';
export default {
  data() {
    return {
      //模态框显示与隐藏
      dialogFormVisible:false,
      //当前页
      currentPage:1,
      //关键字
      searchType:'',
      //关键字数组
      keyData:[],
      //职位类型
      jobtype:'',
      //职位类型数组
      jobtypeData:[],
      //招聘信息数组
      employmentData:[],
      //当前查看或修改的对象
      currentEm:{},
      //模态框显示与隐藏
      seeVisible:false,
      //批量删除ids
      ids: [],
      //招聘公司数组
      businessData:[],
      //工作时长
      workingHoursData:[],
      //审核状态数组
      auditStatusData:[],
      //状态数组
      statusData:[],
      //每页条数
      pageSize:config.pageSize,
      //修改模态框标题名称所占宽度
      formLabelWidth:'100px',
      //修改模态框显示与隐藏
      editVisible:false,
      //导入模态框显示与隐藏
      addVisible:false,
      //关键字下拉框
      input: '',
      pickerOptions: {
        shortcuts: [{
          text: '最近一周',
          onClick(picker) {
            const end = new Date();
            const start = new Date();
            start.setTime(start.getTime() - 3600 * 1000 * 24 * 7);
            picker.$emit('pick', [start, end]);
          }
        }, {
          text: '最近一个月',
          onClick(picker) {
            const end = new Date();
            const start = new Date();
            start.setTime(start.getTime() - 3600 * 1000 * 24 * 30);
            picker.$emit('pick', [start, end]);
          }
        }, {
          text: '最近三个月',
          onClick(picker) {
            const end = new Date();
            const start = new Date();
            start.setTime(start.getTime() - 3600 * 1000 * 24 * 90);
            picker.$emit('pick', [start, end]);
          }
        }]
      },
      value1: '',
      value2: '',

    //校验规则
      rules: {
        title: [
          { required: true, message: '请输入兼职名称', trigger: 'blur' },
        ],
        job: [
          { required: true, message: '请选择工种类型', trigger: 'change' },
        ],
        num: [
          { required: true, message: '请输入招聘人数', trigger: 'blur' },
        ],
        businessId: [
          { required: true, message: '请输入招聘公司', trigger: 'blur' },
        ],
        salary: [
          { required: true, message: '请输入薪资水平', trigger: 'blur' },
        ],
        welfare: [
          { required: true, message: '请输入职位标签', trigger: 'blur' },
        ],
        workingHours: [
          { required: true, message: '请输入工作时间', trigger: 'blur' }
        ],
        description: [
          { required: true, message: '请输入输入职位描述', trigger: 'blur' }
        ],
        contactPhone: [
          { required: true, message: '请输入输入联系方式', trigger: 'blur' }
        ],
        contactName: [
          { required: true, message: '请输入输入联系人姓名', trigger: 'blur' }
        ],
        auditStatus: [
          { required: true, message: '请选择审核状态', trigger: 'change' },
        ],
        status: [
          { required: true, message: '请选择状态', trigger: 'change' },
        ],
      }
    };
  },
  computed: {
    cityList(){
      //获取表单内容
      let temp = [...this.employmentData];
      //截取数组
      let pageSize = config.pageSize;
      let page = this.currentPage;
      return temp.slice((page-1) * pageSize,page * pageSize);
    }
  },
  methods: {
    //保存
    tosave(formName){
      this.$refs[formName].validate(async (valid) => {
        if (valid) {
          delete this.currentEm.startTime;
          delete this.currentEm.endTime;
          delete this.currentEm.publishTime;
          //保存
          try {
            let res = await saveOrUpdateEmployment(this.currentEm);
            if(res.status === 200){
              this.findAllEm();
              this.editVisible = false;
              this.addVisible = false;
              config.successMsg(this,'保存成功');
                  
            }else{
              config.errorMsg(this,'保存失败');
            }
          } catch (error) {
            console.log(error);
            config.errorMsg(this,'保存错误');
          }
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
    toAdd(){
      this.currentEm = {};
      this.addVisible = true;
    },
    //右上角，模态框想关闭之前
    beforeClose(){
      //重置表单验证
      this.$refs['ruleForm'].resetFields();
      this.editVisible = false;
      this.addVisible = false;
    },
    //取消或者关闭模态框
    toCancel(formName){
      //重置表单验证
      this.$refs[formName].resetFields();
      this.editVisible = false;
      this.addVisible = false;
    },
    //输入关键字发生改变
    inputChange(input){
      this.findAllEm();
    },
    //通过招聘标题发生改变
    async keyinto(input){
      // console.log(input);
      if(this.searchType === "2"){
        if(input){
          try {
            let res = await findEmploymentByTitle({title:input});
            this.employmentData = res.data;
            //时间清洗
            this.employmentData.forEach(item => {
              item.publishTime = item.publishTime.slice(0,10);
            })
            this.currentPage = 1;
          } catch (error) {
            config.errorMsg(this,'请输入相关的关键字');
          }
        }
        else{
          this.findAllEm();
          config.errorMsg(this,'请输入相关的关键字');
        }
      }
      else if(this.searchType === "1"){
        if(input){
          try {
            let res = await findEmploymentByJob({job:input});
            this.employmentData = res.data;
            //时间清洗
            this.employmentData.forEach(item => {
              item.publishTime = item.publishTime.slice(0,10);
            })
            this.currentPage = 1;
          } catch (error) {
            config.errorMsg(this,'请输入相关的关键字');
          }
        }
        else{
          this.findAllEm();
          config.errorMsg(this,'请输入相关的关键字');
        }
      }
      else{
        config.errorMsg(this,'请选择关键字类型')
      }
    },
    //分页发生变化
     currentChange(val){
      //val当前点击的页数
      // console.log(val);
      this.currentPage = val;
    },
    //职位发生改变
    async jobChange(val){
      // console.log(val);
      if(val){
        try {
          let res = await findEmploymentByJob({job:val});
          this.employmentData = res.data;
          //时间清洗
          this.employmentData.forEach(item => {
            item.publishTime = item.publishTime.slice(0,10);
          })
          
          this.currentPage = 1;
        } catch (error) {
          config.errorMsg(this,'通过职位查找招聘信息错误');
        }
      }
      else{
        this.findAllEm();
      }
    },
    //查看
    toSee(row){
      this.currentEm = {...row};
      this.seeVisible = true;
    },
     //批量删除
    toBatchDelete(){
      //获取要批量删除的id
      let ids = this.ids;
      if(ids.length > 0){
        this.$alert('是否删除', '提示', {
          confirmButtonText: '删除',
          callback: action => {
            if(action === 'confirm'){
              let result = [];
              ids.forEach(async id => {
                 try {
                  let res = await deleteEmploymentById({id:id});
                  result.push(res.status);
                } catch (error) {
                  result.push(500);
                }
              });
              setTimeout(()=>{
                console.log(result);
                //判断是否都是200
                let resu = result.every((item)=>{
                  return item === 200;
                })
                if(resu){
                  config.successMsg(this,'批量删除成功');
                }else{
                  config.errorMsg(this,'批量删除错误')
                }
                this.findAllEm();
              },2000)
            }
          }
        });
      }else{
        this.$message({
          message: '请勾选需要删除的数据',
          type: 'warning'
        });
      }
    },
     //复选框选中切换
    SelectionChange(val){
      //val就是选中的对象组成的数组
      // console.log(val);
      let ids = val.map(item=>{
        return item.id;
      })
      this.ids = ids;
    },
    //查找所有的职位类型信息
    async findAlljobt(){
      try{
        let res = await findAllJobType();
        this.jobtypeData = res.data;
      }catch(error){
        config.errorMsg(this,'查找错误');
      }
    },

    //查找所有的招聘信息
    async findAllEm(){
      try{
        let res = await findAllEmployment();
        //筛选通过状态
        res.data = res.data.filter(item=>{
          return item.status === "招聘完成";
        })
        this.employmentData = res.data;

        //时间清洗
        this.employmentData.forEach(item => {
          item.publishTime = item.publishTime.slice(0,10);
        })

         //招聘公司数组
        let businessArr = res.data.map((item)=>{
          return item.businessId;
        });
        this.businessData = [...new Set(businessArr)];

        this.currentPage = 1;
      }catch(error){
        config.errorMsg(this,'查找错误');
      }
    },
  },
  created() {
    this.findAlljobt();
    this.findAllEm();
  },
  mounted() {}
};
</script>
<style lang="scss" scoped>
.searchDiv{
 float: left;
 margin-top: -10px;
 margin-bottom: 10px;
}
.key{
  float: left;
  width: 300px;
  margin-top: -10px;
  margin-bottom: 10px;
  margin-left: 50px;
  .el-select{
    width: 100px;
  }
  .input-with-select{
    background-color: #fff;
  }
}
.tableDiv{
  margin-top: 10px;
}
.footerDiv{
  margin-top: 10px;
  .btnDiv{
    float: left;
  }
  .pageDiv{
    float: right;
  }
}
.icon{
  float: right;
  margin-top: -10px;
}
.seeDiv2{
  float: right;
  font-size: 30px;
  margin-top: -40px;
  clear: both;
}
.seeDiv5{
  margin-top: 20px;
}
.put{
  background-color: rgb(245, 157, 50);
}
.dialog-footer{
  text-align: center;
  margin-top: -30px;
}
.get{
  color: rgb(194, 72, 41);
  font-size: 16px;
}
</style>