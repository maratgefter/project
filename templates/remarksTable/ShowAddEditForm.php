<div>
    <div class='container'>
        <div class='row justify-content-center'>
            <form action="<?= $URL ?>" method="POST" class="text-center border border-light p-3">
                <?php
                foreach ($columnsNames as $name) {
                    if ($name != 'id') {
                        if ($name == 'workshops_id') {
                            
                            echo "<label>" . (empty($tableHeaders[$name]) ? $name : $tableHeaders[$name]);
                            echo "<br><select name='workshops_id' class='form-control'>";
                            foreach ($workshop as $id => $name) {
                                echo "<option value='$id'>$name</option>";
                            }

                            echo "</select></lable><br>";
                        } else if ($name == 'users_id') {
                            echo "<label>" . (empty($tableHeaders[$name]) ? $name : $tableHeaders[$name]);
                            echo "<br><select name='users_id' class='form-control'>";
                            foreach ($user as $id => $name) {
                                echo "<option value='$id'>$name</option>";
                            }

                            echo "</select></lable><br>";
                        } elseif ($name == 'remark_type_id') {
                            echo "<label>" . (empty($tableHeaders[$name]) ? $name : $tableHeaders[$name]);
                            echo "<br><select name='remark_type_id' class='form-control'>";
                            foreach ($remarkType as $id => $remark_type) {
                                echo "<option value='$id'>$remark_type</option>";
                            }

                            echo "</select></lable><br>";
                        } elseif ($name == 'date') {
                            echo "<label>"
                                . (empty($tableHeaders[$name]) ? $name : $tableHeaders[$name])
                                . "<input class='form-control mb-4' type='datetime-local' name='"
                                . $name . "' value='"
                                . ($editValues[$name] ?? '') . "'></label><br>"; 
                             
                        } else {
                            echo "<label>"
                                . (empty($tableHeaders[$name]) ? $name : $tableHeaders[$name])
                                . "<input class='form-control mb-4' type='text' name='"
                                . $name . "' value='"
                                . ($editValues[$name] ?? '') . "'></label><br>";
                        }
                    }
                }
                ?>
                <input class="btn btn-info my-4" type="submit" value="OK">
            </form>
        </div>
    </div>
</div>