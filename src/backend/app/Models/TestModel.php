<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class TestModel extends Model
{
    public function test()
    {
        return DB::table('test')->get();
    }
}
