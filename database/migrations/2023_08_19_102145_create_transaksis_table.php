<?php

// database/migrations/2023_08_19_create_transaksis_table.php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTransaksisTable extends Migration
{
    public function up()
    {
        Schema::create('transaksis', function (Blueprint $table) {
            $table->id('trans_id');
            $table->integer('hardware');
            $table->json('parameter');
            $table->string('created_by');
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('deleted_at')->nullable();
            
            // Add foreign key constraints if needed
        });
    }

    public function down()
    {
        Schema::dropIfExists('transaksis');
    }
}

