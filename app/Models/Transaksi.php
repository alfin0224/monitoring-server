<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transaksi extends Model
{
    use HasFactory;

    public function hardware()
    {
        return $this->belongsTo(Hardware::class, 'hardware');
    }

    public function transactionDetails()
    {
        return $this->hasMany(TransaksiDetail::class, 'trans_id');
    }

}