<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMasterSensorsTable extends Migration
{
    public function up()
    {
        Schema::create('master_sensors', function (Blueprint $table) {
            $table->string('sensor', 4)->primary();
            $table->string('sensor_name');
            $table->string('unit');
            $table->string('created_by');
            $table->timestamp('created_at')->nullable();
            $table->softDeletes();
        });
    }

    public function down()
    {
        Schema::dropIfExists('master_sensors');
    }
}
