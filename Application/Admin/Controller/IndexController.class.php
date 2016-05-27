<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Admin\Controller;
use User\Api\UserApi as UserApi;

/**
 * 后台首页控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class IndexController extends AdminController {

    /**
     * 后台首页
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function index(){
        if(UID){
            $this->meta_title = '管理首页';

            //统计近期的销售数据
            $date = date();
            $firstDayOfWeek = strtotime(date('Y-m-d', time()-86400*date('w')+(date('w')>0?86400:-6*86400)));
            $endDayOfWeek = strtotime(date('Y-m-d 23:59:59', strtotime(date('Y-m-d', $firstDayOfWeek) . ' +6 day')));

            $dateMonth = date('Y-m-d');
            $firstDayOfMonth = strtotime(date('Y-m-01', strtotime($dateMonth)));
            $endDayOfMonth = strtotime(date('Y-m-d', strtotime(date('Y-m-01', strtotime($dateMonth)) . ' +1 month -1 day')));

            $weekTop = M('order_goods')
                ->join('zc_order_info on zc_order_goods.order_id = zc_order_info.order_id')
                ->where("zc_order_info.add_time >= '" . $firstDayOfWeek . "' and zc_order_info.add_time <= '" . $endDayOfWeek . "'")
                ->select();

            $monthTop = M('order_goods')
                ->join('zc_order_info on zc_order_goods.order_id = zc_order_info.order_id')
                ->where("zc_order_info.add_time >= '" . $firstDayOfMonth . "' and zc_order_info.add_time <= '" . $endDayOfMonth . "'")
                ->select();

            //点击量排行
            $clickTop = M('goods')->order('click_count desc')->limit(10)->field('goods_id, goods_name, goods_img, promote_price, click_count')->select();

            $this->assign('clickTop', $clickTop);
            $this->assign('weekTop', $this->countTop($weekTop));
            $this->assign('monthTop', $this->countTop($monthTop));
            $this->display();
        } else {
            $this->redirect('Public/login');
        }
    }

    protected function countTop($goods, $top){
        $sameGoods = array();

        foreach($goods as $key=>$val){
            if($sameGoods[$val['goods_id']]){
                $sameGoods[$val['goods_id']]['count'] += $val['goods_number'];
            }
            else
            {
                $sameGoods[$val['goods_id']] = M('goods')->where(array('goods_id' => $val['goods_id']))->field('goods_id, goods_name, goods_img, promote_price')->find();
                $sameGoods[$val['goods_id']]['count'] = $val['goods_number'];
            }
        }

        $topGoods = quick_sort(array_values($sameGoods));

        return array_slice($topGoods, 0, $top);
    }

    /**
     * 10天的访问量
     */
    public function visit()
    {
        $date = date('Y-m-d');
        $start = date('Y-m-d', strtotime($date . '-10 day'));
        $end = date('Y-m-d 23:59:59');
        $visit = M('visit')->where("time >= '" .$start. "' and time <= '" .$end. "'")->select();

        $allVisits = array();
        foreach($visit as $val)
        {
            $d = date('Y-m-d', strtotime($val['time']));
            if($allVisits[$d])
            {
                $allVisits[$d] += 1;
            }
            else
            {
                $allVisits[$d] = 1;
            }
        }

        $this->ajaxReturn($allVisits);
    }

    /**
     * 一年的销售榜
     */
    public function getYearDatas(){

        $year = date('Y');
        $months = [
            [strtotime($year . '-01-01 00:00:00'), strtotime($year . '-01-31 23:59:59'), '一月'],
            [strtotime($year . '-02-01 00:00:00'), strtotime($year . '-02-29 23:59:59'), '二月'],
            [strtotime($year . '-03-01 00:00:00'), strtotime($year . '-03-31 23:59:59'), '三月'],
            [strtotime($year . '-04-01 00:00:00'), strtotime($year . '-04-30 23:59:59'), '四月'],
            [strtotime($year . '-05-01 00:00:00'), strtotime($year . '-05-31 23:59:59'), '五月'],
            [strtotime($year . '-06-01 00:00:00'), strtotime($year . '-06-30 23:59:59'), '六月'],
            [strtotime($year . '-07-01 00:00:00'), strtotime($year . '-07-31 23:59:59'), '七月'],
            [strtotime($year . '-08-01 00:00:00'), strtotime($year . '-08-31 23:59:59'), '八月'],
            [strtotime($year . '-09-01 00:00:00'), strtotime($year . '-09-30 23:59:59'), '九月'],
            [strtotime($year . '-10-01 00:00:00'), strtotime($year . '-10-31 23:59:59'), '十月'],
            [strtotime($year . '-11-01 00:00:00'), strtotime($year . '-11-30 23:59:59'), '十一月'],
            [strtotime($year . '-12-01 00:00:00'), strtotime($year . '-12-31 23:59:59'), '十二月']
        ];

        //计算每个月的数据
        $monthData = array();
        foreach($months as $key=>$val)
        {
            $goods = M('order_goods')
                ->join('zc_order_info on zc_order_goods.order_id = zc_order_info.order_id')
                ->where("zc_order_info.add_time >= '" . $val[0] . "' and zc_order_info.add_time <= '" . $val[1] . "'")
                ->select();

            $numCount = 0;
            $priceCount = 0;
            if($goods){
                foreach($goods as $v){
                    $numCount += $v['goods_number'];
                    $priceCount += $v['goods_price'] * $v['goods_number'];
                }
            }

            $monthData[] = [$numCount, $priceCount, $val[2]];
        }

        $this->ajaxReturn($monthData);
    }
}
