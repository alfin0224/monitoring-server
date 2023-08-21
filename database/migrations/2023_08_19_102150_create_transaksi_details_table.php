<?php

// database/migrations/2023_08_19_create_transaksi_details_table.php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTransaksiDetailsTable extends Migration
{
    public function up()
    {
        Schema::create('transaksi_details', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('trans_id');
            $table->integer('hardware');
            $table->string('sensor');
            $table->decimal('value', 10, 2);
            $table->timestamp('deleted_at')->nullable();
            
            // Add foreign key constraints if needed
        });
    }

    public function down()
    {
        Schema::dropIfExists('transaksi_details');
    }
}