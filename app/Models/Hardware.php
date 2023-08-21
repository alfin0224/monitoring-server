<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Hardware extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'hardware';
    protected $primaryKey = 'hardware';
    public $incrementing = false;
    public $timestamps = false;

    protected $fillable = [
        'hardware',
        'location',
        'timezone',
        'local_time',
        'latitude',
        'longitude',
        'created_by',
    ];

    public function hardwareDetails()
    {
        return $this->hasMany(HardwareDetail::class, 'hardware');
    }
    public function transactions()
    {
        return $this->hasMany(Transaksi::class, 'hardware');
    }

}
