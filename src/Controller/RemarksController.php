<?php

namespace App\Controller;

use TexLab\MyDB\DB;
use App\Core\Conf;
use TexLab\MyDB\DbEntity;
use App\Model\RemarksModel;

class RemarksController extends AbstractTableController
{
    protected $tableName = 'remarks';
    protected $viewPatternsPath = 'templates/table/';
    protected $pageSize = 4;

    public function __construct()
    {
        parent::__construct();
        $this->table = new RemarksModel($this->tableName, DB::Link(Conf::MYSQL));
    }

    public function actionShowEditForm()
    {
        $tableWorkshops = new DbEntity('workshops', DB::Link(Conf::MYSQL));
        $tableRemarkType = new DbEntity('remark_type', DB::Link(Conf::MYSQL));
        $tableUser = new DbEntity('users', DB::Link(Conf::MYSQL));

        $this->view->setPatternsPath('templates/remarksTable/');

        $this->render("ShowAddEditForm", [
            'columnsNames' => $this->table->getColumnsNames(),
            'editValues' => $this->table->get(['id' => $_GET['id']])[0],
            'URL' => '?t=' . $this->shortClassName() . '&a=Edit&id=' . $_GET['id'],
            'user' => $tableUser->getColumn('surname'),
            'workshop' => $tableWorkshops->getColumn('name'),
            'remarkType' => $tableRemarkType->getColumn('remark_type'),
            'tableHeaders' => $this->table->getColumnsComments()
        ]);

    }



    public function actionShowAddForm()
    {
        $tableWorkshops = new DbEntity('workshops', DB::Link(Conf::MYSQL));
        $tableRemarkType = new DbEntity('remark_type', DB::Link(Conf::MYSQL));
        $tableUser = new DbEntity('users', DB::Link(Conf::MYSQL));

        $this->view->setPatternsPath('templates/remarksTable/');
        
        $this->render("ShowAddEditForm", [
            'columnsNames' => $this->table->getColumnsNames(),
            'editValues' => $this->table->get(['id' => $_GET['id']])[0],
            'URL' => '?t=' . $this->shortClassName() . '&a=Add',
            'user' => $tableUser->getColumn('surname'),
            'workshop' => $tableWorkshops->getColumn('name'),
            'remarkType' => $tableRemarkType->getColumn('remark_type'),
            'tableHeaders' => $this->table->getColumnsComments()
        ]);
    }
}