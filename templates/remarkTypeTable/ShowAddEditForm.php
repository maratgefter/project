<div>
    <div class='container'>
            <div class='row justify-content-center'>
                <form action="<?= $URL ?>" method="POST" class="text-center border border-light p-3">
                    <?php
                        foreach ($columnsNames as $name) {
                            if ($name != 'id') {
                                echo "<label>"
                                .(empty($tableHeaders[$name]) ? $name : $tableHeaders[$name])
                                ."<input class='form-control' type='text' name='"
                                .$name."' placeholder='"
                                .$name."' value='"
                                .($editValues[$name] ?? '')."'></label><br/>";
                            }
                        }
                    ?>
                    <input class="btn btn-info my-4" type="submit" value="OK">
                </form>
            </div>
        </div>
</div>