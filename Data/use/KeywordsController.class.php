<?php

namespace Admin\Controller;

use Think\Controller;

class KeywordsController extends BaseController
{

    /**
     * 关键词列表页
     */
    public function lists()
    {
        $site = I('get.site', cookie('site'));

        if(!$site)
        {
            $site = M('website')->getField('id');
        }

        cookie('site', $site);

        $website = M('website')->select();
        $this->assign('website', $website);

        $this->display();
    }

    public function getKeywords(){
        $site = I('get.site');

        $where['sid'] = $site;
        $keywords = M('site_keywords')
            ->join('jb46o_keywords on jb46o_site_keywords.kid = jb46o_keywords.kid')
            ->join('jb46o_website on jb46o_site_keywords.sid = jb46o_website.id')
            ->where($where)->field('jb46o_site_keywords.id, jb46o_site_keywords.kid, keywords, jb46o_keywords.url, is_link, jb46o_keywords.state')->order('is_link desc, id asc')->select();

        $this->ajaxReturn($keywords);
    }

    /**
     * 改变关键词is_link状态
     */
    public function changeISLink(){
        $id = I('post.id/d');
        $state = I('post.state/d');
        $sid = I('post.sid');

        $sitekey = M('site_keywords');
        $where['sid'] = $sid;
        $where['is_link'] = 1;

        if($state == 1 && $maxCount = D('keywords')->checkOverMaxLink($sid)){
            $this->ajaxReturn(array('state'=>0, 'msg'=>'超过系统最大默认值数'.$maxCount));
        }
        else
        {
            M('site_keywords')->where(array('id' => $id))->setField('is_link', $state);
            $this->ajaxReturn(array('state'=>1, 'sql'=>M('site_keywords')->getLastSql()));
        }
    }

    /**
     * 改变关键词state状态
     */
    public function changeState(){
        $id = I('post.id/d');
        $state = I('post.state/d');

        M('keywords')->where(array('kid' => $id))->setField('state', $state);
        $this->ajaxReturn(array('state'=>1));
    }

    /**
     * 删除站点关键词
     */
    public function delSiteKeywords(){
        $ids = I('post.ids');

        if(M('site_keywords')->where(array('id'=>array('in', $ids)))->delete())
        {
            $this->ajaxReturn(array('state'=>1));
        }
        else
        {
            $this->ajaxReturn(array('state'=>0));
        }
    }

    /**
     * 删除关键词
     */
    public function delKeywords(){
        $ids = I('post.ids');

        if(M('site_keywords')->where(array('kid'=>array('in', $ids)))->delete()) {
            if (M('keywords')->where(array('kid' => array('in', $ids)))->delete()) {
                $this->ajaxReturn(array('state' => 1));
            }
        }
        else
        {
            $this->ajaxReturn(array('state'=>0));
        }
    }

    /**
     * 复制关键词
     */
    public function copyTo(){
        $sid = I('get.sid');
        $ids = I('get.ids');

        //判断重复插入，忽略
        $newKids = M('site_keywords')->where(array('sid'=>$sid))->getField('kid', true);
        if(count($newKids) > 0){
            $where['kid'] = array('not in', $newKids);
        }

        $where['id'] = array('in', $ids);

        $data = M('site_keywords')->where($where)->field('kid, is_link, catid')->select();
        foreach($data as $key=>$val){
            $data[$key]['sid'] = $sid;
            $data[$key]['is_link'] = 0;
        }

        if(count($data) < 1){
            $this->ajaxReturn(array('state'=>0, 'msg'=>'复制的关键词已经存在'));
        }
        else if(M('site_keywords')->addAll($data))
        {
            $this->ajaxReturn(array('state'=>1));
        }
    }

    /**
     * 关键词编辑添加页面
     */
    public function edit(){

        $mkeywords = M('keywords');
        $msitekeywords = M('site_keywords');
        $typeweb = cookie('site');

        if(!IS_POST){
            $website = M('website')->where(array('state'=>1))->field('id, label, name')->select();
            $this->assign('website', $website);

            if($kid = I('get.kid/d')){
                $where['jb46o_keywords.kid'] = $kid;

                $keywords = M('keywords')->where($where)->find();
                $allsites = M('site_keywords')
                    ->join('jb46o_keywords on jb46o_keywords.kid = jb46o_site_keywords.kid')
                    ->join('jb46o_website on jb46o_site_keywords.sid = jb46o_website.id')
                    ->where($where)
                    ->field('jb46o_site_keywords.sid')->select();
                foreach($allsites as $val)
                {
                    $keywords['site'][] = $val['sid'];
                }

                $this->assign('data', $keywords);
                $this->assign('sites', $keywords['site']);
            }

            $this->display();
        }
        else{
            $sid = I('post.sid');
            cookie('site', $sid[0]);

            //编辑
            if($kid = I('post.kid')){

                //更新jb46o_keywords表
                if($mkeywords->create()){
                    $mkeywords->save();
                }

                $this->sitekeysChange($kid, $sid);

                $datas = array();
                $existSites = $msitekeywords->where(array('sid'=>array('in', $sid), 'kid'=>I('post.kid')))->getField('sid', true);

                D('Users')->setUserUp($this->uid, '修改关键词'.$kid.'到全部站点');
            }
            //添加
            else{
                //判断jb46o_keywords表重复性，忽略
                $keywordsInDb = $mkeywords->where(array('keywords'=>I('post.keywords')))->find();

                if($keywordsInDb){
                    $this->ajaxReturn('新增失败, 关键词已存在！');
                }

                if($mkeywords->create()){
                    $newkid = $mkeywords->add();

                    $datas = array();
                    foreach($sid as $key=>$val){
                        $datas[] = array(
                            'sid' => $val,
                            'is_link' => I('post.is_link/d'),
                            'kid' => $newkid
                        );
                    }

                    if($msitekeywords->addAll($datas)){
                        D('Users')->setUserUp($this->uid, '添加关键词' . I('post.keywords'));
                    }
                }
                else{
                    $this->ajaxReturn(array('state'=>0, 'msg'=>'添加失败！'));
                }

            }

            $this->ajaxReturn(array('state'=>1));
        }
    }

    //全部关键词，部分平台
    public function allKeys(){

        $website = M('website')->where(array('state'=>1))->field('id, name')->select();
        $this->assign('website', $website);

        $this->display();
    }

    public function getAllKeys(){
        $allDatas = M('keywords')
            ->join('jb46o_site_keywords on jb46o_keywords.kid = jb46o_site_keywords.kid')
            ->join('jb46o_website on jb46o_site_keywords.sid = jb46o_website.id')
            ->field('jb46o_keywords.kid, jb46o_keywords.keywords, jb46o_keywords.url, jb46o_keywords.state, jb46o_keywords.title, jb46o_keywords.description, jb46o_keywords.keywords_rm, jb46o_keywords.pv, jb46o_site_keywords.sid, jb46o_website.name')
            ->select();

        $allKeys = array();
        foreach($allDatas as $key=>$val){
            if($allKeys[$val['kid']]){
                $allKeys[$val['kid']]['site'][] = $val['sid'];
                $allKeys[$val['kid']]['sitename'] .= '，' .$val['name'];
            }
            else
            {
                $allKeys[$val['kid']] = $val;
                $allKeys[$val['kid']]['site'] = array();
                $allKeys[$val['kid']]['site'][] = $val['sid'];
                $allKeys[$val['kid']]['sitename'] = $val['name'];
            }
        }

        $keywords = array();
        foreach($allKeys as $val){
            if(!$val['sitename']){
                $val['sitename'] = '无所属';
            }
            $keywords[] = $val;
        }

        $this->ajaxReturn($keywords);
    }

    public function importKeys(){
        if (!empty($_FILES)) {
            import("@.ORG.UploadFile");

            $config = array(
                'maxSize' => 3145728,
                'savePath' => '',
                'saveName' => array('uniqid', ''),
                'exts' => array('xlsx', 'xls'),
                'autoSub' => true,
                'subName' => array('date', 'Ymd'),
            );

            $upload = new \Think\Upload($config); // 实例化上传类
            //判断是否有图
            $info = $upload->upload();
            if (!$info) {
                $this->error($upload->getError());
            } else {
                $infoPath = './uploads/' . $info['import']['savepath'] . $info['import']['savename'];
            }

            vendor("PHPExcel.PHPExcel");
            $file_name = $infoPath;
            $objReader = \PHPExcel_IOFactory::createReader('Excel5');
            $objPHPExcel = $objReader->load($file_name, $encode = 'utf-8');

            $sheet = $objPHPExcel->getSheet(0);
            $highestRow = $sheet->getHighestRow(); // 取得总行数
            $highestColumn = $sheet->getHighestColumn(); // 取得总列数

            $keywordsInDb = M('keywords')->getField('keywords', true);
            //记录重复的keywords
            $exist = array();



            $siteData = array();
            for ($i = 2; $i <= $highestRow; $i++) {
                $data['keywords'] = $objPHPExcel->getActiveSheet()->getCell("B" . $i)->getValue();

                if (in_array($data['keywords'], $keywordsInDb)) {
                    $exist[] = $data['keywords'];
                    continue;
                }

                $data['url'] = $objPHPExcel->getActiveSheet()->getCell("C" . $i)->getValue();
                $data['title'] = $objPHPExcel->getActiveSheet()->getCell("E" . $i)->getValue();
                $data['keywords_rm'] = $objPHPExcel->getActiveSheet()->getCell("F" . $i)->getValue();
                $data['description'] = $objPHPExcel->getActiveSheet()->getCell("G" . $i)->getValue();
                $data['pv'] = $objPHPExcel->getActiveSheet()->getCell("H" . $i)->getValue();


                $data['state'] = 1;
                $kid = M('keywords')->add($data);

                $site = $objPHPExcel->getActiveSheet()->getCell("D" . $i)->getValue();
                $website = M('website')->getField('name, id', true);


                if (!$site) {
                    $siteData[] = array('kid' => $kid, 'sid' => 1);
                } else {
                    $site = explode('，', $site);
                    foreach ($site as $val) {
                        if ($webid = $website[$val]) {
                            $siteData[] = array('kid' => $kid, 'sid' => $webid);
                        }
                    }
                }
            }

            if (count($siteData) > 0) {
                M('site_keywords')->addAll($siteData);
            }

            $this->ajaxReturn(array('info' => 1, 'exist' => $exist));
        }else
        {
            $this->ajaxReturn(array('info'=>0, 'msg'=>'导入失败，请重试！'));
        }
    }

    /**
     * 站点变更
     */
    public function changeSite(){
        $kid = I('post.kid/d');
        $sites = I('post.sites');

        $this->sitekeysChange($kid, $sites);

        D('Users')->setUserUp($this->uid, '修改关键词网站' . I('post.keywords'));
        $this->ajaxReturn(array('state'=>1));
    }

    public function getAllSites(){
        $website = M('website')->where(array('state'=>1))->getField('id, name', true);
        $this->ajaxReturn($website);
    }

    public function kedit(){
        $this->show();
    }

    protected function sitekeysChange($kid, $sites){
        $ori = M('site_keywords')->where(array('kid'=>$kid))->getField('sid', true);
        $delSite = array();
        $addSite = array();

        foreach($sites as $val){
            if(!in_array($val, $ori)){
                $addSite[] = $val;
            }
        }

        foreach($ori as $val){
            if(!in_array($val, $sites)){
                $delSite[] = $val;
            }
        }

        //删除取消的
        if(count($delSite) > 0)
        {
            M('site_keywords')->where(array('kid'=>$kid, 'sid'=>array('in', $delSite)))->delete();
        }

        if(count($addSite) > 0){
            $addData = array();
            foreach($addSite as $val){
                $data['kid'] = $kid;
                $data['is_link'] = 0;
                $data['sid'] = $val;

                $addData[] = $data;
            }

            M('site_keywords')->addAll($addData);
        }
    }
}