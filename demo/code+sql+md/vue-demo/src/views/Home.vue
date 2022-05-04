<template>
    <div style="padding: 10px">
      <!--功能区-->
      <div style="margin: 10px">
        <el-button type="primary"  @click="add">新增</el-button>   <!--新增按钮事件-->
        <el-button type="primary">导入</el-button>
        <el-button type="primary">导出</el-button>
      </div>
      <!--查询-->
      <div style="margin: 10px 0">
            <el-input v-model="search" placeholder="请输入关键字" style="width: 20%" clearable></el-input>
            <el-button type="primary" @click="searchData" style="margin-left: 5px">查询</el-button>
      </div>
      <!--查询-->
      <el-table
          :data="tableData"
          border
          stripe
          style="width: 100%">

        <el-table-column
            prop="id"
            label="ID"
            sortable>
        </el-table-column>
        <el-table-column
            prop="username"
            label="姓名">
        </el-table-column>
        <el-table-column
            prop="nickName"
            label="昵称">
        </el-table-column>
        <el-table-column
            prop="age"
            label="年龄">
        </el-table-column>
        <el-table-column
            prop="sex"
            label="性别">
        </el-table-column>
        <el-table-column
            prop="address"
            label="地址">
        </el-table-column>

        <el-table-column fixed="right" label="Operations">
          <template #default="scope"> <!-- //指定模板==>scope-->
            <el-button  size="small" @click="handleClick(scope.row)">编辑</el-button>
            <el-popconfirm title="确定删除吗？" @confirm="handleDatele(scope.row.id)">
              <template #reference>
                <el-button  size="small" style="background-color: brown; color: aliceblue">删除</el-button>
              </template>
            </el-popconfirm>
          </template>
        </el-table-column>

      </el-table>
      <!--分页-->
      <div  style="margin: 10px 0">
        <el-pagination
            :current-page="currentPage"
            :page-size="pageSize"
            :page-sizes="[5, 10, 20]"
            :small="small"
            :disabled="disabled"
            :background="background"
            layout="total, sizes, prev, pager, next, jumper"
            :total="total"
            @size-change="handleSizeChange"
            @current-change="handleCurrentChange">
        </el-pagination>

        <!--add弹窗-->
        <el-dialog v-model="dialogVisible" title="新增用户" width="30%">
          <!--add弹窗的表单-->
          <el-form :model="form" label-width="120px">
            <el-form-item label="用户名">
              <el-input v-model="form.username" style="width: 80%" />
            </el-form-item>
            <el-form-item label="昵称">
              <el-input v-model="form.nickName" style="width: 80%" />
            </el-form-item>
            <el-form-item label="年龄">
              <el-input v-model="form.age" style="width: 80%" />
            </el-form-item>
            <el-form-item label="性别">
              <el-radio v-model="form.sex" label="男" size="large">男</el-radio>
              <el-radio v-model="form.sex" label="女" size="large">女</el-radio>
              <el-radio v-model="form.sex" label="未知" size="large">未知</el-radio>
            </el-form-item>
            <el-form-item type="textarea" label="地址">
              <el-input v-model="form.address" style="width: 80%" />
            </el-form-item>
          </el-form>
          <template #footer>
              <span class="dialog-footer">
                  <el-button @click="dialogVisible = false">取消</el-button>
                 <el-button type="primary" @click="save">确定</el-button>
              </span>
          </template>
        </el-dialog>
      </div>

  </div>
</template>

<script>

import request from "@/untils/request";

export default {
name: "Home",
  components: {
  },
  data(){
  return {
    //变量
    form: {},
    dialogVisible: false,
    currentPage: '',
    pageSize: '',
    search: '',
    total: 0,
    tableData: []      //这里是表格数据
    }
  },
  created() {
    this.searchData()//加载时调用，下面的方法
  },

  /**
   * 方法
   */
  methods: {
    add(){
      this.dialogVisible = true;
      this.form = {};   //清空表单
    },
    save(){
      /**
       * 增加个修改数据都是通过form表单提交,所以做判断
       */
      if(this.form.id){
        //修改
        request.put("/user",this.form).then(res=>{
          console.log(res);
          if(res.code == 0){            //// /* this.$message({message: '新增成功',type: 'success'});*/
            this.$message({
              message: '更新成功',
              type: 'success'
            });
          }
          else {
            this.$message({
              message: res.msg,
              type: 'error'
            });
          }
          this.searchData();   //更新数据，等于刷新
          this.dialogVisible = false;  //关闭弹窗
        })
      }else {
        //确定按钮--》增加数据
        request.post("/user",this.form).then(res=>{
          console.log(res);
          if(res.code == 0){            //// /* this.$message({message: '新增成功',type: 'success'});*/
            this.$message({
              message: '新增成功',
              type: 'success'
            });
          }
          else {
            this.$message({
              message: res.msg,
              type: 'error'
            });
          }
          this.searchData();   //更新数据，等于刷新
          this.dialogVisible = false;  //关闭弹窗
          })
      }
    },
    searchData(){
      //搜索按钮--》
      //get请求,要加params
      request.get("/user",{
        params:{
          pageNum: this.currentPage,
          pageSize: this.pageSize,
          search: this.search
        }
      }).then(res=>{
        console.log(res);
        this.tableData = res.data.records;     //res.data.records,,,records是查询出来的数据   -->s
        this.total = res.data.total;
      })
    },
    handleClick(row){
        //编辑
      this.form = JSON.parse(JSON.stringify(row))  //把row的值赋给form,且隔离与其他的form
      this.dialogVisible = true;
    },
    handleDatele(id){
      console.log(id)
      request.delete("/user/"+id).then(res=>{
        console.log(res);
        if(res.code == 0){            //// /* this.$message({message: '新增成功',type: 'success'});*/
          this.$message({
            message: '删除成功',
            type: 'success'
          });
        }
        else {
          this.$message({
            message: res.msg,
            type: 'error'
          });
        }
        this.searchData();   //更新数据，等于刷新
      })
    },
    handleSizeChange(pageSize){
      this.pageSize = pageSize
      this.searchData()
    },
    handleCurrentChange(pageNum){
      this.currentPage = pageNum
      this.searchData()
    },
  }
}
</script>
