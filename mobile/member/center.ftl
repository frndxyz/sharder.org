<#import "/WEB-INF/ftl/sharders/pc/mobile/layout.ftl" as lay/>
<#import "/WEB-INF/ftl/sharders/editPwd.ftl" as editPwd/>
<@lay.htmlHead    pagename="center">
<link rel="stylesheet" href="/r/cms/resource/sharders/css/mobile/center.css">
<link rel="stylesheet" href="/r/cms/resource/sharders/layui/css/layui.css">
<style>
    .language-icon{
        top: 0px !important;
    }
    .subscribe-body .subscribe-head , .subscribe-body .subscribe-ul li{
        display: flex;
        justify-content:space-around ;
    }
    .subscribe-body .subscribe-head span{
        display: inline-block;
        width: 100%;
    }

</style>
</@lay.htmlHead>

<@lay.htmlBody>
    <#include "/WEB-INF/ftl/sharders/hint/hint.ftl" >
<div class="phone-center-main" id="member_center">
    <#--<div style="text-align: center;margin-bottom: 10px"><img src="/r/cms/resource/sharders/img/index/subscribe_over.jpg" style="width: 100%;margin-top: 70px" id="subscribe-over"></div>-->
    <div class="user-information" style="padding-top: 80px">
        <h1 class="phone-center-information-title i18n" name="sharder-user-information">Account Information</h1>
        <ul class="user-information-text">
            <li><labal class="user-title i18n" name="sharder-account-number">UID:</labal><span class="user-text">${acconut!}</span></li>
            <li><labal class="user-title i18n" name="sharder-sign-in-username">Nickname</labal><span class="user-text">${user.username!}</span></li>
            <li><labal class="user-title i18n" name="sharder-extension-code">Extension code</labal><span class="user-text">${inviterId!}</span></li>
            <#--<li><labal class="user-title tesu i18n" name="sharder-extension-link">Extension link</labal><span class="user-text augoid" id="contents">${invitePage!}?inviterId=${inviterId!}</span></li>-->
            <@editPwd.operation/>
        </ul>
        <#--<button class="copy-link i18n" name="sharder-copy-ectension-link" onclick="copyTextById('contents')">Copy links</button>-->
    <#--&lt;#&ndash;<p class="text-color i18n" name="sharder-you-link-subscribe">通你的专属链接/邀请码注册并成功参与众售。</p>&ndash;&gt;-->
        <#--&lt;#&ndash;<p class="text-color i18n" name="sharder-you-subscrie-reward">你可以获得其众售获得豆匣(SS)总额度的5%作为返点奖励。</p>&ndash;&gt;-->
        <#--<p class="text-color i18n" name="yaoqingtishi">The more your refer, the more airdrop you will get.</p>-->
        <#--<p style="color: #0BA0D1 ; font-weight: bold"><span class="i18n sharder-user-parent" name="sharder-user-parent">Invitation</span>${inviteSum!0}</p>-->

    </div>

    <div class="asset-information" id="center">
        <h1 class="phone-center-information-title i18n" name="asset-information">Asset information</h1>
        <div class="sharders-total-assets">
            <p class="sharder-total-assets i18n" name="sharsder-my-total-assets">Total Asset</p>
            <p class="sharder-sharder i18n" name="sharder-SS">Sharder Token (SS)</p>
            <p class="sharder-quota">${amount!"0"}</p>
        </div>
        <div class="crowd-funding-rebate">
                <div class="crowd-funding details">
                    <p class="crowd-funding-title">
                        <img src="/r/cms/resource/sharders/img/gantanhao.png" class="crowd-funding-img crowd-funding-img1" v-on:click="tabMessage(true)">
                        <span class="details-title i18n" name="sharder-subscribe-income">SS Purchased </span>
                    </p>
                    <p class="crowd-funding quota ">${crowd_amount!'0'}SS</p>
                    <#--<p class="details-colse" >{{retruenTExts(!crowd)}}</p>-->
                    <p class="details-colse" v-on:click="tabBtn('zhongchou')">{{retruenTExts(!crowd)}}</p>
                </div>
                <div class="rebate details">
                    <p class="crowd-funding-title">
                        <img src="/r/cms/resource/sharders/img/gantanhao.png" class="crowd-funding-img img crowd-funding-img2" v-on:click="tabMessage(false)">
                        <span class="details-title i18n" name="dxjl">Reward</span>
                    </p>
                    <p class="rebate-quota quota">${invite_rewards_amount!'0'}SS</p>
                    <#--<p class="details-colse" >{{isRebate ? "关闭详情" : "查看详情"}}</p>-->
                    <p class="details-colse" v-on:click="tabBtn('fandian')">{{retruenTExt(!isRebate)}}</p>
                </div>
        </div>
        <div class="paging-query">
            <component :is="template"></component>
            <div id="page"></div>
        </div>
    </div>

</div>
<@editPwd.main/>

<div style="display: none">
    <span class="i18n" name="shader-storage-token">Sharder tokens acquired.</span>
    <span class="i18n" name="sharder-rewarded-purchase-referred">Airdrops are in correlation with community contributions.</span>
    <span id="chakans" class="i18n" name="sharder-details-info">Details</span>
    <span id="guanbis" class="i18n" name="sharder-details-info-close">Close the Details</span>
    <span id="chakan" class="i18n" name="sharder-details">Details</span>
    <span id="guanbi" class="i18n" name="sharder-close-details">Close Details</span>
    <#--<span class="i18n" name="sharder-registrant-uid">注册人UID</span>-->
    <#--<span class="i18n" name="sharder-registrant-time">注册时间</span>-->
    <#--<span class="i18n" name="sharder-subscribe-quota">白名单额度</span>-->
    <#--<span class="i18n" name="sharder-deal-base">返点奖励/SS</span>-->
    <#--<span class="i18n"name="sharder-details-benefits">你还没有邀请好友，快去邀请好友投资返福利哦！！！</span>-->
    <span class="i18n"name="sharder-details-immediately">Immediately invited</span>
    <span class="i18n"name="layui-laypage-prev">prev</span>
    <span class="i18n"name="layui-laypage-next">next</span>
</div>
<script type="text/x-template" id="details-white-list">
    <div class="details-white-list subscribe-body">
        <p class="subscribe-head"><span class="subscribe-table i18n" name="sharder-registrant">Subscriber</span><span class="subscribe-table i18n" name="sharder-registrant-time"> Sign up time </span><span class="subscribe-table i18n" name="sharder-white-list-share">Whitelist quota </span></p>
        <ul class="subscribe-ul">
            <li class="subscribe-li" v-for="pd in parentData.dataList"><span class="subscribe-table">{{pd.id}}</span><span class="subscribe-table">{{pd.createDate}}</span><span class="subscribe-table">1TEH</span></li>
            <li class="subscribe-li" v-if="parentData.dataList == ''"><span>No data is found！！！</span></li>
        </ul>
    </div>
</script>
<script type="text/x-template" id="public-information">
    <table class="ss-table defalut">
        <thead>
        <tr>
            <#--<th class="i18n" data-name="sharder-participation-time">参与时间</th>-->
            <th class="i18n" data-name="sharder-participation-time">Time</th>
            <th class="i18n" data-name="sahrder-support-quantity">Amount</th>
            <#--<th class="i18n" data-name="sharder-use-white-list">使用白名单额度</th>-->
            <th class="i18n" data-name="sharder-award-type">Bonuses</th>
            <#--<th class="i18n" data-name="sharder-white-list-award">白名单奖励</th>-->
            <th class="i18n" data-name="sharder-award-amount">Reward Amount</th>
            <th class="i18n" data-name="sharder-get-ss">Earned (SS)</th>
        </tr>
        </thead>
        <tbody>
        <tr v-for="dealBase in parentData.dataList.list" >
            <td>{{dealBase.createDate}}</td>
            <td>{{dealBase.payAmount}}</td>
            <td>
                <span v-if="dealBase.awardType == 'SUOCANG'" data-name="suocangjiangli" class="i18n">Lockup bonus</span>
                <span v-else-if="dealBase.awardType == 'AIR_DROP'" data-name="kongtoujiangli" class="i18n">Airdrop</span>
                <span v-else-if="dealBase.awardType == 'LIMIT_QUOTA'" data-name="jieduanjiangli" class="i18n">Stage of reward</span>
                <span v-else-if="dealBase.awardType == 'EXTRA'" data-name="ewaijiangli" class="i18n">Didcretionary bonus</span>
                <span v-else-if="dealBase.awardType == 'WHITELIST'" data-name="baimingdanjiangli" class="i18n">Whitelist bonus</span>
                <span v-else data-name="wu" class="i18n"></span>
            </td>
            <td>
                    <span v-if="dealBase.useWhitelistsQuota != null && dealBase.useWhitelistsQuota != ''">
                        <span>{{dealBase.whitelistAwardAmount || '0'}}</span>
                    </span>
                <span v-else>
                        {{dealBase.awardAmount || '0'}}
                    </span>
            </td>

            <td>
                    <span v-if="dealBase.status == '1' && dealBase.amount == '0'">
                        {{parentData.daiding}}
                        <img src="/r/cms/resource/sharders/img/gantanhao.png" class="personal-img daidingtishi" onmousemove="daidingtishi(true)" onmouseout="daidingtishi(false)" style="width:15px;height: 15px;float: left;cursor: pointer;"></span>
                <span v-else>
                        {{dealBase.amount || '0'}}
                    </span>
            </td>
        </tr>
        </tbody>
    </table>
</script>
<script type="text/x-template" id="rebate_details_mb">
    <div class="rebate-details subscribe-body">
        <p class="subscribe-head">
            <span data-name="sharder-participation-time" class="i18n">Time</span>
            <span data-name="sharder-award-type" class="i18n">Reward type</span>
            <span data-name="sharder-award-amount" class="i18n">Reward Amount</span>
            <span  data-name="sharder-bill-status" class="i18n">Status</span>
            <span data-name="beizhu" class="i18n">Remark</span>
        </p>

        <ul class="subscribe-ul">
            <li class="subscribe-li" v-if="parentData.dataList == false"><span style="color: red;font-size: 11px;">{{parentData.title.e}}</span><a href="#member_center" style="font-size: 11px;">{{parentData.title.f}}</a></li>
            <li class="subscribe-li" v-for="dealBase in parentData.dataList.list">
                <span class="subscribe-table">{{dealBase.createDate}}</span>
                <span class="subscribe-table">
                    <#include "/WEB-INF/ftl/sharders/award_type.ftl"/>
                </span>

                <span class="subscribe-table">{{dealBase.awardAmount || '0'}} (SS)</span>

                <span class="subscribe-table">
                    <span v-if="dealBase.status == 1">
                        normal
                    </span>
                    <span v-else>failure</span>
                </span>
                <span class="subscribe-table"><span  v-if="dealBase.awardType == 'TCC_CONVERT'">{{dealBase.memo}}</span></span>
            </li>
        </ul>
    </div>
</script>
<script src="/r/cms/resource/sharders/layui/layui.js"></script>
<script>
    var laypage;
    layui.use(['laypage'], function() {
       laypage = layui.laypage;
    });
</script>
<script>

    var timeid;
    timeid = window.setInterval(function () {
        var PieChart = localStorage.getItem("end-of-translation");
        if (PieChart) {
            var app = new Vue({
                el:"#center",
                data:{
                    /*默认分页参数 start*/
                    countOfCurrentPage:10, //每页条数
                    currentPage:1, //当前第几页
                    totalCount:0, //总条数
                    totalPage:0, //总页数
                    /*分页参数end*/

                    crowd:false,
                    isRebate:false,
                    name:"",
                    id:${user.id!},
                    dataList:'',
                    template:'',
                    title:'',
                    daiding:'',
                },
                methods:{
                    tabMessage:function(bool){
                        var text;
                        if(bool){
                            text = $("span[name='shader-storage-token']").text();
                            layer.tips(text, '.crowd-funding-img1', {
                                tips: [1, '#3595CC'],
                                time: 40000
                            });
                        }else{
                            text = $("span[name='sharder-rewarded-purchase-referred']").text();
                            layer.tips(text, '.crowd-funding-img2', {
                                tips: [1, '#3595CC'],
                                time: 4000
                            });
                        }


                    },
                    paging:function () {
                        var url= "";
                        var data = "pageNo="+app.currentPage;
                        if(app.template=="fandian"){
//                            url= "/user_center/invite_awaer.ss";
                            url = "/user_center/bills.ss";
                            data +="&type=JL";
                        }else if(app.template == "zhongchou"){
                            url= "/user_center/zhong_chou.ss";
                        }
                        commAjax(url,"GET",data,app.pagingResult);
                    },
                    pagingResult:function (_result) {
                        app.daiding = $("span[name='daiding']").html();
                        if(isEmpty(app.dataList)){
                            app.setPaging(_result);
                        }

                        app.dataList = _result.result != null ? _result.result.data : "";
                        setTimeout(function () {
                            executeDymaicI18n();
                        },100);
                    },
                    setPaging:function (_result) {
                        var  a = _result.result != null ? _result.result.data.totalCount : 0;
                        laypage.render({
                            elem: 'page'
                            ,count: a
                            ,first: false
                            ,last: false
                            ,jump: function(obj, first){
                                if(!first){
                                    app.currentPage = obj.curr
                                    app.paging();
                                    $("#page a.layui-laypage-prev").text($("span[name='layui-laypage-prev']").text());
                                    $("#page a.layui-laypage-next").text($("span[name='layui-laypage-next']").text());
                                }
                            }
                        });
                        $("#page a.layui-laypage-prev").text($("span[name='layui-laypage-prev']").text());
                        $("#page a.layui-laypage-next").text($("span[name='layui-laypage-next']").text());
                    }
                    ,tabBtn:function (_t) {
                        app.dataList = "";
                        app.template = _t;
                        app.currentPage = 1; //每次打开新列表分页从1开始

//                        app.title={a:$("span[name='sharder-registrant-uid']").text(),
//                            b:$("span[name='sharder-registrant-time']").text(),
//                            c:$("span[name='sharder-subscribe-quota']").text(),
//                            d:$("span[name='sharder-deal-base']").text(),
//                            e:$("span[name='sharder-details-benefits']").text(),
//                            f:$("span[name='sharder-details-immediately']").text()};

                        app.title={a:$("span[name='sharder-registrant-uid']").text(),
                            b:$("span[name='sharder-participation-time']").text(),
                            c:$("div>span[name='sharder-award-type']").text(),
                            d:$("span[name='sharder-award-amount']").text(),
                            e:$("span[name='sharder-details-benefits']").text(),
                            f:$("span[name='sharder-details-immediately']").text()};


                        $(".paging-query").css("display","none");
                        $(".crowd-funding.details").css("border-bottom","0");
                        $(".rebate.details").css("border-bottom","0");
                        if(_t == "zhongchou"){
                            app.crowd=!app.crowd;
                            app.isRebate=false;
                            app.paging();
                        }else if(_t == "fandian"){
                            app.isRebate=!app.isRebate;
                            app.crowd=false;
                            app.paging();
                        }else {
                            layer.msg("An event that cannot be identified.");
                            return;
                        }
                        if(app.crowd == true){
                            $(".crowd-funding.details").css("border-bottom","2px solid #0ba0d1");
                        }else if(app.isRebate == true){
                            $(".rebate.details").css("border-bottom","2px solid #0ba0d1");
                        }
                        if(app.crowd == true || app.isRebate == true){
                            $(".paging-query").css("display","block");
                        }
                    },
                    retruenTExt:function (bool) {
                        if(bool){
                            return $("#chakan").text();
                        }else{
                            return $("#guanbi").text();
                        }
                    },
                    retruenTExts:function (bool) {
                        if(bool){
                            return $("#chakans").text();
                        }else{
                            return $("#guanbis").text();
                        }
                    },
                },
                components:{
                    'zhongchou':{
                        template:'#public-information',
                        data:function(){
                            return{
                                parentData:this.$parent.$data
                            }
                        }
                    },
                    'fandian':{
                        template:'#rebate_details_mb',
                        data:function(){
                            return{
                                parentData:this.$parent.$data
                            }
                        }
                    },
                },
            });
            window.clearInterval(timeid);
//            var  language = localStorage.getItem("userLanguage");
//            if(i18nLanguage == "en"){
//                $("#subscribe-over").attr("src","/r/cms/resource/sharders/img/index/subscribe_over_en.jpg");
//            }else if(i18nLanguage == "ko"){
//                $("#subscribe-over").attr("src","/r/cms/resource/sharders/img/index/subscribe_over_ko.png");
//            }else if(i18nLanguage == "ja"){
//                $("#subscribe-over").attr("src","/r/cms/resource/sharders/img/index/japanese_over_ko.jpg");
//            }
        }

    },100);

    var _tips;
    function daidingtishi(_t) {

        if(_t){
            _tips  = layer.tips($("span[name='daidingtishi']").html(), '.daidingtishi', {
                tips: [1, '#3595CC'],
                skin:'huanhuangwenben'
            });
        }else{
            layer.close(_tips);
        }
    }
</script>
</@lay.htmlBody>