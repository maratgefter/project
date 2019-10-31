<?php

namespace App\Controller;

class WorkshopsController extends AbstractTableController
{
    protected $tableName = 'workshops';
    protected $viewPatternsPath = 'templates/table/';
    protected $pageSize = 5;
}