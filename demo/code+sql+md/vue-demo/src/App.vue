<template>
  <!--该div是全部-->
  <div >
      <!--该div是头部-->
      <Header/>
    <!--该div是侧边-->
    <div style="display: flex;">
        <Aside/>
      <!--内容-->
      <router-view style="flex: 1"/>
    </div>
  </div>
</template>

<style>

</style>

<script>
    import Header from "@/components/Header";
    import Aside from "@/components/Aside";
    import Home from "@/views/Home";

    export default {
      name: "layout",
      components: {
        Home,
        Header,
        Aside,
      }
    }
</script>