<?php

namespace App\Controller;

class RemarksController extends AbstractTableController
{
    protected $tableName = 'remarks';
    protected $viewPatternsPath = 'templates/table/';
    protected $pageSize = 4;
}