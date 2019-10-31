<?php

namespace App\Model;

use TexLab\MyDB\DbEntity;

class RemarksModel extends DbEntity
{

    public function getPage(?int $page = null): array
    {
        $this
        ->reset()
        ->setSelect("remarks.id, CONCAT(users.name, ' ', users.surname) AS users_id, workshops.name AS workshops_id, remark_type.remark_type AS remark_type_id, remarks.remark, remarks.date")
        ->setFrom("remarks, workshops, users, remark_type")
        ->setWhere("remarks.remark_type_id = remark_type.id AND remarks.workshops_id = workshops.id AND remarks.users_id = users.id")
        ->setOrderBy("`remarks`.`id`");
        return parent::getPage($page);
    }


}