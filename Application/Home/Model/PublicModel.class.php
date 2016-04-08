<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: ����� <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Model;
use Think\Model;

/**
 * �ļ�ģ��
 * �����ļ������غ��ϴ�
 */

class PublicModel extends Model
{
    /**
     * �ļ�ģ���Զ����
     * @var array
     */
    protected $_auto = array(
        array('create_time', NOW_TIME, self::MODEL_INSERT),
    );

    /**
     * �ļ�ģ���ֶ�ӳ��
     * @var array
     */
    protected $_map = array(
        'type' => 'mime',
    );

    /**
     * @param $model    ģ��
     * @param int $pageCount    ÿҳ��ʾ��
     * @param array $where  ����
     * @param string $order ����
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
