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
}
