<?php

namespace App\Http\Controllers;

use App\Models\TestModel;

class TestController extends Controller
{
    public function test()
    {
        $test = new TestModel();
        var_dump($test->test());
    }
}
