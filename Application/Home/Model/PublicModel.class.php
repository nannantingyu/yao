<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Model;
use Think\Model;

/**
 * 文件模型
 * 负责文件的下载和上传
 */

class PublicModel extends Model
{
    /**
     * 文件模型自动完成
     * @var array
     */
    protected $_auto = array(
        array('create_time', NOW_TIME, self::MODEL_INSERT),
    );

    /**
     * 文件模型字段映射
     * @var array
     */
    protected $_map = array(
        'type' => 'mime',
    );

    /**
     * @param $model    模型
     * @param int $pageCount    每页显示数
     * @param array $where  条件
     * @param string $order 排序
     */
    public function lists($model, $page, $pageCount, $where = array(), $field = '', $order = '')
    {
        if(!$pageCount || $pageCount <= 0){
            $pageCount = C('PAGE_ITEM_COUNT')?C('PAGE_ITEM_COUNT'): 12;
        }

        $page = $page? $page : 0;
        $limitStart = $page * $pageCount;

        $data['data'] = M($model)->where($where)->order($order)->limit("$limitStart, $pageCount")->field($field)->select();

        $allCount = M($model)->where($where)->count();
        $data['pages'] = ceil($allCount / $pageCount);

        return $data;
    }
}
